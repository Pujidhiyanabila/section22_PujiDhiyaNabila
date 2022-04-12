import 'package:flutter/material.dart';
import 'package:section22/detail.dart';
import 'package:section22/message_data.dart';
import 'package:section22/create.dart';
import 'package:faker/faker.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    final Faker faker = Faker();
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.all(8.0),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final Message message = messageData[index];
            final String imageUrl = faker.image.image(random: true);
            return ListTile(
              leading: Hero(
                tag: message.name,
                child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              title: Text(
                message.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                message.messageText
              ),
              onTap: () async {
                final ReturnParam result = await Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) {
                      return Detail(
                        image: imageUrl,
                        message: message,
                      );
                    }
                  )
                ) as ReturnParam;

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    content: Text(
                      result.option,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    backgroundColor: result.color,
                  )
                );
              }
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }, itemCount: messageData.length
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation){
                return const FlutterForm();
              },
              transitionsBuilder: (context, animation,
              secondaryAnimation, child){
                final tween = 
                  Tween(begin: 0.0, end: 1.0);
                return ScaleTransition(
                  scale: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}