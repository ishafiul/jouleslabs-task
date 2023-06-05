import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:todo/comon/state/snack_bar/snack_bar_cubit.dart';
import 'package:todo/data/states/todo_list/todo_list_cubit.dart';

@Singleton()
class Provider {
  List<BlocProvider> providers = [
    BlocProvider<SnackBarCubit>(
      create: (BuildContext context) => SnackBarCubit(),
    ),
    BlocProvider<TodoListCubit>(
      create: (BuildContext context) => TodoListCubit(),
    ),

  ];
}
