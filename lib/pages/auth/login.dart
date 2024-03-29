import 'package:flutter/material.dart';
import 'package:her2/constants/routes.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({ Key? key }) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  // final _auth = FirebaseAuth.instance; 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          
          image: AssetImage('assets/register1.jpg'), fit:BoxFit.cover
        )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:Stack(
            children: [
              Container(
                padding:EdgeInsets.only(left: 35,top: 130),
                child: Text('Welcome\nBack',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 33
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    right: 35,
                    left: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            fillColor: Colors.grey[100],
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                          validator: (value)
                          {
                            if(value!.isEmpty)
                            {
                              return("Please Enter Your Email");
                            }
                            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please Enter a valid email");
                            }
                          }
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: passwordTextEditingController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.vpn_key),
                            fillColor: Colors.grey[100],
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                        SizedBox(
                          height: 40
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text('Login',style:
                          TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            ),
                          ),
                          CircleAvatar(

                            radius: 30,
                            backgroundColor: Color(0xff4c505b),
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  String? result = await context
                                      .read<AuthenticationServices>()
                                      .signIn(emailTextEditingController.text.trim(),
                                      passwordTextEditingController.text.trim());
                                  if (result != "Signed In") {
                                    // Fluttertoast.showToast(
                                    //     msg: result.split('.')[0],
                                    //     toastLength: Toast.LENGTH_LONG,
                                    // );
                                  }
                                  print("signin result: ${result}");
                                } else {
                                  print("printing else");
                                }
                                //Navigator.pushNamed(context, homeDrawerPage);
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                            ),
                          ),
                        ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, registerPage);
                            },
                            child: Text('Sign Up',style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                          )
                          ),
                          // TextButton(
                          //   onPressed: (){},
                          //   child: Text('Forgot Password',style: TextStyle(
                          //   decoration: TextDecoration.underline,
                          //   fontSize: 18,
                          //   color: Color(0xff4c505b),
                          // ),
                          // )
                          // )
                        ],
                      )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}