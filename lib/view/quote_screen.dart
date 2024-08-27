import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_analytica_task_app/data/utils/widgets/base_scaffold.dart';
import 'package:todo_analytica_task_app/view/quotes/quote_controller.dart';

import '../data/api/api_services/qoute_api_service.dart';
import '../data/utils/widgets/helper.dart';

class QuoteScreen extends StatelessWidget {

  QuoteScreen({super.key});

  final _quoteController = Get.put(QuoteController(QuoteApiService()));

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarTitle: 'Quotes',
      body: Obx(() {
        if (_quoteController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: _quoteController.quoteList.length,
          itemBuilder: (context, index) {
            var quote = _quoteController.quoteList[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.w),
              leading:
                  const Icon(Icons.format_quote, color: Colors.blue, size: 40),
              title: Text(
                quote['content'],
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  "- ${quote['author']}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: quote['content']));
                  Helper.showToast(msg: "Quote copied to clipboard!");
                },
                  child: const Icon(Icons.copy, color: Colors.grey)),
              tileColor: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ).paddingSymmetric(vertical: 5.w);
          },
        ).paddingAll(10.w);
      }),
    );
  }
}
