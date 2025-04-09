import 'package:app/src/home/data/models/product_dto.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../bloc/home_bloc.dart';
import 'home_screen.dart';

class HomePage
    extends BaseBlocWidget<DataSuccess<List<ProductDto>>, HomeCubit> {
  HomePage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text(strings.product)),
      body: buildConsumer(context),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<ProductDto>> state) {
    return HomeScreen(
      home: state.data!,
    );
  }

}
