import 'package:hive/hive.dart';

part 'ajuste.g.dart';

@HiveType(typeId: 0)
class Ajuste {
  @HiveField(0)
  String categoria;
  @HiveField(1)
  int id_atajo;

  Ajuste(this.categoria, this.id_atajo);
}
