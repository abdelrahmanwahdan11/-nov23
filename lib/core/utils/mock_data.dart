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

final mockNotifications = [
  AppNotification(
    id: 'n1',
    title: 'New Turkish super tutors',
    body: 'We added 8 new certified tutors specialized in speaking practice.',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    type: 'update',
  ),
  AppNotification(
    id: 'n2',
    title: 'Booking reminder',
    body: 'Your trial session is tomorrow at 6:00 PM. Join a few minutes early.',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
    type: 'reminder',
  ),
  AppNotification(
    id: 'n3',
    title: 'Success stories',
    body: 'Learners rated conversational drills 4.9/5 this month.',
    timestamp: DateTime.now().subtract(const Duration(days: 3)),
    type: 'insight',
  ),
];

final mockMilestones = [
  LearningMilestone(
    id: 'm1',
    title: 'Complete your first trial',
    subtitle: 'Book a 25-min trial to unlock your roadmap.',
    progress: 0.6,
  ),
  LearningMilestone(
    id: 'm2',
    title: 'Finish 3 sessions',
    subtitle: 'Stay consistent this week with three short calls.',
    progress: 0.4,
  ),
  LearningMilestone(
    id: 'm3',
    title: 'Pronunciation sprint',
    subtitle: 'Practice difficult sounds with spaced repetition.',
    progress: 0.8,
  ),
];
