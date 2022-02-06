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
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  // bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                  Color(0xFFDFFDFF),
                  Color(0xFFA8F9FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              ),
              height: 200,
              // color: Colors.cyan[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Semente",
                          style: TextStyle(
                            color: Colors.cyan[600],
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        // const Image(
                        //   image: AssetImage("lib/assets/images/semente-logo-small.png"),
                        //   width: 50,
                        //   height: 50
                        // ),
                        IconButton(
                          icon: Icon(Icons.logout, color: Colors.cyan[600], size: 40),
                          onPressed: () {
                            context.read<AuthenticationService>().signOut();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(right: 25, left:25,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bem vindo,",
                          style: TextStyle(
                            color: Colors.cyan[600],
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          "${widget.user.email}!",
                          style: TextStyle(
                            color: Colors.cyan[600],
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: const Text(
                "Selecione uma das opções abaixo para iniciar uma conversa",
                style: TextStyle(
                  color: Color(0xff515979),
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                children: [
                  GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 60,
                      mainAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CategoryBoxes(
                        onTap: onHelpTapped,
                        text: "Quero ajuda!",
                        color: Colors.cyan[400],
                      ),
                      CategoryBoxes(
                        onTap: onSupportTapped,
                        text: "Fazer autoavaliação",
                        color: Colors.cyan[400],
                      ),
                      CategoryBoxes(
                        onTap: onSupportTapped,
                        text: "Conversar com alguém",
                        color: Colors.cyan[400],
                      ),
                      CategoryBoxes(
                        onTap: onSupportTapped,
                        text: "Onde conseguir atendimento",
                        color: Colors.cyan[400],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CategoryBoxes(
                    onTap: onSupportTapped,
                    text: "Cadastrar ONG no projeto",
                    color: Colors.orange[400],
                  ),
                  const SizedBox(height: 10,),
                  CategoryBoxes(
                    onTap: onSupportTapped,
                    text: "Quero ser voluntário",
                    color: Colors.green[400],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Mantenha-se informado",
                    style: TextStyle(
                      color: Color(0xff515979),
                      fontSize: 14
                    ),
                  ),
                  GestureDetector(
                    onTap: onSeeAllTapped,
                    child: const Text(
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
            const SizedBox(height: 16),
            SizedBox(
              height: 176,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 25),
                  DiscoverCard(
                    tag: "Partner",
                    onTap: onPartner1Tapped,
                    title: "Depressão",
                    subtitle: "Saiba como identificar os principais sintomas",
                    gradientStartColor: Color(0xFF00EAFF),
                    gradientEndColor: Color(0xFF06A7A7),
                    icon: const Icon(Icons.info, color: Colors.white, size: 35,),
                  ),
                  const SizedBox(width: 20),
                  DiscoverCard(
                    onTap: onPartner2Tapped,
                    title: "Ansiedade",
                    subtitle: "Entenda mais sobre o problema",
                    gradientStartColor: Color(0xffFC67A7),
                    gradientEndColor: Color(0xffF6815B),
                    icon: const Icon(Icons.info, color: Colors.white, size: 35,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            // const Padding(
            //   padding: EdgeInsets.only(left: 25),
            //   child: Text(
            //     "Conheça outros projetos",
            //     style: TextStyle(
            //       color: Color(0xff515979),
            //       fontSize: 14
            //     ),
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 25),
            //   child: GridView(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 19,
            //       mainAxisExtent: 125,
            //       mainAxisSpacing: 19
            //     ),
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     children: [
            //       DiscoverSmallCard(
            //         onTap: () {},
            //         title: "Patrocinador",
            //         gradientStartColor: Color(0xff13DEA0),
            //         gradientEndColor: Color(0xff06B782),
            //       ),
            //       DiscoverSmallCard(
            //         onTap: () {},
            //         title: "Patrocinador",
            //         gradientStartColor: Color(0xffFC67A7),
            //         gradientEndColor: Color(0xffF6815B),
            //         icon: SizedBox(
            //             height: 24,
            //             width: 24,
            //             child: SvgPicture.asset(
            //               "lib/assets/images/svg/tape.svg",
            //               fit: BoxFit.cover,
            //             )
            //         ),
            //       ),
            //       DiscoverSmallCard(
            //         onTap: () {},
            //         title: "Patrocinador",
            //         gradientStartColor: Color(0xffFFD541),
            //         gradientEndColor: Color(0xffF0B31A),
            //       ),
            //       DiscoverSmallCard(
            //         onTap: () {},
            //         title: "Patrocinador",
            //         icon: SizedBox(
            //             height: 24,
            //             width: 24,
            //             child: SvgPicture.asset(
            //               "lib/assets/images/svg/tape.svg",
            //               fit: BoxFit.cover,
            //             )
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 60.0,
      //   decoration: const BoxDecoration(
      //     boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)]
      //   ),
      //   child: BottomAppBar(
      //     child: Container(

      //     ),
      //   ),
      // ),
      floatingActionButton:  Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          elevation: 15,
          backgroundColor: Colors.blue,
          onPressed: () => onHelpTapped(),
          tooltip: 'Cadastrar novo cliente',
          child: const Icon(Icons.chat, size: 25,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void onHelpTapped() {
    Get.to(() => const ChatScreen(help: true), transition: Transition.rightToLeft);
  }

  void onSupportTapped() {
    Get.to(() => const ChatScreen(help: false), transition: Transition.rightToLeft);
  }

  void onSeeAllTapped() {
  }

  void onPartner1Tapped() {
    // Get.to(() => DetailPage(), transition: Transition.rightToLeft);
  }

  void onPartner2Tapped() {
  }
}
