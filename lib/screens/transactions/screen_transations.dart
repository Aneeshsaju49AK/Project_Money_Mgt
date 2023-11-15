import 'package:flutter/material.dart';

class ScreenTransation extends StatelessWidget {
  const ScreenTransation({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Text(
                    '12\naug',
                    textAlign: TextAlign.center,
                  ),
                ),
                title: Text('RS 1000'),
                subtitle: Text('Travel'),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox();
        },
        itemCount: 10);
  }
}
