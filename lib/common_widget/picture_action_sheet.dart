import 'package:flutter/cupertino.dart';

class PictureActionSheet extends StatefulWidget {
  bool existPhoto;
  VoidCallback cameraClick;
  VoidCallback galleryClick;
  VoidCallback deleteClick;

  PictureActionSheet({super.key, required this.existPhoto, required this.cameraClick, required this.deleteClick, required this.galleryClick});

  @override
  State<PictureActionSheet> createState() => _PictureActionSheetState();
}

class _PictureActionSheetState extends State<PictureActionSheet> {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('사진 선택'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: widget.cameraClick,
          child: const Text('카메라'),
        ),
        CupertinoActionSheetAction(
          onPressed: widget.galleryClick,
          child: const Text('앨범'),
        ),
        if(widget.existPhoto)
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: widget.deleteClick,
          child: const Text('삭제'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('취소'),
      ),
    );
  }
}
