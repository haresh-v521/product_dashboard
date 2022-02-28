import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testeui/api/models/fakeapi.dart';
import 'package:testeui/core/apistring/apistring.dart';

class FakeStoreApi extends StatefulWidget {
  const FakeStoreApi({Key? key}) : super(key: key);

  @override
  _FakeStoreApiState createState() => _FakeStoreApiState();
}

class _FakeStoreApiState extends State<FakeStoreApi> {

  Dio dio = Dio();
  List<FakeApi>? result;
  Future<List<FakeApi>?> storeapi()async{
    var response = await dio.get(baseurl2+endurl2);
    print(response.data);
    if(response.statusCode == 200){
      Iterable data = response.data;
      List<FakeApi> user = List<FakeApi>.from(data.map((e) => FakeApi.fromJson(e)));
      setState(() {
        result = user;
      });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    storeapi();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Fake Store Api"),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: result!=null
        ?GridView.builder(
      itemCount: result!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemBuilder: (context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridTile(
                  child: Image.network(
                    result![index].image!,
                    fit: BoxFit.cover,
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black45,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ ${result![index].price}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:[
                                const Icon(Icons.star,color: Colors.yellow,),
                                Text(result![index].rating!.rate!.toString(),style: const TextStyle(fontSize: 20))
                              ],
                            ))
                      ],
                    ),
                  )),
            );
          }
      )
            :const Center(child: CircularProgressIndicator())
      ),
    );
  }
}
