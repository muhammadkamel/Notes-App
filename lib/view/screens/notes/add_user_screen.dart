// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/constains.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final ImagePicker _picker = ImagePicker();

  File? userImage;
  bool isObscureText = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: Main,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              child: IconButton(
                onPressed: () async {
                  try {
                    final _pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    setState(() {
                      userImage = File(_pickedFile!.path);
                    });
                  } catch (error) {
                    print("Error");
                  }
                },
                icon: const Icon(Icons.add),
              ),
              maxRadius: 37,
            ),
            // : Center(
            //     child: Container(
            //       width: 75,
            //       height: 75,
            //       padding: const EdgeInsets.all(2),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.shade200,
            //             blurRadius: 30,
            //           )
            //         ],
            //       ),
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(50000),
            //         child: Image.file(
            //           userImage!,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   ),

            const SizedBox(height: 10),
            Center(
              child: Text(
                "Select Image",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            const SizedBox(height: 20),

            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameTextController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      decoration: inputDecoration.copyWith(
                        label: const Text("User Name"),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      controller: _passwordTextController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      obscureText: isObscureText,
                      decoration: inputDecoration.copyWith(
                        label: const Text("Password"),
                        suffixIcon: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          child: IconButton(
                            icon: Icon(
                              isObscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF626262),
                            ),
                            onPressed: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                      decoration: inputDecoration.copyWith(
                        label: const Text("Email"),
                      ),
                    ),
                    const SizedBox(height: 14),
                    DropdownButtonFormField<String>(
                      decoration: inputDecoration.copyWith(
                        alignLabelWithHint: true,
                        label: const Text("Interest"),
                      ),
                      items: const [
                        DropdownMenuItem<String>(
                          child: Text("Football"),
                          value: "1",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("Waking"),
                          value: "2",
                        ),
                      ],
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text("Save".toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
