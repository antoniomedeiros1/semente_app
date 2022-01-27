import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth_db/screens/discover/detail_page.dart';
import 'package:firebase_auth_db/screens/discover/components/category_boxes.dart';
import 'package:firebase_auth_db/screens/discover/components/discover_card.dart';
import 'package:firebase_auth_db/screens/discover/components/discover_small_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth_db/screens/chat/chat_screen.dart';
import 'package:firebase_auth_db/constants.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({
    Key? key,
  }) : super(key: key);

  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 36,
                right: 18,
                top: 36,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Semente",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Image(
                    image: AssetImage("lib/assets/images/semente-logo-small.png"),
                    width: 50,
                    height: 50
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 10,
              height: 50,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(right: 20, left:20,),
              child: Text(
                "Selecione uma das opções abaixo para falar com nosso chat bot",
                style: TextStyle(
                  color: Color(0xff515979),
                  fontSize: 14
                ),
                textAlign: TextAlign.center,
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
