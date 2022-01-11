import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileRegistrationScreenController extends GetxController {
  // ! ===== Variables =====
  final FormGroup profileRegistrationForm = FormGroup(
    {
      'name': FormControl<String>(validators: [Validators.required]),
      'email': FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
        Validators.maxLength(16),
      ]),
      'confirmPassword': FormControl<String>(),
    },
    validators: [
      Validators.mustMatch('password', 'confirmPassword'),
    ],
  );
}
