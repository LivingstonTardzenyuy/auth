// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'auth/signup.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: SignUpScreen(),
// //     );
// //   }
// // }
// //
// //
//
//
// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'auth/login.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         debugShowCheckedModeBanner: false, home: Login());
//   }
// }
//
// class SignUp extends StatefulWidget {
//   const SignUp({super.key});
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
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
//                           await FirebaseAuth.instance.verifyPhoneNumber(
//                             phoneNumber: phoneController.text,
//                             verificationCompleted: (phoneAuthCredential) {},
//                             verificationFailed: (error) {
//                               log(error.toString());
//                               setState(() {
//                                 isLoading = false;
//                               });
//                             },
//                             codeSent: (verificationId, forceResendingToken) {
//                               setState(() {
//                                 isLoading = false;
//                               });
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => OTPScreen(
//                                     verificationId: verificationId,
//                                     password: passwordController.text,
//                                   ),
//                                 ),
//                               );
//                             },
//                             codeAutoRetrievalTimeout: (verificationId) {
//                               log("Auto Retrieval timeout");
//                             },
//                           );
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
//
//
// class OTPScreen extends StatefulWidget {
//   const OTPScreen({super.key, required this.verificationId, required this.password});
//   final String verificationId;
//   final String password;
//
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   final otpController = TextEditingController();
//
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "We have sent an OTP to your phone. Please verify",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 40),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                   fillColor: Colors.grey.withOpacity(0.25),
//                   filled: true,
//                   hintText: "Enter OTP",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none)),
//             ),
//             const SizedBox(height: 20),
//             isLoading
//                 ? const CircularProgressIndicator()
//                 : Container(
//               width: double.infinity,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.orange,
//               ),
//               child: GestureDetector(
//                   onTap: () async {
//                     setState(() {
//                       isLoading = true;
//                     });
//
//                     try {
//                       final cred = PhoneAuthProvider.credential(
//                           verificationId: widget.verificationId,
//                           smsCode: otpController.text);
//
//                       UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(cred);
//
//                       // Now that the phone number is verified, set the user's password.
//                       await userCredential.user?.updatePassword(widget.password);
//
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const HomeScreen(),
//                           ));
//                     } catch (e) {
//                       log(e.toString());
//                     }
//                     setState(() {
//                       isLoading = false;
//                     });
//                   },
//                   child: Center(
//                     child: const Text(
//                       "Verify",
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//           child: Text(
//             "Welcome buddy",
//             style: TextStyle(fontSize: 20),
//           )),
//     );
//   }
// }
//
//
//
// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../main.dart';
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
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
//             "Login",
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
//                     const SizedBox(height: 40),
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
//                         : ElevatedButton(
//                       onPressed: () async {
//                         setState(() {
//                           isLoading = true;
//                         });
//
//                         try {
//                           // Sign in with phone number and password
//                           await FirebaseAuth.instance.signInWithEmailAndPassword(
//                             email: phoneController.text,
//                             password: passwordController.text,
//                           );
//
//                           // Navigate to the home screen after successful login
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => HomeScreen(),
//                             ),
//                           );
//                         } catch (e) {
//                           log(e.toString());
//                           // Handle login errors here
//                           // For example, display a snackbar to inform the user about invalid credentials
//                         }
//
//                         setState(() {
//                           isLoading = false;
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         minimumSize: const Size(double.infinity, 50),
//                       ),
//                       child: const Text(
//                         "Login",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//
//                     TextButton(
//                       onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
//                       },
//                       child: Text(
//                         "Don't have an Account ?. Sign up",
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
