import 'package:flutter/material.dart';

class PackagesWidgetItem extends StatefulWidget {
  final Widget? bottomOfPackage;
  final Function? setState;
  final Widget title;
  final Function()? onTap;
  final Function()? onDoubleTap;

  const PackagesWidgetItem({
    super.key,
    this.bottomOfPackage,
    this.setState,
    required this.title,
    this.onTap, this.onDoubleTap,
  });

  @override
  State<PackagesWidgetItem> createState() => _PackagesWidgetItemState();
}

class _PackagesWidgetItemState extends State<PackagesWidgetItem> {
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onDoubleTap: (){
        if (isOpened == false) {
          isOpened = true;
        } else {
          isOpened = false;
        }
        widget.onDoubleTap?.call();
        debugPrint('$isOpened');
        widget.setState?.call();
      },
      child: SizedBox(
        width: 320,
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  if (widget.bottomOfPackage != null)
                    IconButton(
                      onPressed: () {
                        if (isOpened == false) {
                          isOpened = true;
                        } else {
                          isOpened = false;
                        }
                        debugPrint('$isOpened');
                        widget.setState?.call();
                      },
                      icon: Icon(
                        isOpened == false
                            ? Icons.arrow_right_outlined
                            : Icons.arrow_drop_down_sharp,
                      ),
                    ),
                  widget.title,
                ],
              ),
            ),
            if (isOpened == true)
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: widget.bottomOfPackage ?? Container(),
              ),
          ],
        ),
      ),
    );
  }
}
