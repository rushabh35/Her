import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({ Key? key }) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
      return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/register1.jpg'), fit:BoxFit.cover
        )
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body:Stack(
            children: [
              Container(
                padding:EdgeInsets.only(left: 35,top: 70),
                child: Text('Create\nAccount',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 33
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.28,
                  right: 35,
                  left: 35),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key_rounded),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
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
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: (){
                            Navigator.pushNamed(context, 'home_drawer');
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
                            Navigator.pushNamed(context, 'login');
                          }, 
                          child: Text('Sign In',style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Colors.black
                        ),
                        )
                        ),
                        
                      ],
                    )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
  }
