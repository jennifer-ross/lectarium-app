import 'package:flutter/material.dart';
import 'package:lectarium/core/size_config.dart';

class ButtonWidget extends StatelessWidget {
  final String? title;
  final bool? hasBorder;
  final Function? onClick;
  Color? background;
  Color? borderColor;
  Color? color;
  double? paddingMultiplier;
  BorderRadius? radius;

  ButtonWidget(
      {@required this.hasBorder,
      @required this.title,
      this.onClick,
      this.background,
      this.borderColor,
      this.color,
      this.paddingMultiplier,
      this.radius});

  @override
  Widget build(BuildContext context) {
    if (background == null) {
      background = Theme.of(context).accentColor;
    }

    if (borderColor == null) {
      borderColor = Theme.of(context).accentColor;
    }

    if (color == null) {
      color = Theme.of(context).accentColor;
    }

    if (paddingMultiplier == null) {
      paddingMultiplier = 1.5;
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                if (onClick != null) {
                  onClick!();
                }
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: background,
                  padding: EdgeInsets.symmetric(
                      vertical:
                          SizeConfig.heightMultiplier * paddingMultiplier!,
                      horizontal:
                          SizeConfig.heightMultiplier * paddingMultiplier! -
                              0.3),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  side: BorderSide(
                    color: borderColor ?? Theme.of(context).accentColor,
                    width: 1,
                  )),
              child: title != null
                  ? Text(title ?? '',
                      style: TextStyle(
                        fontSize: SizeConfig.textMultiplier * 2.2,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ))
                  : Container(),
            ),
          ),
        ],
      ),
    );

    // return Ink(
    //   color: ,
    //   decoration: BoxDecoration(
    //       color: background,
    //       borderRadius: BorderRadius.circular(10),
    //       border: hasBorder
    //           ? Border.all(color: borderColor)
    //           : Border.fromBorderSide(BorderSide.none)),
    //   child: InkWell(
    //     borderRadius: BorderRadius.circular(10),
    //     child: Container(
    //       color: background,
    //       height: 6.5 * SizeConfig.heightMultiplier,
    //       child: Center(
    //         child: Text(
    //           title,
    //           style: TextStyle(
    //             fontSize: SizeConfig.textMultiplier * 2.1,
    //             fontWeight: FontWeight.w600,
    //             color: color,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
