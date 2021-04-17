import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
  final ViewState viewState;
  final SystemUiOverlayStyle systemUiOverlayStyle;
  final bool ignoreLoading;
  final String loadingTitle;
  const AppContainer(
      {Key key,
      this.child,
      this.viewState = ViewState.idle,
      this.systemUiOverlayStyle = SystemUiOverlayStyle.dark,
      this.ignoreLoading = false,
      this.loadingTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyle,
          child: IgnorePointer(
            ignoring: viewState == ViewState.loading,
            child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Stack(
                  children: [
                    child,
                    viewState == ViewState.loading && ignoreLoading == false
                        ? Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(10)),
                              width: 80,
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  centerloading(size: 30),
                                  loadingTitle == null
                                      ? SizedBox()
                                      : Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: Material(
                                              color: Colors.transparent,
                                              child: Text(
                                                loadingTitle,
                                                style: fontInter(12,
                                                    color: Colors.white),
                                              )),
                                        )
                                ],
                              ),
                            ),
                          )
                        : SizedBox()
                  ],
                )),
          ),
        ));
  }
}
