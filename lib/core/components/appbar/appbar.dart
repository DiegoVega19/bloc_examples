import 'package:bloc_1/core/base/bloc/auth/auth_bloc.dart';
import 'package:bloc_1/core/components/text/custom_text.dart';
import 'package:bloc_1/core/constants/app/color_constants.dart';
import 'package:bloc_1/core/constants/app/string_constants.dart';
import 'package:bloc_1/core/constants/enums/icon_enums.dart';
import 'package:bloc_1/core/extensions/context_extensions.dart';
import 'package:bloc_1/core/extensions/image_extensions.dart';
import 'package:bloc_1/core/extensions/num_extensions.dart';
import 'package:bloc_1/core/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    this.isHome = false,
  }) : super(key: key);

  final bool isHome;

  @override
  State<AppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            IconEnums.appLogo.iconName.toPng,
            height: context.dynamicHeight(0.03),
            width: context.dynamicWidth(0.06),
          ),
          7.pw,
          CustomText(
            StringConstants.appName,
            textStyle: context.textTheme.headlineSmall,
          ),
        ],
      ),
      actions: [
        widget.isHome
            ? IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.logout_outlined,
                  color: ColorConstants.black,
                ),
              )
            : const SizedBox.shrink(),
        10.pw,
      ],
    );
  }
}
