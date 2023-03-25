import 'package:bookmarkapp/layout/bookmark_home_screen.dart';
import 'package:bookmarkapp/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var signupKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(),
                )
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: signupImage,
            fit: BoxFit.cover,
          ),
        ),
        child: defaultSignupForm(
          signupKey: signupKey,
          usernameController: usernameController,
          passwordController: passwordController,
          confirmPasswordController: confirmPasswordController,
          onPressed:  (){
            if(signupKey.currentState!.validate())
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(),
                  )
              );
              // print(usernameController.text);
              // print(passwordController.text);
              // print(confirmPasswordController.text);
            }
          },
          suffixPressed: ()
          {
            setState(()
            {
              signupIsPassword = !signupIsPassword;
            });
          },
        ),
      ),
    );
  }
}
//Form(
//           key: signupKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 25.0,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:
//               [
//                 Text(
//                   'SignUp',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 62.6,
//
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 defaultTextFormField(
//                   controller: userNameController,
//                   keyboardType: TextInputType.text,
//                   label: 'User Name',
//                   isPassword: false,
//                   validate: (value)
//                   {
//                     if(value!.isEmpty)
//                     {
//                       return 'user name should not be empty!';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 defaultTextFormField(
//                   controller: passwordController,
//                   keyboardType: TextInputType.visiblePassword,
//                   label: 'Password',
//                   isPassword: isPassword,
//                   suffixIcon: isPassword ? Icons.visibility_off : Icons.visibility,
//                   suffixPressed: (){
//                     setState(() {
//                       isPassword = !isPassword;
//                     });
//                   },
//                   validate: (value)
//                   {
//                     if(value!.isEmpty)
//                     {
//                       return 'password should not be empty!';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 defaultTextFormField(
//                   controller: confirmPasswordController,
//                   keyboardType: TextInputType.visiblePassword,
//                   label: 'Confirm Password',
//                   isPassword: isPassword,
//                   suffixIcon: isPassword ? Icons.visibility_off : Icons.visibility,
//                   suffixPressed: (){
//                     setState(() {
//                       isPassword = !isPassword;
//                     });
//                   },
//                   validate: (value)
//                   {
//                     if(value!.isEmpty)
//                     {
//                       return 'password should not be empty!';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Center(
//                   child: defaultButton(
//                     onPressed: (){
//                       if(signupKey.currentState!.validate())
//                       {
//                         print(userNameController.text);
//                         print(passwordController.text);
//                         print(confirmPasswordController.text);
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (BuildContext context) => HomeScreen(),
//                             )
//                         );
//                       }
//                     },
//                     text: 'register',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )