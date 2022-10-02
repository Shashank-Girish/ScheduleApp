import 'package:hive/hive.dart';
part 'data_i.g.dart';

@HiveType(typeId: 0)
class Info extends HiveObject{
  @HiveField(0)
  String? evnt;
  @HiveField(1)
  DateTime dt=DateTime.now();

}