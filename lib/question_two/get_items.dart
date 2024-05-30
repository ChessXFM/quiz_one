import 'dart:convert';
import 'dart:io';
import 'package:faker/faker.dart';

class CategoryLoader {
  List<String>? _categories;

  List<String> getCategories() {
    _categories ??= List.generate(1000, (_) => faker.lorem.words(3).join(' '));
    return _categories!;
  }
}

class VenueLoader {
  List<String>? _venues;

  List<String> getVenues() {
    _venues ??= List.generate(1000, (_) => faker.lorem.words(2).join(' '));
    return _venues!;
  }
}

class LanguageLoader {
  Future<List<String>>? _languagesFuture;

  Future<List<String>> getLanguages() {
    _languagesFuture ??= _loadLanguages();
    return _languagesFuture!;
  }

  Future<List<String>> _loadLanguages() async {
    const String filePath = "lib/question_two/languages.json";
    String jsonString = await File(filePath).readAsString();
    List<String> items = List<String>.from(json.decode(jsonString));
    return items;
  }
}

