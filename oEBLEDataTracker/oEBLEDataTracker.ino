#include <Wire.h>
#include "src/Protocentral_MLX90632/Protocentral_MLX90632.h"
#include "TCA9548A.h"
#include "src/LEDManager/LEDManager.h"
#include <Arduino.h>
#include <ArduinoBLE.h>
#include "src/IMU_Sensor/IMU_Sensor.h"

TCA9548A mux;
IMU_Sensor imu;

LEDManager ledManager;

// if true, the code waits until serial is available
bool isDebugMode = true;

// PCB is 4,6,7
// FlexPCB is 1,2,3
const uint8_t MLX_CHANNELS[] = {1, 2, 3, 4, 6, 7};
int found_sensor_counter = 0;
int amount_of_0_found = 0;
int sensor_index_to_read = 0;
const uint8_t amount_of_sensors = sizeof(MLX_CHANNELS);
Protocentral_MLX90632 mlx[amount_of_sensors];
const int amount_of_data_columns = 2 * amount_of_sensors + 9;
int data[amount_of_data_columns + 1];

int loopCounter = 0;         // Counts the number of loop iterations that meet the condition
unsigned long startTime = 0; // Time when we start counting
const int N = 100;           // Number of iterations to count before calculating frequency

const int buttonPin = 5;                                // Button pin connected to D5
volatile bool stopMeasurementButtonPressedFlag = false; // Volatile flag used in the interrupt routine
const unsigned long doubleClickTimeframe = 2000;        // Timeframe for double click in milliseconds
unsigned long lastButtonPressTime = 0;                  // Stores the timestamp of the last button press

unsigned long previousMillis = 0; // Stores last time data was sampled
const int interval = 20;          // Sampling interval in milliseconds (50Hz)

int measurement_state = 1; // Initial measurement state

BLEService dataService("001A"); // Custom service UUID
BLECharacteristic imuCharacteristic("200A", BLERead | BLENotify, 20);
BLECharacteristic objectTempCharacteristic("200B", BLERead | BLENotify, 20);
BLECharacteristic sensorTempCharacteristic("200C", BLERead | BLENotify, 20);

// Function prototypes
void setupSensors();
void setupButtonInterrupt();
void setupBLE();
void initializeMLXSensor(Protocentral_MLX90632 &sensor, uint8_t index);
void initializeIMU();
void readSensorData(int *data);
void saveDataToSDCard(int *data, int id);
void stopMeasurement();

/*****************************************  setup() *************************************************/
void setup()
{
  // if (isDebugMode)
  // {
    Serial.begin(115200);
    while (!Serial)
    {
    };
  // }

  setupButtonInterrupt();

  setupBLE();

  initializeIMU();
  setupSensors();
}

/*****************************************  loop() *************************************************/
void loop()
{
  BLEDevice central = BLE.central();
  if (central) {
    if (central.connected()) {
      // if (isDebugMode) {
        Serial.println("Connected to a central device.");
      // }
    }
  }

  unsigned long currentMillis = millis(); // Grab current time

  if (currentMillis - previousMillis >= interval)
  {
    if (found_sensor_counter != amount_of_sensors)
    {
      Serial.println("Not enough sensors found, reexecute setupSensors()");
      setupSensors();
      ledManager.changeLEDColor(-1);
      delay(10000);
    }

    // else
    // {
    memset(data, 0, sizeof(data));
    data[0] = amount_of_data_columns; // Number of data elements

    if (stopMeasurementButtonPressedFlag)
    {
      stopMeasurement();
    }

    readSensorData(data);
    saveDataToSDCard(data, measurement_state);
    // print data
    if (isDebugMode)
    {
      print_data(data, amount_of_data_columns);
    }
  }
}

void print_data(int *data, int amount_of_data_columns)
{
  if (data[1] != -1)
  {
    Serial.print("Object Temperature: ");
    for (int i = 1; i <= amount_of_sensors; i++)
    {
      Serial.print(data[i]);
      if (i != amount_of_sensors)
      {
        Serial.print(", ");
      }
    }
    Serial.println();

    Serial.print("Sensor Temperature: ");
    for (int i = amount_of_sensors + 1; i <= 2 * amount_of_sensors; i++)
    {
      Serial.print(data[i]);
      if (i != 2 * amount_of_sensors)
      {
        Serial.print(", ");
      }
    }
    Serial.println();

    Serial.print("IMU [");
    for (int i = 2 * amount_of_sensors + 1; i <= 2 * amount_of_sensors + 9; i++)
    {
      Serial.print(data[i]);
      if (i != 2 * amount_of_sensors + 9)
      {
        Serial.print(", ");
      }
    }
    Serial.println("]");
    Serial.println("");
  }
}

void setupSensors()
{
  Wire.begin();
  Wire.setClock(400000);
  // Initialize the multiplexer
  mux.begin();
  // Initialize MLX sensors...
  found_sensor_counter = 0;
  for (uint8_t i = 0; i < amount_of_sensors; i++)
  {
    initializeMLXSensor(mlx[i], i);
  }
  if (found_sensor_counter == amount_of_sensors)
  {
    ledManager.changeLEDColor(measurement_state); // Change LED color based on initial measurement state
  }
  else
  {
    ledManager.changeLEDColor(-1);
  }
}

void setupButtonInterrupt()
{
  pinMode(buttonPin, INPUT_PULLUP);                                          // Set button pin as input with internal pull-up resistor
  attachInterrupt(digitalPinToInterrupt(buttonPin), buttonPressed, FALLING); // Attach interrupt to the button pin, trigger on FALLING edge
}

void setupBLE() {
  if (!BLE.begin()) {
    Serial.println("Starting BLE failed!");
    while (1);
  }

  BLE.setLocalName("DataTracker");
  BLE.setAdvertisedService(dataService);
  dataService.addCharacteristic(imuCharacteristic);
  dataService.addCharacteristic(sensorTempCharacteristic);
  dataService.addCharacteristic(objectTempCharacteristic);
  BLE.addService(dataService);
  BLE.advertise();

  // if (isDebugMode) {
    Serial.println("BLE set up, continue");
    Serial.print("BLE Device ID: ");
    Serial.println(BLE.address());
  // }
}

void initializeMLXSensor(Protocentral_MLX90632 &sensor, uint8_t index)
{
  mux.openChannel(MLX_CHANNELS[index]);

  if (!sensor.begin())
  {
    if (isDebugMode)
    {
      Serial.print("Sensor ");
      Serial.print(index);
      Serial.println(" not found. Check wiring or address.");
    }
  }
  else
  {
    if (isDebugMode)
    {
      Serial.print("Sensor ");
      Serial.print(index);
      Serial.println(" found!");
    }
    found_sensor_counter = found_sensor_counter + 1;
  }
  mux.closeChannel(MLX_CHANNELS[index]);
}

void initializeIMU()
{
  imu.start();
}

void readSensorData(int *data)
{
  readTemperatureSensorData(data);
  readIMUSensorData(data);
}

void readTemperatureSensorData(int *data)
{
  // Read MLX sensor data...
  if (amount_of_0_found >= 6)
  {
    stopMeasurement();
    ledManager.changeLEDColor(-1);

    if (isDebugMode)
    {
      Serial.println("Receiving too many 0 data, save file and restart");
    }
    delay(100);
    NVIC_SystemReset();
  }
  else
  {
    if (sensor_index_to_read >= amount_of_sensors)
    {
      sensor_index_to_read = 0;
    }
    // for (uint8_t i = 0; i < amount_of_sensors; i++)
    // {
    //   data[i + 1] = 0;
    //   data[amount_of_sensors + i + 1] = 0;
    // }

    mux.openChannel(MLX_CHANNELS[sensor_index_to_read]);
    data[sensor_index_to_read + 1] = mlx[sensor_index_to_read].get_Temp() * 100;
    data[amount_of_sensors + sensor_index_to_read + 1] = mlx[sensor_index_to_read].get_sensor_temp() * 100;

    if (data[sensor_index_to_read + 1] == 0)
    {
      amount_of_0_found++;
    }

    mux.closeChannel(MLX_CHANNELS[sensor_index_to_read]);
    sensor_index_to_read++;
    // }
  }
}

void readIMUSensorData(int *data)
{
  int imu_muliplicator = 10000;
  float accelX, accelY, accelZ;
  imu.get_acc(accelX, accelY, accelZ);
  data[2 * amount_of_sensors + 1] = accelX * imu_muliplicator;
  data[2 * amount_of_sensors + 2] = accelY * imu_muliplicator;
  data[2 * amount_of_sensors + 3] = accelZ * imu_muliplicator;

  // Get gyroscope data
  float gyroX, gyroY, gyroZ;
  imu.get_gyro(gyroX, gyroY, gyroZ);
  data[2 * amount_of_sensors + 4] = gyroX * imu_muliplicator;
  data[2 * amount_of_sensors + 5] = gyroY * imu_muliplicator;
  data[2 * amount_of_sensors + 6] = gyroZ * imu_muliplicator;

  // Get magnetometer data
  float magX, magY, magZ;
  imu.get_mag(magX, magY, magZ);
  data[2 * amount_of_sensors + 7] = magX * imu_muliplicator;
  data[2 * amount_of_sensors + 8] = magY * imu_muliplicator;
  data[2 * amount_of_sensors + 9] = magZ * imu_muliplicator;
}

void saveDataToSDCard(int *data, int id)
{
  unsigned int timestamp = millis();
  // String data_string = convert_int_to_string(data);

  int objectTempStartIndex = 1;
  int objectTempEndIndex = 6;

  int sensorTempStartIndex = 7;
  int sensorTempEndIndex = 12; // Adjust these indices as per your data structure

  int imuStartIndex = 13;
  int imuEndIndex = 21;

  String data_string_imu = convert_int_to_string(data, imuStartIndex, imuEndIndex);
  String data_string_objTemp = convert_int_to_string(data, objectTempStartIndex, objectTempEndIndex);
  String data_string_sensorTemp = convert_int_to_string(data, sensorTempStartIndex, sensorTempEndIndex);
  // logger->data_callback(id, timestamp, data_string);
  imuCharacteristic.writeValue(data_string_imu.c_str());
  objectTempCharacteristic.writeValue(data_string_objTemp.c_str());
  sensorTempCharacteristic.writeValue(data_string_sensorTemp.c_str());
  if (isDebugMode) {
        Serial.print("BLE: ");
        Serial.print(timestamp);
        Serial.print(", ");
        Serial.print(data_string_objTemp);
        Serial.print(", ");
        Serial.print(data_string_sensorTemp);
        Serial.print(", ");
        Serial.println(data_string_imu);
  }
}

String convert_int_to_string(int *data)
{
  String data_string = "";
  for (int i = 1; i < amount_of_data_columns + 1; ++i)
  {
    data_string += String(data[i]);
    if (i < amount_of_data_columns)
    {
      data_string += ",";
    }
  }
  return data_string;
}

String convert_int_to_string(int *data, int start, int end) {
    String data_string = "";
    for (int i = start; i <= end; ++i) {
        data_string += String(data[i]);
        if (i < end) {
            data_string += ",";
        }
    }
    return data_string;
}

void stopMeasurement()
{
  unsigned int timestamp = millis();
  //logger->data_callback(-1, timestamp, "");
  Serial.println("Stop BLE Measurement");

  //logger->end();
  ledManager.changeLEDColor(-1);
  if (isDebugMode)
  {
    Serial.println("Pressed stop, now finished");
  }
  while (true)
    ;
}

void buttonPressed()
{
  unsigned long currentButtonPressTime = millis();
  if (stopMeasurementButtonPressedFlag == true)
  {
    return;
  }

  if (currentButtonPressTime - lastButtonPressTime < doubleClickTimeframe)
  {
    stopMeasurementButtonPressedFlag = true;
    lastButtonPressTime = 0;
  }
  else
  {
    lastButtonPressTime = currentButtonPressTime;
    incrementMeasurementState();
    ledManager.changeLEDColor(measurement_state);
  }
}

void incrementMeasurementState()
{
  measurement_state++;
}

int getMeasurementState()
{
  return measurement_state;
}