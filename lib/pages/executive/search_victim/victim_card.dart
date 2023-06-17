import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';

class VictimCard extends StatelessWidget {
  final VictimModel victimModel;
  const VictimCard({super.key, required this.victimModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.redAccent.shade700))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              victimModel.name + ' ' + victimModel.surname,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Çadır kent numarası ${victimModel.tentCityId}',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Çadır numarası ${victimModel.tent_number}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'telefon numarası ${victimModel.phone_number ?? "bilinmiyor"}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.redAccent.shade700,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'doğum tarihi ${victimModel.birthday ?? "bilinmiyor"}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'kan grubu ${victimModel.blood_type ?? "bilinmiyor"}',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'cinsiyet ${victimModel.gender}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
