import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  DateTime focusDay = DateTime.now();
  final _titleController = TextEditingController();
  final _categories = ["All", "UI/UX", "Web Development", "Digital Marketing", "Product Design"];
  final _isColors = [false, false, false, false, false, false];

  String formatDay() {
    return DateFormat.yMMMd().format(focusDay);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(AppStrings.back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(AppStrings.options),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height * 0.85,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          formatDay().split(",")[0],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "10 tasks today",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        AppStrings.calender,
                      ),
                    )
                  ],
                ),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                calendarStyle: CalendarStyle(
                  todayTextStyle: const TextStyle(color: Colors.black),
                  selectedTextStyle: const TextStyle(color: Colors.black),
                  todayDecoration: const BoxDecoration(
                    color: AppColors.yellowColor,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.yellowColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                focusedDay: focusDay,
                headerVisible: false,
                calendarFormat: CalendarFormat.week,
                // focusedDay: _focusDay,
                // selectedDayPredicate: (day) => isSameDay(_selectDay, day),
                // onDaySelected: (selectedDay, focusedDay) {
                //   if (!isSameDay(selectedDay, _selectDay)) {
                //     setState(() {
                //       _focusDay = focusedDay;
                //       _selectDay = selectedDay;
                //     });
                //   }
                // },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Task Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFE5E4E2),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 200,
                child: Wrap(
                  children: _categories
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              ),
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Start"),
                      SizedBox(
                        width: 120,
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
                            filled: true,
                            fillColor: const Color(0xFFE5E4E2),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("End"),
                      SizedBox(
                        width: 120,
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: const Icon(Icons.arrow_drop_down)),
                            filled: true,
                            fillColor: const Color(0xFFE5E4E2),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              SizedBox(
                width: Get.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Create Task", style: TextStyle(color: Colors.white, fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blackColor
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
