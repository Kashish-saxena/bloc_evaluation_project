import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_project/bloc/update_bloc.dart';
import 'package:bloc_project/bloc/update_event.dart';
import 'package:bloc_project/bloc/update_state.dart';
import 'package:bloc_project/models/signup_request_model.dart';
import 'package:bloc_project/utils/signup_verification.dart';
import 'package:bloc_project/widgets/radio_field.dart';

class UpdateScreen extends StatefulWidget {
  final int userId;
  final String? userName;
  final String? userEmail;
  final String? userGender;
  final String userStatus;

  const UpdateScreen({
    Key? key,
    required this.userId,
    this.userName,
    this.userEmail,
    this.userGender,
    required this.userStatus,
  }) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final GlobalKey<FormState> _updateKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? gender;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userName ?? "";
    emailController.text = widget.userEmail ?? "";
    gender = widget.userGender ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateBloc, UpdateState>(
      listener: (context, state) {
        if (state is UpdateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Updated user details."),
          ));
          Navigator.pop(context);
        } else if (state is UpdateFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Failed to update user details."),
          ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Screen",
            style: TextStyle(color: Colors.black),
          ),
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Form(
              key: _updateKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                    validator: (val) {
                      return Verification.isNameValid(val ?? "");
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (val) {
                      return Verification.isEmailValid(val ?? "");
                    },
                  ),
                  RadioFieldWidget(
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Gender",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xff8391A1))),
                        Flexible(
                          child: ListTile(
                            textColor: const Color(0xff8391A1),
                            contentPadding: EdgeInsets.zero,
                            leading: Radio(
                                value: "male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                }),
                            title: const Text("Male"),
                          ),
                        ),
                        Flexible(
                          child: ListTile(
                            textColor: const Color(0xff8391A1),
                            contentPadding: EdgeInsets.zero,
                            leading: Radio(
                                value: "female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                }),
                            title: const Text("Female"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_updateKey.currentState!.validate()) {
                        String updatedName = nameController.text;
                        String updatedEmail = emailController.text;
                        if (updatedName != widget.userName ||
                            updatedEmail != widget.userEmail ||
                            gender != widget.userGender) {
                          SignUpRequestModel signUpRequestModel =
                              SignUpRequestModel(
                            name: updatedName,
                            email: updatedEmail,
                            gender: gender ?? "",
                            status: "Active",
                          );
                          context.read<UpdateBloc>().add(
                                PerformUpdateEvent(
                                  widget.userId,
                                  signUpRequestModel,
                                ),
                              );
                        }
                      }
                    },
                    child: Text("Update"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
