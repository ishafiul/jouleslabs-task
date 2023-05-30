import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/comon/utils/extensions.dart';
import 'package:todo/comon/widgets/layout/layout.dart';
import 'package:todo/config/colors.dart';
import 'package:todo/config/const.dart';
import 'package:todo/ui/todo/widgets/callender.dart';

class TodoScreen extends HookWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: LayoutAppBar(
        appBarTitle: const Text('To Do'),
        leading: AppbarLeading(
          onTap: () {
            context.go('/');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
        onPressed: () {},
        backgroundColor: ArtistaColor.secondary,
        child: Icon(Icons.add,color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Space.xl),
          child: Column(
            children: [
              TodoCalender(
                onChange: (DateTime date) {},
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed (1)',
                    style: context.textTheme.titleLarge,
                  ),
                  Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Retro Meeting', style: context.textTheme.bodyLarge?.copyWith(decoration: TextDecoration.lineThrough, fontWeight: FontWeight.bold)),
                    tileColor: Color(0xFFFFF6E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    secondary: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  )
                ].withSpaceBetween(height: 16),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today (2)',
                    style: context.textTheme.titleLarge,
                  ),
                  Icon(Icons.arrow_drop_down_circle_outlined)
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  CheckboxListTile(
                    value: false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Retro Meeting', style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    tileColor: Color(0xFFFFF6E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    secondary: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  ),
                  CheckboxListTile(
                    value: false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Retro Meeting', style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    tileColor: Color(0xFFFFF6E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    secondary: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  ),
                  CheckboxListTile(
                    value: false,
                    onChanged: (value) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Retro Meeting', style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    tileColor: Color(0xFFFFF6E0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    secondary: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                  )
                ].withSpaceBetween(height: 16),
              ),
              SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
