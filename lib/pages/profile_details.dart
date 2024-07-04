import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/userinfo.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                userInfo.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                userInfo.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
