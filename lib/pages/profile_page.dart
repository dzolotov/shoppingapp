import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/userinfo.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserInfo>();
    final navigationStateHolder = context.watch<NavigationState>();

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 128,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(64),
                  child: Image.network(
                    userInfo.url,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigationStateHolder.gotoProfileDetails(),
                child: Text(
                  userInfo.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
