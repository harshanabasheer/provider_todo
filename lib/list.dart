import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/items.dart';
import 'package:provider_todo/provider/provider_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {


  @override
  Widget build(BuildContext context) {
    final object=Provider.of<Provider_class>(context);
    List name=object.items;
    List icon=object.itemsIcon;

    return Scaffold(

      appBar: AppBar(title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/robert.jpeg'), radius: 30,),
          SizedBox(width: 10,),
          Text("ToDo-Wishflow",style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
        backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Positioned(
                            top: 0,
                            left: 0,
                            child:CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.star_half),
                            )
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Go Premium", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                              SizedBox(height: 10,),
                              Text("Go beyond the limit\nGet exclusive features!", style: TextStyle(fontSize: 15, color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.pinkAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          ),
                          child: Icon(Icons.arrow_forward, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                  child: Text("Tasks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: name.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ItemsPage()));
                    },

                    child: Card(
                      color: Colors.black87,
                      elevation: 30,
                      shadowColor: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(icon[index], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 25),
                          Text(name[index], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black, //background color of button
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder( //to set border radius to button
                                      borderRadius: BorderRadius.circular(30)
                                  ),),
                                child: Text("2 Left",style: TextStyle(color: Colors.white),),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white, //background color of button
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder( //to set border radius to button
                                      borderRadius: BorderRadius.circular(30)
                                  ),),
                                child: const Text("5 done",style: TextStyle(color: Colors.black),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Stack(
              children: [
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white.withOpacity(.60),
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  onTap: (value) {
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home,color: Colors.red,),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.graphic_eq,color: Colors.black26,),
                      label: 'Music',
                    ),
                  ],
                ),
                Center(
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.black54,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  onChanged: (value) {
                                    object.updateItemText(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter Item',
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextField(
                                  onChanged: (value) {
                                    object.updateItemIcon(value);
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter Icon',
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                ElevatedButton(
                                  onPressed: () {
                                    object.addItem();
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black45,
                                  ),
                                  child: Text(
                                    'Add to List',
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),

                          );

                        },
                      );
                    },
                    child:Icon(Icons.add,color: Colors.white,) ,
                  ),
                ),
              ],
            )




          ],
        ),
      ),
    );
  }
}