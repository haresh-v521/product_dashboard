import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[700],
        title: const Text("Profile",style: TextStyle(color: Colors.white,fontSize: 25),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined,color: Colors.white,), onPressed: () {
            Navigator.of(context).pop();
        },
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50 ),
                    ),
                    color: Colors.grey[700],
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: const CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5VOlpbH2ioO8ZDv8vgKj3zvtmsGawgZ9k8g&usqp=CAU')
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("User Name",style: TextStyle(fontSize: 22,color: Colors.white),),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("user123@gmail.com",style:TextStyle(fontSize: 18,color: Colors.grey[400]),)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
             Container(
               margin: const EdgeInsets.only(left: 25,right: 25),
               child: Column(
                 children: [
                   Card(
                    elevation: 5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: Colors.grey.shade600
                        )
                      ),
                      leading: Text("User Name",style: const TextStyle(fontSize: 18),),
                    ),
            ),
                   const SizedBox(
                     height:20,
                   ),
                   Card(
                     elevation: 5,
                     child: ListTile(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(5),
                           side: BorderSide(
                               color: Colors.grey.shade600
                           )
                       ),
                       leading: const Text("User Name",style: TextStyle(fontSize: 18),),
                     ),
                   ),
                   const SizedBox(
                     height:20,
                   ),
                   Card(
                     elevation: 5,
                     child: ListTile(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5),
                           side: BorderSide(
                               color: Colors.grey.shade600
                           )
                       ),
                       leading: const Text("Male",style: TextStyle(fontSize: 18),),
                     ),
                   ),
                   const SizedBox(
                     height:20,
                   ),
                   Card(
                     elevation: 5,
                     child: ListTile(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5),
                           side: BorderSide(
                               color: Colors.grey.shade600
                           )
                       ),
                       leading: const Text("24 january 1999",style: TextStyle(fontSize: 18),),
                     ),
                   ),
                   const SizedBox(
                     height:60,
                   ),
                   InkWell(
                     onTap: () {
                       Navigator.of(context).pushNamed('/editprofile');
                     },
                     child: Container(
                       height: 55,
                       width: double.infinity,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           color: Colors.grey[700]),
                       child: const Center(
                           child: Text(
                             "Edit Profile",
                             style: TextStyle(
                                 fontSize: 20, color: Colors.white),
                           )),
                     ),
                   ),
                   const SizedBox(
                     height: 30,
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
