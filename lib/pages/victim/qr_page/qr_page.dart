import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:smart_tent_city_app/notifiers/victim_change_notifier.dart/victim_change_notifier.dart';
import 'package:smart_tent_city_app/pages/background_page.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<VictimChangeNotifier>(context, listen: false).data!.id;
    return BackgroundPage(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(48, 64, 48, 64),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 10,
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * .1,
                  30,
                  MediaQuery.of(context).size.width * .1,
                  20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  QrImageView(
                    data: data,
                    size: 240,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Bu QR kodu Yetkiliye Kişiye gösteriniz',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Bu QR kodu Yetkiliye göstermeniz halinde çadırkente giriş çıkış işlemlerinizin kayıt altına alınması işlemi hızlanacaktır. Kendinizin ve çadır kentimizin güvenliği için hep birlikte çalışalım.',
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
