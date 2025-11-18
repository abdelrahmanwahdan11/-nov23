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

final pastSessions = [
  LessonSession(
    id: 'session_3',
    tutorId: 'tutor_3',
    language: 'Arabic',
    durationMinutes: 45,
    date: DateTime.now().subtract(const Duration(days: 3)),
    time: '8:00 PM',
    price: 24,
    isTrial: false,
  )
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

final sessionSteps = [
  SessionStep(label: 'Preparation', description: 'Tutor reviews your placement quiz.', isDone: true),
  SessionStep(label: 'Warm up', description: '5-min chit chat to loosen up speaking.', isDone: true),
  SessionStep(label: 'Main drill', description: 'Role-play booking a hotel room.', isDone: false),
  SessionStep(label: 'Feedback', description: 'Receive pronunciation notes and homework.', isDone: false),
];

final achievements = [
  Achievement(
    id: 'a1',
    title: 'Streak starter',
    subtitle: 'Attend 2 sessions in one week.',
    progress: 0.8,
    earned: true,
  ),
  Achievement(
    id: 'a2',
    title: 'Confident speaker',
    subtitle: 'Log 120 speaking minutes.',
    progress: 0.35,
  ),
  Achievement(
    id: 'a3',
    title: 'Vocabulary collector',
    subtitle: 'Save 50 new words to your deck.',
    progress: 0.55,
  ),
];

final faqs = [
  FaqItem(
    question: 'How do I reschedule a session?',
    answer: 'Open the booking details and choose a new slot. We keep your notes synced.',
  ),
  FaqItem(
    question: 'Can I learn offline?',
    answer: 'You can download homework packs from your tutor profile for offline practice.',
  ),
  FaqItem(
    question: 'Do you support kids lessons?',
    answer: 'Yes, filter tutors by "Kids friendly" and look for the badge on their cards.',
  ),
];

final plannerDays = List.generate(7, (index) {
  final date = DateTime.now().add(Duration(days: index));
  return PlannerDay(
    date: date,
    focus: index == 0 ? 'Pronunciation drills' : 'Conversation warmups',
    sessions: mockSessions
        .map((s) => LessonSession(
              id: '${s.id}_$index',
              tutorId: s.tutorId,
              language: s.language,
              durationMinutes: s.durationMinutes,
              date: date,
              time: s.time,
              price: s.price,
              isTrial: s.isTrial,
            ))
        .toList(),
  );
});

final sessionNotes = [
  SessionNote(
    title: 'Feedback on vowels',
    snippet: 'Practice long/short sounds, record 3 clips before Friday.',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  SessionNote(
    title: 'Homework pack',
    snippet: 'Tutor shared 12 flashcards and a role-play script.',
    date: DateTime.now().subtract(const Duration(days: 4)),
  ),
];

final invoices = [
  Invoice(
    id: 'inv-1201',
    label: 'Trial lesson with Aylin',
    amount: 18,
    date: DateTime.now().subtract(const Duration(days: 2)),
    status: 'Paid',
  ),
  Invoice(
    id: 'inv-1202',
    label: '60-min package',
    amount: 54,
    date: DateTime.now().subtract(const Duration(days: 10)),
    status: 'Pending',
  ),
  Invoice(
    id: 'inv-1203',
    label: 'Vocabulary booster pack',
    amount: 12,
    date: DateTime.now().subtract(const Duration(days: 14)),
    status: 'Refunded',
  ),
];

final journalEntries = [
  JournalEntry(
    id: 'j1',
    title: 'Ordering coffee',
    body: 'Practiced polite forms and filler words, need to slow down the intro.',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  JournalEntry(
    id: 'j2',
    title: 'Meeting kickoff',
    body: 'Prepared a bilingual agenda and nailed the greeting transitions.',
    date: DateTime.now().subtract(const Duration(days: 3)),
  ),
];

final mockResources = [
  ResourceItem(
    id: 'r1',
    title: 'Speak faster with shadowing',
    type: 'Audio drill',
    duration: '12 min',
    description: 'Follow along a native speaker to copy rhythm and intonation.',
  ),
  ResourceItem(
    id: 'r2',
    title: 'Survival phrases for travel',
    type: 'Guide',
    duration: '7 pages',
    description: 'Downloadable phrasebook covering airports, cafes, and taxis.',
  ),
  ResourceItem(
    id: 'r3',
    title: 'Pronunciation warmups',
    type: 'Video',
    duration: '9 min',
    description: 'Short warmup routine before each live tutor session.',
  ),
  ResourceItem(
    id: 'r4',
    title: 'Business small talk pack',
    type: 'Checklist',
    duration: '5 min',
    description: 'Icebreakers and openers to start meetings smoothly.',
  ),
];
