import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }

}

class HomeActivity extends StatelessWidget{

  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );

  }


  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("partha"),
        actions: [
          IconButton(onPressed:() {MySnackBar("Account",context);}, icon: Icon(Icons.account_circle_sharp)),
          IconButton(onPressed:() {MySnackBar("Search",context);}, icon: Icon(Icons.search)),
          IconButton(onPressed:() {MySnackBar("Settings",context);}, icon: Icon(Icons.settings)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        child: Icon(Icons.add),
        onPressed: (){
          MySnackBar('file added',context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "message"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),

        ],
        onTap: (int index){
          if (index == 0){
            MySnackBar("home button",context);
          }
          if (index == 1){
            MySnackBar("message button",context);
          }
          if (index ==2){
            MySnackBar("profile button",context);
          }
      }
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(1),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountName: Text("Partha Roy Chowdhury"),
                  accountEmail: Text("partharc94@gmail.com"),
                  currentAccountPicture: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo12D4RoyD1axjjfj1wMsHE-sAtMhJI5Djzg&usqp=CAU"),
                )

            ),
            ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: (){MySnackBar("Home", context);
                }),
            ListTile(
                title: Text("email"),
                leading: Icon(Icons.email),
                onTap: (){MySnackBar("email", context);
                }),
            ListTile(
                title: Text("phone"),
                leading: Icon(Icons.phone),
                onTap: (){MySnackBar("phone", context);
                }),
            ListTile(
                title: Text("profile"),
                leading: Icon(Icons.person),
                onTap: (){MySnackBar("prof ile", context);
                }),
          ],
        ),
      ),
    );
  }

}