import 'package:flutter/cupertino.dart';

import '../domain/person.dart';

class AddressCard extends StatelessWidget {
  final Person person;

  const AddressCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: const Color(0xFF172027),
            borderRadius: BorderRadius.circular(12)),
        child: CupertinoListTile(
          title: Text(
            person.name,
            style: const TextStyle(
                color: CupertinoColors.white, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "${person.country}, ${person.city}, ${person.addresses[0]}, ${person.postcode}",
            style: const TextStyle(
                color: CupertinoColors.white, fontWeight: FontWeight.w400),
          ),
          trailing: CupertinoButton(
              onPressed: () {},
              child:
                  const Icon(CupertinoIcons.pen, color: CupertinoColors.white)),
        ),
      ),
    );
  }
}
