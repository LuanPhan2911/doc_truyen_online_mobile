import 'package:doc_truyen_online_mobile/styles/app_text.dart';
import 'package:flutter/material.dart';

class NoDataFromServer extends StatelessWidget {
  final VoidCallback? onRefresh;
  const NoDataFromServer({super.key, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Không có dữ liệu",
          style: AppText.subtitle,
        ),
        onRefresh != null
            ? IconButton(
                onPressed: onRefresh,
                tooltip: "Tải lại trang",
                icon: const Icon(
                  Icons.refresh,
                  size: 50,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
