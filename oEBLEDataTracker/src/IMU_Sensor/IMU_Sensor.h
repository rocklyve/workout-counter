#ifndef EDGE_ML_EARABLE_IMU_SENSOR_H
#define EDGE_ML_EARABLE_IMU_SENSOR_H

#include <DFRobot_BMX160.h>
#include <Wire.h>

class IMU_Sensor {
public:
    IMU_Sensor();

    void start();
    void end();

    void get_float_data(float floatArray[], int sensorID);
    void get_int_data(int intArray[], int sensorID);

    int get_sensor_count();

    static const int sensor_count = 3;

    void get_acc(float& x, float& y, float& z);
    void get_gyro(float& x, float& y, float& z);
    void get_mag(float& x, float& y, float& z);
private:
    bool available = false;

    int max_age = 5;
    unsigned long _last = 0;

    bool has_data[sensor_count];

    DFRobot_BMX160 * IMU;

    sBmx160SensorData_t accel_data;
    sBmx160SensorData_t gyro_data;
    sBmx160SensorData_t magno_data;

    void get_all();
    void reset_has_data();
    void age_check();
};


#endif //EDGE_ML_EARABLE_IMU_SENSOR_H
