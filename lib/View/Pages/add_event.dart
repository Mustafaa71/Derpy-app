import 'package:derpy/Components/avatar.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/event_controller.dart';
import 'package:derpy/Controller/image_picker_controller.dart';
import 'package:derpy/Controller/text_event_controller.dart';
import 'package:derpy/Model/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class AddEvent extends HookConsumerWidget {
  const AddEvent({required this.groupId, super.key});
  final String groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final imagePickerController = ref.watch(ImagePickerController.imagePickerProvider.notifier);
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    const uuid = Uuid();
    final eventUuid = uuid.v4();
    final String? eventAdmin = authController.getUserId();
    final eventDate = useState<DateTime?>(null);
    final eventStartingTime = useState<TimeOfDay?>(null);
    final eventEndingTime = useState<TimeOfDay?>(null);
    final eventController = ref.watch(eventControllerProvider.notifier);
    final textEventController = ref.watch(textEventProvider);
    final name = textEventController.titile;
    final note = textEventController.note;
    final location = textEventController.location;
    final category = textEventController.category;
    final numberOfMembers = textEventController.numberOfMembers;
    final price = textEventController.totalPrice;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event Information'),
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final imagePath =
                        ref.watch(ImagePickerController.imagePickerProvider.select((state) => state.value));
                    return imagePath == null
                        ? Avatar(onClick: () {
                            imagePickerController.upload(context);
                          })
                        : Container(
                            margin: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              child: Image.network(
                                'https://huhpecopmraolbvshwdy.supabase.co/storage/v1/object/public/Gg/$imagePath',
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: CircularProgressIndicator.adaptive(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                                width: 150.0,
                                height: 150.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                  },
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF272A36),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: name,
                        decoration: const InputDecoration(
                          hintText: 'Event Name (Required)',
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: note,
                        decoration: const InputDecoration(
                          hintText: 'Note (Required)',
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: location,
                        decoration: const InputDecoration(
                          hintText: 'Location (Required)',
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: category,
                        decoration: const InputDecoration(
                          hintText: 'Category (required)',
                          prefixIcon: Icon(
                            Icons.category,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        readOnly: true,
                        onTap: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: eventDate.value ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                            initialDatePickerMode: DatePickerMode.day,
                          );
                          if (picked != null && picked != eventDate.value) {
                            eventDate.value = picked;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: eventDate.value != null
                              ? DateFormat('yyyy-MM-dd').format(eventDate.value!)
                              : 'Date (Required)',
                          prefixIcon: const Icon(
                            Icons.calendar_today,
                            color: Colors.blueAccent,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        onTap: () async {
                          final TimeOfDay? startTimePicker = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (startTimePicker != null && startTimePicker != eventStartingTime.value) {
                            eventStartingTime.value = startTimePicker;
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: eventStartingTime.value != null
                              ? formatTimeOfDay(eventStartingTime.value!)
                              : 'Starting Time (Required)',
                          prefixIcon: const Icon(
                            Icons.timelapse_outlined,
                            color: Colors.blueAccent,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        onTap: () async {
                          final TimeOfDay? endTimePicker = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (endTimePicker != null && endTimePicker != eventEndingTime.value) {
                            eventEndingTime.value = endTimePicker;
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: eventEndingTime.value != null
                              ? formatTimeOfDay(eventEndingTime.value!)
                              : 'Ending Time (Required)',
                          prefixIcon: const Icon(
                            Icons.timelapse_outlined,
                            color: Colors.blueAccent,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: numberOfMembers,
                        decoration: const InputDecoration(
                          hintText: 'Number of members (Required)',
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: price,
                        decoration: const InputDecoration(
                          hintText: 'Total Price (Required)',
                          prefixIcon: Icon(
                            Icons.numbers,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (eventUuid.isEmpty ||
                        eventAdmin == null ||
                        eventAdmin.isEmpty ||
                        imagePickerController.imagePath == null ||
                        imagePickerController.imagePath!.isEmpty ||
                        name.text.isEmpty ||
                        note.text.isEmpty ||
                        category.text.isEmpty ||
                        eventDate.value == null ||
                        eventStartingTime.value == null ||
                        eventEndingTime.value == null ||
                        location.text.isEmpty ||
                        numberOfMembers.text.isEmpty ||
                        price.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Warning'),
                            content: const Text('Enter all required information'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      final addEvent = Event(
                        eventId: eventUuid,
                        adminId: eventAdmin.toString(),
                        eventAvatar: imagePickerController.imagePath ?? '',
                        name: name.text,
                        description: note.text,
                        category: category.text,
                        date: eventDate.value!,
                        timeStart: eventStartingTime.value!,
                        timeEnd: eventEndingTime.value!,
                        location: location.text,
                        members: [eventAdmin.toString()],
                        numberOfMembers: numberOfMembers.text,
                        price: price.text,
                        cancelEvent: false,
                      );

                      try {
                        await supabase.from('event').insert([addEvent.toJson()]);
                        await eventController.addEventtoGroup(groupId, eventUuid);
                        await eventController.addEventIdToUserTable(supabase.auth.currentUser!.id, eventUuid);
                        imagePickerController.clearImagePath();
                        name.clear();
                        note.clear();
                        category.clear();
                        location.clear();
                        numberOfMembers.clear();
                        price.clear();
                      } catch (e) {
                        print(e.toString());
                      }

                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    }
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            margin: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                            child: Center(
                              child: Text(
                                'submit',
                                style: TextStyleManager(
                                  kColor: const Color(0xFF0B111A),
                                  kFontSize: 25.0,
                                  kFontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 1,
      ),
    );
  }
}

String formatTimeOfDay(TimeOfDay time) {
  final now = DateTime.now();
  final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
  return '${time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
}
