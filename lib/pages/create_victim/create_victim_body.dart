import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/constants/firebase.dart';
import 'package:smart_tent_city_app/model/ExecutiveModel.dart';
import 'package:smart_tent_city_app/model/VictimModel.dart';
import 'package:smart_tent_city_app/notifiers/executive_change_notifier/executive_change_notifier.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/login/login_button.dart';
import 'package:smart_tent_city_app/pages/login/login_input.dart';

class CreateVictimBody extends StatefulWidget {
  const CreateVictimBody({super.key});

  @override
  State<CreateVictimBody> createState() => _CreateVictimBodyState();
}

class _CreateVictimBodyState extends State<CreateVictimBody> {
  String? phoneNumber;
  String name = '';
  String surname = '';
  String? bloodType;
  String? birthDate;
  String tentNumber = '';
  String? additionalData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          LoginInput(
              onChanged: (val) {
                setState(() {
                  phoneNumber = val;
                });
              },
              hintText: 'telefon numarası(opsiyonel)',
              keyboardType: TextInputType.phone,
              maxLength: 11),
          LoginInput(
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
              hintText: 'kişinin adı',
              keyboardType: TextInputType.name,
              maxLength: 40),
          LoginInput(
              onChanged: (val) {
                setState(() {
                  surname = val;
                });
              },
              hintText: 'kişinin soyadı',
              keyboardType: TextInputType.name,
              maxLength: 20),
          LoginInput(
              onChanged: (val) {
                setState(() {
                  bloodType = val;
                });
              },
              hintText: 'kan grubu',
              keyboardType: TextInputType.text,
              maxLength: 3),
          LoginInput(
              onChanged: (val) {
                setState(() {
                  birthDate = val;
                });
              },
              hintText: 'kişinin doğum tarihi',
              keyboardType: TextInputType.name,
              maxLength: 10),
          LoginInput(
              onChanged: (val) {
                setState(() {
                  tentNumber = val;
                });
              },
              hintText: 'Çadır Numarası',
              keyboardType: TextInputType.number,
              maxLength: 5),
          LoginInput(
              onChanged: (val) {
                setState(() {
                  additionalData = val;
                });
              },
              hintText: 'Ek Bilgi',
              keyboardType: TextInputType.text,
              maxLength: 40),
          LoginButton(onPressed: () {
            final ExecutiveModel executiveModel =
                Provider.of<ExecutiveChangeNotifier>(context, listen: false)
                    .data!;
            VictimModel victimModel = VictimModel(
                tent_number: tentNumber,
                id: FirebaseFirestore.instance
                    .collection(victimCollectionPath)
                    .doc()
                    .id,
                tentCityId: executiveModel.tentCityId,
                name: name,
                surname: surname,
                birthday: birthDate,
                blood_type: bloodType,
                phone_number: phoneNumber);
            Provider.of<VictimChangeNotifier>(context, listen: false)
                .create(victimModel);
          })
        ],
      ),
    );
  }
}
