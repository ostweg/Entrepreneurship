import 'package:entre/cubit/app_cubits.dart';
import 'package:entre/widgets/text_description.dart';
import 'package:entre/widgets/text_icon_widget.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
   return Container(
     child: Scaffold(
       backgroundColor: Colors.white,
       body:BlocBuilder<AppCubits,CubitStates>(
         builder: (context,state){
           if(state is LoadedState){
             var listingsForYou = state.listings.where((element) => element.section=="suggested");
             var listingsSuggested = state.listings.where((element) => element.section=="mightlike");
             return Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   padding: const EdgeInsets.only(top:40,left:20),
                   child: Row(
                     children: [
                       Icon(Icons.menu,size: 30,color: Colors.black54),
                       Expanded(child: Container()),
                       Container(
                         child: TextTitle(text: "Volunteer Connect",color: Colors.black.withOpacity(0.7),),
                       ),
                       Expanded(child: Container()),
                       Container(
                         margin: const EdgeInsets.only(right: 20),
                         width: 30,
                         height: 30,
                         decoration: BoxDecoration(
                             image:const DecorationImage(
                               image: AssetImage(
                                   "images/person.png"
                               ),
                             ),
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.grey.withOpacity(0.1)
                         ),
                       )
                     ],
                   ),
                 ),
                 SizedBox(height:40),
                 Container(
                   margin: const EdgeInsets.only(left:20),
                   child:TextTitle(text:"Suggested for you",color:Colors.black.withOpacity(0.6) ,),
                 ),
                 SizedBox(height:30),
                 Container(
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: TabBar(
                       labelPadding: const EdgeInsets.only(left:20,right:20),
                       labelColor: Colors.black,
                       controller: _tabController,
                       unselectedLabelColor: Colors.grey,
                       isScrollable: true,
                       indicatorSize: TabBarIndicatorSize.label,
                       indicator: CircleTabIndicator(color:const Color(0xFF4c8bfc),radius: 4),
                       tabs: const[
                         Tab(text:"Animal Shelter"),
                         Tab(text:"Conservation"),
                         Tab(text:"Food Security"),
                         Tab(text:"Environmental"),
                       ],
                     ),
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.only(left:20),
                   height: 300,
                   width: double.maxFinite,
                   child: ScrollConfiguration(
                     behavior: ScrollConfiguration.of(context).copyWith(
                       dragDevices:{
                       PointerDeviceKind.touch,
                       PointerDeviceKind.mouse,
                       },
                     ),
                     child: TabBarView(
                       controller: _tabController,
                       children:[
                         ListView.builder(
                           physics: const AlwaysScrollableScrollPhysics(),
                           scrollDirection: Axis.horizontal,
                           itemCount:listingsForYou.length,
                           itemBuilder: (_,index) {
                             return GestureDetector(
                               onTap: (){
                                 BlocProvider.of<AppCubits>(context).detailPage(listingsForYou.elementAt(index));
                               },
                               child: Container(
                                 margin: const EdgeInsets.only(right:15,top:10),
                                 width: 200,
                                 height: 300,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     color: Colors.white,
                                     image: DecorationImage(
                                         image: NetworkImage("https://ostweg.github.io/${listingsForYou.elementAt(index).image}"),
                                         fit: BoxFit.cover
                                     )
                                 ),
                                 child: Container(
                                     alignment: Alignment.bottomLeft,
                                     margin: const EdgeInsets.only(left: 15,bottom: 5),
                                     child: TextTitle(text: listingsForYou.elementAt(index).name,size: 14,color: Colors.white,)
                                 ),
                               ),
                             );
                           },
                         ),
                         Text("where"),
                         Text("Bye"),
                         Text("Ciao"),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(height:30),
                 Container(
                    margin: const EdgeInsets.only(left:20),
                    child: TextTitle(text:"You might be into", color:Colors.black.withOpacity(0.6),),
                 ),
                 SizedBox(height: 10),
                 Container(
                   height: 300,
                   child: ListView.builder(
                       physics: AlwaysScrollableScrollPhysics(),
                       itemCount: listingsSuggested.length,
                       itemBuilder:(context,index){
                         return GestureDetector(
                           onTap: (){
                             BlocProvider.of<AppCubits>(context).detailPage(listingsSuggested.elementAt(index));
                           },
                           child: Container(
                               margin:const EdgeInsets.only(left: 20,right: 20,top:5,bottom: 5),
                               child:Row(
                                 children: [
                                   Container(
                                     width:110,
                                     height:110,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                           topLeft: Radius.circular(20),
                                           bottomLeft: Radius.circular(20),
                                         ),
                                         color:Colors.white38,
                                         image: DecorationImage(
                                             image:NetworkImage(
                                                 "https://ostweg.github.io/${listingsSuggested.elementAt(index).image}"
                                             )
                                         )
                                     ),
                                   ),
                                   Expanded(//takes full width
                                     child: Container(
                                       height: 110,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(20),
                                             bottomRight: Radius.circular(20)
                                         ),
                                         color: const Color(0xFFf2f2f2).withOpacity(0.3),
                                       ),
                                       child: Padding(
                                         padding: const EdgeInsets.only(left: 10,right: 10,top:10),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             TextTitle(text: listingsSuggested.elementAt(index).name,size: 16,color: Colors.black.withOpacity(0.8),),
                                             SizedBox(width: 5),
                                             TextDescription(text: listingsSuggested.elementAt(index).description,size:12,overflow: true,),
                                             SizedBox(height:25),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 TextIconWidget(text:"Switzerland, "+listingsSuggested.elementAt(index).city, icon: Icons.location_on,color: const Color(0xFF4c8bfc),),
                                                 SizedBox(width: 5),
                                                 TextIconWidget(text:"CHF "+listingsSuggested.elementAt(index).pricerperhour.toString()+"/hour", icon: Icons.attach_money,color: Colors.green),
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               )
                           ),
                         );
                       }),
                 )
               ],
             );
           }else {
             return Container(); //show network error
           }
         },
       )
     ),
   );
  }
}
class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:this.color,radius:this.radius);
  }
}
class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2-radius/2,configuration.size!.height-radius-5);

    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}