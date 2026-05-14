import 'package:bloc/bloc.dart';
import 'package:yammyapp/core/api_helper/dio_client.dart';
import 'package:yammyapp/core/constants/constants.dart';
import '../../data/models/cart_model.dart';
import '../../data/repository/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';


class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc({required this.repository}) : super(CartInitial()) {

    on<FetchCart>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await repository.fetchCartData();
        emit(CartFetched(cart));
      } catch (e) {
        emit(CartError("فشل في تحميل السلة، تأكد من الاتصال"));
      }
    });
    //
    // on<IncrementQuantity>((event, emit) {
    //   if (state is CartLoaded) {
    //     final currentCart = (state as CartLoaded).cart;
    //
    //     for (var item in currentCart.cartItems) {
    //       if (item.id == event.itemId) {
    //         item.quantity++;
    //         break;
    //       }
    //     }
    //     emit(CartLoaded(currentCart));
    //
    //     // اختيارياً: ارسل التحديث للباك إند
    //     // repository.updateItemQuantity(event.itemId, ...);
    //   }
    // });
    //
    // on<DecrementQuantity>((event, emit) {
    //   if (state is CartLoaded) {
    //     final currentCart = (state as CartLoaded).cart;
    //     for (var item in currentCart.cartItems) {
    //       if (item.id == event.itemId && item.quantity > 1) {
    //         item.quantity--;
    //         break;
    //       }
    //     }
    //     emit(CartLoaded(currentCart));
    //   }
    // });
  }
}