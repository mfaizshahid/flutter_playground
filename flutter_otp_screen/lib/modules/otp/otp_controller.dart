import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OtpController extends GetxController {
  // ! ==== Messages ====
  final String title = "OTP Screen";
  final String requiresMsg = "This field must not be empty";
  final String minMaxMsg = "OTP code length should be equal to 6";
  final String otpScreenTitle = "Verification";
  final String otpScreenHeaderlText =
      "Please enter the 6 digit verification code sent to";
  final String otpScreenNotReceivedMsg = "Didn't receive code?";
  final String otpScreenResendBtnText = "Request again";
  final String otpScreenEditBtnText = "Edit Number";
  final int otpScreenTimerValue = 30;
  // ! ==== Variables ====
  // Form control name
  final String otpControl = "otpForm";
  late FormGroup otpForm;

  @override
  void onInit() {
    super.onInit();
    otpForm = FormGroup({
      otpControl: FormControl<String>(validators: [
        Validators.required,
        // Set min & max length according to your choice
        Validators.minLength(6),
        Validators.maxLength(6),
      ]),
    });
  }
}
