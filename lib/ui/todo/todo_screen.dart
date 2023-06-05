import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/comon/widgets/bottom_sheet.dart';
import 'package:todo/comon/widgets/layout/layout.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/data/states/todo_list/todo_list_cubit.dart';
import 'package:todo/ui/todo/widgets/callender.dart';
import 'package:todo/ui/todo/widgets/complited_todo_list.dart';
import 'package:todo/ui/todo/widgets/create_bottomsheet.dart';
import 'package:todo/ui/todo/widgets/pending_todo_list.dart';

class TodoScreen extends HookWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> focusDay = useState(DateTime.now());

    useEffect(
      () {
        context.read<TodoListCubit>().getTodos(date: DateTime.utc(DateTime.now().year, DateTime.now().month, DateTime.now().day));
        return null;
      },
      [],
    );
    return Layout(
      appBar: LayoutAppBar(
        appBarTitle: const Text('To Do'),
        leading: AppbarLeading(
          onTap: () {
            context.go('/home');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: () async {
          focusDay.value = DateTime.now();
          ArtistaBottomSheet(context: context, child: const TodoCreateBottomSheet());
        },
        backgroundColor: ArtistaColor.secondary,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Space.xl),
          child: Column(
            children: [
              TodoCalender(
                initFocusDay: focusDay.value,
                onChange: (DateTime date) {
                  final todoListCubit = context.read<TodoListCubit>();
                  todoListCubit.getTodos(date: date);
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const CompletedTodoList(),
              const SizedBox(
                height: 32,
              ),
              const PendingTodoList(),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
