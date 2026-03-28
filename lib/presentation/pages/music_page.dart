import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/di/injection_container.dart';
import '../blocs/music_bloc.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MusicBloc>(),
      child: const MusicView(),
    );
  }
}

class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        title: Text(
          'MUSIC_REQUEST',
          style: GoogleFonts.jetBrainsMono(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search artist...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    context.read<MusicBloc>().add(SearchRequested(_searchController.text));
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                context.read<MusicBloc>().add(SearchRequested(value));
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<MusicBloc, MusicState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (message) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  ),
                  error: (message) => ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: $message'), backgroundColor: Colors.red),
                  ),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  artistsLoaded: (artists) => ListView.builder(
                    itemCount: artists.length,
                    itemBuilder: (context, index) {
                      final artist = artists[index];
                      return ListTile(
                        leading: artist.remotePoster != null
                            ? Image.network(artist.remotePoster!, width: 50, height: 50, fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.person))
                            : const Icon(Icons.person),
                        title: Text(artist.artistName, style: const TextStyle(fontFamily: 'JetBrainsMono')),
                        subtitle: Text(artist.status ?? 'Unknown Status'),
                        trailing: artist.isAdded
                            ? const Icon(Icons.check_circle, color: Colors.green)
                            : ElevatedButton(
                                onPressed: () {
                                  context.read<MusicBloc>().add(ArtistRequested(artist));
                                },
                                child: const Text('ADD'),
                              ),
                        onTap: artist.isAdded && artist.id != null
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => BlocProvider.value(
                                      value: context.read<MusicBloc>(),
                                      child: AlbumsView(artistId: artist.id!, artistName: artist.artistName),
                                    ),
                                  ),
                                );
                              }
                            : null,
                      );
                    },
                  ),
                  initial: () => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.library_music, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('Search for artists to add to your library'),
                      ],
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
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
      appBar: AppBar(title: Text('ALBUMS: ${widget.artistName.toUpperCase()}')),
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
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: album.remoteCover != null
                            ? Image.network(
                                album.remoteCover!,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.album, size: 48),
                              )
                            : const Icon(Icons.album, size: 48),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              album.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'JetBrainsMono'),
                            ),
                            Text(
                              album.releaseDate ?? 'Unknown date',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            error: (message) => Center(child: Text(message)),
            orElse: () => const Center(child: Text('Loading albums...')),
          );
        },
      ),
    );
  }
}
