import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testeui/validator.dart';

import '../api/remotedata/apiservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  callLoginApi() {
    final service = ApiServices();

    service.apiCallLogin(
      {
        "email": _emailController.text,
        "password": _passwordController.text,
      },
    ).then((value){

        print(value.token!);
        //push
    });

  }

  //fire base google signin

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);

    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1585089858717-f4378c2031d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                          fit: BoxFit.cover)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 70, left: 20),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.only(top: 330),

                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          topLeft: Radius.circular(80))),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.grey[700]),
                              )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  wordSpacing: 3,
                                ),
                                fillColor: Colors.white,
                                filled:true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(

                                      color: Colors.grey, width: 2.0),
                                ),
                                labelText: 'Your Email',
                              ),
                              /*validator: (value){
                                if (value!.isEmpty) return "Enter Email";
                                String pattern =
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

                                RegExp regExp = RegExp(pattern);
                                if (!regExp.hasMatch(value)) {
                                  return "Enter Valid Email!";
                                }
                                return null;
                              },*/
                              validator: EmailFieldValidator.validate,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            /*validator: (val) {
                              if (val!.isEmpty) {
                                return 'Please enter your password';
                              } else if (val.length < 6) {
                                return 'Please enter password with atleast 6 chars';
                              }
                              return null;
                            },*/
                            validator: PasswordFieldValidator.validate,
                            obscureText: true,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: false,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'Your PassWord',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot Password ?",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[800]))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                print("Validated");
                                callLoginApi();

                                Navigator.of(context).pushNamed('/profile');
                              } else {
                                print("Not Validated");
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.grey[700]),
                              child: const Center(
                                  child: Text(
                                "Login",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have accout ?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[800]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                // onPressed: (){
                                //
                                //   Navigator.of(context).pushNamed('/signup');
                                // },
                                onPressed: googleLogin,
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepOrange,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
