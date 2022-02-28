import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testeui/core/apistring/apistring.dart';

import '../api/models/userjsonplaceholder.dart';

class UserJsonPlace extends StatefulWidget {
  const UserJsonPlace({Key? key}) : super(key: key);

  @override
  _UserJsonPlaceState createState() => _UserJsonPlaceState();
}

class _UserJsonPlaceState extends State<UserJsonPlace> {
  Dio dio = Dio();
  List<User>? result;

  Future<List<User>> userapi() async {
    var response = await dio.get(baseurl1 + endurl1);
    print(response.data);
    if (response.statusCode == 200) {
      Iterable data = response.data;
      List<User> user = List<User>.from(data.map((e) => User.fromJson(e)));
      setState(() {
        result = user;
      });
    }
    throw Exception("field not found");
  }

  @override
  void initState() {
    super.initState();
    userapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("UserJsonPlaceHolder"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: result != null
              ? GridView.builder(
                  itemCount: result!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "ID = ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                Text(
                                  result![index].id!.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].name!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "UserName",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].username!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Email",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].email!,
                              maxLines: 1,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Street",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            Text(
                              result![index].address!.street!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Suite",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].address!.suite!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "City",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].address!.city!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Zipcode",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].address!.zipcode!.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Text(
                              "Phone",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              result![index].phone!.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.4),
                )
              : Center(child: CircularProgressIndicator())),
    );
  }
}
