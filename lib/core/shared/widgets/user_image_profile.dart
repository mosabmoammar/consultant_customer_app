import 'package:flutter/material.dart';

class UserImageProfile extends StatelessWidget {
  final String? image;
  final bool status;
  const UserImageProfile({
    super.key,
    required this.image,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: image != null
                  ? DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: image == null
                ? const Icon(Icons.person, size: 32, color: Colors.grey)
                : null,
          ),

          Positioned(
            bottom: 1.0,
            right: 1.0,
            child: Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                color: status
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFFF44336),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
