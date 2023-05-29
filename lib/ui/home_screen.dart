import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/layout/layout.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/ui/home/widgets/flexible_space_content.dart';
import 'package:todo/ui/home/widgets/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: LayoutAppBar(
        leading: AppbarLeading(isLeading: false),
        appBarTitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dhaka, Bangladesh",
              style: context.textTheme.bodyMedium?.copyWith(color: ArtistaColor.text.shade200),
            ),
            Text(
              "Thursday, 26 November",
              style: context.textTheme.titleSmall,
            ),
          ],
        ),
        flexibleSpace: const HomeFlexibleSpace(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Space.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Flexible(child: Services()),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Image.asset('assets/images/_chart.png')), // TODO: need to replace with chart
                  Flexible(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("11 of 16 Completed",style: context.textTheme.bodyMedium?.copyWith(
                        color: ArtistaColor.text.shade200,
                      ),), // TODO: replace with values
                      Text("This Week",style: context.textTheme.headlineSmall?.copyWith()),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
