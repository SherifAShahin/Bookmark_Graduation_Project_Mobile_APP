import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ionicons/ionicons.dart';

import '../../github.dart';
import '../../github2.dart';

Widget defaultButton({
  double width = 280.0,
  double height = 64.0,
  String hexColor = '#045255',
  double borderRadius = 15.0,
  required Function()? onPressed,
  required String text,
  Color textColor = Colors.white,
  double fontSize = 25.0,
}) => Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    color: HexColor(
      hexColor,
    ),
    borderRadius: BorderRadius.circular(
      borderRadius,
    ),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
      ),
    ),
  ),
);

Widget defaultTextFormField({
  double height = 50.0,
  Color color = Colors.white,
  double borderRadius = 15.0,
  required var controller,
  required TextInputType keyboardType,
  required String label,
  required bool isPassword,
  ValueChanged? onSubmit,
  required FormFieldValidator validate,
  bool labelIsOn = false,
  IconData? suffixIcon,
  Function()? suffixPressed,
}) => Container(
  height: height,
  padding: EdgeInsetsDirectional.only(
    start: 10.0,
  ),
  decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(
      borderRadius,
    ),
  ),
  child: TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: isPassword,
    onFieldSubmitted: onSubmit,
    validator: validate,

    decoration: InputDecoration(
      labelText: label,
      suffixIcon: suffixIcon != null ? IconButton(
        highlightColor: HexColor('#e3c099'),
        onPressed: suffixPressed,
        icon: Icon(
          suffixIcon,
        ),
      ) : null,
      floatingLabelBehavior: labelIsOn ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
      border: InputBorder.none,
    ),
  ),
);

Widget defaultNoteMessage({
  double margin = 25.0,
  double padding = 20.0,
  double opacity = 0.5,
  double borderRadius = 15.0,
  double titleBoldTextSize = 30.0,
  double titleRegularTextSize = 20.0,
  double bodyTextSize = 20.0,
  double endTextSize = 20.0,
  bool isTransparent = true,
  Color backgroundColor = Colors.white,
  Color? titleBoldTextColor = Colors.black,
  Color? titleRegularTextColor = Colors.black,
  Color? bodyTextColor = Colors.black,
  Color? endTextColor = Colors.black,
  FontWeight titleBoldFontWeight = FontWeight.w700,
  FontWeight? titleRegularFontWeight,
  FontWeight? bodyTextFontWeight,
  FontWeight? endTextFontWeight,
  TextAlign? titleTextAlign,
  TextAlign bodyTextAlign = TextAlign.justify,
  TextAlign endTextAlign = TextAlign.end,
  String? titleBold,
  String? titleRegular,
  String? bodyText,
  String? endText,
  required String buttonText,
  required Function()? onPressed,
}) => Center(
  child: Container(
    margin: EdgeInsets.symmetric(
      horizontal: margin,
    ),
    padding: EdgeInsets.all(
      padding,
    ),
    decoration: BoxDecoration(
      color: isTransparent ? backgroundColor.withOpacity(
        opacity,
      ) : backgroundColor,
      borderRadius: BorderRadius.circular(
        borderRadius,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        RichText(
          text: TextSpan(
            children:
            [
              TextSpan(
                text: titleBold,
                style: TextStyle(
                  fontSize: titleBoldTextSize,
                  fontWeight: titleBoldFontWeight,
                  color: titleBoldTextColor,
                ),
              ),
              TextSpan(
                text: titleRegular,
                style: TextStyle(
                  fontSize: titleRegularTextSize,
                  fontWeight: titleRegularFontWeight,
                  color: titleRegularTextColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          bodyText!,
          style: TextStyle(
            fontSize: bodyTextSize,
            fontWeight: bodyTextFontWeight,
            color: bodyTextColor,
          ),
          textAlign: bodyTextAlign,
        ),
        SizedBox(
          height: 14.0,
        ),
        SizedBox(
          width: double.infinity,
          child: Text(
            endText!,
            style: TextStyle(
              fontSize: endTextSize,
              fontWeight: endTextFontWeight,
              color: endTextColor,
            ),
            textAlign: endTextAlign,
          ),
        ),
        SizedBox(
          height: 27.0,
        ),
        defaultButton(
            onPressed: onPressed,
            text: buttonText,
        ),
      ],
    ),
  ),
);



bool loginIsPassword = true;
Widget defaultLoginForm({
  required GlobalKey<FormState> formKey,
  required var usernameController,
  required var passwordController,
  required Function()? onPressed,
  required Function()? suffixPressed,
  required Function()? textButtonOnPressed,
  double padding = 25.0,
  double titleFontSize = 62.6,
  double dontHaveAccountTextFontSize = 18.5,
  double textButtonFontSize = 18.5,
  double buttonFontSize = 25.0,
  double buttonWidth = 280.0,
  double buttonHeight = 64.0,
  double buttonBorderRadius = 15.0,
  TextInputType usernameKeyboardType = TextInputType.text,
  TextInputType passwordKeyboardType = TextInputType.visiblePassword,
  String title = 'Login',
  String usernameLabel = 'Username',
  String passwordLabel = 'Password',
  String usernameValidateMessage = 'user name should not be empty!',
  String passwordValidateMessage = 'password should not be empty!',
  String buttonText = 'login',
  String dontHaveAccountText = 'don’t have an account?, ',
  String textButtonTitle = 'sign up...',
  String textButtonColor = '#045255',
  String buttonHexColor = '#045255',
  IconData suffixOff = Icons.visibility_off,
  IconData suffixOn = Icons.visibility,
  Color buttonTextColor = Colors.white,
  Color dontHaveAccountTextColor = Colors.white,
  FontWeight textButtonFontWeight = FontWeight.w700,
  FontWeight titleFontWeight = FontWeight.w700,
  FontWeight dontHaveAccountTextFontWeight = FontWeight.w400,
}) => Form(
  key: formKey,
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Text(
          title,
          style: TextStyle(
            fontWeight: titleFontWeight,
            fontSize: titleFontSize,

          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        defaultTextFormField(
          controller: usernameController,
          keyboardType: usernameKeyboardType,
          label: usernameLabel,
          isPassword: false,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return usernameValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        defaultTextFormField(
          controller: passwordController,
          keyboardType: passwordKeyboardType,
          label: passwordLabel,
          isPassword: loginIsPassword,
          suffixIcon: loginIsPassword ? suffixOff : suffixOn,
          suffixPressed: suffixPressed,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return passwordValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: defaultButton(
            onPressed: onPressed,
            text: buttonText,
            textColor: buttonTextColor,
            fontSize: buttonFontSize,
            borderRadius: buttonBorderRadius,
            height: buttonHeight,
            width: buttonWidth,
            hexColor: buttonHexColor,
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
              dontHaveAccountText,
              style: TextStyle(
                color: dontHaveAccountTextColor,
                fontWeight: dontHaveAccountTextFontWeight,
                fontSize: dontHaveAccountTextFontSize,
              ),
            ),
            TextButton(
              onPressed: textButtonOnPressed,
              child: Text(
                textButtonTitle,
                style: TextStyle(
                  color: HexColor(
                    textButtonColor,
                  ),
                  fontWeight: textButtonFontWeight,
                  fontSize: textButtonFontSize,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);


bool signupIsPassword = true;
Widget defaultSignupForm({
  required GlobalKey<FormState> signupKey,
  required var usernameController,
  required var passwordController,
  required var confirmPasswordController,
  required Function()? onPressed,
  required Function()? suffixPressed,
  double padding = 25.0,
  double buttonFontSize = 25.0,
  double buttonWidth = 280.0,
  double buttonHeight = 64.0,
  double buttonBorderRadius = 15.0,
  double titleFontSize = 62.6,
  FontWeight titleFontWeight = FontWeight.w700,
  String title = 'SignUp',
  String usernameLabel = 'Username',
  String passwordLabel = 'Password',
  String confirmPasswordLabel = 'Confirm Password',
  String usernameValidateMessage = 'username should not be empty!',
  String passwordValidateMessage = 'password should not be empty!',
  String confirmPasswordValidateMessage = 'password should not be empty!',
  String buttonHexColor = '#045255',
  String buttonText = 'register',
  TextInputType usernameKeyboardType = TextInputType.text,
  TextInputType passwordKeyboardType = TextInputType.visiblePassword,
  IconData suffixOff = Icons.visibility_off,
  IconData suffixOn = Icons.visibility,
  Color buttonTextColor = Colors.white,
}) => Form(
  key: signupKey,
  child: Padding(
    padding: EdgeInsets.symmetric(
      horizontal: padding,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Text(
          title,
          style: TextStyle(
            fontWeight: titleFontWeight,
            fontSize: titleFontSize,

          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        defaultTextFormField(
          controller: usernameController,
          keyboardType: usernameKeyboardType,
          label: usernameLabel,
          isPassword: false,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return usernameValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        defaultTextFormField(
          controller: passwordController,
          keyboardType: passwordKeyboardType,
          label: passwordLabel,
          isPassword: signupIsPassword,
          suffixIcon: signupIsPassword ? suffixOff : suffixOn,
          suffixPressed: suffixPressed,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return passwordValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        defaultTextFormField(
          controller: confirmPasswordController,
          keyboardType: passwordKeyboardType,
          label: confirmPasswordLabel,
          isPassword: signupIsPassword,
          suffixIcon: signupIsPassword ? suffixOff : suffixOn,
          suffixPressed: suffixPressed,
          validate: (value)
          {
            if(value!.isEmpty)
            {
              return confirmPasswordValidateMessage;
            }
            return null;
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: defaultButton(
            onPressed: onPressed,
            text: buttonText,
            textColor: buttonTextColor,
            fontSize: buttonFontSize,
            borderRadius: buttonBorderRadius,
            height: buttonHeight,
            width: buttonWidth,
            hexColor: buttonHexColor,
          ),
        ),
      ],
    ),
  ),
);

Widget bookItemBuilder({
  required BookModel model,
  double margin = 15.0,
  double opacity = 0.5,
  double radius = 15.0,
  double titleFontSize = 25.0,
  double authorFontSize = 20.0,
  double bookGenreFontSize = 20.0,
  double iconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String hexColor = '#045255',
  Color fontColor = Colors.white,
  Color iconColor = Colors.amber,
  FontWeight fontWeight = FontWeight.w300,
  IconData icon = Icons.star,
}) => Padding(
  padding: const EdgeInsets.only(
    top: 27.0,
  ),
  child: Container(
    height: 202.0,
    width: double.infinity,
    padding: EdgeInsetsDirectional.all(
      20.0,
    ),
    margin: EdgeInsetsDirectional.symmetric(
      horizontal: margin,
    ),
    decoration: BoxDecoration(
      color: HexColor(
        hexColor,
      ).withOpacity(opacity),
      borderRadius: BorderRadius.circular(
        radius,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Image.network(
          model.image,
          fit: BoxFit.fill,
          width: 115.6,
        ),
        SizedBox(
          width: 21.4,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  color: fontColor,
                  fontWeight: fontWeight,
                  fontSize: titleFontSize,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Text(
                  model.author,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontSize: authorFontSize,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Text(
                  model.genre,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontSize: bookGenreFontSize,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: RatingBar.builder(
                    itemSize: iconSize,
                    initialRating: initialRating,
                    minRating: minRating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Icon(
                      icon,
                      color: iconColor,
                    ),
                    onRatingUpdate: (rating)
                    {
                      print(rating);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

Widget bookItemListBuilder({
  required List<BookModel> model,
  double margin = 15.0,
  double opacity = 0.5,
  double radius = 15.0,
  double titleFontSize = 25.0,
  double authorFontSize = 20.0,
  double bookGenreFontSize = 20.0,
  double iconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String hexColor = '#045255',
  Color fontColor = Colors.white,
  Color iconColor = Colors.amber,
  FontWeight fontWeight = FontWeight.w300,
  IconData icon = Icons.star,
}) => ListView.builder(
  itemBuilder: (context, index) => MaterialButton(
    padding: EdgeInsetsDirectional.all(
      0.0,
    ),
    onPressed: ()
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GitHubScreen2(model[index]),
        ),
      );
    },
    child: bookItemBuilder(
      model: model[index],
      minRating: minRating,
      titleFontSize: titleFontSize,
      radius: radius,
      opacity: opacity,
      initialRating: initialRating,
      iconColor: iconColor,
      fontColor: fontColor,
      bookGenreFontSize: bookGenreFontSize,
      authorFontSize: authorFontSize,
      icon: icon,
      fontWeight: fontWeight,
      iconSize: iconSize,
      hexColor: hexColor,
      margin: margin,
    ),
  ),
  itemCount: model.length,
);

Widget booksItemDetailBuilder({
  required BookModel model,
  required Function()? heartIconOnPressed,
  required Function()? archiveIconOnPressed,
  required Function()? shareIconOnPressed,
  double iconSize = 50.0,
  double imageWidth = 233.0,
  double imageHeight = 308.3,
  double titleFontSize = 28.0,
  double textFontSize = 25.0,
  double headingFontSize = 25.0,
  double ratingIconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String iconHexColor = '#045255',
  String noDescriptionMessage = 'there is no description to show now. check later',
  String ratingIconHexColor = '#045255',
  IconData heartIcon = Ionicons.heart_outline,
  IconData archiveIcon = Ionicons.archive_outline,
  IconData shareIcon = Ionicons.share_social_outline,
  IconData ratingIcon = Icons.star,
  BoxFit imageBoxFit = BoxFit.fill,
  FontWeight titleFontWeight = FontWeight.w700,
  FontWeight headingFontWeight = FontWeight.w700,
  FontWeight textFontWeight = FontWeight.w400,
  Color textColor = Colors.black,
}) => Container(
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.5),
    borderRadius: BorderRadius.circular(
      15.0,
    ),
  ),
  child: Padding(
    padding: EdgeInsets.all(
      20.0,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Image.network(
              model.image,
              fit: imageBoxFit,
              width: imageWidth,
              height: imageHeight,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                [
                  IconButton(
                    onPressed: heartIconOnPressed,
                    icon: Icon(
                      heartIcon,
                      size: iconSize,
                      color: HexColor(
                        iconHexColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  IconButton(
                    onPressed: archiveIconOnPressed,
                    icon: Icon(
                      archiveIcon,
                      size: iconSize,
                      color: HexColor(
                        iconHexColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  IconButton(
                    onPressed: shareIconOnPressed,
                    icon: Icon(
                      shareIcon,
                      size: iconSize,
                      color: HexColor(
                        iconHexColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          model.title,
          style: TextStyle(
              fontWeight: titleFontWeight,
              fontSize: titleFontSize,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        RichText(
            text: TextSpan(
                children:
                [
                  TextSpan(
                    text: "Author: ",
                    style: TextStyle(
                      fontWeight: headingFontWeight,
                      color: textColor,
                      fontSize: headingFontSize,
                    ),
                  ),
                  TextSpan(
                    text: model.author,
                    style: TextStyle(
                      fontWeight: textFontWeight,
                      color: textColor,
                      fontSize: textFontSize,
                    ),
                  )
                ]
            )
        ),
        SizedBox(
          height: 10.0,
        ),
        RichText(
            text: TextSpan(
                children:
                [
                  TextSpan(
                    text: "Genre: ",
                    style: TextStyle(
                      fontWeight: headingFontWeight,
                      color: textColor,
                      fontSize: headingFontSize,
                    ),
                  ),
                  TextSpan(
                    text: model.genre,
                    style: TextStyle(
                      fontWeight: textFontWeight,
                      color: textColor,
                      fontSize: textFontSize,
                    ),
                  )
                ]
            )
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Description: ",
          style: TextStyle(
            fontWeight: headingFontWeight,
            color: textColor,
            fontSize: headingFontSize,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        ConditionalBuilder(
          condition: model.description == null,
          builder: (context) => Text(
            noDescriptionMessage,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: textFontWeight,
              color: textColor,
              fontSize: textFontSize,
            ),
          ),
          fallback: (context) => Text(
            model.description.toString(),
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontWeight: textFontWeight,
              color: textColor,
              fontSize: textFontSize,
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children:
          [
            Text(
              'Rating: ',
              style: TextStyle(
                fontWeight: headingFontWeight,
                color: textColor,
                fontSize: headingFontSize,
              ),
            ),
            RatingBar.builder(
              itemSize: ratingIconSize,
              initialRating: initialRating,
              minRating: minRating,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, index) => Icon(
                ratingIcon,
                color: HexColor(
                  ratingIconHexColor,
                ),
              ),
              onRatingUpdate: (rating)
              {
                print(rating);
              },
            ),
          ],
        ),
      ],
    ),
  ),
);