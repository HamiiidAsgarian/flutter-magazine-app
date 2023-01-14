import 'package:flutter/material.dart';

class MyNavbar extends StatelessWidget {
  const MyNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color.fromARGB(255, 41, 41, 41),
                  Color.fromARGB(255, 218, 218, 218)
                ])),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/navb.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                    child: Center(
                  child: Image.asset(
                    "assets/images/navi.png",
                    scale: 0.7,
                    fit: BoxFit.cover,
                  ),
                ))
              ],
            ),
          )),
          Expanded(
              child: Container(
            color: Colors.green,
          )),
          Expanded(
              child: Container(
            color: Colors.blue,
          ))
        ],
      ),
    );
  }
}

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  const MyAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(width: 3)),
      // color: Color.fromARGB(255, 255, 251, 0).withOpacity(0),
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Row(children: [
            Stack(
              children: [
                Image.asset("assets/images/i3.png", fit: BoxFit.fill),
                Image.asset("assets/images/avatar.png"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                  Text("Hi Hamid,wellcome back"),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "last see 11:27",
                    style: TextStyle(fontSize: 11),
                  )
                ])),
          ])),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],

        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // children: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        // ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);

  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
