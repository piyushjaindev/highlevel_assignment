import 'package:hive/hive.dart';

class DurationTypeAdapter extends TypeAdapter<Duration> {
  @override
  Duration read(BinaryReader reader) {
    final seconds = reader.readInt();
    return Duration(seconds: seconds);
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer.writeInt(obj.inSeconds);
  }

  @override
  int get typeId => 2;
}
