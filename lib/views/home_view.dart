import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_memer/services/api.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memer App'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Api.getmemes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.memes!.length,
              itemBuilder: (context, index) {
                final meme = snapshot.data!.memes![index];
                return ListTile(
                  title: Text(meme.name!),
                  leading: CircleAvatar(
                    radius: 22.0,
                    backgroundImage: CachedNetworkImageProvider(
                      meme.url!,
                      errorListener: (p0) => const Icon(Icons.error),
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () => launchUrl(
                      Uri.parse(meme.url!),
                    ),
                    child: Text(meme.url!),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
