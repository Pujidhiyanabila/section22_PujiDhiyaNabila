import 'package:flutter/material.dart';
import 'package:section22/message_data.dart';

class Detail extends StatefulWidget {
  Detail({Key? key, required this.image, required this.message})
      : super(key: key);

  final String image;
  final Message message;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.message.name),
      ),
      
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: widget.message.name, 
              child: AnimatedContainer(
                width: isBig ? 400 : 300,
                height: isBig ? 400 : 300,
                duration: Duration(seconds: 1),
                child: Image.network(widget.image),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                setState((){
                  isBig = !isBig;
                });
              }, 
              child: const Text('Resize'))
          ],
        ),
      ),
    );
  }
}

class ReturnParam {
  final String option;
  final Color color;

  ReturnParam(this.option, this.color);
}
