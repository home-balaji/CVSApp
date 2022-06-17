import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class add_patient_screen extends StatefulWidget {
  @override
  _add_patient_screen createState() => _add_patient_screen();
}

class _add_patient_screen extends State<add_patient_screen> {
  bool showLoader = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKeyPatient = GlobalKey<FormState>();

  @override
  void dispose() {

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  addPatient() async {
    setState(() {
      showLoader = true;
    });
    FirebaseFirestore.instance.collection('user').add({
      'user_type': '0',
      'done_date': '',
      'user_profile': '',
      'done_week': '0',
      'done_day': '0',
      'achievement': '0',
      'userName': userNameController.text,
      'password': passwordController.text,
      'name': nameController.text,
    }).then((value) => {
          print('print value id value ${value.id}'),
          FirebaseFirestore.instance.collection('user').doc(value.id).update({
            'id': value.id,
          }).whenComplete(() => {
                FirebaseFirestore.instance
                    .collection('watchDataTable')
                    .add({
                      'user_id': value.id,
                      'userName': userNameController.text,
                      'W1 AP time': '',
                      'W1 AP date': '',
                      'W1 D1 time': '',
                      'W1 D1 date': '',
                      'W1 D2 time': '',
                      'W1 D2 date': '',
                      'W1 D3 time': '',
                      'W1 D3 date': '',
                      'W2 AP time': '',
                      'W2 AP date': '',
                      'W2 D1 time': '',
                      'W2 D1 date': '',
                      'W2 D2 time': '',
                      'W2 D2 date': '',
                      'W2 D3 time': '',
                      'W2 D3 date': '',
                      'W3 AP time': '',
                      'W3 AP date': '',
                      'W3 D1 time': '',
                      'W3 D1 date': '',
                      'W3 D2 time': '',
                      'W3 D2 date': '',
                      'W3 D3 time': '',
                      'W3 D3 date': '',
                      'W4 AP time': '',
                      'W4 AP date': '',
                      'W4 D1 time': '',
                      'W4 D1 date': '',
                      'W4 D2 time': '',
                      'W4 D2 date': '',
                      'W4 D3 time': '',
                      'W4 D3 date': '',
                      'W5 AP time': '',
                      'W5 AP date': '',
                      'W5 D1 time': '',
                      'W5 D1 date': '',
                      'W5 D2 time': '',
                      'W5 D2 date': '',
                      'W5 D3 time': '',
                      'W5 D3 date': '',
                      'W6 AP time': '',
                      'W6 AP date': '',
                      'W6 D1 time': '',
                      'W6 D1 date': '',
                      'W6 D2 time': '',
                      'W6 D2 date': '',
                      'W6 D3 time': '',
                      'W6 D3 date': '',
                    })
                    .then((value) => {
                          FirebaseFirestore.instance
                              .collection('watchDataTable')
                              .doc(value.id)
                              .update({
                            'id': value.id,
                          })
                        })
                    .whenComplete(() => {
                          setState(() {
                            showLoader = false;
                          }),
                          showSnackBar('Patient add successfully'),
                          Navigator.of(context).pop(),
                        }),
              }),
        });
  }

  void showSnackBar(text) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 40),
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          'assets/icons/back_arrow.png',
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text(
                        'Add Patient',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            // decoration: TextDecoration.underline,
                            color: Color(0xff744EC3),
                            fontSize: 30,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Color(0xff485370),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Form(
                key: formKeyPatient,
                child: ListView(
                  children: <Widget>[
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextFormField(
                        controller: userNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: 'User Name',
                          errorStyle: const TextStyle(color: Colors.red),
                          hintStyle: const TextStyle(
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        validator: (String? s) {
                          if (s!.isEmpty) {
                            return 'Enter valid user name';
                          }
                        },
                        onSaved: (String? s) {
                          userNameController.text = s!.trim();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: 'Password',
                          errorStyle: const TextStyle(color: Colors.red),
                          hintStyle: const TextStyle(
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        validator: (String? s) {
                          if (s!.isEmpty) {
                            return 'Enter valid password';
                          }
                        },
                        onSaved: (String? s) {
                          passwordController.text = s!.trim();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color(0xffFDFCFC),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          hintText: 'Name',
                          errorStyle: const TextStyle(color: Colors.red),
                          hintStyle: const TextStyle(
                            color: Color(0xff999999),
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                        validator: (String? s) {
                          if (s!.isEmpty) {
                            return 'Enter valid name';
                          }
                        },
                        onSaved: (String? s) {
                          nameController.text = s!.trim();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    showLoader
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : RaisedButton(
                            onPressed: () {
                              if (formKeyPatient.currentState!.validate()) {
                                formKeyPatient.currentState!.save();
                                addPatient();
                              }
                            },
                            color: const Color(0xffC299F6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 8, bottom: 8),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
