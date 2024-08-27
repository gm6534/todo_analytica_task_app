import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/helper.dart';
import '../../data/api/api_services/qoute_api_service.dart';

class QuoteController extends GetxController {
  var isLoading = true.obs;
  var quoteList = [].obs;

  final QuoteApiService apiService;

  QuoteController(this.apiService);

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      isLoading(true);
      var response = await apiService.fetchQuote();
      if (response != null) {
        quoteList.value = response;
      }
    } catch (e) {
      isLoading(false);
      Helper.showToast(msg: "Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
