import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: ()  {
             showDialog(context: context, builder: (context){
           return Container(
           child: AlertDialog(title: Text('Create new Workspace'),
             content: TextField(
               onChanged:( value ){},
               decoration: InputDecoration(
                 hintText: "Workspace name"
               ),
             ),
             actions: [
               TextButton(
               onPressed: ()  {
                 Navigator.pop(context);
               },
             child: const Text("Cancle", style: TextStyle(color: Colors.black)
             ),
               ),
               TextButton(
               onPressed: ()  {},
               child: const Text("OK", style: TextStyle(color: Colors.black)),
               )
               ],
           ),
           );
             });
            },
            child: const Text("One", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: ()  {},
            child: const Text("Two", style: TextStyle(color: Colors.black)),
          ),TextButton(
            onPressed: ()  {},
            child: const Text("Three", style: TextStyle(color: Colors.black)),
          ),TextButton(
            onPressed: ()  {},
            child: const Text("Four", style: TextStyle(color: Colors.black)),
          ),TextButton(
            onPressed: ()  {},
            child: const Text("Five", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Settings Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Account Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class DownloadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Download Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Menu Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(
        child: Text('Notification Page', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Crm extends StatefulWidget{
  @override
  State<Crm> createState() => _CrmState();
}

class _CrmState extends State<Crm> {
  final TextEditingController search = TextEditingController();
  int index = 0;
  final List<Widget> _pages = [
    HomePage(),
    SettingsPage(),
    AccountPage(),
    DownloadPage(),
    MenuPage(),
    NotificationPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('CRM'),
        backgroundColor: Colors.purpleAccent.shade100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              hintText: 'Search',

            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_add)),
          SizedBox(width: 50,),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          SizedBox(width:30 ,),
          IconButton(onPressed: (){
           showDialog(context: context, builder: (context)
           {
             return Container(
               child: AlertDialog(title: Column(
                 children: [
                   CircleAvatar(
                     backgroundColor: Colors.grey,
                     radius: 50,
                     child: Text(
                       'TR',
                       style: TextStyle(fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold),
                     ), //Text
                   ), //CircleAvatar
                   Text('Tushar Rai', style: TextStyle(fontWeight: FontWeight
                       .bold),),
                   SizedBox(height: 15,),
                   Text('On Shift', style: TextStyle(fontWeight: FontWeight
                       .bold, color: Colors.green,fontSize: 16),),
                   SizedBox(height: 10,),
                   Text('Startred 2.13pm at Admin',style: TextStyle(fontSize: 14),),
                   SizedBox(height: 25,),
                   Row(
                     children: [
                       ElevatedButton(
                           onPressed: () {
           showDialog(context: context, builder: (context)
           {
             return Container(
               width: 600,
                      child: AlertDialog(
                         title: Column(
                           children: [
                             Text('Which break do you want to start?',style: TextStyle(fontWeight: FontWeight.bold),),
                             SizedBox(height: 40,),
                             Container(
                               child: Padding(
                                 padding: const EdgeInsets.all(12),
                                 child: Row(
                                   children: [
                                     Column(
                                       children: [
                                         Text('Meal Break',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                         Text('(unpade)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                       ],
                                     ),
                                     SizedBox(width: 20,),

                                     Text('Unscheduled',style: TextStyle(color: Colors.grey),),

                                   ],
                                 ),
                               ),

                               height: 80,
                               width: 350,
                               color: Colors.grey.shade200,
                             ),

                             SizedBox(height: 10,),
                             Container(
                               child: Padding(
                                 padding: const EdgeInsets.all(12),
                                 child: Row(
                                   children: [
                                     Column(
                                       children: [
                                         Text('Rest Break',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                         Text('(unpade)',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                                       ],
                                     ),
                                     SizedBox(width: 15,),

                                     Text('Unscheduled',style: TextStyle(color: Colors.grey),),

                                   ],
                                 ),
                               ),

                               height: 80,
                               width: 350,
                               color: Colors.grey.shade200,
                             ),
                           ],
                         ),

                         actions: [
                           ElevatedButton(onPressed: (){
                             Navigator.pop(context);

                           },  style:ElevatedButton.styleFrom(
                               backgroundColor: Colors.greenAccent
                           ),child: Text('Cancle')),

                           SizedBox(width: 10,),



                           ElevatedButton(onPressed: (){
           showDialog(context: context, builder: (context)
           {
             return Container(
               child: AlertDialog(
                     title: Column(
                       children: [
                         Text('Break Time',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.black),),
                         SizedBox(height: 25,),

                         CircleAvatar(
                           backgroundColor: Colors.blue.shade200,
                           radius: 60,
                           child: Icon(Icons.thumb_up, size: 70, color: Colors.white),
                          // backgroundImage: const AssetImage('assets/images/like.jpg'),

                         ),
                         SizedBox(height: 20,),

                         Text('Enjoy your meal break (unpade)!',style: TextStyle(fontWeight: FontWeight.bold),),
                         SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('See you back soon..'),
                         ),



                       ],
                     ),

             ),);
           }
           );

           },
                               style:ElevatedButton.styleFrom(
                               backgroundColor: Colors.greenAccent
                           ),child: Text('Start Break')),

                         ],

                       ),
                      );
                        }
                       );
                           },
                           style:ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue
                           ),
                           child: Text('Start Break',style: TextStyle(color: Colors.white),)
                       ),
                       SizedBox(width: 15,),
                       ElevatedButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           style:ElevatedButton.styleFrom(
                               backgroundColor: Colors.blue
                           ),
                           child: Text('End Shift',style: TextStyle(color: Colors.white),)),

                     ],
                   ),
                   SizedBox(height:10 ,),
                   TextButton(onPressed: () {}, child: Text('Edit shift',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                   ),
                 ],
               ),

               ),
             );
           }
           );
          },
              icon: Icon(Icons.account_circle)),

        ],),
      body: Row(
        children: [

          NavigationRail(
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ), NavigationRailDestination(
                icon: Icon(Icons.account_circle),
                label: Text('Account'),
              ), NavigationRailDestination(
                icon: Icon(Icons.save_alt),
                label: Text('Download'),
              ), NavigationRailDestination(
                icon: Icon(Icons.line_weight_sharp),
                label: Text('menu'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.add_alert_sharp),
                label: Text('Notification'),
              )
            ], selectedIndex: index,
            backgroundColor: Colors.grey,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: _pages[index],
              color: Colors.greenAccent.shade100,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(



             ),
            ),

        ],
      ),
    );
  }
}

class StartBreak extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return  Container(
      child: AlertDialog(
        title: Text('a'),
      ),
    );




  }

}

