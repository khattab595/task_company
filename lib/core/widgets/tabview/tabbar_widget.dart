import 'package:app/src/main_index.dart';

class TabItemModel{
  final String label ;
  TabItemModel({required this.label});
  Tab builder(){
    return TabWidgetItemBuilder(this);
  }
}

class TabWidgetItemBuilder extends Tab{
  TabWidgetItemBuilder(TabItemModel model, {Key? key}):super(key: key, text: model.label);
}

class TabBarWidget  extends StatelessWidget{
  final Function(int)? onTap;
  final List<TabItemModel> tabs ;
  final Widget? page;
  const TabBarWidget({Key? key ,required this.tabs, this.onTap, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: SizedBox(
        height: 90,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar:   PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Container(
              margin: 20.paddingAll,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                border: Border.all(
                    color: kBorderColor,
                    width: 0.3,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(8)),
              child: TabBar(
                // isScrollable: true,
                indicatorColor: Colors.transparent,
                dividerColor: Colors.transparent,
                unselectedLabelStyle: context.bodyLarge,
                labelStyle: context.labelLarge,
                labelColor: Colors.white,
                unselectedLabelColor:kPrimaryDark,
                padding: 5.paddingAll,
                indicatorPadding: 0.paddingAll,
                labelPadding:  0.paddingHoriz ,
                indicator:  BoxDecoration(
                    color: context.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1), // changes position of shadow
                      ),
                    ],

                ),
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: onTap,
                tabs: tabs.map((e) => e.builder()
                ).toList(),
              ),
            ),
          ),
          body: page,
        ),
      ),
    );
  }

}
