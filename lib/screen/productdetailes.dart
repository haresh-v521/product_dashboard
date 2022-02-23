import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        title: const Text(
          "Product Details",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_rPlSZaAQF2wt6CEu5HOFfbcVM2BW0ei_NA&usqp=CAU"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8pTF3r8Q0Z1S9d3o1CdNrlfk_BHL4X2rcyA&usqp=CAU"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsmNPMEUut9u7YwQ5HpQqo2anfZCs84TtYrg&usqp=CAU"),
                              fit: BoxFit.cover)),
                    )
                  ],
                  options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(microseconds: 800),
                    viewportFraction: 0.8,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bluetooth Headphones",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Price : 100\$",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Highlights",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Power Output(RMS): 10 w",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Battery life: 12 hrs",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Bluetooth Version: 5",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Wireless range: 10 m",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Wireless music streaming via Bluetooth",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "IPX7: Splash and sweat shield",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Multiple connectivity: BT,TF Card and AUX",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "Colors",
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade800),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.shade900,
                              blurRadius: 2,
                              offset: const Offset(0,2)
                            )
                          ]
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.blue.shade900,
                                  blurRadius: 2,
                                  offset: const Offset(0,2)
                              )
                            ]
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 3),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4 ),
                                  blurRadius: 2,
                                  offset: const Offset(0,2)
                              )
                            ]
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white,width: 3),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  offset: Offset(0,2)
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Description",style: TextStyle(fontSize: 20,color: Colors.grey.shade900),),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Its time to enjoy a seamless playback experience courtesy boAt Stone 350 10W portable wireless speaker. The speaker comes equipped with 1.96 dynamic drivers for an immersive stereo experience. It supports instant wireless connectivity with Bluetooth v5.0.",style: TextStyle(color: Colors.grey.shade600,height: 1.8),),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Ratings",style: TextStyle(fontSize: 20,color: Colors.grey.shade900),),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow.shade700,size: 30,),
                      Icon(Icons.star,color: Colors.yellow.shade700,size: 30,),
                      Icon(Icons.star,color: Colors.yellow.shade700,size: 30,),
                      Icon(Icons.star,color: Colors.yellow.shade700,size: 30,),
                      const Icon(Icons.star,color: Colors.grey,size: 30,)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.yellow.shade700,size: 30),
                      Icon(Icons.star,color: Colors.yellow.shade700,size: 30),
                      const Icon(Icons.star,color: Colors.grey,size: 30),
                      const Icon(Icons.star,color: Colors.grey,size: 30),
                      const Icon(Icons.star,color: Colors.grey,size: 30)
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
