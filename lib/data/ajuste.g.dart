// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajuste.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AjusteAdapter extends TypeAdapter<Ajuste> {
  @override
  final int typeId = 0;

  @override
  Ajuste read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ajuste(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Ajuste obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoria)
      ..writeByte(1)
      ..write(obj.id_atajo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AjusteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
