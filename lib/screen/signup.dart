import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:intl/intl.dart';
import '../firebase/auth/allauthentication/authentication.dart';
import '../validator.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({Key? key}) : super(key: key);

  @override
  _SignUPScreenState createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {


  //textform validate

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmpassController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();


  //dropdownlist

  String dropdownvalue = "";
   List<String> items = ['Male', 'Female'];


   //datepicker

  Future<void> opendatepicker(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 3),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    if (d != null) {
      setState(() {
        //_selectedDate = DateFormat.yMd("en_US").format(d);
        _dateController.text=DateFormat.yMd("en_US").format(d);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      "Welcome",
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
                  child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text(
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.grey[700]),
                              )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: TextFormField(
                              controller: _nameController,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  wordSpacing: 3,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                labelText: 'Your Name',
                              ),
                              // validator: (val) {
                              //   if (val!.isEmpty) {
                              //     return 'Please enter your Name';
                              //   }
                              //   return null;
                              // },

                              validator: NameFieldValidator.validate,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'Your Email',
                            ),
                            // validator: (val) {
                            //   if (val!.isEmpty) {
                            //     return 'Please enter your email';
                            //   }
                            //   return null;
                            // },
                            validator: EmailFieldValidator.validate,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'PassWord',
                            ),
                            // validator: (val) {
                            //   if (val!.isEmpty) {
                            //     return 'Please enter your Password';
                            //   } else if (val.length < 6) {
                            //     return 'Please enter password with atleast 6 chars';
                            //   }
                            //   return null;
                            // },

                            validator: PasswordFieldValidator.validate,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _confirmpassController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                wordSpacing: 3,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              labelText: 'Confirm PassWord',
                            ),
                            // validator: (val) {
                            //   if (val!.isEmpty) {
                            //     return 'Please enter your ConfirmPassword';
                            //   } else if (val.length < 6) {
                            //     return 'Please enter cpassword with atleast 6 chars';
                            //   }
                            //   return null;
                            // },
                            validator: ConfirmPassFieldValidator(
                                    confirmPwd: _passwordController.text)
                                .validate,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: DropdownButtonFormField<String>(
                                  hint: const Text("Gender"),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                      ),
                                  ),
                                  isExpanded: true,
                                  validator: (value) =>
                                      value == null ? 'Field required' : null,
                                  // icon: const Expanded(child: Icon(Icons.keyboard_arrow_down)),
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[700]),
                                        ));
                                  }).toList(),
                                  onChanged: (Value) {
                                    setState(() {
                                      dropdownvalue = Value!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Choose Date';
                                    }
                                  },
                                  onTap: (){
                                    opendatepicker(context);
                                  },
                                  //enabled: false,
                                  readOnly: true,
                                  controller: _dateController,
                                  decoration: const InputDecoration(
                                    hintText: 'Date of Birth',
                                    contentPadding: EdgeInsets.symmetric(vertical: 22,horizontal: 10),
                                    errorStyle: TextStyle(
                                      wordSpacing: 3,
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey, width: 2.0),
                                    ),
                                    suffixIcon: Icon(Icons.calendar_today),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                print("Validated");
                                Navigator.of(context).pushNamed('/login');
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
                                "SignUp",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
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
                                "You have accout ?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[800]),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                // onPressed: () {
                                //   Navigator.of(context).pushNamed('/login');
                                // },
                                onPressed: (){
                                  AuthClass().signUp(email: _emailController.text, password: _passwordController.text);
                                },
                                child: const Text(
                                  "Login",
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
