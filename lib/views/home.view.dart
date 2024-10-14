import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:memelab/api/api.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MemeLab"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FutureBuilder(
          future: API.getMemes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: snapshot.data!.data!.memes!.length,
                itemBuilder: (context, index) {
                  final meme = snapshot.data!.data!.memes![index];
                  return InkWell(
                    onTap: () => launchUrl(Uri.parse(meme.url!)),
                    child: GridTile(
                      header: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: meme.url!,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ],
                      ),
                      footer: Container(
                        decoration: const BoxDecoration(color: Colors.black54),
                        child: Text(
                          meme.name!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Text(meme.url!),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: SizedBox.square(
                  dimension: 20.0,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
