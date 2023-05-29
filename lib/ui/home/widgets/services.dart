import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/card.dart';
import 'package:todo/config/const.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ArtistaCard(
            onTap: (){

            },
            cardType: ArtistaCardType.primary,
            borderColor: Colors.transparent,
            bgColor: Color(0xFFE5F8D3),
            height: 87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/habbits.png',
                  ),
                  Text(
                    'Habit',
                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ].withSpaceBetween(height: 12),
              ),
            ),
          ),
        ),
        Flexible(
          child: ArtistaCard(
            onTap: (){

            },
            cardType: ArtistaCardType.primary,
            borderColor: Colors.transparent,
            bgColor: Color(0xFFE1EBFF),
            height: 87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/bills.png',
                  ),
                  Text(
                    'Bills',
                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ].withSpaceBetween(height: 12),
              ),
            ),
          ),
        ),
        Flexible(
          child: ArtistaCard(
            onTap: (){

            },
            cardType: ArtistaCardType.primary,
            borderColor: Colors.transparent,
            bgColor: Color(0xFFFFF6E0),
            height: 87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/todo.png',
                  ),
                  Text(
                    'To Do',
                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ].withSpaceBetween(height: 12),
              ),
            ),
          ),
        ),
        Flexible(
          child: ArtistaCard(
            onTap: (){

            },
            cardType: ArtistaCardType.primary,
            borderColor: Colors.transparent,
            bgColor: const Color(0xFFFFEDE5),
            height: 87,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/challenge.png',
                  ),
                  Flexible(
                    child: Text(
                      'Challenge',
                      style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ].withSpaceBetween(height: 12),
              ),
            ),
          ),
        ),
      ].withSpaceBetween(width: Space.lg),
    );
  }
}
