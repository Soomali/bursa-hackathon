import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_tent_city_app/notifiers/async_change_notifier.dart';
import 'package:smart_tent_city_app/pages/provider/error_handler/error_handle_mode.dart';

import '../../../model/error_model.dart';

class ErrorHandlerProvider<T extends AsyncChangeNotifier>
    extends StatelessWidget {
  final ErrorHandleMode mode;
  final Widget child;
  final List<String> errorIds;
  ErrorHandlerProvider(
      {this.mode = ErrorHandleMode.popup,
      required this.child,
      required this.errorIds});

  void showErrorPopUp(
      BuildContext context, ErrorModel errorModel, VoidCallback onPressed) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    onPressed();
                    Navigator.of(context).pop();
                  },
                  child: Text('Tamam'))
            ],
            content: Text(errorModel.message),
          );
        });
  }

  void showErrorSnackbar(
      BuildContext context, ErrorModel errorModel, VoidCallback onEnd) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: WillPopScope(
          onWillPop: () async {
            onEnd();
            return true;
          },
          child: Text(errorModel.message)),
    ));
  }

  void handleErrors(BuildContext context, List<ErrorModel> errors,
      AsyncChangeNotifier notifier) {
    if (errors.isEmpty) {
      return;
    }
    for (ErrorModel error in errors) {
      if (mode == ErrorHandleMode.popup) {
        showErrorPopUp(context, error, () {
          notifier.removeError(error.id);
        });
      } else {
        showErrorSnackbar(context, error, () {
          notifier.removeError(error.id);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, notifier, widget) {
        List<ErrorModel> errors = [];
        for (String errorId in errorIds) {
          final error = notifier.getError(errorId);
          if (error != null) {
            errors.add(error);
          }
        }
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          handleErrors(context, errors, notifier);
        });

        return widget ?? child;
      },
      child: child,
    );
  }
}
