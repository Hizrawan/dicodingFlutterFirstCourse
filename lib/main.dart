import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo oka',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const FirstScreen(),
      debugShowCheckedModeBanner: false,
    );
    
  }
}

class FirstScreen extends StatelessWidget{
  const FirstScreen({Key? key}) : super(key: key);
 
  @override

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true ,
          title: Text('Halo Guys'),
          actions:[
            IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.black,))
          ],
          leading:IconButton(onPressed: (){}, icon: const Icon(Icons.menu,color: Colors.black,))
        ),
        body: Center(
 child:  Container(
            width: 200,
            height: 100,
            color: Colors.blue,
            child: Center(
               child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.share),
              Icon(Icons.thumb_up),
              Icon(Icons.thumb_down)

          ],
          ),
              )
            ),
            
        ),
          
         
         
          
        floatingActionButton: FloatingActionButton(onPressed: (){},child: const Icon(Icons.add)),
      );
  }
}
