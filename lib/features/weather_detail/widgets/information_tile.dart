import 'package:flutter/material.dart';

class InformationTile extends StatelessWidget {
  final String value1;
  final String value2;
  final String title1;
  final String title2;
  final Icon icon1;
  final Icon icon2;

  const InformationTile({
    super.key,
    required this.value1,
    required this.value2,
    required this.title1,
    required this.title2,
    required this.icon1,
    required this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon1,
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  value1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            icon2,
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  value2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
