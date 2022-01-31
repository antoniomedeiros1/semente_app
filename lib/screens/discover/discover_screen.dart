import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth_db/screens/discover/detail_page.dart';
import 'package:firebase_auth_db/screens/discover/components/category_boxes.dart';
import 'package:firebase_auth_db/screens/discover/components/discover_card.dart';
import 'package:firebase_auth_db/screens/discover/components/discover_small_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth_db/screens/chat/chat_screen.dart';
import 'package:firebase_auth_db/constants.dart';
import 'package:firebase_auth_db/services/authentication_service.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {

  final User user;

  const DiscoverScreen(this.user, {Key? key}) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 36,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Semente",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  // const Image(
                  //   image: AssetImage("lib/assets/images/semente-logo-small.png"),
                  //   width: 50,
                  //   height: 50
                  // ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.cyan, size: 30),
                    onPressed: () {
                      context.read<AuthenticationService>().signOut();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 10,
              height: 80,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(right: 20, left:20,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bem vindo, ${widget.user.email}!",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Selecione uma das opções abaixo para falar com nosso chat bot",
                    style: TextStyle(
                      color: Color(0xff515979),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  CategoryBoxes(
                    onTap: onHelpTapped,
                    text: "Quero ajuda!",
                    color: kPrimaryColor,
                  ),
                  CategoryBoxes(
                    onTap: onSupportTapped,
                    text: "Quero ser apoiador(a)!",
                    color: kSecondaryColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nossos parceiros",
                    style: TextStyle(
                      color: Color(0xff515979),
                      fontSize: 14
                    ),
                  ),
                  GestureDetector(
                    onTap: onSeeAllTapped,
                    child: Text(
                      "Ver todos",
                      style: TextStyle(
                        color: Color(0xff4A80F0),
                        fontSize: 14
                      )
                    )
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 176,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 25),
                  DiscoverCard(
                    tag: "Partner",
                    onTap: onPartner1Tapped,
                    title: "Nome do projeto",
                    subtitle: "Descricao",
                  ),
                  SizedBox(width: 20),
                  DiscoverCard(
                    onTap: onPartner2Tapped,
                    title: "Nome do projeto",
                    subtitle: "Descricao",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Nossos patrocinadores",
                style: TextStyle(
                  color: Color(0xff515979),
                  fontSize: 14
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 19,
                  mainAxisExtent: 125,
                  mainAxisSpacing: 19
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Patrocinador",
                    gradientStartColor: Color(0xff13DEA0),
                    gradientEndColor: Color(0xff06B782),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Patrocinador",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                    icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "lib/assets/images/svg/tape.svg",
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Patrocinador",
                    gradientStartColor: Color(0xffFFD541),
                    gradientEndColor: Color(0xffF0B31A),
                  ),
                  DiscoverSmallCard(
                    onTap: () {},
                    title: "Patrocinador",
                    icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          "lib/assets/images/svg/tape.svg",
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 20.0,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        )
      ),
      floatingActionButton:  FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () => null,
        tooltip: 'Cadastrar novo cliente',
        child: const Icon(Icons.spa_outlined, ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onHelpTapped() {
    Get.to(() => ChatScreen(help: true), transition: Transition.rightToLeft);
  }

  void onSupportTapped() {
    Get.to(() => ChatScreen(help: false), transition: Transition.rightToLeft);
  }

  void onSeeAllTapped() {
  }

  void onPartner1Tapped() {
    // Get.to(() => DetailPage(), transition: Transition.rightToLeft);
  }

  void onPartner2Tapped() {
  }
}
