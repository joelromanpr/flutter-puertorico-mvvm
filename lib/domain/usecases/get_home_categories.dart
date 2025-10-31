import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';

class GetHomeCategories {
  final Repository repository;

  GetHomeCategories(this.repository);

  Future<List<String>> call() async {
    // In a real app, this might come from the repository
    return Future.value([
      'Government',
      'Municipalities',
      'Schools',
    ]);
  }
}
