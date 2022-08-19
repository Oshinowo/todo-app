import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sim_data/sim_data.dart';
import 'package:ussd_service/ussd_service.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Bloc App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _code = TextEditingController();
  String ussdResponseMsg = '';
  String sim = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code is Magic'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _code,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  if (await Permission.contacts.request().isGranted) {
                    makeMyRequest();
                  } else {
                    setState(() {
                      ussdResponseMsg = 'no';
                    });
                    // print('no');
                  }
                },
                child: const Text(
                  'Send',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'result: $ussdResponseMsg',
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'sim number: $sim',
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'error: $error',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: printSimCardsData,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void printSimCardsData() async {
    try {
      SimData simData = await SimDataPlugin.getSimData();
      for (var s in simData.cards) {
        print('Serial number: ${s.serialNumber}');
        setState(() {
          sim = s.serialNumber;
        });
      }
    } on PlatformException catch (e) {
      setState(() {
        error = e.message!;
      });
      debugPrint("error! code: ${e.code} - message: ${e.message}");
    }
  }

  makeMyRequest() async {
    int subscriptionId = sim as int; // sim card subscription ID
    final coded = _code.text; // ussd code payload
    try {
      String ussdResponseMessage = await UssdService.makeRequest(
        subscriptionId,
        coded,
        const Duration(
            seconds: 10), // timeout (optional) - default is 10 seconds
      );
      setState(() {
        ussdResponseMsg = ussdResponseMessage;
      });
      print("succes! message: $ussdResponseMessage");
    } catch (e) {
      setState(() {
        error = e.toString();
      });
      debugPrint("error! code: $e - message: $e");
    }
  }
}
