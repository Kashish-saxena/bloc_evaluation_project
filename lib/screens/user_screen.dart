import 'dart:developer';
import 'package:bloc_project/bloc/api_bloc.dart';
import 'package:bloc_project/bloc/api_event.dart';
import 'package:bloc_project/bloc/api_state.dart';
import 'package:bloc_project/models/signup_response_model.dart';
import 'package:bloc_project/screens/update_screen.dart';
import 'package:bloc_project/services/delete_api_service.dart';
import 'package:bloc_project/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
  debugPrint("Called build>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'User Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: blockBody(context),
    );
  }
}

Widget blockBody(context) {
  debugPrint("Calless>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
  final update = BlocProvider.of<ApiBloc>(context);
  return BlocBuilder<ApiBloc, ApiState>(
    builder: (context, state) {
      if (state is ApiLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is ApiError) {
        return const Center(child: Text("Error"));
      }
      if (state is ApiLoaded) {
        List<SignUpResponseModel> userList = state.signUpResponseModel;
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            SignUpResponseModel user = userList[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: const Color(0xffF7F8F9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffE8ECF4)),
              ),
              child: ListTile(
                title: Text(
                  "Name: ${user.name}",
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Text(
                  'Email: ${user.email}',
                  style: const TextStyle(color: Colors.black),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        bool isSuccess =
                            await DeleteApiService.deleteUser(user.id ?? 0);
                        if (isSuccess) {
                          update.add(GetApiList());

                          const snackBar = SnackBar(
                            content: Text("User Deleted"),
                            duration: Duration(seconds: 2),
                          );
                          if (context.mounted) {
                            //throwing the warning that buildcontext can't be used in async

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          log("Failed to Delete");
                          const snackBar = SnackBar(
                              content: Text("Failed to Delete"),
                              duration: Duration(seconds: 2));
                          if (context.mounted) {
                            //throwing the warning that buildcontext can't be used in async

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateScreen(
                                      userName: user.name,
                                      userId: user.id ?? 0,
                                      userEmail: user.email,
                                      userGender: user.gender,
                                      userStatus: "Active",
                                    )));

                        update.add(GetApiList());
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return Container();
      }
    },
  );
}
