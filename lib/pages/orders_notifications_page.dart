import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owner_app/models/orders_history_model.dart';
import 'package:owner_app/providers/orders_history_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/show_alert_dialog.dart';

class OrdersNotificationsPage extends StatefulWidget {
  const OrdersNotificationsPage({super.key});

  @override
  State<OrdersNotificationsPage> createState() => _OrdersNotificationsPageState();
}

class _OrdersNotificationsPageState extends State<OrdersNotificationsPage> {

   List<OrdersHistory> orders=[];
  
   @override
  void initState() {
    
  
    Provider.of<OrdersHistoryProvider>(context, listen: false).getOrdersHistory();
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
        title: Text('Orders History',
         style: GoogleFonts.urbanist(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF212121)
                    ),
        ),
        iconTheme: IconThemeData(color: const Color(0xFF212121)),
      ),
      body: ListView(
           shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(0),
          children: [
       Consumer<OrdersHistoryProvider>(
                      builder: (context, dp, child)
                      {
                       
                        return   ListView.separated(
                separatorBuilder: (context, index) => Divider(color: Color(0xFFCA987E),),
                itemCount: dp.ordersHistory.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemBuilder: (context, index) => 
                ExpansionTile(
                    iconColor: Colors.black,
                  collapsedIconColor: Colors.black,
                  title: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(dp.ordersHistory[index].customers['name'],
                     style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121)
                            ),
                           
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dp.ordersHistory[index].customers['email'],
                         style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212121)
                            ),
                          
                        ),
                        Text('Status: ${dp.ordersHistory[index].status}',
                         style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212121)
                            ),            
                        ),
                        Text('Time Start: ${dp.ordersHistory[index].time_start}',
                         style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212121)
                            ),            
                        ),
                        Text('Time end: 9',
                         style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF212121)
                            ),            
                        ),
                      ],
                    ),
                  ),
                  children: [
                  
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child:  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10)
                                    ),
                          child: Image.network(dp.ordersHistory[index].salons['featured_image'])),
                      ),
                      title: Text(dp.ordersHistory[index].salons['name'],
                       style: GoogleFonts.urbanist(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121)
                            ),
                      ),
                      subtitle: Text(dp.ordersHistory[index].salons['description']),
                      trailing: Text(dp.ordersHistory[index].salons['status']== 1? 'Open': 'Closed',
                        style: TextStyle(
                          color: dp.ordersHistory[index].salons['status']== 1? Colors.green: Colors.red
                        ),
                      ),
                    )
                  ],
                  )
             );
       
                      }
              ),

              ],
      ),
    );
  }
}