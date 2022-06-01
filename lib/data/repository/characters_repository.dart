import '../models/characters.dart';
import '../models/quote.dart';
import '../web_services/characters_web_services.dart';

class CharactersRepository {
  CharactersRepository(this.charactersWebServices);

  final CharactersWebServices charactersWebServices;
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharactersQuotes(String charName) async {
    final quotes = await charactersWebServices.getCharactersQuotes(charName);
    return quotes.map((charQuote) => Quote.fromJson(charQuote)).toList();
  }
}
