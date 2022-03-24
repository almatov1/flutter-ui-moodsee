import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  final name;
  final pass;

  SecondRoute({Key? key, this.pass, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Stack(
        children: [
          GestureDetector(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 78,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/media/DI16VHLXoAIg5s-.jpg'),
                    radius: 30,
                  ),
                  isThreeLine: true,
                  title: Text('almatov.1'),
                  subtitle: Text('Super content. I like it ' + (index.toString()) + '.'),
                );
              },
            ),
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.focusedChild!.unfocus();
              }
              ;
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'almatov.1:',
                hintText: 'Ваш комментарий...',
                prefixIcon: Icon(Icons.account_circle_outlined),
                suffixIcon: Material(
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_outlined),
                    onPressed: () {
                      print('xui');
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        currentFocus.focusedChild!.unfocus();
                      }
                      ;
                    },
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}