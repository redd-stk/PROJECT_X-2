import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_x/src/features/controllers/sign_up_controller.dart';
import 'package:project_x/src/features/screens/otp_verification_screen/otp_verification.dart';

import '../../../common_widgets/defaultButton.dart';
import '../../../constants/constants.dart';
import '../../../size_config/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String name, phoneNumber, email;
  late String password;
  bool _isOperator = false;
  bool _isPassenger = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: getScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
            child: SizedBox(
                height: getScreenHeight(46),
                child: emailFormField(
                  controller.email,
                )),
          ),
          SizedBox(height: getScreenHeight(20)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
            child: SizedBox(
                height: getScreenHeight(46),
                child: nameFormField(
                  controller.name,
                )),
          ),
          SizedBox(
            height: getScreenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
            child: SizedBox(
                height: getScreenHeight(46),
                child: phoneNumberFormField(
                  controller.phoneNumber,
                )),
          ),
          SizedBox(
            height: getScreenHeight(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
            child: SizedBox(
                height: getScreenHeight(46),
                child: passwordFormField(
                  controller.password,
                )),
          ),
          SizedBox(
            height: getScreenHeight(10),
          ),
          Text(
            "Sign up as:",
            style: TextStyle(
                fontSize: getScreenWidth(14), fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(25)),
            child: Row(
              children: <Widget>[
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _isOperator,
                  onChanged: (value) {
                    setState(() {
                      _isOperator = value!;
                      _isPassenger = !value;
                    });
                  },
                ),
                const Text("Operator"),
                SizedBox(width: getScreenWidth(50)),
                Checkbox(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  value: _isPassenger,
                  onChanged: (value) {
                    setState(() {
                      _isPassenger = value!;
                      _isOperator = !value;
                    });
                  },
                ),
                const Text("Passenger"),
              ],
            ),
          ),
          Text(
            "** By pressing the Sign Up button you agree to our terms and conditions **",
            style: TextStyle(
                fontSize: getScreenWidth(getScreenWidth(13)),
                fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: getScreenHeight(15),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getScreenWidth(85)),
            child: DefaultButton(
                text: "Sign Up",
                pressed: () {
                  if (formKey.currentState!.validate()) {
                    SignUpController.Instance.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim());
                  }
                }),
          ),
        ],
      ),
    );
  }

  TextFormField emailFormField(controller) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "Please enter an email";
      //   }
      //   if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      //       .hasMatch(value)) {
      //     return "Please Enter a valid Email";
      //   }
      //   return null;
      // },
      onSaved: (newValue) => email = newValue!,
      decoration: InputDecoration(
        labelStyle: TextStyle(
            fontSize: getScreenWidth(18),
            color: appPrimaryColor,
            fontWeight: FontWeight.bold),
        hintStyle: TextStyle(fontSize: getScreenWidth(13)),
        labelText: "Email",
        hintText: "Enter Your Email address",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: appPrimaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: appPrimaryColor)),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField nameFormField(controller) {
    return TextFormField(
        // controller: _nameField,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        // validator: (value) {
        //   if (value!.isEmpty) {
        //     return "Please enter a name";
        //   }
        //   return null;
        // },
        onSaved: (newValue) => name = newValue!,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red)),
          labelStyle: TextStyle(
              fontSize: getScreenWidth(18),
              color: appPrimaryColor,
              fontWeight: FontWeight.bold),
          hintStyle: TextStyle(fontSize: getScreenWidth(13)),
          labelText: "Name",
          hintText: "Enter Your Name",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  TextFormField phoneNumberFormField(controller) {
    return TextFormField(
        // controller: _phoneNumberField,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onSaved: (newValue) => phoneNumber = newValue!,
        decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: getScreenWidth(18),
              color: appPrimaryColor,
              fontWeight: FontWeight.bold),
          hintStyle: TextStyle(fontSize: getScreenWidth(13)),
          labelText: "Phone Number",
          hintText: "Enter Your Phone Number",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }

  TextFormField passwordFormField(controller) {
    return TextFormField(
        // controller: _passwordField,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        textInputAction: TextInputAction.next,
        onSaved: (newValue) => password = newValue!,
        decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: getScreenWidth(18),
              color: appPrimaryColor,
              fontWeight: FontWeight.bold),
          hintStyle: TextStyle(fontSize: getScreenWidth(13)),
          labelText: "Password",
          hintText: "Enter Your Preferred Password",
          suffixIcon: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.remove_red_eye_sharp,
                size: getScreenWidth(21),
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: appPrimaryColor)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ));
  }
}
