import 'package:flutter/material.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/bottom_sheet.dart';
import 'package:todo/comon/widgets/button.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/ui/todo/widgets/schedule_bottomsheet.dart';

class TodoCreateBottomSheet extends StatelessWidget {
  const TodoCreateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Space.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create Task",
            style: context.textTheme.titleLarge,
          ),
          TextFormField(
            validator: (value) {},
            decoration: const InputDecoration(
              labelText: 'Task Title',
              hintText: 'type your task ',
            ),
            onChanged: (value) {},
            keyboardType: TextInputType.text,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                buttonType: ButtonType.text,
                buttonSize: ButtonSize.md,
                buttonColor: ButtonColor.primary,
                onPressed: () {
                  ArtistaBottomSheet(context: context, child: TodoScheduleBottomSheet());
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
            ],
          )
        ].withSpaceBetween(height: 16),
      ),
    );
  }
}
