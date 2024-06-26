import 'package:derpy/Components/buttons/reusable_button.dart';
import 'package:derpy/Components/reusable_card_image.dart';
import 'package:derpy/Constants/color_manager.dart';
import 'package:derpy/Constants/text_style_manager.dart';
import 'package:derpy/Controller/event_controller.dart';
import 'package:derpy/Controller/permissions.dart';
import 'package:derpy/Model/event.dart';
import 'package:derpy/View/Pages/add_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class GroupContent extends HookConsumerWidget {
  const GroupContent({required this.groupId, required this.groupName, required this.groupImage, super.key});
  final String groupId;
  final String groupName;
  final String groupImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supabase = Supabase.instance.client;
    final eventList = useState<List<Event>>([]);
    final isLoading = useState<bool>(true);
    const oddCardColor = Color(0xFF122932);
    const evenCardColor = Color(0xFF285943);
    final eventController = ref.watch(eventControllerProvider.notifier);
    final userId = supabase.auth.currentUser!.id;

    final permission = ref.watch(permissionsProvider.notifier);

    useEffect(() {
      eventController.getEventsBelongToGroup(groupId).then((events) {
        eventList.value = events;
        isLoading.value = false;
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(groupName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ReusableCardImage(
              imagePath: groupImage,
              topRight: 20,
            ),
          ),
        ],
        backgroundColor: ColorManager.kBackgroundColor,
      ),
      body: SafeArea(
        child: isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  Color changeColorCard(int index) {
                    return (index % 2 == 0) ? oddCardColor : evenCardColor;
                  }

                  final cardColor = changeColorCard(index);
                  final event = eventList.value[index];
                  final imagePath = supabase.storage.from('Gg').getPublicUrl(event.eventAvatar);
                  return InkWell(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                      Navigator.of(context).pop();
                      final isMember = await permission.hideJoinEvents(supabase.auth.currentUser!.id, event.eventId);
                      // ignore: use_build_context_synchronously
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              SizedBox(
                                height: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: WidgetCircularAnimator(
                                        innerColor: Colors.white,
                                        outerColor: Colors.blue,
                                        innerAnimation: Curves.easeInOutBack,
                                        outerAnimation: Curves.easeInOutBack,
                                        size: 100,
                                        innerAnimationSeconds: 10,
                                        outerAnimationSeconds: 10,
                                        child: Container(
                                          decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                                          child: CircleAvatar(
                                            backgroundColor: const Color(0xff034C5C),
                                            radius: 30,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(imagePath.toString()),
                                              radius: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        event.name,
                                                        style: TextStyleManager(
                                                          kColor: Colors.grey,
                                                          kFontSize: 25.0,
                                                          kFontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Date: ${formatDate(event.date)}',
                                                      style: TextStyleManager(
                                                        kColor: Colors.grey,
                                                        kFontSize: 15.0,
                                                        kFontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(height: 0),
                                                const SizedBox(height: 10.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Starting Time: ${event.timeStart.format(context)}',
                                                      style: TextStyleManager(
                                                        kColor: Colors.white,
                                                        kFontSize: 15.0,
                                                        kFontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Ending Time: ${event.timeEnd.format(context)}',
                                                      style: TextStyleManager(
                                                        kColor: Colors.white,
                                                        kFontSize: 15.0,
                                                        kFontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 6.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Price: ${event.price} SR',
                                                      style: TextStyleManager(
                                                        kColor: Colors.white,
                                                        kFontSize: 15.0,
                                                        kFontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Number of Member: ${event.numberOfMembers}',
                                                      style: TextStyleManager(
                                                        kColor: Colors.white,
                                                        kFontSize: 15.0,
                                                        kFontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 6.0),
                                                Text(
                                                  'Location: ${event.location}',
                                                  style: TextStyleManager(
                                                    kColor: Colors.white,
                                                    kFontSize: 15.0,
                                                    kFontWeight: FontWeight.normal,
                                                  ),
                                                ),
                                                const Divider(),
                                                Text(
                                                  'Note: ${event.description}',
                                                  style: TextStyleManager(
                                                    kColor: Colors.redAccent,
                                                    kFontSize: 15.0,
                                                    kFontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ReusableButton(
                                    label: isMember ? 'You are already enroll' : 'Join Us',
                                    textColor: isMember ? const Color(0xffea3323) : Colors.white,
                                    backgroundcolor: isMember ? const Color(0xFFea3323).withOpacity(0.2) : Colors.blue,
                                    onClick: () async {
                                      if (!isMember) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                  child: TweenAnimationBuilder<double>(
                                                tween: Tween<double>(begin: 0.0, end: 1),
                                                duration: const Duration(milliseconds: 3500),
                                                builder: (context, value, _) => CircularProgressIndicator(value: value),
                                              ));
                                            });
                                        await eventController.addEventIdToUserTable(userId, event.eventId);
                                        Navigator.of(context).pop();
                                      }
                                    },
                                    borderColor: isMember ? const Color(0xffea3323) : Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: const [],
                      ),
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: WidgetCircularAnimator(
                                  innerColor: Colors.white,
                                  outerColor: Colors.blue,
                                  innerAnimation: Curves.easeInOutBack,
                                  outerAnimation: Curves.easeInOutBack,
                                  size: 60,
                                  innerAnimationSeconds: 10,
                                  outerAnimationSeconds: 10,
                                  child: Container(
                                    decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xff034C5C),
                                      radius: 30,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(imagePath.toString()),
                                        radius: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              event.name,
                                              style: TextStyleManager(
                                                  kColor: Colors.grey, kFontSize: 18.0, kFontWeight: FontWeight.bold),
                                              overflow: TextOverflow.visible,
                                              maxLines: 1,
                                            ),
                                          ),
                                          Text(
                                            'Date: ${formatDate(event.date)}',
                                            style: TextStyleManager(
                                              kColor: Colors.grey,
                                              kFontSize: 15.0,
                                              kFontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4.0),
                                      const Divider(height: 3),
                                      const SizedBox(height: 10.0),
                                      Text(
                                        'Price: ${event.price} SR',
                                        style: TextStyleManager(
                                          kColor: Colors.white,
                                          kFontSize: 15.0,
                                          kFontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Number of Member: ${event.numberOfMembers}',
                                            style: TextStyleManager(
                                              kColor: Colors.white,
                                              kFontSize: 15.0,
                                              kFontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
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
                },
                itemCount: eventList.value.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddEvent(
              groupId: groupId,
            ),
            isScrollControlled: true,
            useSafeArea: true,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(date);
}
