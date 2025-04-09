
import '../../../main_index.dart';
import '../../../settings/presentation/bloc/locale_cubit.dart';
import '../../../settings/presentation/bloc/locale_state.dart';

class ChangeLanguagePopup extends BaseStatelessWidget {
  final EdgeInsetsGeometry? margin;
  ChangeLanguagePopup({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [
      strings.english,
      strings.arabic,
    ];
    return Container(
        clipBehavior: Clip.antiAlias,
        width: 80,
        margin: margin ?? EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        decoration: Decorations.kDecorationOnlyRadius(color: context.onPrimary, radius: 20),
        child: BlocBuilder<LocaleCubit, LocalState>(
          bloc: LocaleCubit()..getLanguageData(),
          builder: (context, state) {
  return DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            value: state.language == 'en' ? 0 : 1,
            isDense: true,
            borderRadius: BorderRadius.circular(10),
            alignment: AlignmentDirectional.center,
            dropdownColor: context.onPrimary,
            padding: EdgeInsets.zero,
            decoration: InputDecoration(
              filled: true,
              fillColor: context.onPrimary,
              labelStyle: context.labelMedium.copyWith(fontSize: 14),
              hintStyle: context.labelMedium.copyWith(fontSize: 14),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              isDense: true,
            ),
            icon: Icon(Icons.keyboard_arrow_down, color: context.backgroundColor, size: 20),
            items: items.map((e) =>  DropdownMenuItem(
              value: items.indexOf(e),
              alignment: AlignmentDirectional.center,
              child: Text(e, style: context.labelSmall),
            )).toList(),
            onChanged: (value){
              print('value $value');
              if(value == 0){
                context.read<LocaleCubit>().setLanguageData('en');
              }else{
                context.read<LocaleCubit>().setLanguageData('ar');
              }
            },
          ),
        );
  },
),
      );
  }
}

