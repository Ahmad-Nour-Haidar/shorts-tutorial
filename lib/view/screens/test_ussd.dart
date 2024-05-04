import 'package:direct_caller_sim_choice/direct_caller_sim_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sim_data/sim_data.dart';
import 'package:sim_data/sim_model.dart';

import 'package:ussd_advanced/ussd_advanced.dart';
import 'package:ussd_service/ussd_service.dart';

class TestUssd extends StatefulWidget {
  const TestUssd({super.key});

  @override
  State<TestUssd> createState() => _TestUssdState();
}

class _TestUssdState extends State<TestUssd> {
  late TextEditingController _controller;
  String? _response;
  String _res = "null";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Permission.phone.request();
          // final directCaller = DirectCaller();
          // final res = directCaller.makePhoneCall("*100#3", simSlot: 2);
          // print(res);
          // return;
          if (await Permission.phone.isGranted) {
            try {
              // final simData = await SimDataPlugin.getSimData();
              // for (final s in simData.cards) {
              //   print('==============================');
              //   print(s.carrierName);
              //   print(s.countryCode);
              //   print(s.displayName);
              //   print(s.isDataRoaming);
              //   print(s.isNetworkRoaming);
              //   print(s.mcc);
              //   print(s.mnc);
              //   print(s.serialNumber);
              //   print(s.slotIndex);
              //   print(s.subscriptionId);
              //   print('==============================');
              // }
              // String ussdResponseMessage = await UssdService.makeRequest(
              //   22,
              //   "*100#",
              //   const Duration(seconds: 100),
              // );
              // setState(() {
              //   _res = ussdResponseMessage;
              // });
              // print("succes! message: $ussdResponseMessage");
              final res = await FlutterPhoneDirectCaller.callNumber("*181*0957414325*50#");
              print(res);
            } on PlatformException catch (e) {
              _res = e.toString();
              debugPrint("error! code: ${e.code} - message: ${e.message}");
            } catch (e) {
              _res = e.toString();
              debugPrint("error: $e");
            }
          }
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Ussd Plugin example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // text input
          TextField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'Ussd code'),
          ),

          // dispaly responce if any
          if (_response != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(_response!),
            ),

          // buttons
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  UssdAdvanced.sendUssd(
                    code: _controller.text,
                    subscriptionId: 1,
                  );
                },
                child: const Text('norma\nrequest'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final res = await UssdAdvanced.sendAdvancedUssd(
                      code: "*100#",
                      subscriptionId: 22,
                    );
                    setState(() {
                      _res = res.toString();
                    });
                    print("res = $res");
                  } on PlatformException catch (e) {
                    _res = e.toString();
                    debugPrint(
                        "error! code: ${e.code} - message: ${e.message}");
                  } catch (e) {
                    _res = e.toString();
                    debugPrint("error: $e");
                  }
                },
                child: const Text('single session\nrequest'),
              ),
              ElevatedButton(
                onPressed: () async {
                  String? _res = await UssdAdvanced.multisessionUssd(
                      code: _controller.text, subscriptionId: 1);
                  setState(() {
                    _response = _res;
                  });
                  String? _res2 = await UssdAdvanced.sendMessage('0');
                  setState(() {
                    _response = _res2;
                  });
                  await UssdAdvanced.cancelSession();
                },
                child: const Text('multi session\nrequest'),
              ),
            ],
          ),
          Text(
            _res,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// *150*
