import 'package:app/src/main_index.dart';

import '../../../../core/widgets/texts/texts.dart';
import '../../data/models/product_dto.dart';


class PublicItem extends BaseStatelessWidget {
  final ProductDto data;
  final IconData? icon;
  void Function()? onPressed;

  PublicItem(
      {super.key,
        required this.data,
        required this.onPressed,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingVert + 6.paddingHoriz,
      margin: 6.paddingHoriz + 6.paddingVert,
      decoration:
      Decorations.kDecorationBorderRadius(borderColor: Colors.grey.withOpacity(0.3)),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                data.image ?? "",
                height: 100,
                width: double.infinity,
              ),
              PositionedDirectional(
                top: 0,
                end: 0,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: primaryColor,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 20,
                    onPressed: onPressed,
                    icon: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          5.ph,
          titleAndPrice(context),


        ],
      ),
    );
  }

  Widget titleAndPrice(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: SemiBoldHintText(
            label: data.title ?? "",
            labelStyle: context.bodyMedium
                .copyWith(fontSize: 15, overflow: TextOverflow.ellipsis),
          ),
        ),
        RegularHintText(
          label: "${data.price.toString()} \$",
        ),
      ],
    );
  }
}

