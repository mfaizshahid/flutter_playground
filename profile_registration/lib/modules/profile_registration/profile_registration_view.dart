import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile_registration/modules/profile_registration/profile_registration_controller.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileRegistrationScreen
    extends GetView<ProfileRegistrationScreenController> {
  const ProfileRegistrationScreen({Key? key}) : super(key: key);

  @override
  SafeArea build(BuildContext context) {
    return SafeArea(
      child: ReactiveForm(
        formGroup: controller.profileRegistrationForm,
        child: Scaffold(
          appBar: _appBar(context),
          body: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            child: _screenContent(context),
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
      centerTitle: true,
      title: Text(
        "Profile Registration",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  // ! ===== Screen Content ====
  Column _screenContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Name text field
        FadeIn(
          duration: const Duration(milliseconds: 900),
          child: ReactiveTextField(
            formControlName: 'name',
            onSubmitted: () =>
                controller.profileRegistrationForm.control('email').focus(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: '',
              labelText: "Name",
              suffixIcon: IconButton(
                onPressed: () =>
                    controller.profileRegistrationForm.control('name').reset(),
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ),
            validationMessages: (control) => {
              ValidationMessage.required: "This field must not be empty",
            },
          ),
        ),
        const SizedBox(height: 15.0),
        // Email text field
        FadeIn(
          duration: const Duration(milliseconds: 900),
          child: ReactiveTextField(
            formControlName: 'email',
            onSubmitted: () =>
                controller.profileRegistrationForm.control('password').focus(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: '',
              labelText: "Email",
              suffixIcon: IconButton(
                onPressed: () =>
                    controller.profileRegistrationForm.control('email').reset(),
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ),
            validationMessages: (control) => {
              ValidationMessage.required: "This field must not be empty",
              ValidationMessage.email: "Invalid email",
            },
          ),
        ),
        const SizedBox(height: 15.0),
        // Password text field
        FadeIn(
          duration: const Duration(milliseconds: 900),
          child: ReactiveTextField(
            obscureText: true,
            formControlName: 'password',
            onSubmitted: () => controller.profileRegistrationForm
                .control('confirmPassword')
                .focus(),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: '',
              labelText: "Password",
              suffixIcon: IconButton(
                onPressed: () => controller.profileRegistrationForm
                    .control('password')
                    .reset(),
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ),
            validationMessages: (control) => {
              ValidationMessage.required: "This field must not be empty",
              ValidationMessage.minLength:
                  "Password length must be atleast 8 characters",
              ValidationMessage.maxLength:
                  "Password length should be less than 16 characters",
            },
          ),
        ),
        const SizedBox(height: 15.0),
        // Confirm Password text field
        FadeIn(
          duration: const Duration(milliseconds: 900),
          child: ReactiveTextField(
            obscureText: true,
            formControlName: 'confirmPassword',
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: '',
              labelText: "Confirm Password",
              suffixIcon: IconButton(
                onPressed: () => controller.profileRegistrationForm
                    .control('confirmPassword')
                    .reset(),
                icon: const Icon(
                  Icons.clear_rounded,
                ),
              ),
            ),
            validationMessages: (control) => {
              ValidationMessage.mustMatch:
                  "Password and Confirm Password does not match"
            },
          ),
        ),
      ],
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
                    // todo: Call Api to register user
                    Get.snackbar(
                      "Profile Registration Form",
                      "Form Valid",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                : null,
            child: const Icon(Icons.arrow_forward_rounded, size: 30.0),
          ),
        );
      },
    );
  }
}
