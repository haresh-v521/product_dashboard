import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[700],
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
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
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Colors.grey[700],
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: Stack(
                          children: [
                            const CircleAvatar(
                                radius: 45,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5VOlpbH2ioO8ZDv8vgKj3zvtmsGawgZ9k8g&usqp=CAU')),
                            Container(
                              margin: const EdgeInsets.only(top: 50, left: 75),
                              child: const CircleAvatar(
                                child: Center(
                                    child: Icon(
                                  Icons.edit,
                                  size: 12,
                                )),
                                radius: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "User Name",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "user123@gmail.com",
                      style: TextStyle(fontSize: 18, color: Colors.grey[400]),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.grey.shade600)),
                      leading: Text(
                        "User Name",
                        style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit,color: Colors.grey.shade700,),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.grey.shade600)),
                      leading: Text(
                        "User Name",
                        style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.edit,color: Colors.grey.shade700,),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.grey.shade600)),
                      leading: Text(
                        "Male",
                        style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_drop_down,color: Colors.grey.shade700,),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Colors.grey.shade600)),
                      leading: Text(
                        "24 january 1999",
                        style: TextStyle(fontSize: 18,color: Colors.grey.shade600),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.calendar_today,color: Colors.grey.shade700,),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/productlist');
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey[700]),
                      child: const Center(
                          child: Text(
                        "Save Changes",
                        style: TextStyle(fontSize: 20, color: Colors.white),
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
