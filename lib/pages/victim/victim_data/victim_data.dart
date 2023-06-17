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
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      victim.photo == null ? Icon(Icons.account_circle,size: 130) : Icon(Icons.account_circle_outlined,size:130),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          children: [
                            Text(victim.name+" "+victim.surname,style: TextStyle(fontSize: 30)),
                            victim.blood_type!=null ?Text("Kan grubu: "+victim.blood_type.toString(),style: TextStyle(fontSize: 20)):Text("Kan grubu bilinmiyor",style:TextStyle(fontSize: 20))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("Çadır no: "+victim.tent_number),
                        Text("Çadır kent no: "+victim.tentCityId)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Telefon no: "+victim.phone_number.toString()),
                        Text("Cinsiyet: "+victim.gender)
                      ],
                    )
                  ],
                ),
                victim.additional_data!=null ? Text("Kazazede açıklaması: "+victim.additional_data!):SizedBox(),
              ],
            ),
          ),
        )
    );
  }
}
