import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/country_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://restcountries.com/v3.1/")
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //fetch Countries
  @GET("region/europe?fields=name,capital,flags,region,languages,population")
  Future<List<CountryModel>> fetchCountries();
}