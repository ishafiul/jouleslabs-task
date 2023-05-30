import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo/comon/utils/extensions.dart';

class TipsSortSwitch extends HookWidget {
  const TipsSortSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isSwitch = useState(false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Flexible(child: Text('Tips',style: context.textTheme.headlineSmall,)),
        Container(
          width: 130,
          height: 30,
          decoration: const BoxDecoration(
            color: Color(0xFFE5F6FF),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Container(
                width: 65,
                height: 30,
                decoration: BoxDecoration(
                  color: isSwitch.value == false ? const Color(0xFF91D5FF) : null,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    isSwitch.value = false;
                  },
                  child: const Center(child: Text("Newest")),
                ),
              ),
              Container(
                width: 65,
                height: 30,
                decoration: BoxDecoration(
                  color: isSwitch.value == true ? const Color(0xFF91D5FF) : null,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    isSwitch.value = true;
                  },
                  child: const Center(child: Text("Popular")),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
