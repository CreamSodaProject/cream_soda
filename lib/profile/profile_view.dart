import 'package:cream_soda/common_widget/picture_action_sheet.dart';
import 'package:cream_soda/common_widget/use_elevated_button.dart';
import 'package:cream_soda/common_widget/use_page_title_text.dart';
import 'package:cream_soda/common_widget/use_text_form_field.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'profile_provider.dart';

class ProfilePage extends StatefulWidget {

  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileProvider(),
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
            padding: const EdgeInsets.symmetric(vertical: defaultVerticalGap, horizontal: defaultHorizonGap),
            child: Column(
              children: [
                UsePageTitleText(title: "프로필 편집"),

                IconButton(
                    onPressed: () {
                      showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) => PictureActionSheet(
                          existPhoto: state.existPhoto,
                          cameraClick: () => provider.getImage(ImageSource.camera),
                          galleryClick: () => provider.getImage(ImageSource.gallery),
                          deleteClick: () => provider.deletePhoto(),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.person_crop_circle_fill_badge_plus,
                      size: 150,
                      color: lightColorScheme.outline,
                    )),
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
                            Text("*", style: TextStyle(
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
                              if (value == null || value.isEmpty){
                                return "이름을 입력해주세요.";
                              }
                              if(!provider.isNameValid(value)){
                                return "이름은 2~10자로 입력해주세요.";
                              }
                              return null;
                            }),
                        UseElevatedButton(title: "등록", onPressed: (){

                        })
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}


