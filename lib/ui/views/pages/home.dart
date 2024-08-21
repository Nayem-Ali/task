import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_manager/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusDay = DateTime.now();
  DateTime _selectDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          focusedDay: _focusDay,
          selectedDayPredicate: (day) => isSameDay(_selectDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(selectedDay, _selectDay)) {
              setState(() {
                _focusDay = focusedDay;
                _selectDay = selectedDay;
              });
            }
          },
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Card(
                child: ListTile(
                  title: Text("UI/UX Design"),
                  subtitle: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.timelapse),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("10:00 am - 11:30 am"),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
