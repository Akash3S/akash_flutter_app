import 'dart:async';

import 'package:flutter/material.dart';

class TimeCounter extends StatefulWidget {
  @override
  State<TimeCounter> createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {

  int s=0 ,m=0, h=0;
  String digsec="00", digmin="00", dighr="00";
  Timer? timer;
  bool started = false;
  List Laps =[];

  //stop function
  void stop()
  {
    timer!.cancel();
    setState(() {
      started=false;

    });
  }
  //reset function
  void reset()
  {
    timer!.cancel();
    setState(() {
      started=false;
      s=0 ;m=0 ;h=0;
      digsec="00";
      digmin="00";
      dighr="00";
      started = false;
    });
  }
//start function
  void start()
  {
    started=true;
    timer =Timer.periodic(Duration(seconds:1), (timer){
      int localsec=s+1;
      int localmin=m+1;
      int localhr=h+1;
      if(localsec>59)
      {
        if(localmin>59)
          {
            localhr++;
            localmin=0;
          }
           else
           {
             localmin++;
             localsec=0;
           }
      }
      setState(() {
        s=localsec;
        m=localmin;
        h=localhr;
        digsec=(s>=10)?"$s":"0$s";
        digmin=(m>=10)?"$m":"0$m";
        dighr=(h>=10)?"$h":"0$h";

      });

    });
  }

  void addlaps()
  {
    String lap="$digsec:$digmin:$dighr";
    setState(() {
      Laps.add(lap);
    });
  }

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
                          '$dighr:$digmin:$digsec',
                          style: TextStyle(fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold),
                        ), //Text
                      ), //CircleAvatar
                      Text('Tushar Rai', style: TextStyle(fontWeight: FontWeight
                          .bold),),
                      SizedBox(height: 15,),
                      Text('On Shift', style: TextStyle(fontWeight: FontWeight
                          .bold, color: Colors.green,fontSize: 16),),
                      SizedBox(height: 10,),
                      IconButton(onPressed: (){
                        addlaps();
                      }, icon: Icon(Icons.watch_later)),
                      Container(
                        child:ListView.builder(
                            itemCount:Laps.length,
                        itemBuilder:(context,index){
                              return Padding(
                                  padding: EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("Lap ${index+1}",style: TextStyle(fontSize: 16,color: Colors.black),),
                                          Text(" ${Laps[index]}",style: TextStyle(fontSize: 16,color: Colors.black),)

                                        ],
                                      ),
                              );

                        }
                        ) ,
                      ),
                      SizedBox(height: 25,),

                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                (!started)?start():stop();
                              },
                              style:ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue
                              ),
                              child: Text((!started)?'Start Break':"Stop",style: TextStyle(color: Colors.white),)
                          ),
                          SizedBox(width: 15,),
                          ElevatedButton(
                              onPressed: () {
                                reset();
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



   );
  }
}