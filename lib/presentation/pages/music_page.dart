import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/di/injection_container.dart';
import '../blocs/music_bloc.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MusicBloc>()..add(const ArtistsRequested()),
      child: const MusicView(),
    );
  }
}

class MusicView extends StatelessWidget {
  const MusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca de Música'),
      ),
      body: BlocBuilder<MusicBloc, MusicState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            artistsLoaded: (artists) => ListView.builder(
              itemCount: artists.length,
              itemBuilder: (context, index) {
                final artist = artists[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(artist.name),
                  subtitle: Text('${artist.albumCount} álbuns'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => BlocProvider.value(
                          value: context.read<MusicBloc>(),
                          child: AlbumsView(artistId: artist.id, artistName: artist.name),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            error: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: Text('Carregando artistas...')),
          );
        },
      ),
    );
  }
}

class AlbumsView extends StatefulWidget {
  final String artistId;
  final String artistName;

  const AlbumsView({super.key, required this.artistId, required this.artistName});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  @override
  void initState() {
    super.initState();
    context.read<MusicBloc>().add(AlbumsRequested(widget.artistId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Álbuns de ${widget.artistName}')),
      body: BlocBuilder<MusicBloc, MusicState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            albumsLoaded: (albums) => GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return _buildAlbumCard(context, album);
              },
            ),
            error: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: Text('Carregando álbuns...')),
          );
        },
      ),
    );
  }

  Widget _buildAlbumCard(BuildContext context, dynamic album) {
    final nasUrl = sl<SharedPreferences>().getString('nas_url') ?? '';
    final user = sl<SharedPreferences>().getString('navidrome_user') ?? '';
    // Simplified cover art URL for now
    final coverArtUrl = album.coverArt != null
        ? '$nasUrl:4533/rest/getCoverArt?id=${album.coverArt}&u=$user&v=1.16.1&c=nas_home'
        : null;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: coverArtUrl != null
                ? Image.network(
                    coverArtUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(Icons.album, size: 48),
                  )
                : const Icon(Icons.album, size: 48),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              album.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
