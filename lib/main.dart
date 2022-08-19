import 'package:flutter/material.dart';
import 'package:ussd_advanced/ussd_advanced.dart';
// import 'package:sim_data/sim_data.dart';
// import 'package:ussd_service/ussd_service.dart';

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
  String? ussdResponseMsg;
  String sim = '';
  String error = '';

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

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
              TextField(
                controller: _code,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  UssdAdvanced.sendUssd(code: _code.text, subscriptionId: 1);
                  // if (await Permission.contacts.request().isGranted) {
                  //   // makeMyRequest();
                  // } else {
                  //   setState(() {
                  //     error = 'no';
                  //   });
                  //   // print('no');
                  // }
                },
                child: const Text(
                  'Send normal request',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              if (ussdResponseMsg != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(ussdResponseMsg!),
                ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'result: $ussdResponseMsg',
              ),
              // const SizedBox(
              //   height: 50,
              // ),
              // Text(
              //   'sim number: $sim',
              // ),
              // const SizedBox(
              //   height: 50,
              // ),
              // Text(
              //   'error: $error',
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () async {
              String? res = await UssdAdvanced.multisessionUssd(
                  code: _code.text, subscriptionId: 1);
              setState(() {
                ussdResponseMsg = res;
              });
              String? res2 = await UssdAdvanced.sendMessage('0');
              setState(() {
                ussdResponseMsg = res2;
              });
              await UssdAdvanced.cancelSession();
              // if (await Permission.contacts.request().isGranted) {
              //   // printSimCardsData();
              // } else {
              //   setState(() {
              //     error = 'no';
              //   });
              // }
            },
            child: const Text('multiple session'),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () async {
              String? res = await UssdAdvanced.sendAdvancedUssd(
                  code: _code.text, subscriptionId: 1);
              setState(() {
                ussdResponseMsg = res;
              });
              // if (await Permission.contacts.request().isGranted) {
              //   // printSimCardsData();
              // } else {
              //   setState(() {
              //     error = 'no';
              //   });
              // }
            },
            child: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }

  // void printSimCardsData() async {
  //   try {
  //     SimData simData = await SimDataPlugin.getSimData();
  //     for (var s in simData.cards) {
  //       print('Serial number: ${s.serialNumber}');
  //       setState(() {
  //         sim = s.serialNumber;
  //       });
  //     }
  //   } on PlatformException catch (e) {
  //     setState(() {
  //       error = e.message!;
  //     });
  //     debugPrint("error! code: ${e.code} - message: ${e.message}");
  //   }
  // }

  // makeMyRequest() async {
  //   int subscriptionId = 1; // sim card subscription ID
  //   final coded = _code.text; // ussd code payload
  //   try {
  //     String ussdResponseMessage =
  //         await UssdService.makeRequest(subscriptionId, coded);
  //     setState(() {
  //       ussdResponseMsg = ussdResponseMessage;
  //     });
  //     print("succes! message: $ussdResponseMessage");
  //   } catch (e) {
  //     setState(() {
  //       error = e.toString();
  //     });
  //     debugPrint("error! code: $e - message: $e");
  //   }
  // }
}
