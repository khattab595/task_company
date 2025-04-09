import '../../../main_index.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends BaseStatelessWidget {
  final VoidCallback onLogout;
  ProfileScreen({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 12.paddingHoriz,
      child: Column(
        children: [
          ProfileHeaderWidget(),
          30.ph,
          const Divider(),
          30.ph,
          ProfileItem(
            icon: AppIcons.logout,
            title: strings.logout,
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
