import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_task/features/api/person_model.dart';
import 'package:test_task/features/services/person_service.dart';

part 'person_provider.g.dart';

@riverpod
Future<List<PersonModel>> getPersons(GetPersonsRef ref) {
  return ref.read(personServiceProvider).getPersons();
}
