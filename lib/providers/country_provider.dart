import 'dart:developer';
import 'package:flutter/material.dart';
import '../models/country_model.dart';
import '../services/api_service.dart';

class CountryProvider extends ChangeNotifier {
  final ApiService _api;
  List<CountryModel> _countries = [];
  String _sortType = 'name';
  bool _isLoading = false;
  bool _isError = false;

  CountryProvider(this._api) {
    fetchCountries();
  }

  //getters for countries
  List<CountryModel> get countries => _countries;

  //getters for sortings
  String get sortType => _sortType;

  //getters for isLoading
  bool get isLoading => _isLoading;

  //getters for isError
  bool get isError => _isError;

  //fetch countries
  Future<void> fetchCountries() async {
    try {
      _isLoading = true;
      _countries = await _api.fetchCountries();
    } catch (e) {
      _isError = true;
      log(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //set sort type
  void setSortType(String type) {
    _sortType = type;
    sortCountries();
    notifyListeners();
  }

  //sort countries
  void sortCountries() {
    switch (_sortType) {
      case 'population':
        _countries.sort((a, b) => a.population.compareTo(b.population));
        break;
      case 'name':
        _countries.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'capital':
        _countries.sort((a, b) => a.capital.compareTo(b.capital));
        break;
    }
  }
}
