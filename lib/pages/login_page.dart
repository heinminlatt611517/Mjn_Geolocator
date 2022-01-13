import 'package:flutter/material.dart';
import 'package:flutter_geolocator_example/network/RestApi.dart';
import 'package:flutter_geolocator_example/pages/my_location_page.dart';
import 'package:flutter_geolocator_example/utils/app_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userIdController = TextEditingController();
  var passwordController = TextEditingController();
  final writeData = GetStorage();

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Hero(
          tag: 'hero',
          child: Icon(
            Icons.account_circle,
            size: 150,
            color: Colors.black,
          )),
    );
    final inputEmail = Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: userIdController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'UserID',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
    final inputPassword = Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50.0))),
      ),
    );
    final buttonLogin = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        child: ButtonTheme(
          height: 50,
          child: RaisedButton(
            child: Text('Login',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            color: Colors.blue.withOpacity(0.8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            onPressed: ()  {
              debugPrint('click');
              if (userIdController.text != '' || passwordController.text != '')
                {
                  Map<String, String> map = {
                    'user_id': userIdController.value.text,
                    'password': passwordController.value.text
                  };

                debugPrint('call api');
                  RestApi.fetchSupportLogin(map).then((value) => {
                    Future.delayed(Duration.zero,
                        (){
                          if (value.status == 'Success')
                          {
                            Get.off(MyLocation(value.token.toString()));
                          }

                          else {
                            AppUtils.showErrorSnackBar("Fail", value.description ?? '' );
                          }
                        })
                      });
                }
            },
          ),
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              logo,
              inputEmail,
              inputPassword,
              buttonLogin,
            ],
          ),
        ),
      ),
    ));
  }
}
