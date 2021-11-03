import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark, // dark text for status bar
      statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GoogleTranslator translator = GoogleTranslator();
  TextEditingController controller = TextEditingController();
  String translatedText = "Hi how are you?";

  void translate(){
    String text = controller.text.toString();
    translator.translate(text, to: "hi").then((output) {
      setState((){
        translatedText = output.text.toString();
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Translator"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: controller,
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(onPressed: (){
              translate();
            },
              child: Text("Translate"),
            ),
            SizedBox(height: 20,),
            Text(translatedText),
          ],
        ),
      ),
    );
  }
}
