import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectIndex == 0 ? kRed : kGreen,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = 0;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.41,
                            decoration: BoxDecoration(
                              color: selectIndex == 0 ? kMainColor : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: selectIndex == 0 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectIndex = 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.41,
                            decoration: BoxDecoration(
                              color: selectIndex == 1 ? kMainColor : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: selectIndex == 1 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How much?",
                        style: TextStyle(
                          fontSize: 20,
                          color: kWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: kWhite,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                          hintStyle: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: kWhite,
                  ),
                  child: const Form(
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
