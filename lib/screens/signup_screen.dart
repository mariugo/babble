import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '/services/media_picker_service.dart';
import '/services/database_service.dart';
import '/services/cloud_storage_service.dart';
import '/widgets/custom_input_field.dart';
import '/widgets/rounded_button.dart';
import '/providers/authentication_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
