import 'package:animate_do/animate_do.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_screen/modules/otp/otp_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_pinput/reactive_pinput.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: ReactiveForm(
        formGroup: controller.otpForm,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: _appBar(context),
          body: Stack(
            children: <Widget>[
              _backgroundDecoration(),
              SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: Get.height * 0.2,
                ),
                child: _screenContent(context),
              ),
            ],
          ),
          floatingActionButton: _verifyButton(),
        ),
      ),
    );
  }

  // ! ===== App Bar ====
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        controller.title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  // ! ==== Background Decoratio =====
  Positioned _backgroundDecoration() {
    return Positioned(
      top: 0,
      right: 0,
      child: SvgPicture.asset(
        'assets/top_right_large.svg',
        width: Get.width * 0.3,
        height: Get.height * 0.3,
      ),
    );
  }

  Column _screenContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //  Screen title: Verification
        Center(
          child: FadeIn(
            duration: const Duration(milliseconds: 800),
            child: Text(
              controller.otpScreenTitle,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        // Vertical space
        const SizedBox(height: 25.0),
        // Main text: Enter 6 digit code ...
        FadeIn(
          duration: const Duration(milliseconds: 800),
          child: Text(
            // Replace text with Get.arguments or from variable: wahtever your use case
            controller.otpScreenHeaderlText + " +92 000 0000000",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
          ),
        ),
        // Vertical space
        const SizedBox(height: 25.0),
        // Edit number link (return to login page on tap)
        Center(
          child: GestureDetector(
            // todo: Implement onTap: Navigate back to phone registration screen
            onTap: () {},
            child: FadeIn(
              duration: const Duration(milliseconds: 800),
              child: Text(
                controller.otpScreenEditBtnText,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.blue,
                    ),
              ),
            ),
          ),
        ),
        // Vertical space
        const SizedBox(height: 25.0),
        // Pin code text fields
        ReactivePinPut<String>(
          formControlName: controller.otpControl,
          fieldsCount: 6,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6),
          ],
          withCursor: true,
          autofocus: true,
          pinAnimationType: PinAnimationType.fade,
          submittedFieldDecoration: _pinPutDecoration(Colors.teal),
          selectedFieldDecoration: _pinPutDecoration(Colors.blue),
          followingFieldDecoration: _pinPutDecoration(Colors.red),
          validationMessages: (control) => {
            ValidationMessage.required: controller.requiresMsg,
            ValidationMessage.maxLength: controller.minMaxMsg,
            ValidationMessage.minLength: controller.minMaxMsg,
          },
        ),
        // Vertical space
        const SizedBox(height: 25.0),
        // Didn't receive code text & button
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text: Didn't receive code
            FadeIn(
              duration: const Duration(milliseconds: 800),
              child: Text(
                controller.otpScreenNotReceivedMsg,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            // Horizontal space
            const SizedBox(
              width: 10.0,
            ),
            // Resend again button
            _resendAgainTimerButton(context),
          ],
        ),
      ],
    );
  }

  // Function for pin code fields decoration
  BoxDecoration _pinPutDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(
        color: color,
      ),
    );
  }

  // ! ===== Verify button =====
  ReactiveFormConsumer _verifyButton() {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return FadeInRight(
          duration: const Duration(milliseconds: 800),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10.0),
            ),
            onPressed: form.valid
                ? () {
                    // todo: Call Api to verify otp code
                  }
                : null,
            child: const Icon(Icons.arrow_forward_rounded, size: 30.0),
          ),
        );
      },
    );
  }

  // ! ==== Request again timer button ====
  ArgonTimerButton _resendAgainTimerButton(BuildContext context) {
    return ArgonTimerButton(
      height: 16.0,
      width: 95.0,
      initialTimer: controller.otpScreenTimerValue,
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      color: Colors.transparent,
      elevation: 0,
      child: Text(
        controller.otpScreenResendBtnText,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
      ),
      loader: (timeLeft) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            "$timeLeft",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
          ),
        );
      },
      onTap: (startTimer, btnState) {
        if (btnState == ButtonState.Idle) {
          startTimer(controller.otpScreenTimerValue);
        }
      },
    );
  }
}
