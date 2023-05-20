import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  @override
  Widget build(BuildContext context) {
    List<String> docID = [];

    Future getId() async {
      await FirebaseFirestore.instance
          .collection('user')
          .get()
          .then((snapshot) => snapshot.docs.forEach((element) {
            docID.add(element.reference.id);
            //print(docID);
      }

      ));
    }


    List<String> materialType = [
      'Choose Material to be tested',
      'Concrete',
      'Cement'
    ];
    String material_option = 'Choose Material to be tested';




    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Submit Query"),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.3,
            right: MediaQuery.of(context).size.width * 0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    icon: Icon(Icons.build_circle_outlined),
                    hintText: "Name of Construction Site",
                    border: OutlineInputBorder (
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    icon: Icon(Icons.group_add_rounded),
                    hintText: "Name of Contractor/Agency",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.select_all_sharp, color: Colors.black38),
                  Container(
                      height: 60,
                      width: 300,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black38)),
                      padding: EdgeInsets.all(16),
                      child: DropdownButton(
                        iconSize: 30,
                        borderRadius: BorderRadius.circular(15),
                        hint: Text(
                          "Register As: ",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        items: materialType.map((valueitem) {
                          return DropdownMenuItem(
                              child: Text(valueitem), value: valueitem);
                        }).toList(),
                        onChanged: <String>(newvalue) {
                          setState(() {
                            material_option = newvalue;
                          });
                        },
                        value: material_option,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    icon: Icon(Icons.question_mark_rounded),
                    hintText: "Query",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    getId();

                  },
                  child: Text(
                    "Submit Query",
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  String? name;
  String? email;
  int? mobnumber;
  String? division;
  String? ref;
  String? usertype;
}
