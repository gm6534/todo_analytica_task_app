import 'package:todo_analytica_task_app/data/api/api_settings/api_client.dart';
import 'package:todo_analytica_task_app/data/utils/constants/app_constants.dart';
import '../api_settings/handle_exception.dart';

class QuoteApiService {

  Future<dynamic> fetchQuote() async {
    try {
      final response = await APIClient.get(baseUrl: ApiEndPoint.quotesApiUrl, endpoint: ApiEndPoint.quotesApiEndPoint);
      return response;
    } catch (e) {
      throw APIException(e.toString());
    }
  }
}
