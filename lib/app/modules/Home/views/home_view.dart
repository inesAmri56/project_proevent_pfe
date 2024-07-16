import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../component/text_utils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());
  final List<Event> eventList = [
    Event(id: 1, image: 'assets/images/event.jpg', rate: 4.5),
    Event(id: 2, image: 'assets/images/event.jpg', rate: 4.0),
    Event(id: 3, image: 'assets/images/event.jpg',  rate: 3.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here ....",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              // Categories Grid
              Padding(
                padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                child: GridView.builder(
                  itemCount: controller.catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: controller.catColors[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: controller.catIcons[index],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          controller.catNames[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Products Grid
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Column(
                  children: [
                    // Event List
                    Expanded( // Wrap with Expanded widget
                      child: GridView.builder(
                        itemCount: eventList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 9.0,
                          crossAxisSpacing: 6,
                          maxCrossAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          return BuildCardItems(
                            image: eventList[index].image,
                            rate: eventList[index].rate,
                            eventId: eventList[index].id,
                          );
                        },
                      ),
                    ),
                    // Product List
                    Expanded( // Wrap with Expanded widget
                      child: GridView.builder(
                        itemCount: eventList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 9.0,
                          crossAxisSpacing: 6,
                          maxCrossAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          return BuildCardItems(
                            image: eventList[index].image,
                            rate: eventList[index].rate,
                            eventId: eventList[index].id,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget BuildCardItems({
  required String image,
  required double rate,
  required eventId,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  // Handle favorites here
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          // Image container
          Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: [
                Text(
                  "event name",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(), // Add Spacer to push rating container to the end
                Container(
                  height: 20,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextUtils(
                        text: "$rate",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        underline: TextDecoration.none,
                      ),
                      Icon(Icons.star, size: 12, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class Event {
  final int id;
  final String image;
  final double rate;

  Event({
    required this.id,
    required this.image,
    required this.rate,
  });
}
