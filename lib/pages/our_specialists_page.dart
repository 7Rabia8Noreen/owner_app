import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owner_app/providers/our_specialist_provider.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class OurSpecialistsPage extends StatefulWidget {
  const OurSpecialistsPage({super.key});

  @override
  State<OurSpecialistsPage> createState() => _OurSpecialistsPageState();
}

class _OurSpecialistsPageState extends State<OurSpecialistsPage> {

  @override
  void initState() {
    Provider.of<OurSpecialistProvider>(context, listen: false).getWorkersDetails();
    super.initState();
  }
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
        //  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
          children: [

             Consumer<OurSpecialistProvider>(
                      builder: (context, dp, child)
                      {
                         return    ListView.separated(
                separatorBuilder: (context, index) => Divider(color: Color(0xFFCA987E),),
                itemCount: dp.workerDetails.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) => 
                 ExpansionTile(
                 // trailing: SizedBox(),
                  iconColor: Colors.black,
                  collapsedIconColor: Colors.black,

                   title: ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: CircleAvatar(
                                   backgroundColor: Color(0xFFF2E4D9),
                                
                                   child: Image.asset('assets/images/specialist_image.png',
                                   fit: BoxFit.fill,
                                   ),
                                ),
                               
                                title: Text(dp.workerDetails[index].name,
                            style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121)
                            ),
                            ),
                             subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(dp.workerDetails[index].speciality,
                            style: GoogleFonts.urbanist(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF616161)
                            ),
                            ),
                            Text(dp.workerDetails[index].avalaibily_time,
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF616161).withOpacity(0.5)
                            ),
                            ),
                               ],
                             ),
                            trailing:   Text('Sallery\n  ${dp.workerDetails[index].salary}',
                            style: GoogleFonts.urbanist(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFCA987E),
                            ),
                            textAlign: TextAlign.center,
                            ),
                              ),
                              children: [
                                ListTile(
                                  leading: CircleAvatar(child: Image.network(dp.workerDetails[index].salons['featured_image'])),
                                  title: Text(dp.workerDetails[index].salons['name']),
                                  subtitle: Text(dp.workerDetails[index].salons['description']),
                                  trailing: Text(dp.workerDetails[index].salons['status']==1 ? 'Open' :'Closed',
                                  style: TextStyle(
                                    color:dp.workerDetails[index].salons['status']==1? Colors.green :Colors.red
                                  ),
                                  ),
                                )
                              ],
                 ),
               );
          
                      }
             ),
             ],
        ),
      ),
    );
  }
}