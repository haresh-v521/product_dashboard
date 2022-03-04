import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PhoneAuthentication extends StatefulWidget {
  const PhoneAuthentication({Key? key}) : super(key: key);

  @override
  _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
}

class _PhoneAuthenticationState extends State<PhoneAuthentication> {


  // PhoneAuthentication

   Future<FirebaseApp>? _firebaseApp;
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _otp = TextEditingController();

  bool isLoggedIn = false;
  bool otpSent = false;
  String? uid;
  String? _verificationId;

  void _verifyOTP() async {
    // we know that _verificationId is not empty
    final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: _otp.text);

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (FirebaseAuth.instance.currentUser != null) {
        setState(() {
          isLoggedIn = true;
          uid = FirebaseAuth.instance.currentUser!.uid;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumber.text,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    setState(() {
      otpSent = true;
    });
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
    });
  }

  void codeSent(String verificationId, [a]) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
    });
  }

  void verificationFailed(FirebaseAuthException exception) {
    print(exception.message);
    setState(() {
      isLoggedIn = false;
      otpSent = false;
    });
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isLoggedIn = true;
        uid = FirebaseAuth.instance.currentUser!.uid;
      });
    } else {
      print("Failed to Sign In");
    }
  }

  @override
  void initState() {
    super.initState();
    _firebaseApp = Firebase.initializeApp();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Authentication"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: FutureBuilder(
            future: _firebaseApp,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return isLoggedIn
                  ? Center(
                child: Text('Welcome User!\nYour uid is: $uid'),
              )
                  : otpSent
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _otp,
                    decoration: const InputDecoration(
                      hintText: "Enter your OTP",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _verifyOTP,
                    child: const Text("Sign In"),
                  ),
                ],
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _phoneNumber,
                    decoration: const InputDecoration(
                      hintText: "Enter your phone number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: _sendOTP,
                    child: const Text("Send OTP"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
