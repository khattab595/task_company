
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';



@Injectable()
class NavBarState {}

class NewsBottomNavInitial extends NavBarState {}

class NavBarBloc extends Cubit<NavBarState> {
  NavBarBloc() : super(NavBarState());
  static NavBarBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsBottomNavInitial());
  }
}
