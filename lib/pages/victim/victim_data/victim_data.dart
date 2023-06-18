import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .16),
        child: Center(
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .03,
                  horizontal: MediaQuery.of(context).size.width * .05),
              decoration: BoxDecoration(
                  border: Border.all(), borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: SvgPicture.asset('assets/injured_person.svg')),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'isim-soy isim',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${victim.name} ${victim.surname}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Doğum Tarihi',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  victim.birthday != null
                      ? Text("${victim.birthday}",
                          style: const TextStyle(fontSize: 16))
                      : const Text("-", style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Kan Grubu',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  victim.blood_type != null
                      ? Text("${victim.blood_type}",
                          style: const TextStyle(fontSize: 16))
                      : const Text("-", style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Telefon numarası',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  victim.phone_number != null
                      ? Text(
                          "${victim.phone_number}",
                          style: const TextStyle(fontSize: 16),
                        )
                      : const Text("-", style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Çadır numarası',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  victim.tent_number != null
                      ? Text("${victim.tent_number}",
                          style: const TextStyle(fontSize: 16))
                      : const Text("-", style: TextStyle(fontSize: 16)),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
