import '../../../../../core/widgets/radio/custom_radio_list.dart';
import '../../../../main_index.dart';
import '../../bloc/locale_cubit.dart';
import '../../bloc/locale_state.dart';

class ChangLanguageScreen extends BaseStatelessWidget {
  ChangLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'ar';
    return BlocBuilder<LocaleCubit, LocalState>(
       bloc: LocaleCubit()..getLanguageData(),
        builder: (context, state) {
         selectedValue = context.languageCode;
      return Column(
        children: [
          CustomRadioList(
            isLast: true,
            title: strings.arabic,
            value: 'ar',
            groupValue: selectedValue,
            onChanged: (value) {
              print(value);
              selectedValue = value as String;
              context.read<LocaleCubit>().setLanguageData('ar');
            },
          ),
          const CustomDivider(),
          CustomRadioList(
            isLast: true,
            title: strings.english,
            value: 'en',
            groupValue: selectedValue,
            onChanged: (value) {
              context.read<LocaleCubit>().setLanguageData('en');

            },
          ),
        ],
      );
    });
  }
}
