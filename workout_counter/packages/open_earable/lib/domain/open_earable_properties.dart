class OEProperties {
  bool broadcast;
  bool read;
  bool writeWithoutResponse;
  bool write;
  bool notify;
  bool indicate;
  bool authenticatedSignedWrites;
  bool extendedProperties;
  bool notifyEncryptionRequired;
  bool indicateEncryptionRequired;

  OEProperties(
    this.broadcast,
    this.read,
    this.writeWithoutResponse,
    this.write,
    this.notify,
    this.indicate,
    this.authenticatedSignedWrites,
    this.extendedProperties,
    this.notifyEncryptionRequired,
    this.indicateEncryptionRequired,
  );
}
