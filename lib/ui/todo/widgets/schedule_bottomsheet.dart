import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/button.dart';
import 'package:todo/comon/widgets/inputs.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/ui/todo/widgets/callender.dart';

class TodoScheduleBottomSheet extends HookWidget {
  final Function(
    DateTime date,
    String? reminder,
    TimeOfDay? scheduleTime,
  ) onChange;

  const TodoScheduleBottomSheet({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<TimeOfDay> scheduleTime = useState(const TimeOfDay(hour: 00, minute: 00));
    final ValueNotifier<String> reminderMin = useState("0");
    final ValueNotifier<DateTime> scheduleDate = useState(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(Space.xl),
      child: Column(
        children: [
          TodoCalender(
            initFocusDay: DateTime.now(),
            onChange: (date) {
              scheduleDate.value = date;
            },
          ),
          Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Set Time"),
                Flexible(
                  child: Container(
                    width: 150,
                    height: 48,
                    decoration: BoxDecoration(color: ArtistaColor.secondary, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: InkWell(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
                        );
                        if (time != null) {
                          scheduleTime.value = time;
                        }
                      },
                      child: Center(child: Text("${scheduleTime.value.hour}:${scheduleTime.value.minute}")),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Reminder"),
              Flexible(
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(color: ArtistaColor.secondary, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: AtristaDownItemInput(
                    items: const ['1', '5', '10', '15', '30'],
                    labelText: '',
                    labelSuffix: "min ago",
                    initialItemLabelText: "0 min ago",
                    onChanged: (value) {
                      reminderMin.value = value;
                    },
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
                onPressed: () {
                  context.pop();
                },
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
                onPressed: () {
                  onChange(scheduleDate.value, reminderMin.value, scheduleTime.value);
                  context.pop();
                },
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
