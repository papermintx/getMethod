import 'package:apps1/models/get_method_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  GetMethodList getMethodList = GetMethodList();

  @override
  Widget build(BuildContext context) {
    GetMethodList.connectToApi("2").then((value) {
      getMethodList = value;
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Get Method"),
        ),
        body: ListView.builder(
            itemCount: getMethodList.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              getMethodList.data![index].avatar!,
                              width: 100,
                              height: 100,
                            ),
                            Text(getMethodList.data![index].firstName!),
                            Text(
                              getMethodList.data![index].email!,
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                title: Text(getMethodList.data![index].firstName!),
                subtitle: Text(getMethodList.data![index].email!),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(getMethodList.data![index].avatar!),
                ),
              );
            }),
      ),
    );
  }
}
