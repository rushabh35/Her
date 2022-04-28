import 'package:flutter/material.dart';
import 'package:her2/FadeAnimation.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({ Key? key }) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    //   return Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/register1.jpg'), fit:BoxFit.cover
    //     )
    //     ),
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.transparent,
    //         elevation: 0,
    //       ),
    //       backgroundColor: Colors.transparent,
    //       body:Stack(
    //         children: [
    //           Container(
    //             padding:EdgeInsets.only(left: 35,top: 70),
    //             child: Text('Create\nAccount',
    //             style: TextStyle(
    //               color: Colors.black,
    //               fontSize: 33
    //               ),
    //             ),
    //           ),
    //           SingleChildScrollView(
    //             child: Container(
    //               padding: EdgeInsets.only(
    //               top: MediaQuery.of(context).size.height * 0.28,
    //               right: 35,
    //               left: 35),
    //               child: Column(
    //                 children: [
    //                   TextField(
    //                     decoration: InputDecoration(
    //                       prefixIcon: Icon(Icons.person),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(color: Colors.black)
    //                       ),
    //                       enabledBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(color: Colors.grey)
    //                       ),
    //                       hintText: 'Name',
    //                       hintStyle: TextStyle(color: Colors.black),
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10)
    //                       )
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 30,
    //                   ),
    //                   TextField(
    //                     decoration: InputDecoration(
    //                       prefixIcon: Icon(Icons.email),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(color: Colors.black)
    //                       ),
    //                       enabledBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(color: Colors.grey)
    //                       ),
    //                       hintText: 'Email',
    //                       hintStyle: TextStyle(color: Colors.black),
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10)
    //                       )
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 30,
    //                   ),
    //                   TextField(
    //                     obscureText: true,
    //                     decoration: InputDecoration(
    //                       prefixIcon: Icon(Icons.vpn_key_rounded),
    //                       focusedBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(color: Colors.black)
    //                       ),
    //                       enabledBorder: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10),
    //                         borderSide: BorderSide(color: Colors.grey)
    //                       ),
    //                       hintText: 'Password',
    //                       hintStyle: TextStyle(color: Colors.black),
    //                       border: OutlineInputBorder(
    //                         borderRadius: BorderRadius.circular(10)
    //                       )
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: 40
    //                   ),
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                     Text('Login',style: 
    //                     TextStyle(
    //                       color: Colors.black,
    //                       fontSize: 27,
    //                       fontWeight: FontWeight.w700,
    //                       ),
    //                     ),
    //                     CircleAvatar(
    //                       radius: 30,
    //                       backgroundColor: Color(0xff4c505b),
    //                       child: IconButton(
    //                         color: Colors.white,
    //                         onPressed: (){
    //                         Navigator.pushNamed(context, 'home_drawer');
    //                         },
    //                         icon: Icon(
    //                           Icons.arrow_forward,
    //                       ),
    //                     ),
    //                   ),
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 40,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     TextButton(
    //                       onPressed: (){
    //                         Navigator.pushNamed(context, 'login');
    //                       }, 
    //                       child: Text('Sign In',style: TextStyle(
    //                       decoration: TextDecoration.underline,
    //                       fontSize: 18,
    //                       color: Colors.black
    //                     ),
    //                     )
    //                     ),
                        
    //                   ],
    //                 )
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    // );
      return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      	child: Container(
	        child: Column(
	          children: <Widget>[
	            Container(
	              height: 400,
	              decoration: BoxDecoration(
	                image: DecorationImage(
	                  image: AssetImage('assets/background.png'),
	                  fit: BoxFit.fill
	                )
	              ),
	              child: Stack(
	                children: <Widget>[
	                  Positioned(
	                    left: 30,
	                    width: 80,
	                    height: 200,
	                    child: FadeAnimation(1, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/light-1.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    left: 140,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.3, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/light-2.png')
	                        )
	                      ),
	                    )
                      ),
	                  ),
	                  Positioned(
	                    right: 40,
	                    top: 40,
	                    width: 80,
	                    height: 150,
	                    child: FadeAnimation(1.5, Container(
	                      decoration: BoxDecoration(
	                        image: DecorationImage(
	                          image: AssetImage('assets/clock.png')
	                        )
	                      ),
	                    )),
	                  ),
	                  Positioned(
	                    child: FadeAnimation(1.6, Container(
	                      margin: EdgeInsets.only(top: 50),
	                      child: Center(
	                        child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
	                      ),
	                    )),
	                  )
	                ],
	              ),
	            ),
	            Padding(
	              padding: EdgeInsets.all(30.0),
	              child: Column(
	                children: <Widget>[
	                  FadeAnimation(1.8, Container(
	                    padding: EdgeInsets.all(5),
	                    decoration: BoxDecoration(
	                      color: Colors.white,
	                      borderRadius: BorderRadius.circular(10),
	                      boxShadow: [
	                        BoxShadow(
	                          color: Color.fromRGBO(143, 148, 251, .2),
	                          blurRadius: 20.0,
	                          offset: Offset(0, 10)
	                        )
	                      ]
	                    ),
	                    child: Column(
	                      children: <Widget>[
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100] as dynamic))
	                          ),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Full Name",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Email ",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
                          Container(
	                          padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
	                            border: Border(bottom: BorderSide(color: Colors.grey[100] as dynamic))
	                          ),
	                          child: TextField(
	                            decoration: InputDecoration(
	                              border: InputBorder.none,
	                              hintText: "Password",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        )
	                      ],
	                    ),
	                  )),
	                  SizedBox(height: 30,),
	                  FadeAnimation(2, Container(
	                    height: 50,
	                    decoration: BoxDecoration(
	                      borderRadius: BorderRadius.circular(10),
	                      gradient: LinearGradient(
	                        colors: [
	                          Color.fromRGBO(143, 148, 251, 1),
	                          Color.fromRGBO(143, 148, 251, .6),
	                        ]
	                      )
	                    ),
	                    child: Center(
	                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'home_drawer');
                        },
	                        child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
	                  )),
	                  SizedBox(height: 70,),
	                  FadeAnimation(
                      1.5, 
                      GestureDetector(
                        onTap : () {
                          Navigator.pushNamed(context, 'login');
                        },
                        child: Text(
                          "Already have an account?", 
                          style: TextStyle(
                            color: Color.fromRGBO(143, 148, 251, 1)
                          ),
                        ),
                      )
                    ),
	                ],
	              ),
	            )
	          ],
	        ),
	      ),
      )
    );
  }
  }
