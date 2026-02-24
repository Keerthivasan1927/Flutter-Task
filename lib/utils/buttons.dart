import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final TextInputType keypadtype;
  final String title;
  final Function(String)? onChage;

  const Buttons({
    required this.title,
    super.key,
    required this.keypadtype,
    this.onChage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.zero),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: .start,
          children: [
            Text(title),
            TextFormField(
              onChanged: onChage,
              keyboardType: keypadtype,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
