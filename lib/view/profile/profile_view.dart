import 'package:cream_soda/view/common_widget/use_page_title_text.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/profile/components/profile_form.dart';
import 'package:cream_soda/view/profile/components/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final email =args['email'];
    final password = args['password'];

    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          ProfileProvider()..init(email, password),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final state = provider.state;

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultVerticalGap, horizontal: defaultHorizonGap),
        child: Column(
          children: [
            UsePageTitleText(title: "프로필 편집"),
            const SizedBox(height: gap35),
            ProfileImage(),
            ProfileForm()
          ],
        ),
      ),
    ));
  }
}
