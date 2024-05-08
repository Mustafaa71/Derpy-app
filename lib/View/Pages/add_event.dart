import 'package:derpy/Components/avatar.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/Auth/auth_controller.dart';
import 'package:derpy/Controller/image_picker_controller.dart';
import 'package:derpy/Model/event.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class AddEvent extends HookConsumerWidget {
  const AddEvent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final imagePickerController = ref.watch(ImagePickerController.imagePickerProvider.notifier);
    final authController = ref.watch(AuthController.authControllerProvider.notifier);
    final name = TextEditingController();
    final description = TextEditingController();
    final location = TextEditingController();
    final category = TextEditingController();
    final date = TextEditingController();
    final startingTime = TextEditingController();
    final endingTime = TextEditingController();
    final numberOfMember = TextEditingController();
    final totalPrice = TextEditingController();
    const uuid = Uuid();
    final eventUuid = uuid.v4();
    final String? eventAdmin = authController.getUserId();
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
                          hintText: 'Event Name (required)',
                          prefixIcon: Icon(
                            Icons.border_color,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: description,
                        decoration: const InputDecoration(
                          hintText: 'Event Description (required)',
                          prefixIcon: Icon(
                            Icons.document_scanner,
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
                          hintText: 'Group Location (required)',
                          prefixIcon: Icon(
                            Icons.location_on,
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
                        controller: date,
                        decoration: const InputDecoration(
                          hintText: 'Date (Required)',
                          prefixIcon: Icon(
                            Icons.dataset,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: startingTime,
                        decoration: const InputDecoration(
                          hintText: 'Starting Time (Required)',
                          prefixIcon: Icon(
                            Icons.timelapse_outlined,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: endingTime,
                        decoration: const InputDecoration(
                          hintText: 'Ending Time (Required)',
                          prefixIcon: Icon(
                            Icons.timelapse_outlined,
                            color: Colors.blueAccent,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const Divider(),
                      TextField(
                        controller: numberOfMember,
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
                        controller: totalPrice,
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
                  onTap: () {
                    Future.microtask(() async {
                      final addEvent = Event(
                        eventId: eventUuid,
                        adminId: eventAdmin.toString(),
                        eventAvatar: imagePickerController.imagePath ?? '',
                        name: name.text,
                        description: description.text,
                        category: category.text,
                        date: date.text,
                        timeStart: startingTime.text,
                        timeEnd: endingTime.text,
                        location: location.text,
                        members: [],
                        numberOfMembers: numberOfMember.text,
                        price: totalPrice.text,
                        cancelEvent: false,
                      );
                      await supabase.from('event').insert([addEvent.toJson()]);
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                    });
                  },
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
              ],
            ),
          );
        },
        itemCount: 1,
      ),
    );
  }
}
