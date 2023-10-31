import 'package:flutter/cupertino.dart';
import 'package:orering_test_project/domain/person.dart';
import 'package:orering_test_project/ui/address_card.dart';

import 'edit_address_card.dart';

class PersonDetailsCard extends StatefulWidget {
  final String title;
  final List<Person> persons;

  const PersonDetailsCard(this.title, this.persons, {super.key});

  @override
  State<PersonDetailsCard> createState() => _PersonDetailsCardState();
}

class _PersonDetailsCardState extends State<PersonDetailsCard> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CupertinoButton(
                        padding: const EdgeInsets.fromLTRB(47, 6, 46, 7),
                        borderRadius: BorderRadius.circular(36),
                        color: tabIndex == 0
                            ? const Color(0xFFEA560D)
                            : const Color(0xFFE7ECF0),
                        onPressed: () {
                          setState(() {
                            tabIndex = 0;
                          });
                        },
                        child: Text("Add address",
                            style: TextStyle(
                                color: tabIndex == 1
                                    ? const Color(0xFF919EAB)
                                    : CupertinoColors.white))),
                  ),
                  Flexible(
                    child: CupertinoButton(
                      padding: const EdgeInsets.fromLTRB(36, 6, 36, 7),
                      onPressed: () {
                        setState(() {
                          tabIndex = 1;
                        });
                      },
                      color: tabIndex == 1
                          ? const Color(0xFFEA560D)
                          : const Color(0xFFE7ECF0),
                      borderRadius: BorderRadius.circular(36),
                      child: Text("Select address",
                          style: TextStyle(
                              color: tabIndex == 0
                                  ? const Color(0xFF919EAB)
                                  : CupertinoColors.white)),
                    ),
                  ),
                ]),
          ),
          IndexedStack(
            index: tabIndex,
            children: [
              SizedBox(
                  height: tabIndex == 0 ? null : 1,
                  child: const EditAddressCard()),
              SizedBox(
                  height: tabIndex == 1 ? null : 1,
                  child: Column(
                    children: [
                      CupertinoSearchTextField(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: CupertinoColors.white,
                            border: Border.all(
                                width: 0.5, color: const Color(0xFFA9B5C1))),
                      ),
                      ListView(
                        shrinkWrap: true,
                        children: [
                          for (var person in widget.persons)
                            AddressCard(person: person),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

//                 Flexible(
//                   child: IndexedStack(index: tabIndex, children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: ListView.builder(
//                         itemCount: entries.length,
//                         itemBuilder: (context, index) {
//                           var keys = entries.keys.toList();
//                           var val = entries[keys[index]];
//                           if (keys[index] == "Address line") {
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("${keys[index]}*",
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.w600)),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(top: 8, bottom: 0),
//                                   child: CupertinoTextField(
//                                       padding: const EdgeInsets.all(12),
//                                       prefix: Padding(
//                                         padding:
//                                             const EdgeInsets.only(left: 12.0),
//                                         child: Icon(
//                                           val,
//                                           color: const Color(0xFF677482),
//                                         ),
//                                       ),
//                                       placeholder: "Placeholder text"),
//                                 ),
//                                 CupertinoButton(
//                                   onPressed: () {},
//                                   padding: EdgeInsets.zero,
//                                   child: const Text("Add address line +",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500)),
//                                 )
//                               ],
//                             );
//                           }
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("${keys[index]}*",
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold)),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 8, bottom: 12),
//                                 child: CupertinoTextField(
//                                     padding: const EdgeInsets.all(12),
//                                     prefix: Padding(
//                                       padding:
//                                           const EdgeInsets.only(left: 12.0),
//                                       child: Icon(
//                                         val,
//                                         color: const Color(0xFF677482),
//                                       ),
//                                     ),
//                                     placeholder: "Placeholder text"),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     Column(children: [
//                       const CupertinoSearchTextField(
//                         padding: EdgeInsets.all(16),
//                         backgroundColor: CupertinoColors.white,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(vertical: 20),
//                         decoration: BoxDecoration(
//                             color: const Color(0xFF172027),
//                             borderRadius: BorderRadius.circular(12)),
//                         child: CupertinoListTile(
//                           padding: EdgeInsets.zero,
//                           title: const Text("Full name"),
//                           subtitle:
//                               const Text("Country, city, address, postcode"),
//                           trailing: CupertinoButton(
//                               child: const Icon(CupertinoIcons.square_pencil),
//                               onPressed: () {}),
//                         ),
//                       )
//                     ]),
//                   ]),
//                 ),
