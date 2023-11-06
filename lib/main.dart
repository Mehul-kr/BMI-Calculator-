import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  var bgcolor=Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('BMI'),
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('BMI',style: TextStyle(
                  fontWeight: FontWeight.w700,fontSize: 35
                ),
                ),
                SizedBox(height: 21,),

                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                    label: Text('Input your Weight '),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('Input your Height(in feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: const InputDecoration(
                      label: Text('Input your Weight(in feet)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16,),

                ElevatedButton(onPressed: (){
                  var wt=wtController.text.toString();
                  var ft=ftController.text.toString();
                  var inch=inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    var iwt= int.parse(wt);
                    var ift=int.parse(ft);
                    var iinh=int.parse(inch);

                    var tinch=(ift*12)+iinh;
                     var tcm=tinch*2.54;
                     var tm=tcm/100;
                     var bmi=iwt/(tm*tm);
                     var msg="";

                     if(bmi>25){
                       msg="You're OverWeight!!";
                       bgcolor=Colors.red.shade700;
                     }else if(bmi<18){
                       msg="You're UnderWeight!!";
                       bgcolor=Colors.yellow.shade300;

                     }else{
                       msg="You're Healthy!!";
                       bgcolor=Colors.green.shade200;

                     }
                     setState(() {
                       result='$msg \n your BMI is: ${bmi.toStringAsFixed(2)}';
                     });

                  } else{
                    setState(() {
                      result='plz fill the requied blanks!! ';
                    });
                  }

                },
                    child: Text('Calculate')),
                SizedBox(height: 11,),

                Text(result,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
