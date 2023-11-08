import 'package:cream_soda/common_widget/picture_action_sheet.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/profile/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final state = provider.state;

    return  state.imageFile == null
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
    );
  }
}
