import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:tesstt_task/features/home/domain/entities/bottle.dart';
import 'package:tesstt_task/features/home/presentation/widgets/hisotry.dart';
import 'package:tesstt_task/features/home/presentation/widgets/tasting_notes.dart';
import 'package:tesstt_task/utils/theme/theme_colors.dart';

class BottleDetailScreen extends StatelessWidget {
  final Bottle bottle;

  const BottleDetailScreen({super.key, required this.bottle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.mainColor,
      appBar: AppBar(
        backgroundColor: ThemeColors.mainColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Genesis Collection",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close, size: 24),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ThemeColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.settings, color: ThemeColors.goldenColor),
                  Text(
                    bottle.name,
                    style: const TextStyle(
                        color: ThemeColors.actionBgBtnColor, fontSize: 18),
                  ),
                  Transform.rotate(
                    angle: -math.pi / 2,
                    child: const Icon(Icons.arrow_back,
                        color: ThemeColors.goldenColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Hero(
              tag: 'bottle_${bottle.id}',
              child: Image.asset(bottle.image, height: 250),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ThemeColors.secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bottle ${bottle.progress}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Talisker ',
                            style: TextStyle(
                              color: ThemeColors.goldenColor,
                              fontSize: 24,
                            ),
                          ),
                          TextSpan(
                            text: '18 Year old',
                            style: TextStyle(
                              color: ThemeColors.actionBgBtnColor,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "#${bottle.number}",
                      style: const TextStyle(
                          color: ThemeColors.actionBgBtnColor, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: ThemeColors.goldenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w500),
                        tabs: const [
                          Tab(child: Text("  Details  ")),
                          Tab(child: Text("  Tasting  ")),
                          Tab(child: Text("  History  ")),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              _buildDetailRow("Distillery", "Text"),
                              _buildDetailRow("Region", "Text"),
                              _buildDetailRow("Country", "Text"),
                              _buildDetailRow("Type", "Text"),
                              _buildDetailRow("Age", "Text"),
                              _buildDetailRow("Filled", "Text"),
                              _buildDetailRow("Bottled", "Text"),
                              _buildDetailRow("Cask No.", "Text"),
                              _buildDetailRow("ABV", "Text"),
                              _buildDetailRow("Size", "Text"),
                              _buildDetailRow("Finish", "Text"),
                            ],
                          ),
                          DetailVideoWidget(
                            videoUrl: bottle.videoUrl,
                          ),
                         CustomStepper()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.goldenColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              icon: const Icon(Icons.add),
              label: const Text("Add to my collection"),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: const TextStyle(fontSize: 16, color: Colors.white))),
          Text(value, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        ],
      ),
    );
  }
}
