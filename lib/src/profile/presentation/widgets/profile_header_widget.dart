

import 'package:app/core/widgets/images/image_network.dart';

import '../../../../core/widgets/texts/texts.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';

class ProfileHeaderWidget extends BaseStatelessWidget {

   ProfileHeaderWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ImageNetworkCircle(
          image: "",
          width: 70,
          height: 70,
        ),
        20.pw,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BoldText(
              label: 'Mohamed Mahmoud',
            ),
            5.ph,
            const RegularHintText(
              label:  'Flutter Developer',
            ),
          ],
        ),
      ],
    );
  }
}
