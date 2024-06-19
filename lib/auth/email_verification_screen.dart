import 'dart:developer';
import 'package:auth/auth/phone_number_ver.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailVerificationScreen extends StatefulWidget {
  final String email;
  final String phone;
  final String password;

  const EmailVerificationScreen({required this.email, required this.phone, required this.password});

  @override
  _EmailVerificationScreenState createState() => _EmailVerificationScreenState();
}

// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   bool isVerified = false;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     checkEmailVerification();
//   }
//
//   Future<void> checkEmailVerification() async {
//     User? user = FirebaseAuth.instance.currentUser;
//
//     while (user != null && !user.emailVerified) {
//       await Future.delayed(const Duration(seconds: 3));
//       await user.reload();
//       user = FirebaseAuth.instance.currentUser;
//     }
//
//     if (user != null && user.emailVerified) {
//       setState(() {
//         isVerified = true;
//       });
//
//       // After email is verified, send the OTP to the phone number
//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: widget.phone,
//         verificationCompleted: (phoneAuthCredential) {},
//         verificationFailed: (error) {
//           log(error.toString());
//         },
//         codeSent: (verificationId, forceResendingToken) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => OTPScreen(
//                 verificationId: verificationId,
//                 email: widget.email,
//                 password: widget.password,
//                 phone: widget.phone,
//               ),
//             ),
//           );
//         },
//         codeAutoRetrievalTimeout: (verificationId) {
//           log("Auto Retrieval timeout");
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange,
//       body: Center(
//         child: isVerified
//             ? Center(child: const Text("Email Verified! Sending OTP...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),))
//             : Center(child: const Text("Verify Email. A code has been sent.", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800,))),
//       ),
//     );
//   }
// }

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isVerified = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    checkEmailVerification();
  }

  Future<void> checkEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;

    while (user != null && !user.emailVerified) {
      await Future.delayed(const Duration(seconds: 3));
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
    }

    if (user != null && user.emailVerified) {
      setState(() {
        isVerified = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: isVerified
            ? Center(child: const Text("Email Verified! Proceed to verify phone...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),))
            : Center(child: const Text("Verify Email. A code has been sent.", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800,))),
      ),
    );
  }
}



// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  //   bool isVerified = false;
  //
  //   @override
  //   void initState() {
  //     super.initState();
  //     checkEmailVerification();
  //   }
  //
  //   Future<void> checkEmailVerification() async {
  //     User? user = FirebaseAuth.instance.currentUser;
  //
  //     while (user != null && !user.emailVerified) {
  //       await Future.delayed(const Duration(seconds: 3));
  //       await user.reload();
  //       user = FirebaseAuth.instance.currentUser;
  //     }
  //
  //     if (user != null && user.emailVerified) {
  //       setState(() {
  //         isVerified = true;
  //       });
  //     }
  //   }
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       backgroundColor: Colors.orange,
  //       body: Center(
  //         child: isVerified
  //             ? Center(
  //           child: ElevatedButton(
  //             onPressed: () {
  //               // Navigate to OTP screen
  //               Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => OTPScreen(
  //                     email: widget.email,
  //                     phone: widget.phone,
  //                     password: widget.password,
  //                   ),
  //                 ),
  //               );
  //             },
  //             child: const Text(
  //               "Verify Phone Number",
  //               style: TextStyle(fontSize: 20),
  //             ),
  //           ),
  //         )
  //             : const Center(
  //           child: Text(
  //             "Please verify your email. We have sent a verification link to your email address.",
  //             style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }
