import 'package:bloc/bloc.dart';
import '../../data/models/characters.dart';
import '../../data/models/quote.dart';
import '../../data/repository/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  List<Quote> quotes = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharactersQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
