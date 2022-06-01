import 'package:dio/dio.dart';
import '../../constants/string.dart';
import '../models/quote.dart';

class CharactersWebServices {
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  late Dio dio;
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<dynamic>> getCharactersQuotes(String charName) async {
    try {
      Response response = await dio.get(
        'quote',
        queryParameters: {
          'author': charName,
        },
      );
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
