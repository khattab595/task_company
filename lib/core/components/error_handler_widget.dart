import 'package:app/core/utils/navigator.dart';

import '../exceptions/api_exception.dart';
import '/src/main_index.dart';

// ignore: must_be_immutable
class ErrorPlaceHolderWidget extends StatelessWidget {
  final String? error;
  final String? title;
  final Function()? onClickReload;
  final dynamic exception;
  final Color? color;
  final bool showImage;

  final double? height;

  ErrorPlaceHolderWidget(
      {Key? key,
      this.error,
      this.exception,
      this.title,
      this.onClickReload,
      this.showImage = true,
      this.color,
      this.height,
      this.placeHolderImage})
      : super(key: key);
  Widget? placeHolderImage;

  String? message;

  @override
  Widget build(BuildContext context) {
    ApiException apiException = context.handleApiError(exception: exception);
    message = error ?? apiException.message;
    bool isAuthError = apiException.code == 401;
    return Container(
        color: color ?? Colors.white,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              placeHolderImage != null && showImage
                  ? Container(
                      color: color ?? Colors.white,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: placeHolderImage,
                    )
                  : Icon(
                      isAuthError ? Icons.lock_outline : Icons.error_outline,
                      color: Colors.red,
                      size: 50,
                    ),
              title != null
                  ? Text(
                      title!,
                      style: kTextMedium.copyWith(
                          color: kPrimaryDark, fontSize: 12),
                    )
                  : Container(),
              Text(
                message.toString().trim(),
                style: context.bodyMedium,
                textAlign: TextAlign.center,
              ),
              10.ph,
              ElevatedButton.icon(
                onPressed: isAuthError
                    ? () => Navigators.pushNamedAndRemoveUntil(Routes.loginPage)
                    : onClickReload,
                icon: Icon(isAuthError ? Icons.login : Icons.refresh,
                    color: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.primaryColor,
                ),
                label: Text(
                    isAuthError
                        ? context.strings.sign_in
                        : context.strings.reload,
                    style: context.labelMedium.copyWith(color: Colors.white)),
              )
            ],
          ),
        ));
  }
}
