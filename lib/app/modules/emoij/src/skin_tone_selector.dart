import 'package:flutter/material.dart';
import 'package:thanglong_university/app/modules/emoij/src/skin_dot.dart';
import 'package:thanglong_university/app/modules/emoij/src/skin_tones.dart';

class SkinToneSelector extends StatefulWidget {
  final Function(int) onSkinChanged;

  const SkinToneSelector({
    Key key,
    @required this.onSkinChanged,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SkinToneState();
}

class _SkinToneState extends State<SkinToneSelector> {
  int _skin = 0;
  OverlayEntry _overlayEntry;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return SkinDotButton(
      skin: _skin,
      onPressed: () {
        if (_expanded) {
          _overlayEntry.remove();
        } else {
          _overlayEntry = createOverlay(context);
          Overlay.of(context).insert(_overlayEntry);
        }
        setState(() {
          _expanded = !_expanded;
        });
      },
    );
  }

  OverlayEntry createOverlay(BuildContext context) {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    List<Widget> dots = [];
    for (var i = 0; i < SkinTones.tones.length; i++) {
      dots.add(
        SkinDotButton(
          skin: i,
          onPressed: () {
            _overlayEntry.remove();
            setState(() {
              _skin = i;
              _expanded = false;
            });
            widget.onSkinChanged(_skin);
          },
        ),
      );
    }

    var w = size.width * 6;
    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset.dx - w + size.width,
              top: offset.dy - size.height,
              width: w,
              height: size.height,
              child: Material(
                elevation: 4.0,
                child: Row(
                  children: dots,
                ),
              ),
            ));
  }
}

class SkinDotButton extends StatelessWidget {
  final int skin;
  final Function() onPressed;

  const SkinDotButton({Key key, this.skin, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 9,
      height: MediaQuery.of(context).size.width / 9,
      child: FlatButton(
        autofocus: true,
        padding: EdgeInsets.all(0.0),
        child: SkinDot(
          skin: skin,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
