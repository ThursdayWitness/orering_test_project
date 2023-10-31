import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class EditAddressCard extends StatefulWidget {
  const EditAddressCard({super.key});

  @override
  State<EditAddressCard> createState() => _EditAddressCardState();
}

class _EditAddressCardState extends State<EditAddressCard> {
  final _formKey = GlobalKey<FormState>();
  final _entries = {
    "Full name": CupertinoIcons.person_solid,
    "Email": CupertinoIcons.mail_solid,
    "Phone number": CupertinoIcons.phone_solid,
    "Country": CupertinoIcons.location_solid,
    "City": CupertinoIcons.building_2_fill,
    "Address line": CupertinoIcons.map_pin,
    "Postcode": CupertinoIcons.cube_box_fill
  };
  final _validators = [
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the full name';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the email';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the number';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the country';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the city';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the address';
      }
      return null;
    },
    (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter the postcode';
      }
      return null;
    },
  ];
  final _formatters = [
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
    FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
    FilteringTextInputFormatter.digitsOnly,
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
    FilteringTextInputFormatter.singleLineFormatter,
    FilteringTextInputFormatter.digitsOnly,
  ];
  final _placeholders = [
    "Danilev Egor",
    "egor_zu@email.com",
    "+375726014690",
    "Belarus",
    "Minsk",
    "Derzhinskogo 3b",
    "220069"
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _entries.length,
        itemBuilder: (context, index) {
          var keys = _entries.keys.toList();
          var val = _entries[keys[index]];
          if (keys[index] == "Address line") {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${keys[index]}*",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.5, color: const Color(0xFFA9B5C1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CupertinoTextFormFieldRow(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      padding: const EdgeInsets.all(12),
                      prefix: Icon(
                        val,
                        color: const Color(0xFF677482),
                      ),
                      placeholder: _placeholders[index],
                      validator: _validators[index],
                      inputFormatters: [_formatters[index]],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Text(
                      "Add address line +",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${keys[index]}*",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFA9B5C1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: CupertinoTextFormFieldRow(
                    padding: const EdgeInsets.all(12),
                    prefix: Icon(
                      val,
                      color: const Color(0xFF677482),
                    ),
                    placeholder: _placeholders[index],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: _validators[index],
                    inputFormatters: [_formatters[index]],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
