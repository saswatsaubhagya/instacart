import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instacart_api/instacart_api.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._apiClient) : super(const HomeState.initial()) {
    _fetchData();
  }
  final InstaCartApiClient _apiClient;
  List<Product> _products = [];
  List<String> _categories = [];
  String selectedCategory = '';

  _fetchData() async {
    emit(const HomeState.loading());
    try {
      await getProducts();
      await getCategories();
      emit(HomeState.loaded(_products, _categories));
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }

  Future<List<Product>> getProducts() async {
    try {
      _products = await getProductList(client: _apiClient);
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
    return _products;
  }

  Future<List<String>> getCategories() async {
    try {
      _categories = await getCategoryList(_apiClient);
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
    return _categories;
  }

  Future<void> getCategoryProducts(String category) async {
    try {
      BotToast.showLoading();
      _products = await getCategoryProductList(
        client: _apiClient,
        category: category,
      );
      selectedCategory = category;
      emit(HomeState.loaded(_products, _categories));
      BotToast.closeAllLoading();
    } catch (e) {
      BotToast.showText(text: e.toString());
      BotToast.closeAllLoading();
    }
    emit(HomeState.loaded(_products, _categories));
  }

  Future<void> clearSelectedCategory() async {
    try {
      BotToast.showLoading();
      await getProducts();
      selectedCategory = '';
      BotToast.closeAllLoading();
      emit(HomeState.loaded(_products, _categories));
    } catch (e) {
      BotToast.closeAllLoading();
      BotToast.showText(text: e.toString());
    }
  }
}
