import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';

class HomeFlexibleSpace extends StatelessWidget {
  const HomeFlexibleSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    return LayoutBuilder(
      builder: (ctx, cons) {
        top = cons.biggest.height;
        return Stack(
          children: [
            AnimatedOpacity(
              opacity: top >= 100
                  ? 1
                  : top >= 80
                      ? .6
                      : 0,
              duration: const Duration(microseconds: 300),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/home_head.png'), fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Space.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "35°",
                                      style: context.textTheme.displayMedium?.copyWith(fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "c",
                                      style: context.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(child: Image.asset('assets/images/moon.png'))
                            ],
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Good Morning!',
                            style: context.textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(
                          height: Space.md,
                        ),
                        Flexible(
                            child: Text(
                          '“If you spend too much time thinking about a thing, you’ll never get it done.”',
                          style: context.textTheme.bodyMedium?.copyWith(color: ArtistaColor.text.shade200),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            /* FlexibleSpaceBar(
              title: AnimatedOpacity(
                opacity: top <= 100 ? 1.0 : 0.0,
                duration: const Duration(microseconds: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dhaka, Bangladesh",
                      style: context.textTheme.bodyMedium,
                    ),
                    Text(
                      "Thursday, 26 November",
                      style: context.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            )*/
          ],
        );
      },
    );
  }
}
