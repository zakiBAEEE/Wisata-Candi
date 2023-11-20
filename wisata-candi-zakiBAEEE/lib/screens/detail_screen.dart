import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../data/candi_data.dart';
import '../models/candi.dart';

class DetailScreen extends StatelessWidget {
  final Candi candi;
  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // image utama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    candi.imageAsset,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                ),
                // tombol back custom
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, 
                        vertical: 32,
                    ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                  ),
            ],
          ),
        
        //Detail Info
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // info atas (nama candi dan tombol favorit)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    candi.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.favorite_border),
                    )
                ],
              ),
              // info tengah (lokasi, dibangun, tipe)
              const SizedBox(height: 16),
              Row(children: [
                const Icon(Icons.place, color: Colors.red),
                const SizedBox(width: 8),
                const SizedBox(width: 70,
                child: Text('Lokasi', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),),
                Text(': ${candi.location}'),
              ],),
              Row(children: [
                const Icon(Icons.calendar_month, color: Colors.blue),
                const SizedBox(width: 8),
                const SizedBox(width: 70,
                child: Text('Dibagun', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),),
                Text(': ${candi.built}'),
              ],),
              Row(children: [
                const Icon(Icons.house, color: Colors.green),
                const SizedBox(width: 8),
                const SizedBox(width: 70,
                child: Text('Tipe', style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),),
                Text(': ${candi.type}'),
              ],),
              const SizedBox(height: 16),
              Divider(color: Colors.deepPurple.shade100),
              const SizedBox(height: 16),
              // info bawah (deskripsi)
              Container(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Deskripsi',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  candi.description,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          ),
          // Detail Galeri
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: Colors.deepPurple.shade100),
                const Text('Galeri', style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: candi.imageUrls.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.deepPurple.shade100,
                                width: 2
                              ),
                            ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                               imageUrl: candi.imageUrls[index],
                               width: 120,
                               height: 120,
                               fit: BoxFit.cover,
                               placeholder: (context, url) => Container(
                                width: 120,
                                height: 120,
                                color: Colors.deepPurple[50],
                               ),
                               errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          ),
                        ),
                        );
                    },
                  ),
                ),
                const SizedBox(height: 4),
                const Text('Tap untuk memperbesar',style: TextStyle(
                  fontSize: 12, color: Colors.black54
                ),),
              ],
            ),
            ),
        ],
      ),
    ),
    );
  }
}