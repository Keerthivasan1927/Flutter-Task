// import 'package:flutter/material.dart';

// class Popupmenu extends StatelessWidget {
//   final bool isFavorite;
//   final VoidCallback onToggle;

//   const Popupmenu({
//     super.key,
//     required this.isFavorite,
//     required this.onToggle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       onSelected: (value) {
//         if (value == "favorite") {
//           onToggle();
//         }
//       },
//       itemBuilder: (context) => [
//         PopupMenuItem(
//           value: "favorite",
//           child: Row(
//             children: [
//               Icon(Icons.star, color: isFavorite ? Colors.yellow : Colors.grey),
//               const SizedBox(width: 8),
//               Text(isFavorite ? "Unstar" : "Favorite"),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
