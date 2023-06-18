import 'package:flutter/material.dart';
import 'package:smart_tent_city_app/model/RequestModel.dart';

class RequestCard extends StatelessWidget {
  final RequestModel requestModel;
  final VoidCallback? onTapReject;
  final VoidCallback? onTapAccept;
  const RequestCard(
      {super.key,
      required this.requestModel,
      this.onTapAccept,
      this.onTapReject});

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
                    vertical: MediaQuery.of(context).size.height * .05,
                    horizontal: MediaQuery.of(context).size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
