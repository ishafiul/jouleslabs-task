import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/config/colors.dart';

class TodoCalender extends HookWidget {
  final Function(DateTime date) onChange;

  const TodoCalender({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> _focusDay = useState(DateTime.now());

    return TableCalendar(
      calendarStyle: CalendarStyle(
        selectedDecoration: const BoxDecoration(
            color: Color(0xFFFFD979),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            )),
        todayDecoration: const BoxDecoration(
          color: Color(0xFFfbe8b9),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        defaultDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        disabledDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        holidayDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        markerDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        rangeEndDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        outsideDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        rangeStartDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),

        weekendDecoration:const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),

        withinRangeDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),

        todayTextStyle: context.textTheme.bodyLarge!,
        selectedTextStyle: context.textTheme.bodyLarge!,
      ),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: context.textTheme.titleMedium!,
          leftChevronIcon: Container(
            height: 30,
            width: 30,
            padding: const EdgeInsets.only(left: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFFFF6E0),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: ArtistaColor.secondary,
              size: 14,
            ),
          ),
          rightChevronIcon: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFFFF6E0),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: ArtistaColor.secondary,
              size: 14,
            ),
          )),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      onDaySelected: (selectedDay, focusedDay) {
        _focusDay.value = selectedDay;
        onChange(selectedDay);
      },
      selectedDayPredicate: (day) {
        return isSameDay(day, _focusDay.value);
      },
      focusedDay: _focusDay.value,
    );
  }
}
