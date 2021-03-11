import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/shared_widgets/components/modal_bottom_sheet/modal_bottom_sheet_fixed.dart';
import 'package:app/shared_widgets/widget/loading.dart';
import 'package:app/util/extensions.dart';

showLoadingBottomSheet() async {
  await Get.bottomSheet(
    GestureDetector(
        child: ModalBottomSheetFixed(
      centerTitle: false,
      child: Center(child: LoadingAnimatedIcon()),
    )).ignoreTouch(true),
    isScrollControlled: true,
    enableDrag: false,
    isDismissible: false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
