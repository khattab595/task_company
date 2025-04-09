import '../../../src/main_index.dart';
import 'active_stepper_widget.dart';
import 'base_step.dart';
import 'easy_line.dart';
import 'easy_step.dart';
import 'easy_stepper.dart';
import 'inactive_stepper_widget.dart';
import 'stepper_model.dart';

class CustomStepper extends StatelessWidget {
  final List<StepperModel> steps;
  final List<Widget>? widgets;
  final void Function(int)? onStepReached;
  final int? activeStep;
  final ScrollController? controller;

  const CustomStepper(
      {Key? key,
      required this.steps,
      this.widgets,
      this.onStepReached,
      this.activeStep,
      this.controller})
      : super(key: key);

  @override
  build(BuildContext context) {
    final theme = Theme.of(context);
    int activeStep = this.activeStep ?? 0;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      child: StatefulBuilder(builder: (context, setState) {
        return Column(
          children: [
            SizedBox(
              height: 80,
              child: EasyStepper(
                activeStep: activeStep,
                stepRadius: 22,
                lineType: LineType.normal,
                lineSpace: 10,
                activeStepBorderType: BorderType.normal,
                // activeStepBorderColor: kOrange_09,
                // activeStepIconColor: kOrange_09,
                // activeStepTextColor: kOrange_09,
                activeLineColor: theme.cardColor,
                // activeStepBackgroundColor: kWhite,
                // unreachedStepBackgroundColor: kBackground,
                // unreachedStepBorderColor: kGrey_D0,
                // unreachedStepIconColor: kGrey_D0,
                // unreachedStepTextColor: kGrey_D0,
                unreachedLineColor: theme.cardColor,
                unreachedStepBorderType: BorderType.normal,
                // finishedStepBackgroundColor: kPrimary,
                // finishedStepBorderColor: kPrimary,
                // finishedStepIconColor: kPrimary,
                // finishedStepTextColor: kPrimary,
                finishedLineColor: theme.cardColor,
                finishedStepBorderType: BorderType.normal,
                lineThickness: 0.5,
                internalPadding: 0,
                showLoadingAnimation: false,
                steps: steps
                    .map((e) {
                      print('e.isActive ${e.isActive}');
                      return EasyStep(
                        customStep: e.isActive
                            ? ActiveStepperWidget(
                          value: e.subTitle,
                          color: e.color,
                          colorText: e.colorText,
                        )
                            : const InActiveStepperWidget(),
                        title: e.title,
                      );
                })
                    .toList(),
                onStepReached: (index) {
                  //   setState(() {
                  activeStep = index;
                  onStepReached!(index);
                  //   });
                },
              ),
            ),
            if (widgets != null) widgets![activeStep]
          ],
        );
      }),
    );
  }
}
