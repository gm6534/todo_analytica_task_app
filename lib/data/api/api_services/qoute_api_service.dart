import 'package:todo_analytica_task_app/data/api/api_settings/api_client.dart';
import '../api_settings/handle_exception.dart';

class QuoteApiService {

  Future<dynamic> fetchQuote() async {
    try {
      final response = await APIClient.get(baseUrl: 'https://zenquotes.io/', endpoint: 'api/random');
      return response;
    } catch (e) {
      throw APIException(e.toString());
    }
  }
}
