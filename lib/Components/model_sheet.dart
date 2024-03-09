import 'package:flutter/material.dart';

class ModelSheet {
  static Future addPlanModelSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24.0),
          color: const Color(0xFF1c1d22),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add new plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFF25262e),
                        child: const Text('GG'),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Expanded(
                      child: Container(
                        color: Colors.amber,
                        child: const Text('GG'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
