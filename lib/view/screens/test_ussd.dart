import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:permission_handler/permission_handler.dart';

class TestUssd extends StatefulWidget {
  const TestUssd({super.key});

  @override
  State<TestUssd> createState() => _TestUssdState();
}

class _TestUssdState extends State<TestUssd> {
  late TextEditingController _controller;

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

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.red, width: 2),
  );

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
              final res = await FlutterPhoneDirectCaller.callNumber(
                _controller.text,
              );
              print(res);
            } on PlatformException catch (e) {
              debugPrint("error! code: ${e.code} - message: ${e.message}");
            } catch (e) {
              debugPrint("error: $e");
            }
          }
        },
        child: const Icon(Icons.send),
      ),
      appBar: AppBar(
        title: const Text('Test Mode'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'phone number',
                border: border,
                disabledBorder: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
