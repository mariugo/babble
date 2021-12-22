import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:babble/providers/authentication_provider.dart';
import 'package:babble/widgets/top_bar.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  late double _deviceHeight;
  late double _deviceWidth;

  late AuthenticationProvider _auth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context, listen: false);
    return _buildUI();
  }

  Widget _buildUI() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.03,
          vertical: _deviceHeight * 0.02,
        ),
        height: _deviceHeight * 0.98,
        width: _deviceWidth * 0.97,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TopBarWidget(
              'Chats',
              primaryAction: IconButton(
                icon: const Icon(Icons.logout),
                color: const Color.fromRGBO(
                  0,
                  82,
                  218,
                  1,
                ),
                onPressed: () {
                  _auth.logOut();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
