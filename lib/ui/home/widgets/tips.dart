import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/card.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';

class TipsCard extends StatelessWidget {
  const TipsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ArtistaCard(
      cardType: ArtistaCardType.primary,
      bgColor: const Color(0xFFE5F6FF),
      borderColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(Space.xl),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/man_head.png"),
                      Text("Mickel Potter", style: context.textTheme.bodyMedium?.copyWith(color: ArtistaColor.text.shade200)),
                    ].withSpaceBetween(width: 6),
                  ),
                  Text(
                    "How to get up early in the morning!",
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: ArtistaColor.primary,
                          ),
                          Text("5 min", style: context.textTheme.bodyMedium?.copyWith(color: ArtistaColor.text.shade200))
                        ].withSpaceBetween(width: 6),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: ArtistaColor.primary,
                          ),
                          Text("1.2k", style: context.textTheme.bodyMedium?.copyWith(color: ArtistaColor.text.shade200))
                        ].withSpaceBetween(width: 6),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mode_comment_outlined,
                            color: ArtistaColor.primary,
                          ),
                          Text("865", style: context.textTheme.bodyMedium?.copyWith(color: ArtistaColor.text.shade200))
                        ].withSpaceBetween(width: 6),
                      ),
                    ].withSpaceBetween(width: 12),
                  )
                ].withSpaceBetween(height: 15),
              ),
            ),
            Image.asset('assets/images/tipsImage.png'),
          ],
        ),
      ),
    );
  }
}
