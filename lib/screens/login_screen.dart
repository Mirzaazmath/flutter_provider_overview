import 'package:flutter/material.dart';
import 'package:flutter_provider_overview/utills/general_utlis.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../res/components/buttons_components.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 final  TextEditingController _emailcontroller=TextEditingController();
 final  TextEditingController _passwordcontroller=TextEditingController();
  final  FocusNode _emailnode= FocusNode();
   final FocusNode _passwordnode= FocusNode();

  final  ValueNotifier<bool> _obsurevalue= ValueNotifier<bool>(true);

  /// here we are overriding the dispone method so that we can dispose
 /// the controller and it willl  help for less ram consumption
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _emailnode.dispose();
    _passwordcontroller.dispose();
    _passwordnode.dispose();
  }


  @override
  Widget build(BuildContext context) {
     final authprovider=Provider.of<AuthProvider>(context);
     print("build");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const   Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            const   SizedBox(height: 10,),
            TextFormField(
              focusNode: _emailnode,
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmitted: (val){
                Utils.focusFeildChange(context, _emailnode, _passwordnode);
              },
              decoration:const  InputDecoration(
                hintText: "Email",
                suffixIcon: Icon(Icons.person)

              ),),
          const   SizedBox(height: 10,),
            /// Listen the Change and rebuild that particular widget
            ValueListenableBuilder(
              valueListenable: _obsurevalue,
              builder: (context,notifer,child){
                return TextFormField(
                  obscureText: notifer,
                  focusNode: _passwordnode,
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.text,
                  decoration:  InputDecoration(
                      hintText: "Password",
                      suffixIcon: InkWell(
                        onTap: (){
                         _obsurevalue.value=!_obsurevalue.value;
                        },
                          child: Icon(notifer?Icons.visibility_off: Icons.visibility))
                  ),);
              },

            ),
            const   SizedBox(height: 40,),
            CustomButton(
              loading: authprovider.load,
              title: "Login",onTap: (){
              if(_emailcontroller.text==""){
                Utils.toastmessage("Please Enter Email");
              }else if (_passwordcontroller.text==""){
                Utils.toastmessage("Please Enter password");
              }else if (_passwordcontroller.text.length<6){
                Utils.showflushbarMessage("Password Should be of more then 6 digits", context);
              }else{
                Map data={
                  "email":_emailcontroller.text.toString(),
                "password":_passwordcontroller.text.toString(),
                };
                authprovider.logincall(data, context);

                print("Api Hits");
              }

            },)
          ],

        ),
      )

    );
  }
}
