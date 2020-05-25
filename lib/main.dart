import 'package:codingpapa_provider_test/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
    
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<Counter>( //Counter()를 provider에서 return
        create: (context)=> Counter(), //builder->create으로 provier 4.0.0부터 변경됨. 
        child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

    @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
      
        title: Text(title),
      ),
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(Provider.of<Counter>(context).getCount().toString()),
            Consumer<Counter>(//Consumer사용시, setState 위치에 위젯을 감쌈. Counmser<사용할 클래스>(builder: ..)
                builder: (context,value,child)=> //consumer에 필요한 3가지이며, value가 Counter를 의미함. 
                Text(
                value.getCount().toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Provider.of<Counter>(context,listen: false).incrementCount(), //provider는 한 줄로 종료됨. Counter에 있는 함수 호출 
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }



}


  

