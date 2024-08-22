import 'package:countries_app/models/country_model.dart';
import 'package:countries_app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fetchCountries returns a list of countries', () async {
    //Arrange - setting up objcts or data
    ApiService apiService = ApiService(Dio());

    //Act - Executing the method
    print('Fetching countries...');
    final countries = await apiService.fetchCountries();

    //Assert - Verifying the result
    print('Countries fetched: ${countries.length}');
    expect(countries, isA<List<CountryModel>>());
  });
}
