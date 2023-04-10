import 'package:block_example/api/example_api_provider.dart';
import 'package:block_example/model/covid_model.dart';
import 'package:block_example/model/example_model.dart';

class ApiRepository {
  final _provider = ApiExample();

  Future<CovidModel> fetchCovidList() {
    return _provider.getCovidInfo();
  }
  Future<UserDetailsModel> fetchUserList() {
    return _provider.getUsers();
  }
}

class NetworkError extends Error {}