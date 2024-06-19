// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'email_verification_screen.dart';
// import 'login.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange,
//       body: Column(
//         children: [
//           const SizedBox(height: 50),
//           const Text(
//             "Register",
//             style: TextStyle(
//               fontSize: 45,
//               fontWeight: FontWeight.w800,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 200),
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(70),
//                 ),
//                 color: Colors.white,
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 50),
//                     TextField(
//                       controller: emailController,
//
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.withOpacity(0.25),
//                         filled: true,
//                         hintText: "Enter Email",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       keyboardType: TextInputType.phone,
//                       controller: phoneController,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.withOpacity(0.25),
//                         filled: true,
//                         hintText: "Enter Phone",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       controller: passwordController,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         fillColor: Colors.grey.withOpacity(0.25),
//                         filled: true,
//                         hintText: "Enter Password",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     isLoading
//                         ? const CircularProgressIndicator()
//                         : Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.orange,
//                       ),
//                       width: double.infinity,
//                       child: GestureDetector(
//                         onTap: () async {
//                           setState(() {
//                             isLoading = true;
//                           });
//
//                           try {
//                             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                               email: emailController.text,
//                               password: passwordController.text,
//                             );
//
//                             await FirebaseAuth.instance.currentUser?.sendEmailVerification();
//
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => EmailVerificationScreen(
//                                   email: emailController.text,
//                                   phone: phoneController.text,
//                                   password: passwordController.text,
//                                 ),
//                               ),
//                             );
//                           } catch (e) {
//                             log(e.toString());
//                             setState(() {
//                               isLoading = false;
//                             });
//                           }
//                         },
//                         child: Center(
//                           child: const Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextButton(
//                       onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
//                       },
//
//                       child: Text(
//                         "Have an Account ?. Sign in",
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'email_verification_screen.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Text(
            "Register",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 200),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.25),
                        filled: true,
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.25),
                        filled: true,
                        hintText: "Enter Phone",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.25),
                        filled: true,
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    isLoading
                        ? const CircularProgressIndicator()
                        : Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            await FirebaseAuth.instance.currentUser?.sendEmailVerification();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmailVerificationScreen(
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                          } catch (e) {
                            log(e.toString());
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Center(
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Have an Account ?. Sign in",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
