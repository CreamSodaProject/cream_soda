import 'package:cream_soda/common_widget/picture_action_sheet.dart';
import 'package:cream_soda/common_widget/use_alert_dialog.dart';
import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_outlined_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/router/move.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'profile_provider.dart';

class ProfilePage extends StatefulWidget {
  final String? email;
  final String? password;

  const ProfilePage({this.email, this.password, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          ProfileProvider()..init(widget.email, widget.password),
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
            state.imageFile == null
                ? IconButton(
                    onPressed: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => PictureActionSheet(
                          existPhoto: state.existPhoto,
                          cameraClick: () =>
                              provider.getImage(ImageSource.camera),
                          galleryClick: () =>
                              provider.getImage(ImageSource.gallery),
                          deleteClick: () => provider.deletePhoto(),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_plus,
                      size: 150,
                      color: lightColorScheme.outline,
                    ))
                : InkWell(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        state.imageFile!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    onTap: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => PictureActionSheet(
                          existPhoto: state.existPhoto,
                          cameraClick: () =>
                              provider.getImage(ImageSource.camera),
                          galleryClick: () =>
                              provider.getImage(ImageSource.gallery),
                          deleteClick: () => provider.deletePhoto(),
                        ),
                      );
                    },
                  ),
            Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "이름",
                          style: TextStyle(
                              fontSize: font14,
                              color: lightColorScheme.outline,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("*",
                            style: TextStyle(
                                fontSize: font14,
                                color: lightColorScheme.error,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    UseTextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.text,
                        controller: state.nameController,
                        hintText: "필수",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "이름을 입력해주세요.";
                          }
                          if (!provider.isNameValid(value)) {
                            return "이름은 2~10자로 입력해주세요.";
                          }
                          return null;
                        }),
                    UseElevatedButton(
                      title: "등록",
                      onPressed: () {
                        if (state.formKey.currentState!.validate()) {
                          provider.join(context);
                        }
                      },
                    ),
                    UseOutlinedButton(
                        title: "취소",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => UseAlertDialog(
                                    title: "등록을 취소하시겠습니까?",
                                    content: "기입한 정보가 모두 사라집니다.",
                                    confirmFunction: () {
                                      Navigator.pop(context);
                                      Navigator.popAndPushNamed(
                                          context, Move.mainPage);
                                    },
                                    cancelFunction: () {
                                      Navigator.pop(context);
                                    },
                                  ));
                        }),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
