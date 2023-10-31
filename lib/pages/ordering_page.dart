import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:orering_test_project/domain/person.dart';
import 'package:orering_test_project/ui/person_details_card.dart';

class OrderingPage extends StatefulWidget {
  const OrderingPage({super.key});

  @override
  State<OrderingPage> createState() => _OrderingPageState();
}

class _OrderingPageState extends State<OrderingPage> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Ordering", style: TextStyle(fontSize: 20)),
          leading: Icon(CupertinoIcons.back),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Step 1",
                    style: TextStyle(fontSize: 16, fontFamily: "SF Pro"),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Start date",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CupertinoTextField(
                          controller: TextEditingController(
                            text: DateFormat('MMM dd, yyyy').format(date),
                          ),
                          keyboardType: TextInputType.none,
                          padding: const EdgeInsets.all(12),
                          prefix: const Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Icon(CupertinoIcons.calendar,
                                color: Color(0xFF677482)),
                          ),
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => Container(
                                height: 216,
                                margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                color: CupertinoColors.systemBackground
                                    .resolveFrom(context),
                                child: SafeArea(
                                  top: false,
                                  child: CupertinoDatePicker(
                                    initialDateTime: date,
                                    mode: CupertinoDatePickerMode.date,
                                    use24hFormat: true,
                                    showDayOfWeek: true,
                                    onDateTimeChanged: (DateTime newDate) {
                                      setState(() => date = newDate);
                                    },
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              PersonDetailsCard("Sender details", [person1]),
              const Padding(padding: EdgeInsets.only(top: 16)),
              PersonDetailsCard("Recipient address", [person2]),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: 52,
                child: CupertinoButton.filled(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    borderRadius: BorderRadius.circular(50),
                    child: const Text("Next step"),
                    onPressed: () {}),
              )
            ],
          ),
        ));
  }
}
