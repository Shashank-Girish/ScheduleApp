// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_i.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfoAdapter extends TypeAdapter<Info> {
  @override
  final int typeId = 0;

  @override
  Info read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Info()
      ..evnt = fields[0] as String?
      ..dt = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Info obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.evnt)
      ..writeByte(1)
      ..write(obj.dt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
