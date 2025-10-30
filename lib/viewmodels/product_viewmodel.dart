import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mechine_test/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _api = ApiService();
  List<Map<String, dynamic>> _products = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _skip = 0;
  final int _limit = 10;
  String? _error;

  List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get products => _products;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;
  String? get error => _error;
  List<Map<String, dynamic>> get cart => _cart;
  List<Map<String, dynamic>> get wishlist => _wishlist;

  ProductProvider() {
    _loadCartAndWishlist();
  }

  Future<void> loadProducts({bool refresh = false}) async {
    if (_isLoading) return;
    if (!_hasMore && !refresh) return;

    if (refresh) {
      _skip = 0;
      _products = [];
      _hasMore = true;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _api.getProducts(_skip, _limit);
      final List<dynamic> newProducts = data['products'];

      _products.addAll(newProducts.cast<Map<String, dynamic>>());
      _skip += _limit;

      if (newProducts.length < _limit) {
        _hasMore = false;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>?> getProductDetails(int id) async {
    try {
      return await _api.getProductById(id);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }

  Future<void> _loadCartAndWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    final cartStr = prefs.getString('cart');
    final wishlistStr = prefs.getString('wishlist');

    if (cartStr != null) {
      _cart = List<Map<String, dynamic>>.from(json.decode(cartStr));
    }
    if (wishlistStr != null) {
      _wishlist = List<Map<String, dynamic>>.from(json.decode(wishlistStr));
    }
    notifyListeners();
  }

  Future<void> addToCart(Map<String, dynamic> product) async {
    if (!_cart.any((p) => p['id'] == product['id'])) {
      _cart.add(product);
      await _saveCart();
      notifyListeners();
    }
  }

  Future<void> removeFromCart(int productId) async {
    _cart.removeWhere((p) => p['id'] == productId);
    await _saveCart();
    notifyListeners();
  }

  Future<void> addToWishlist(Map<String, dynamic> product) async {
    if (!_wishlist.any((p) => p['id'] == product['id'])) {
      _wishlist.add(product);
      await _saveWishlist();
      notifyListeners();
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    _wishlist.removeWhere((p) => p['id'] == productId);
    await _saveWishlist();
    notifyListeners();
  }

  bool isInCart(int productId) {
    return _cart.any((p) => p['id'] == productId);
  }

  bool isInWishlist(int productId) {
    return _wishlist.any((p) => p['id'] == productId);
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cart', json.encode(_cart));
  }

  Future<void> _saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('wishlist', json.encode(_wishlist));
  }
}
