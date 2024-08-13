import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task/features/api/person_api.dart';
import 'package:test_task/features/api/person_model.dart';

class PersonService {
  Future<List<PersonModel>> getPersons() async {
    final response = await PersonApi().getPersons();
    return response.map((e) => PersonModel(e.name)).toList();
  }
}

final personServiceProvider = Provider((ref) {
  return PersonService();
});
