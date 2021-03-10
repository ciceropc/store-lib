import 'package:app/shared_widgets/widget/snack_bar.dart';

void handleError(e, {double marginBottom = SnackbarController.snackbarMargin}) {
  if (e != null && e is Map) {
    if (e.containsKey('code') && e['code'] == 500) {
      showConnectionErrorSnackBar();
    } else {
      showErrorSnackBar('Ocorreu um erro', initialMarginBottom: marginBottom);
    }
  } else {
    showErrorSnackBar('Ocorreu um erro', initialMarginBottom: marginBottom);
  }
}
