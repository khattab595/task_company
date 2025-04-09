import 'package:app/core/resources/validation.dart';
import 'package:app/core/widgets/texts/texts.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams)? onLogin;

  LoginScreen({Key? key, this.onLogin}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      emailController.text = 'eve.holt@reqres.in';
      passwordController.text = 'cityslicka';
    }
    return SingleChildScrollView(
      padding: 20.paddingAll,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            150.ph,
            BoldText(
            label:  strings.sign_in,
             fontSize: 24,
            ),
            40.ph,
            CustomTextField(
              controller: emailController,
              title: strings.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Validation.validateEmail(value ?? ''),
            ),
            CustomTextField(
              controller: passwordController,
              title: strings.password,
              isPassword: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            PrimaryButton(
              title: strings.login,
              margin: 100.paddingTop,
              onPressed: () => onPressed(),
            ),
          ],
        ),
      ),
    );
  }

  onPressed() async {
    if (formKey.currentState!.validate()) {
      onLogin!(LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ));
    }
  }
}
