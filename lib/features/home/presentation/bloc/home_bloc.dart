import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/category_model.dart';
import '../../data/models/menu_item_model.dart';
import '../../domain/repository/homeRepository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final results = await Future.wait([
          homeRepository.getHomeCategories(),
          homeRepository.getHomeBestSellers(),
          homeRepository.getHomeAllMenuItems(),
        ]);

        emit(HomeLoaded(
          categories: results[0] as List<CategoryModel>,
          bestSellers: results[1] as List<MenuItemModel>,
          allItems: results[2] as List<MenuItemModel>,
        ));
      } catch (e) {
        emit(HomeError("حدث خطأ أثناء تحميل البيانات: ${e.toString()}"));
      }
    });
  }
}