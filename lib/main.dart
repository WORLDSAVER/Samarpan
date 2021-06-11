import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "./models/members.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Samarpan",
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  int i = 0;

  void _login(BuildContext ctx) {
    // if (usernameController == null || passwordController == null) {
    //   return ;
    // }
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == "SAMARPAN" && password == "123456789") {
      setState(
        () {
          i = 1;
        },
      );
    } else {
      showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return GestureDetector(
            onTap: () {
              setState(() {
                i = 0;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 400,
              child: Text(
                "Wrong Password!\n\nPlease try again.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      );
    }
  }

  void _logout() {
    setState(
      () {
        i = 0;
      },
    );
  }

  final appBar = AppBar(
    title: Text(
      "SAMARPAN",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: <Widget>[
      Image.asset("assets/images/samarpan_logo.png"),
    ],
  );

  List<Members> _membersList = [
    Members(
      title: "JSECS",
      memberNames: "SATCHIT, HITARTH, RAKSHIT & VISHAL",
      description: "Our Backbone.",
    ),
    Members(
      title: "COORDI.",
      memberNames: "KIRAN, BOBBY, TUSHAR & NAMAN",
      description: "Senior Coordinators",
    ),
    Members(
      title: "SESSION",
      memberNames: "NAMAN, ARYAN, ADITYA & SHREYA",
      description: "Session Heads",
    ),
    Members(
      title: "SOCIAL",
      memberNames: "SIDDHANT, GAURIKA, SIMRAN & YASHIKA",
      description: "Our Social Media team",
    ),
    Members(
      title: "CONTENT",
      memberNames: "SOMYA, JIVESH, PANKAJ & VAIBHAV",
      description: "The content creators",
    ),
    Members(
      title: "PROJECT",
      memberNames: "ARYAN, VIKAS, HIMANSHU & RISHABH",
      description: "Our Project team",
    ),
  ];
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final curScaleFactor = MediaQuery.of(context).textScaleFactor;
    final loginField =  Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 225,
                            child: Column(
                              children: [
                                TextField(
                                  controller: usernameController,
                                  decoration:
                                      InputDecoration(labelText: "Username"),
                                ),
                                TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      labelText: "Password",
                                    ),
                                    obscureText: !showPassword),
                                SizedBox(height: 30),
                                Row(children: [
                                  Text("Show Password"),
                                  Container(
                                    child: Switch(
                                      onChanged: (val) {
                                        setState(
                                          () {
                                            showPassword = val;
                                          },
                                        );
                                      },
                                      value: showPassword,
                                    ),
                                  )
                     ,
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.255),
                                  RaisedButton(
                                    onPressed: () {
                                      HapticFeedback.heavyImpact();
                                      _login(context);
                                    },
                                    child: Text("LOGIN"),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        );
                                
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            1,
        child: i != 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.25,
                      width: 250,
                      child: Image.asset("assets/images/samarpan_logo.png"),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.03,
                      child: Text(
                        "WE WORSHIP TECHNOLOGY",
                        style: TextStyle(
                          fontSize: 19 * curScaleFactor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.03),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.05,
                      child: RaisedButton(
                        child: Text("LOGOUT"),
                        onPressed: () {
                          HapticFeedback.heavyImpact();
                          _logout();
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.03),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.04,
                      child: Text(
                        "OUR MEMBERS",
                        style: TextStyle(
                          fontSize: 22 * curScaleFactor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                MediaQuery.of(context).padding.top) *
                            0.03),
                    Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          (1 - 0.03 - 0.04 - 0.03 - 0.05 - 0.03 - 0.03 - 0.25),
                      child: ListView.builder(
                        itemCount: _membersList.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: FittedBox(
                                        child: FittedBox(
                                      child: Text(_membersList[index].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    )),
                                  ),
                                ),
                                title: FittedBox(
                                  child: Text(_membersList[index].memberNames,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                subtitle: Text(
                                  _membersList[index].description,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top),
                  child: Column(
                    children: [
                      Image.asset("assets/images/samarpan_logo.png"), Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: loginField,
                      ),
                      SizedBox(height:30), 
                      // Container(padding:EdgeInsets.all(10), 
                      //                         child: Card(
                      //                           child: Container(padding:EdgeInsets.all(10),
                      //                                                                             child: Text(
                      //       "Forgot your password? Please Contact your JSECS."),
                      //                           ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
