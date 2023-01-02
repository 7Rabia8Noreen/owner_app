import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurSpecialistsPage extends StatefulWidget {
  const OurSpecialistsPage({super.key});

  @override
  State<OurSpecialistsPage> createState() => _OurSpecialistsPageState();
}

class _OurSpecialistsPageState extends State<OurSpecialistsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFF2E4D9),
      appBar: AppBar(
         backgroundColor: const Color(0xFFF2E4D9),
         elevation: 0,
         centerTitle: true,
        title: Text('Our Specialists',
         style: GoogleFonts.urbanist(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF212121)
                    ),
        ),
        iconTheme: IconThemeData(color: const Color(0xFF212121)),
      ),
      body: Container(
       
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          children: [
             Expanded(
               child: ListView.separated(
                separatorBuilder: (context, index) => Divider(color: Color(0xFFCA987E),),
                itemCount: 20,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => 
                 ListTile(
                              contentPadding: EdgeInsets.all(0),
                              leading: CircleAvatar(
                                 backgroundColor: Color(0xFFF2E4D9),
               
                                 child: Image.asset('assets/images/specialist_image.png',
                                 fit: BoxFit.fill,
                                 ),
                              ),
                             
                              title: Text('Nathan Alexander',
                          style: GoogleFonts.urbanist(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF212121)
                          ),
                          ),
                           subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Senior Barber',
                          style: GoogleFonts.urbanist(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF616161)
                          ),
                          ),
                          Text('Time: 9AM-9PM',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF616161).withOpacity(0.5)
                          ),
                          ),
                             ],
                           ),
                          trailing:   Text('Sallery\n5000',
                          style: GoogleFonts.urbanist(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFCA987E),
                          ),
                          ),
                            ),
               ),
             )
                    
          ],
        ),
      ),
    );
  }
}