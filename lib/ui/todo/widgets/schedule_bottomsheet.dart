import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/button.dart';
import 'package:todo/comon/widgets/inputs.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/ui/todo/widgets/callender.dart';

class TodoScheduleBottomSheet extends StatelessWidget {
  const TodoScheduleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Space.xl),
      child: Column(
        children: [
          TodoCalender(
            onChange: (date) {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Reminder"),
              Flexible(
                child: Container(
                  width: 150,
                  height: 48,
                  decoration:
                      BoxDecoration(color: ArtistaColor.secondary, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: InkWell(
                      onTap: () async {
                        final ff = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 10, minute: 12),);
                        print(ff?.hour);
                      },
                      child: Center(child: Text("HH:MM"))),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Reminder"),
              Flexible(
                child: Container(
                  width: 150,
                  decoration:
                      BoxDecoration(color: ArtistaColor.secondary, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const AtristaDownItemInput(
                    items: ['5'],
                    labelText: '',
                    labelSuffix: "min ago",
                    initialItemLabelText: "0 min ago",
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                buttonType: ButtonType.text,
                buttonSize: ButtonSize.sm,
                onPressed: () {},
                isFullWidth: false,
                buttonColor: ButtonColor.secondary,
                child: Text(
                  "CANCEL",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Button(
                buttonType: ButtonType.elevatedPrimary,
                buttonSize: ButtonSize.sm,
                onPressed: () {},
                isFullWidth: false,
                buttonColor: ButtonColor.secondary,
                child: Text(
                  "SAVE",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ].withSpaceBetween(width: 15),
          )
        ].withSpaceBetween(height: 15),
      ),
    );
  }
}
