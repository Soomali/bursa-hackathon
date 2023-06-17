import 'package:cloud_firestore/cloud_firestore.dart';

enum Movement { into, out }

class MovementModel {
  Timestamp time;
  Movement movement;
  MovementModel({required this.time, required this.movement});
  factory MovementModel.fromJson(Map<String, dynamic> json) {
    return MovementModel(
        time: json['time'],
        movement: json['movement'] == Movement.into.name
            ? Movement.into
            : Movement.out);
  }
  Map<String, dynamic> toJson() {
    return {'time': time, 'movement': movement.name};
  }
}
