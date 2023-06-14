import 'package:entre/cubit/app_cubits.dart';
import 'package:entre/widgets/text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  List images = [
    "harmonyhaven.png",
    "greenthumbsociety.png",
    "artisticexpressions.png",
    "foodforall.png",
    "ecowarriors.png"
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
   return Scaffold(
     backgroundColor: Colors.white,
     body:BlocBuilder<AppCubits,CubitStates>(
       builder: (context,state){
         if(state is LoadedState){
           var listings = state.listings;
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
                 child:TextTitle(text:"Explore"),
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
                 child: TabBarView(
                   controller: _tabController,
                   children:[
                     ListView.builder(
                       itemCount:listings.length,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (_,index) {
                         return GestureDetector(
                           onTap: (){
                             BlocProvider.of<AppCubits>(context).detailPage(listings[index]);
                           },
                           child: Container(
                             margin: const EdgeInsets.only(right:15,top:10),
                             width: 200,
                             height: 300,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 color: Colors.white,
                                 image: DecorationImage(
                                     image: NetworkImage("https://ostweg.github.io/${listings[index].image}"),
                                     fit: BoxFit.cover
                                 )
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
             ],
           );
         }else {
           return Container(); //show network error
         }
       },
     )
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