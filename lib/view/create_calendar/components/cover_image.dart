import 'package:cream_soda/view/common_widget/picture_action_sheet.dart';
import 'package:cream_soda/constants/theme/color_schemes.g.dart';
import 'package:cream_soda/constants/theme/use_size.dart';
import 'package:cream_soda/view/create_calendar/create_calendar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreateCalendarProvider>();
    final state = provider.state;

    return InkWell(
      child:  state.imageFile == null ? Stack(children: [
        Image.asset("assets/images/defaultCalendar.png", height: 250, width: double.infinity, fit: BoxFit.cover),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 50,
              width: 400,
              decoration: const BoxDecoration(color: Colors.black54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.image_outlined,
                    color: lightColorScheme.background,
                    size: size18,
                  ),
                  const SizedBox(width: gap5),
                  Text(
                    "커버 이미지 변경",
                    style: TextStyle(
                        color: lightColorScheme.background,
                        fontWeight: FontWeight.bold,
                        fontSize: font14),
                  ),
                ],
              ),
            ))
      ]) :
      SizedBox(
        height: 250,
        width: double.infinity,
        child: Image.file(
          state.imageFile!,
          width: 150,
          height: 150,
          fit: BoxFit.cover,
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
