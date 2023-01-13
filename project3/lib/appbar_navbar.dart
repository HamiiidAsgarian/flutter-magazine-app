import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        // selectedItemColor: Colors.black,
        unselectedItemColor: Colors.red,
        backgroundColor: Colors.green,
        fixedColor: Colors.greenAccent,

        // selectedItemColor: Colors.black,
        onTap: (value) {},
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "", icon: Icon(Icons.search)),
        ]);
  }
}

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  const MyAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      // color: Colors.red.withOpacity(.5),
      // height: 50, width: double.infinity,
      // backgroundColor: Colors.white.withOpacity(.5),
      // elevation: 0,
      // // backgroundColor: Colors.white.withOpacity(0),
      // actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
      // leading: const CircleAvatar(radius: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),

              child: ClipOval(
                  child: Image.asset("assets/images/i3.png", fit: BoxFit.fill)),
              // radius: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("Hamiiid.Asgarian@gmail.com"),
          ]),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
