import 'package:flutter/material.dart';
import 'package:wisata_candi/widgets/pfofile_info_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO 1 : DEKLARASIKAN VARIABEL YANG DIBUTUHKAN
  bool isSignIn = true;
  String fullName = "";
  String userName = " ";
  int favoriteCandiCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Color.fromARGB(255, 41, 44, 226),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: [
              // TODO 2 : Buat bagian profile header
              // ======================FOTO PROFIL : MULAI====================
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                    padding: EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2),
                              shape: BoxShape.circle),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('images/placehoder_image.png'),
                          ),
                        ),
                        if (isSignIn)
                          IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.cyanAccent,
                              )),
                      ],
                    )
                    // ====================FOTO PROFIL : SELESAI===================

                    ),
              ),
              // TODO 3 : BUAT PROFILE INFO
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Pengguna',
                  value: userName,
                  iconColor: Colors.amber,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.lock,
                  label: 'Nama',
                  value: fullName,
                  showEditIcon: isSignIn,
                  onEditPressed: () {
                    debugPrint('Icon edit ditekan...');
                  },
                  iconColor: Colors.blue,
                ),
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 4),
                ProfileInfoItem(
                  icon: Icons.favorite,
                  label: 'Favorit',
                  value: favoriteCandiCount > 0 ? '$favoriteCandiCount' : '',
                  iconColor: Colors.red,
                ),
                // TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                SizedBox(height: 4),
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 20),
                isSignIn
                    ? TextButton(onPressed: () {}, child: Text('Sign Out'))
                    : TextButton(onPressed: () {}, child: Text('Sign In')),
            ]),
          )
        ],
      ),
    );
  }
}
