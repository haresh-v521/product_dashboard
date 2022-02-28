import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testeui/api/models/DemoApi.dart';
import 'package:testeui/core/apistring/apistring.dart';

class DemoApii extends StatefulWidget {
  const DemoApii({Key? key}) : super(key: key);

  @override
  _DemoApiiState createState() => _DemoApiiState();
}

class _DemoApiiState extends State<DemoApii> {
  Dio dio = Dio();

  DemoApi? result;

  Future<void> apicall() async {
    var response = await dio.get(baseurl + listuser);
    print(response.data);
    if (response.statusCode == 200) {
      result = DemoApi.fromJson(response.data);
    }
  }

  @override
  void initState() {
    super.initState();
    apicall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("DemoApi"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: result != null
              ? result!.data!.isNotEmpty
                  ? GridView.builder(
                      itemCount: result!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          color: Colors.white70,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 6,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2
                                    )
                                  ),
                                  child: Image.network(
                                    result!.data![index].avatar!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                result!.data![index].id!.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    result!.data![index].firstName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(result!.data![index].lastName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))
                                ],
                              ),
                              Text(
                                result!.data![index].email!,
                                maxLines: 1,
                          style:  TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                    )
                  : const Text("No Data Found")
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.black),
                    ),
                  ),
                ),
        ));
  }
}
