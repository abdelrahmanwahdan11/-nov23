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

final communityPosts = [
  CommunityPost(
    id: 'c1',
    author: 'Mariam',
    avatarUrl: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg',
    title: 'How I stopped translating in my head',
    body: 'Shadowed 5 minutes daily, recorded myself, and asked my tutor for two micro-fixes per call.',
    timeAgo: '2h ago',
    likes: 124,
    comments: 18,
    tags: const ['Mindset', 'Speaking'],
  ),
  CommunityPost(
    id: 'c2',
    author: 'Diego',
    avatarUrl: 'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
    title: 'Shared slides for job interviews',
    body: 'Added bilingual prompts for every slide and practiced with timers. Feel free to copy the structure!',
    timeAgo: '5h ago',
    likes: 86,
    comments: 12,
    tags: const ['Career', 'Templates'],
  ),
  CommunityPost(
    id: 'c3',
    author: 'Aya',
    avatarUrl: 'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg',
    title: 'Weekend speaking challenge',
    body: 'Recording 3 short monologues this weekend. Who wants to swap notes?',
    timeAgo: '1d ago',
    likes: 62,
    comments: 9,
    tags: const ['Challenges', 'Speaking'],
  ),
];

final practiceDrills = [
  PracticeDrill(
    id: 'p1',
    title: 'Confidence warmup',
    focus: 'Intonation & fillers',
    duration: '8 min',
    difficulty: 'Easy',
    energy: 'Low energy',
    description: 'Start with low-stakes shadowing and copy two native pauses.',
    isNew: true,
  ),
  PracticeDrill(
    id: 'p2',
    title: 'Role-play: airport check-in',
    focus: 'Travel',
    duration: '12 min',
    difficulty: 'Medium',
    energy: 'Medium',
    description: 'Act as passenger and agent, swap roles and record quick notes.',
  ),
  PracticeDrill(
    id: 'p3',
    title: 'Business standups',
    focus: 'Work updates',
    duration: '10 min',
    difficulty: 'Medium',
    energy: 'High',
    description: 'Practice concise updates with timing cues and escalation phrases.',
  ),
  PracticeDrill(
    id: 'p4',
    title: 'Pronunciation sprints',
    focus: 'Sounds & rhythm',
    duration: '6 min',
    difficulty: 'Hard',
    energy: 'High',
    description: 'Alternate between minimal pairs and tongue twisters with breaks.',
  ),
];

final liveEvents = [
  LiveEvent(
    id: 'e1',
    title: 'Speaking circle: travel stories',
    host: 'Coach Aylin',
    dateTime: DateTime.now().add(const Duration(days: 1, hours: 3)),
    duration: '45 min',
    mode: 'Live room',
    coverUrl: 'https://images.pexels.com/photos/5428835/pexels-photo-5428835.jpeg',
    spotsLeft: 12,
  ),
  LiveEvent(
    id: 'e2',
    title: 'Pronunciation lab: tricky vowels',
    host: 'Coach Diego',
    dateTime: DateTime.now().add(const Duration(days: 2, hours: 5)),
    duration: '30 min',
    mode: 'Workshop',
    coverUrl: 'https://images.pexels.com/photos/3184339/pexels-photo-3184339.jpeg',
    spotsLeft: 6,
  ),
  LiveEvent(
    id: 'e3',
    title: 'Interview clinic',
    host: 'Coach Mariam',
    dateTime: DateTime.now().add(const Duration(days: 4)),
    duration: '50 min',
    mode: 'Live room',
    coverUrl: 'https://images.pexels.com/photos/1181671/pexels-photo-1181671.jpeg',
    spotsLeft: 18,
  ),
];

final certificates = [
  CertificateItem(
    id: 'cert1',
    title: 'Conversational Turkish',
    issuer: 'LinguaTutor',
    level: 'Level A2',
    earnedOn: DateTime.now().subtract(const Duration(days: 14)),
    badge: 'Speaking badge',
  ),
  CertificateItem(
    id: 'cert2',
    title: 'Business English',
    issuer: 'LinguaTutor',
    level: 'Level B1',
    earnedOn: DateTime.now().subtract(const Duration(days: 40)),
    badge: 'Professional badge',
  ),
  CertificateItem(
    id: 'cert3',
    title: 'Grammar foundation',
    issuer: 'LinguaTutor',
    level: 'Level A1',
    earnedOn: DateTime.now().subtract(const Duration(days: 90)),
    badge: 'Starter badge',
  ),
];

final placementSections = [
  PlacementSection(
    id: 'ps1',
    title: 'Micro interview',
    subtitle: 'Record 5 prompts so we can rate fluency and speed.',
    completed: true,
  ),
  PlacementSection(
    id: 'ps2',
    title: 'Listening check',
    subtitle: 'Match 10 clips to their intents and flag tricky parts.',
    completed: false,
  ),
  PlacementSection(
    id: 'ps3',
    title: 'Placement report',
    subtitle: 'We summarize your CEFR range and recommend tutors.',
    completed: false,
  ),
];

final coachTips = [
  CoachTip(
    id: 'ct1',
    title: 'Warm up with 5-minute retells',
    summary: 'Choose a news article and retell it with 3 key vocab swaps before each session.',
    category: 'Speaking',
    isNew: true,
  ),
  CoachTip(
    id: 'ct2',
    title: 'Shadow once, then record',
    summary: 'Shadow a 60-second clip, then record yourself and compare tone for self-feedback.',
    category: 'Listening',
    isNew: false,
  ),
  CoachTip(
    id: 'ct3',
    title: 'Micro goals for confidence',
    summary: 'Set a daily micro goal like “ask for a discount politely” and log it in your journal.',
    category: 'Mindset',
    isNew: false,
  ),
];

final insightMetrics = [
  InsightMetric(
    id: 'im1',
    label: 'Weekly speaking time',
    value: '86 min',
    delta: '+18% vs last week',
    isPositive: true,
  ),
  InsightMetric(
    id: 'im2',
    label: 'Listening drills',
    value: '12 completed',
    delta: '-2 vs target',
    isPositive: false,
  ),
  InsightMetric(
    id: 'im3',
    label: 'Vocabulary added',
    value: '34 words',
    delta: '+9 this week',
    isPositive: true,
  ),
];
