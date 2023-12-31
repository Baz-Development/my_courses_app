import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_courses_app/src/authentication/presentation/cubit/authentication_cubit.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({super.key, required this.fullnameController});

  final TextEditingController fullnameController;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fullnameController,
                decoration: const InputDecoration(
                  labelText: 'fullname',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final fullname = fullnameController.text.trim();
                  const avatar =
                      'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1046.jpg';
                  context.read<AuthenticationCubit>().createUser(
                        createdAt: DateTime.now().toString(),
                        fullname: fullname,
                        avatar: avatar,
                      );
                  Navigator.of(context).pop();
                },
                child: const Text('create user'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
