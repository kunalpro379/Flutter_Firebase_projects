import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/rendering.dart';
import 'package:newchatapp/widgets/user_image_picker.dart';

import 'dart:io';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late BuildContext scaffoldContext;
  var _EnteredUserName = '';
  File? _Selectedimage;
  var _IsAuthenticating = false;

  bool _isLogin = true;
  String _enteredEmail = '';
  String _enteredPassword = '';

  @override
  void initState() {
    super.initState();
    // Save the context in the initState method
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      scaffoldContext = context;
    });
  }

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid || !_isLogin && _Selectedimage == null) {
      return;
    }

    _formKey.currentState!.save();

    try {
      setState(() {
        _IsAuthenticating = true;
      });

      if (_isLogin) {
        final userCredentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        print(userCredentials);
      } else {
        final userCredentials =
            await _firebaseAuth.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        final StorageRef = FirebaseStorage.instance
            .ref()
            .child(' user_images')
            .child('${userCredentials.user!.uid}.jpg');
        await StorageRef.putFile(_Selectedimage!);
        final ImageUrl = await StorageRef.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredentials.user!.uid)
            .set({
          'username': _EnteredUserName,
          'email': _enteredEmail,
          'ImageUrl': ImageUrl
        });

        print(ImageUrl);
        print(userCredentials);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        // Handle email already in use error
      }
      ScaffoldMessenger.of(scaffoldContext).clearSnackBars();
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication Failed.'),
        ),
      );
      setState(() {
        _IsAuthenticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " ChatKaroDotCom...",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 119, 71, 52),
        actions: [
          IconButton(
            onPressed: () {
              print(
                  '---------------WTF-------------- Oh ahhh Uhhh ohhaah-----------------------------------madarchod------------------------------------------bhosadike--------------------------------------yadzavya-------------------------------------cchutiya ----------------gandbhosadi----------------------------lawdu----------------------- ');
            },
            icon: Icon(Icons.message_sharp,
                size: 30, color: Theme.of(context).indicatorColor),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                  right: 20,
                  left: 20,
                ),
                width: 200,
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: EdgeInsets.all(50),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!_isLogin)
                            userImagePicker(
                              onPickImage: (pickedImg) {
                                _Selectedimage = pickedImg;
                              },
                            ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              fillColor: Color.fromARGB(255, 168, 255, 125),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  !value.contains('@')) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredEmail = value!;
                            },
                          ),
                          if (!_isLogin)
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'UserName'),
                              enableSuggestions: true,
                              validator: (ValueKey) {
                                if (ValueKey == null ||
                                    ValueKey.isEmpty ||
                                    ValueKey.trim().length < 4) {
                                  return 'PLease EnTer At LeasT 4 ChaRacTeRs';
                                }
                                return null;
                              },
                              onSaved: (ValueKey) {
                                _EnteredUserName = ValueKey!;
                              },
                            ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 70, 6, 1),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _enteredPassword = value!;
                            },
                          ),
                          const SizedBox(height: 30),
                          if (_IsAuthenticating)
                            const CircularProgressIndicator(),
                          if (!_IsAuthenticating)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                              child: Text(
                                _isLogin ? 'Login' : 'Sign Up',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          if (!_IsAuthenticating)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(
                                _isLogin
                                    ? 'Create New Account'
                                    : 'I already have an account. Login',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
