import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/chatItemHelper.dart';
import 'package:whatsapp_ui_clone/chatItemTemplate.dart';
import 'package:whatsapp_ui_clone/statusItemHelper.dart';
import 'package:whatsapp_ui_clone/statusItemTemplate.dart';
import 'package:whatsapp_ui_clone/callItemHelper.dart';
import 'package:whatsapp_ui_clone/callItemTemplate.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Whatsapp Challenge',
      theme: new ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> 
  with SingleTickerProviderStateMixin {
  TabController tabController;
  var fabIcon;
  var whatsAppColor = Color.fromRGBO(18, 140, 126, 1.0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              fabIcon = null;
              break;
            case 1:
              fabIcon = Icons.chat;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("WhatsApp"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: whatsAppColor,
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(child: Text("CHATS"),),
            Tab(child: Text("STATUS",)),
            Tab(child: Text("CALLS",)),
          ], indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Icon(Icons.camera_alt),
          // chats tab
          ListView.builder(
            itemBuilder: (context, position) {
              ChatItemModel item = ChatHelper.getItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(item.profileSrc),
                          backgroundColor: Colors.transparent,
                        ),
                        
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Column (
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item.messageDate,
                                          style: TextStyle(
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ]
                                    )
                                ],),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    item.mostRecentMessage,
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16.0,
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: ChatHelper.itemCount,
          ),
          // status tab
          ListView.builder(
            itemBuilder: (context, position) {
              StatusItemModel item = StatusHelper.getItem(position);
              
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:  NetworkImage(item.imgSrc),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      item.name
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    item.dateTime,
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 16.0,
                                    )
                                  ),
                                ),
                                Divider(),
                              ],
                            )
                          ),)
                      ],)
                  )
                ],
              );
            },
            itemCount: StatusHelper.itemCount,
          ),
          ListView.builder(
            itemBuilder: (context, position) {
              CallItemModel callItemModel = CallHelper.getItem(position);
              
              // decide call type and icon color
              var callType = callItemModel.callType;
              var callIcon = Icons.call_received;
              var callIconColor = Colors.green;
              switch (callType) {
                case "incoming":
                  callIcon = Icons.call_received;
                  callIconColor = Colors.green;
                  break;
                case "outgoing":
                  callIcon = Icons.call_made;
                  callIconColor = Colors.red;
                  break;
                default:
                  callIcon = Icons.call_missed;
                  callIconColor = Colors.red;
              }
              
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(callItemModel.imgSrc),
                          backgroundColor: Colors.transparent,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          callItemModel.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 4.0),
                                            child: Icon(
                                              callIcon,
                                              color: callIconColor,
                                              size: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: Text(
                                              callItemModel.dateTime,
                                              style: TextStyle(
                                                  color: Colors.black45, fontSize: 16.0),
                                            ),
                                          ),
                                        ]
                                    )),
                                  ],
                                ),
                                Icon(Icons.call, color: whatsAppColor,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: CallHelper.itemCount,
          ),
        ],
      ),
      floatingActionButton: new Opacity(
        opacity: tabController.index == 0 ? 0.0 : 1.0,
        child: new FloatingActionButton(
          onPressed: () {},
          child: Icon(fabIcon),
          backgroundColor: Colors.green,
      ),
    )
    );
  }
}
