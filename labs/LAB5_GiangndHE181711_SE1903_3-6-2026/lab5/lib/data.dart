import 'movie.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl: 'https://images.unsplash.com/photo-1509198397868-475647b2a1e5?q=80&w=600&auto=format&fit=crop',
    overview: 'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he endeavors to prevent a terrible future only he can foresee.',
    rating: 8.6,
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    trailers: [
      Trailer(id: 't1_1', name: 'Official Trailer #1'),
      Trailer(id: 't1_2', name: 'IMAX Sneak Peek'),
    ],
  ),
  Movie(
    id: '2',
    title: 'Deadpool & Wolverine',
    posterUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?q=80&w=600&auto=format&fit=crop',
    overview: 'A listless Wade Wilson toils in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, he must reluctantly suit-up again with an even more reluctant Wolverine.',
    rating: 8.3,
    genres: ['Action', 'Comedy'],
    trailers: [
      Trailer(id: 't2_1', name: 'Red Band Trailer'),
      Trailer(id: 't2_2', name: 'Behind the Scenes'),
    ],
  ),
  Movie(
    id: '3',
    title: 'Inside Out 2',
    posterUrl: 'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?q=80&w=600&auto=format&fit=crop',
    overview: 'Teenager Riley\'s mind headquarters is undergoing a sudden demolition to make room for something entirely unexpected: new Emotions! Joy, Sadness, Anger, Fear and Disgust, who’ve long been running a successful operation, aren\'t sure how to feel when Anxiety shows up.',
    rating: 8.0,
    genres: ['Animation', 'Family', 'Comedy'],
    trailers: [
      Trailer(id: 't3_1', name: 'Teaser Trailer'),
      Trailer(id: 't3_2', name: 'Official Trailer'),
    ],
  ),
  Movie(
    id: '4',
    title: 'Interstellar',
    posterUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=600&auto=format&fit=crop',
    overview: 'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',
    rating: 8.7,
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    trailers: [
      Trailer(id: 't4_1', name: 'Main Trailer'),
      Trailer(id: 't4_2', name: '10th Anniversary Trailer'),
    ],
  ),
];
