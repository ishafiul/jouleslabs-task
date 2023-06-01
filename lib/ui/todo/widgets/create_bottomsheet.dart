import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/comon/state/snack_bar/snack_bar_cubit.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/bottom_sheet.dart';
import 'package:todo/comon/widgets/button.dart';
import 'package:todo/comon/widgets/snackbar.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/data/states/todo_list/todo_list_cubit.dart';
import 'package:todo/ui/todo/widgets/schedule_bottomsheet.dart';

final todoFormKey = GlobalKey<FormState>();

class TodoCreateBottomSheet extends HookWidget {
  const TodoCreateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> selectedScheduleDate = useState(DateTime.now());
    final ValueNotifier<String?> selectedReminderMin = useState('0');
    final ValueNotifier<TimeOfDay?> selectedScheduleTime = useState(TimeOfDay(hour: 0, minute: 0));
    final ValueNotifier<String> todoTitle = useState('');
    return Form(
      key: todoFormKey,
      child: Padding(
        padding: const EdgeInsets.all(Space.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Task",
              style: context.textTheme.titleLarge,
            ),
            FormField(
              validator: (value) {
                if (todoTitle.value == '') {
                  return "Please insert a title for your todo task";
                }
                return null;
              },
              builder: (field) => Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Task Title',
                      hintText: 'type your task ',
                    ),
                    onChanged: (value) {
                      todoTitle.value = value;
                    },
                    keyboardType: TextInputType.text,
                  ),
                  if (field.hasError)
                    Padding(
                      padding: const EdgeInsets.all(Space.md),
                      child: Text(
                        field.errorText!,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: ArtistaColor.danger,
                        ),
                      ),
                    )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: FormField(
                    builder: (field) {
                      return Column(
                        children: [
                          Button(
                            buttonType: ButtonType.text,
                            buttonSize: ButtonSize.md,
                            buttonColor: ButtonColor.primary,
                            onPressed: () {
                              ArtistaBottomSheet(
                                context: context,
                                child: TodoScheduleBottomSheet(
                                  onChange: (date, reminder, scheduleTime) {
                                    selectedScheduleDate.value = date;
                                    selectedReminderMin.value = reminder;
                                    selectedScheduleTime.value = scheduleTime;
                                  },
                                ),
                              );
                            },
                            isFullWidth: false,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFF6E0),
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: ArtistaColor.secondary,
                                  ),
                                ),
                                Text(
                                  'Set schedule',
                                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ].withSpaceBetween(width: 9),
                            ),
                          ),
                          if (field.hasError)
                            Padding(
                              padding: const EdgeInsets.all(Space.md),
                              child: Text(
                                field.errorText!,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: ArtistaColor.danger,
                                ),
                              ),
                            )
                        ],
                      );
                    },
                  ),
                ),
                Button(
                  buttonType: ButtonType.elevatedPrimary,
                  buttonSize: ButtonSize.sm,
                  onPressed: () {
                    if (todoFormKey.currentState!.validate()) {
                      final todoListCubit = context.read<TodoListCubit>();
                      final snackbarCubit = context.read<SnackBarCubit>();
                      todoListCubit.createTodos(
                        date: DateTime.utc(selectedScheduleDate.value.year,selectedScheduleDate.value.month,selectedScheduleDate.value.day),
                        title: todoTitle.value,
                        time: selectedScheduleTime.value!,
                        reminderMin: selectedReminderMin.value!,
                      );
                      snackbarCubit.snackBar(type: SnackBarType.success, message: "ToDo Added");
                      context.pop();
                    }
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
              ],
            )
          ].withSpaceBetween(height: 16),
        ),
      ),
    );
  }
}
