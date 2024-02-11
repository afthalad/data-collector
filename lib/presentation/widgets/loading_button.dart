// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../bloc/image/image_cubit.dart';
import 'base widgets/st_button_widget.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return STButton(
      state: LoadingState(),
      onClick: () {},
    );
  }
}
