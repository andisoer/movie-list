import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pertemuan11/model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    String backdropPath;
    double screenHeight = MediaQuery.of(context).size.height;

    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w200/${selectedMovie.posterPath}';
    } else {
      path =
          'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-11844399.jpg';
    }

    if (selectedMovie.backdropPath != null) {
      backdropPath =
          'https://image.tmdb.org/t/p/w500/${selectedMovie.backdropPath}';
    } else {
      backdropPath =
          'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-11844399.jpg';
    }

    var date = selectedMovie.releaseDate ?? "2001-01-01";
    var formattedDate = DateTime.parse(date);

    date = DateFormat("d MMM yyyy").format(formattedDate);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 2 / 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      backdropPath,
                      height: screenHeight * 2 / 5,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(200),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                selectedMovie.title ?? "-",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Text(
                        'Sinopsis',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: Text(
                        '${selectedMovie.overview}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Text(
                          'Rating : ${selectedMovie.voteAverage}',
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          'Release Date: $date',
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text('Created by Andi Surya, NIM : 21201194'),
                      ),
                    ),
                    const SizedBox(height: 48),
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
