import 'models.dart';

final mockGoals = [
  Goal(id: '1', title: 'Improve speaking', description: 'Feel confident in daily conversations.'),
  Goal(id: '2', title: 'Prepare for exam', description: 'Ace your proficiency test with targeted practice.'),
  Goal(id: '3', title: 'Travel better', description: 'Pick up phrases that help you explore with ease.'),
  Goal(id: '4', title: 'For work', description: 'Communicate clearly with teammates and clients.'),
];

final mockTutors = List.generate(12, (index) {
  return Tutor(
    id: 'tutor_$index',
    name: 'Aylin Kaya #$index',
    avatarUrl: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
    country: 'Turkey',
    flagEmoji: '🇹🇷',
    isSuperTutor: index.isEven,
    isTopRated: index % 3 == 0,
    isPopularChoice: index % 2 == 0,
    pricePerLesson: 18 + index,
    rating: 4.6,
    reviewsCount: 210 + index,
    studentsCount: 1200 + index * 5,
    lessonsCount: 3400 + index * 10,
    nativeLanguage: 'Turkish',
    otherLanguages: const ['English', 'Arabic'],
    shortDescription: 'Friendly tutor focusing on speaking confidence.',
    aboutMe: 'I love helping learners grow with immersive sessions and actionable feedback.',
    tags: const ['Popular choice', 'Refundable', 'High demand'],
    videoThumbnailUrl: 'https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg',
    locationImageUrl: 'https://images.pexels.com/photos/338515/pexels-photo-338515.jpeg',
  );
});

final mockSessions = [
  LessonSession(
    id: 'session_1',
    tutorId: 'tutor_1',
    language: 'Turkish',
    durationMinutes: 30,
    date: DateTime.now().add(const Duration(days: 2)),
    time: '6:00 PM',
    price: 18,
    isTrial: true,
  ),
  LessonSession(
    id: 'session_2',
    tutorId: 'tutor_2',
    language: 'English',
    durationMinutes: 60,
    date: DateTime.now().add(const Duration(days: 7)),
    time: '10:00 AM',
    price: 32,
    isTrial: false,
  ),
];
