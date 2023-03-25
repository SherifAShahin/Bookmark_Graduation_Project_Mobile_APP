import 'package:bookmarkapp/layout/bookmark_home_screen.dart';
import 'package:bookmarkapp/modules/signup/signup_screen.dart';
import 'package:bookmarkapp/shared/components/components.dart';
import 'package:bookmarkapp/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: loginImage,
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 62.6,

                  ),
                ),
                SizedBox(
                height: 5.0,
                ),
                defaultTextFormField(
                    controller: userNameController,
                    keyboardType: TextInputType.text,
                    label: 'User Name',
                    isPassword: false,
                    validate: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'user name should not be empty!';
                      }
                        return null;
                    },
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultTextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  label: 'Password',
                  isPassword: isPassword,
                  suffixIcon: isPassword ? Icons.visibility_off : Icons.visibility,
                  suffixPressed: (){
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  validate: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'password should not be empty!';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: defaultButton(
                      onPressed: (){
                        if(formKey.currentState!.validate())
                        {
                          print(userNameController.text);
                          print(passwordController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => HomeScreen(),
                              )
                          );
                        }
                      },
                      text: 'login',
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text(
                      'don’t have an account?, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18.5,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'sign up...',
                        style: TextStyle(
                          color: HexColor(
                            '#045255',
                          ),
                          fontWeight: FontWeight.w700,
                          fontSize: 18.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
