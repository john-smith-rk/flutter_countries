import 'package:flutter/material.dart';
import 'package:flutter_countries/flutter_countries.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<CountryData>? mDataList;
  bool isLoading = false;
  String title = "";


  Future<void> getALl() async {
    title = "All";
    mDataList?.clear();
    setState(() {isLoading=true;});
    mDataList =  await FlutterCountriesUtilities.getCountries();
    mDataList?.sortByName();
    setState(() {isLoading=false;});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                ElevatedButton(onPressed: getALl, child: Text("Get")),

                mDataList == null?(isLoading?const CircularProgressIndicator():const SizedBox.shrink()):countryList(),

              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget countryList(){
    return ListView.builder(
      primary: false,
      shrinkWrap:true,
      itemCount: mDataList?.length??0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

                Row(
                  children: [

                    Expanded( flex : 1,child: Image.network(mDataList![index].flagPng.toString(),
                      width: 50,
                      height: 80,
                      fit: BoxFit.cover,
                    ),),

                    SizedBox(width: 5),

                    Expanded(flex : 2,child: Text(mDataList![index].nameOfficial.toString(), style: TextStyle(fontWeight: FontWeight.bold)))

                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("nameCommon"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].nameCommon.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("nameOfficial"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].nameOfficial.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("flagPng"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].flagPng.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("flagSvg"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].flagSvg.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("flagDescription"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].flagDescription.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("region"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].region.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("capital"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].capital.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("currencyCode"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].currencyCode.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("currencyName"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].currencyName.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("currencySymbol"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].currencySymbol.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("callingCode"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].callingCode.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("allCallingCode"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].allCallingCode?.join(", ").toString()??"", style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("cca2"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].cca2.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("ccn3"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].ccn3.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("cca3"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].cca3.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("cioc"),
                    Text(" : "),
                    Expanded(child: Text(mDataList![index].cioc.toString(), style: TextStyle(fontWeight: FontWeight.bold)))
                  ],
                ),

              ],
            ),
          ),
        );
      },

    );
  }
}
