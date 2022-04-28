import 'package:flutter/material.dart';
import 'package:her2/FadeAnimation.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({ Key? key }) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  // final _auth = FirebaseAuth.instance; 
  Widget build(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       image: DecorationImage(
          
  //         image: AssetImage('assets/register1.jpg'), fit:BoxFit.cover
  //       )
  //       ),
  //       child: Scaffold(
  //         backgroundColor: Colors.transparent,
  //         body:Stack(
  //           children: [
  //             Container(
  //               padding:EdgeInsets.only(left: 35,top: 130),
  //               child: Text('Welcome\nBack',
  //               style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 33
  //                 ),
  //               ),
  //             ),
  //             SingleChildScrollView(
  //               child: Container(
  //                 padding: EdgeInsets.only(
  //                 top: MediaQuery.of(context).size.height * 0.5,
  //                 right: 35,
  //                 left: 35),
  //                 child: Column(
  //                   children: [
  //                     TextFormField(
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(Icons.mail),
  //                         fillColor: Colors.grey[100],
  //                         hintText: 'Email',
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10)
  //                         )
  //                       ),
  //                       validator: (value)
  //                       {
  //                         if(value!.isEmpty)
  //                         {
  //                           return("Please Enter Your Email");
  //                         }
  //                         if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
  //                             .hasMatch(value)) {
  //                           return ("Please Enter a valid email");
  //                         }
  //                       }
  //                     ),
  //                     SizedBox(
  //                       height: 30,
  //                     ),
  //                     TextField(
  //                       obscureText: true,
  //                       decoration: InputDecoration(
  //                         prefixIcon: Icon(Icons.vpn_key),
  //                         fillColor: Colors.grey[100],
  //                         hintText: 'Password',
  //                         border: OutlineInputBorder(
  //                           borderRadius: BorderRadius.circular(10)
  //                         )
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 40
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                       Text('Login',style: 
  //                       TextStyle(
  //                         color: Color(0xff4c505b),
  //                         fontSize: 27,
  //                         fontWeight: FontWeight.w700,
  //                         ),
  //                       ),
  //                       CircleAvatar(
                          
  //                         radius: 30,
  //                         backgroundColor: Color(0xff4c505b),
  //                         child: IconButton(
  //                           color: Colors.white,
  //                           onPressed: (){
  //                             Navigator.pushNamed(context, 'home_drawer');
  //                           },
  //                           icon: Icon(
  //                             Icons.arrow_forward,
  //                         ),
  //                       ),
  //                     ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 40,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       TextButton(
  //                         onPressed: (){
  //                           Navigator.pushNamed(context, 'register');
  //                         }, 
  //                         child: Text('Sign Up',style: TextStyle(
  //                         decoration: TextDecoration.underline,
  //                         fontSize: 18,
  //                         color: Color(0xff4c505b),
  //                       ),
  //                       )
  //                       ),
  //                       // TextButton(
  //                       //   onPressed: (){}, 
  //                       //   child: Text('Forgot Password',style: TextStyle(
  //                       //   decoration: TextDecoration.underline,
  //                       //   fontSize: 18,
  //                       //   color: Color(0xff4c505b),
  //                       // ),
  //                       // )
  //                       // )
  //                     ],
  //                   )
  //                   ],
  //                 ),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //   );
  // }
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
	                    )),
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
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
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
	                              hintText: "Email",
	                              hintStyle: TextStyle(color: Colors.grey[400])
	                            ),
	                          ),
	                        ),
	                        Container(
	                          padding: EdgeInsets.all(8.0),
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
	                        child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
	                      ),
	                    ),
	                  )),
	                  SizedBox(height: 70,),
	                  FadeAnimation(
                      1.5, 
                      GestureDetector(
                        onTap : () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: Text(
                          "Create Account?", 
                          style: TextStyle(
                            fontSize : 14,
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