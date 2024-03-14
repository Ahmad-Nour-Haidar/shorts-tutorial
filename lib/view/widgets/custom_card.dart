import 'package:flutter/material.dart';

const color = Color(0xffFF6F02);

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.onPressed,
    required this.restaurantName,
    required this.partnerName,
    required this.age,
  });

  final VoidCallback onPressed;
  final String restaurantName;
  final String partnerName;
  final int age;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        clipBehavior: Clip.none,
        // fit: StackFit.passthrough,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.only(bottom: 20),
              clipBehavior: Clip.hardEdge,
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    // put here your image
                    child: const Icon(Icons.image),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            partnerName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Age: $age',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Restaurant name: $restaurantName',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 40.0,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Send a message',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
