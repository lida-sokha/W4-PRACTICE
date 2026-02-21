import 'package:flutter/material.dart';
import 'package:theory_lesson/W4-PRACTICE/2_download_app/ui/providers/theme_color_provider.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(controller.ressource.name),
            subtitle: _buildSubtitile(),
            trailing: _buildTrailingWidget(),
          ),
        );
      },
    );

    // TODO
  }

  Widget _buildSubtitile() {
    if (controller.status == DownloadStatus.notDownloaded) {
      return Text("${controller.resourceSizeMB} MB");
    }

    return Text(
      "${controller.progressPercent}% complete - "
      "${controller.downloadedMB.toStringAsFixed(1)} "
      "of ${controller.ressource.size} MB",
    );
  }

  Widget _buildTrailingWidget() {
    return switch (controller.status) {
      DownloadStatus.notDownloaded => IconButton(
        onPressed: controller.startDownload,
        icon: const Icon(Icons.download),
      ),
      DownloadStatus.downloading => const Icon(Icons.downloading_outlined),
      DownloadStatus.downloaded => const Icon(Icons.folder),
    };
  }
}
