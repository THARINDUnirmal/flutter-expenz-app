import 'package:expenz_app/models/expense%20_categories.dart';
import 'package:expenz_app/models/income%20_categories.dart';
import 'package:expenz_app/services/expense_servicers.dart';
import 'package:expenz_app/services/income_services.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScreen extends StatefulWidget {
  final Function(Income) addIncome;
  final Function(Expense) addExpense;

  const AddScreen({
    super.key,
    required this.addExpense,
    required this.addIncome,
  });

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  int _selectIndex = 0;
  ExpenseCategories _expenseCategories = ExpenseCategories.food;
  IncomeCategories _incomeCategories = IncomeCategories.freelance;

  //contrallers
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _amount = TextEditingController();

  //date picker
  DateTime _date = DateTime.now();

  //time picker
  DateTime _timeNow = DateTime.now();

  //form key
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectIndex == 0 ? kRed : kGreen,
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
                              _selectIndex = 0;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.41,
                            decoration: BoxDecoration(
                              color: _selectIndex == 0 ? kMainColor : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: _selectIndex == 0 ? kWhite : kBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectIndex = 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.41,
                            decoration: BoxDecoration(
                              color: _selectIndex == 1 ? kMainColor : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Text(
                                "Income",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: _selectIndex == 1 ? kWhite : kBlack,
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
                    top: MediaQuery.of(context).size.height * 0.13,
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
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 10,
                  ),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.27,
                  ),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: kWhite,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: "Category",
                            hintStyle: const TextStyle(
                              color: kGrey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          items: _selectIndex == 0
                              ? ExpenseCategories.values.map((c) {
                                  return DropdownMenuItem(
                                    value: c,
                                    child: Text(c.name),
                                  );
                                }).toList()
                              : IncomeCategories.values.map((c) {
                                  return DropdownMenuItem(
                                    value: c,
                                    child: Text(c.name),
                                  );
                                }).toList(),
                          value: _selectIndex == 0
                              ? _expenseCategories
                              : _incomeCategories,
                          onChanged: (value) {
                            setState(() {
                              _selectIndex == 0
                                  ? _expenseCategories =
                                      value as ExpenseCategories
                                  : _incomeCategories =
                                      value as IncomeCategories;
                            });
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        TextFormField(
                          controller: _title,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter A Title";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Title",
                            hintStyle: const TextStyle(
                              color: kGrey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        TextFormField(
                          controller: _description,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter A Description";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Description",
                            hintStyle: const TextStyle(
                              color: kGrey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        TextFormField(
                          controller: _amount,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter A Amount";
                            }
                            double? thisAmount = double.tryParse(value);

                            if (thisAmount == null || thisAmount <= 0) {
                              return "Please Enter A Valid Amount! (eg:0 < amount)";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Amount",
                            hintStyle: const TextStyle(
                              color: kGrey,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2025),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      setState(() {
                                        _date = value;
                                      });
                                    }
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kMainColor,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      color: kWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Select Date",
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              DateFormat("y, MMMM, dd").format(_date),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) {
                                    if (value != null) {
                                      setState(() {
                                        _timeNow = DateTime(
                                          _date.year,
                                          _date.month,
                                          _date.day,
                                          value.hour,
                                          value.minute,
                                        );
                                      });
                                    }
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kYellow,
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.more_time,
                                      color: kWhite,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Select Time",
                                      style: TextStyle(
                                        color: kWhite,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_timeNow),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_selectIndex == 0) {
                                List<Expense> exList =
                                    await ExpenseServicers().loadExpenses();

                                Expense expensesData = Expense(
                                  id: exList.length + 1,
                                  title: _title.text,
                                  amount: _amount.text.isEmpty
                                      ? 0
                                      : double.parse(_amount.text),
                                  category: _expenseCategories,
                                  date: _date,
                                  time: _timeNow,
                                  description: _description.text,
                                );

                                //add expenses
                                widget.addExpense(expensesData);

                                //clear filds data in Ui
                                _title.clear();
                                _description.clear();
                                _amount.clear();
                              } else {
                                //load income data to create income id

                                List<Income> incomeDataList =
                                    await IncomeServices().loadIncome();

                                //create id
                                Income incomeData = Income(
                                  id: incomeDataList.length + 1,
                                  title: _title.text,
                                  amount: _amount.text.isEmpty
                                      ? 0
                                      : double.parse(_amount.text),
                                  category: _incomeCategories,
                                  date: _date,
                                  time: _timeNow,
                                  description: _description.text,
                                );

                                //add income
                                widget.addIncome(incomeData);

                                //clear filds data in Ui
                                _title.clear();
                                _description.clear();
                                _amount.clear();
                              }
                            }
                          },
                          child: Button(
                            buttonTitle: "Add",
                            buttonColor: _selectIndex == 0 ? kRed : kGreen,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
