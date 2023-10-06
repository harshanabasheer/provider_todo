import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/provider/provider_page.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {


  @override
  Widget build(BuildContext context) {
    final object=Provider.of<Provider_class>(context);
    List name=object.itemsList;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black45,
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.black54,
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      onChanged: (value) {
                        object.updateItemList(value);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Item',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        object.addItem();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black45,
                      ),
                      child: const Text(
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
        child:const Icon(Icons.add,color: Colors.white,) ,
      ),
      appBar: AppBar(title: const Text("List",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black45,),
      body:
      ListView.builder(
          itemCount: name.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(name[index],style: const TextStyle(fontWeight: FontWeight.bold)),
                trailing: Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: object.icn_change(name[index]),
                  onChanged: (bool ? value){
                    object.updateItemList(name[index]);
                  },

                )
              ),
            );
          }),
    );
  }
}