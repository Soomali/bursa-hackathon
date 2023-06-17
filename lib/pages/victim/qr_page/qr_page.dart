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
      child: Center(
        child: QrImageView(data: data),
      ),
    );
  }
}
