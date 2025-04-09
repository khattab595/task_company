import 'package:app/src/main_index.dart';
import '../../core/widgets/texts/texts.dart';
import '../home/data/models/product_dto.dart';

class SharedItem extends BaseStatelessWidget {
  final ProductDto data;
  final IconData? icon;
  void Function()? onPressed;

  SharedItem(
      {super.key,
      required this.data,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingVert + 6.paddingHoriz,
      margin: 12.paddingHoriz + 6.paddingVert,
      decoration:
          Decorations.kDecorationBorderRadius(borderColor: kBorderColor),
      child: Row(
        children: [
          Image.network(
            data.image ?? "",
            height: 100,
            width: 100,
          ),
          5.pw,
          titleAndPrice(context),
          const Spacer(),
          Column(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.red,
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
            ],
          )
        ],
      ),
    );
  }

  Widget titleAndPrice(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: SemiBoldHintText(
            label: data.title ?? "",
            labelStyle: context.bodyMedium
                .copyWith(fontSize: 14, overflow: TextOverflow.ellipsis),
          ),
        ),
        RegularHintText(
          label: "${data.price.toString()} \$",
        ),
      ],
    );
  }
}

