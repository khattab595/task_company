import '../../../src/main_index.dart';

class CustomCountButton extends StatelessWidget {
  final IconData iconData;
  final Function() onTap;

  const CustomCountButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        alignment: Alignment.center,
        decoration: Decorations.kDecorationOnlyRadius(
          color: Colors.white,
        ),
        child: Icon(
          iconData,
          color: context.secondary,
          size: 20,
        ),
      ),
    );
  }
}
