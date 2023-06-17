import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';

class VictimData extends StatelessWidget {
  const VictimData({super.key});

  @override
  Widget build(BuildContext context) {
    final victim =
        Provider.of<VictimChangeNotifier>(context, listen: false).data!;




    return BackgroundPage(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
        Text(victim.id),
          Divider(color: Colors.red,),
          Text(victim.name),
          Divider(color: Colors.red,),
          Text(victim.surname),
          Divider(color: Colors.red,),
          victim.birthday != null ? Text("${victim.birthday}"): Text("-"),
          Divider(color: Colors.red,),
          victim.blood_type != null ? Text("${victim.blood_type}"): Text("-"),
          Divider(color: Colors.red,),
          victim.phone_number != null ? Text("${victim.phone_number}"): Text("-"),
          Divider(color: Colors.red,),
          victim.tent_number != null ? Text("${victim.tent_number}"): Text("-"),
          Divider(color: Colors.red,),
          victim.additional_data != null ? Text("${victim.additional_data}"):Text("-"),
          Divider(color: Colors.red,),]


    ],
      ),
    ));
  }
}
