import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1585089858717-f4378c2031d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTR8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("WelCome,",style: TextStyle(fontSize: 30,color: Colors.white),),
                        Text("Please Login OR Singnup",style: TextStyle(fontSize: 20,color: Colors.white),)
                      ],
                    ),
                  )
                ),
              Padding(
                padding: const EdgeInsets.only(top: 60,bottom: 20),
                child: Column(
                  children: [
                     Center(
                       child: InkWell(
                         onTap: (){
                           Navigator.of(context).pushNamed('/login');
                         },
                         child: Container(
                           height: 50,
                           width: 300,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(25),
                             color: Colors.white
                           ),
                           child: Center(child: Text("LOGIN",style: TextStyle(fontSize: 20),)),
                         ),
                       ),
                     ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Container(
                            height: 50,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white
                            ),
                            child: Center(child: Text("SIGN UP",style: TextStyle(fontSize: 20),)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
