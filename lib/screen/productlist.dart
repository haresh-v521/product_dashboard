import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        title: const Text(
          "Product List",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
              color: Colors.grey.shade700),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/productdetails');
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 2,
                        spreadRadius: 1)
                  ]),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 1),
                    height: 140,
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/icon_play.png",
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_rPlSZaAQF2wt6CEu5HOFfbcVM2BW0ei_NA&usqp=CAU'),
                                fit: BoxFit.cover),
                            color: Colors.yellow,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                              )
                            ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bluetooth Headphones",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Price : 100\$",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 15,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 1,
                          ),
                          margin: const EdgeInsets.only(
                            left: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red.shade900,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 3),
                            child: const Text(
                              "Sell",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: Image.asset(
                            "assets/icon_play.png",
                            height: 20,
                            width: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
