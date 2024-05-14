import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:qyran/generated/l10n.dart';
import 'package:qyran/utils/globals_fun.dart';
import 'package:qyran/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:qyran/utils/globals.dart';

class ConfirmCode extends StatefulWidget {
  final bool register;
  final String phone;
  final String confirmCode;
  const ConfirmCode({required this.phone, required this.register, required this.confirmCode, super.key});
  @override
  State<StatefulWidget> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  bool register = false;
  String? code;
  @override
  Widget build(BuildContext context) {
    register = widget.register;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(widgetPadding),
          child: SizedBox(
            child: Center(
              child: SizedBox(
                height: 50.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/logo.png"),
                    Text(
                      register ? S.of(context).register : S.of(context).login_signIn,
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: buttonTextSize),
                    ),
                    Text(
                      S.of(context).confirm_code(widget.phone),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: appGray4, fontSize: mainSize),
                    ),
                    Pinput(
                      length: 4,
                      onChanged: (value) {
                        setState(() {
                          code = value;
                        });
                      },
                      defaultPinTheme: PinTheme(width: 50, height: 50, decoration: BoxDecoration(color: Colors.white, border: Border.all(color: borderPinput), borderRadius: BorderRadius.circular(8))),
                    ),
                    CustomButton(
                        disableColor: primaryColor.withOpacity(0.24),
                        onPress: !_success()
                            ? null
                            : () {
                                if (code != widget.confirmCode) {
                                  showError(S.of(context).error_code).show(context);
                                } else {
                                  Navigator.pop(context, true);
                                }
                              },
                        color: primaryColor,
                        title: S.of(context).continue_),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _success() {
    return (code != null && code!.isNotEmpty);
  }
}
