import 'package:flutter/material.dart';

import 'package:tesstt_task/features/home/domain/entities/bottle.dart';
import 'package:tesstt_task/features/home/presentation/screens/bottom_detail_screen.dart';
import 'package:tesstt_task/utils/theme/theme_colors.dart';

class CollectionItemCard extends StatelessWidget {
 final Bottle bottle;

  const CollectionItemCard({
    super.key,
   required this.bottle
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BottleDetailScreen(bottle: bottle),
      ),
    );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.secondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
           
            

            const Spacer(),
            Image.asset(
              bottle.image,
              height: 170,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bottle.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                if (bottle.year.isNotEmpty)
                  Text(
                    bottle.year,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                if (bottle.progress.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                    ),
                    child: Text(
                      bottle.progress,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
