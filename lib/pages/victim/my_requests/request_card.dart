import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/constants/custom_colors.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';
import 'package:smart_tent_city_app/model/RequestStatus.dart';

class RequestCard extends StatelessWidget {
  final RequestModel requestModel;
  final VoidCallback? onTapReject;
  final VoidCallback? onTapAccept;
  const RequestCard(
      {super.key,
      required this.requestModel,
      this.onTapAccept,
      this.onTapReject});

  Widget getStatusChip() {
    String label = '';
    Color color;
    Color textColor;
    switch (this.requestModel.status) {
      case RequestStatus.accepted:
        label = 'Onaylandı';
        color = CustomColors.greenAccent;
        textColor = Colors.white;
        break;
      case RequestStatus.rejected:
        label = 'Reddedildi';
        color = Colors.redAccent.shade700;
        textColor = Colors.white;
        break;
      case RequestStatus.waiting:
        label = 'Bekleniyor';
        color = Colors.yellow;
        textColor = Colors.black;
        break;
    }
    return Chip(
        labelPadding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        backgroundColor: color,
        label: Text(
          label,
          style: TextStyle(color: textColor, fontSize: 12),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .02,
                    horizontal: MediaQuery.of(context).size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                        '${this.requestModel.tent_number} numaralı çadır tarafından talep edildi'),
                    ...this
                        .requestModel
                        .products
                        .map((e) => Text(' ■  ${e.amount} adet ${e.type}'))
                        .toList()
                  ],
                )),
          ),
          Positioned(
            child: getStatusChip(),
            top: 0,
            left: 0,
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: Row(
              children: [
                if (onTapReject != null) ...[
                  IconButton(
                      onPressed: onTapReject,
                      icon: Icon(
                        Icons.remove_circle,
                        color: Colors.redAccent.shade700,
                        size: 40,
                      )),
                  SizedBox(
                    width: 12,
                  )
                ],
                if (onTapAccept != null)
                  IconButton(
                      onPressed: onTapAccept,
                      icon: Icon(
                        Icons.check_circle_rounded,
                        color: Colors.redAccent.shade700,
                        size: 40,
                      )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
