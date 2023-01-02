import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owner_app/pages/our_specialists_page.dart';

class HomePage extends StatefulWidget {
  final int id;
  final String name;
  final String email;
  final String token;
  const HomePage({super.key,
  required this.id,
  required this.email,
  required this.name,
  required this.token
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E4D9), 
     body: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
                width: double.infinity,
                height: 236,
                child: Stack(
                  children: [
                     Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset('assets/images/home_art_background.png',
                      fit: BoxFit.fill,
                      )
                     ),
                     Positioned(
                      top: 64,
                      left: 24,
                      right: 24,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: const CircleAvatar(
                           backgroundColor: Color(0xFFF2E4D9),
                           child: Icon(Icons.person,
                           color: Color(0xFFCA987E),
                           ),
                        ),
                       
                        title: Text(widget.name,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
                    ),
                     subtitle: Text(widget.email,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFF2E4D9)
                    ),
                    ),
                    trailing:   Container(
                         // width: 50,
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF2E4D9)
                          ),
                          child: const Icon(Icons.notifications,
                          color: Color(0xFFCA987E),
                          ),
                        ),
                      )
                     ),
                   
              
                  ],
                ),
              ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24),
               child: Column(
                children: [
                  ListTile(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => const OurSpecialistsPage())
                      );
                    },
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                           backgroundColor: const Color(0xFFCA987E).withOpacity(0.4),
                           child: SvgPicture.asset('assets/svg/profile_icon.svg')
                        ),
                        title: Text('Our Specialists',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3A2228)
                    ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xFFCA987E),
                    ),
                  ),
                                    ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                             backgroundColor: const Color(0xFFCA987E).withOpacity(0.4),
                           child: SvgPicture.asset('assets/svg/history_icon.svg')
                        ),
                        title: Text('Orders History',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3A2228)
                    ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xFFCA987E),
                    ),
                  ),
                                    ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                             backgroundColor: const Color(0xFFCA987E).withOpacity(0.4),
                           child: SvgPicture.asset('assets/svg/logout_icon.svg')
                        ),
                        title: Text('Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF3A2228)
                    ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios,
                    color: Color(0xFFCA987E),
                    ),
                  )
                ],
               ),
             )
            
        ],
       ),
     ),
    );
  }
}