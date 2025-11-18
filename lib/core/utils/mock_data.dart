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

final streakDays = List.generate(
  10,
  (index) => StreakDay(
    date: DateTime.now().subtract(Duration(days: 9 - index)),
    completed: index <= 8,
    doubleXp: index == 8,
  ),
);

final rewardItems = [
  RewardItem(
    id: 'rw1',
    title: '25% off next bundle',
    points: 240,
    description: 'Use this voucher on any 5-lesson pack with your preferred tutor.',
    tag: 'Popular',
  ),
  RewardItem(
    id: 'rw2',
    title: 'Priority support for a week',
    points: 120,
    description: 'Skip the line when you need to adjust bookings or billing details.',
    tag: 'New',
  ),
  RewardItem(
    id: 'rw3',
    title: 'Coach review on your recording',
    points: 180,
    description: 'Upload a 2-minute clip and get annotated feedback within 24 hours.',
  ),
];

final surveyQuestions = [
  SurveyQuestion(
    id: 'sq1',
    prompt: 'What do you want more of next month?',
    options: ['Speaking drills', 'Listening labs', 'Exam prep', 'Casual conversation'],
  ),
  SurveyQuestion(
    id: 'sq2',
    prompt: 'When do you usually study?',
    options: ['Early morning', 'Lunch break', 'Evening', 'Weekends only'],
  ),
  SurveyQuestion(
    id: 'sq3',
    prompt: 'How do you prefer feedback?',
    options: ['Voice notes', 'Annotated text', 'Live review', 'Short checklists'],
  ),
];

final leaderboardEntries = [
  LeaderboardEntry(
    rank: 1,
    name: 'Sara M.',
    avatarUrl: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
    points: 1420,
    lessons: 82,
    flag: '🇸🇦',
  ),
  LeaderboardEntry(
    rank: 2,
    name: 'Diego R.',
    avatarUrl: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
    points: 1285,
    lessons: 76,
    flag: '🇪🇸',
  ),
  LeaderboardEntry(
    rank: 3,
    name: 'Lina Q.',
    avatarUrl: 'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
    points: 1190,
    lessons: 70,
    flag: '🇪🇬',
  ),
  LeaderboardEntry(
    rank: 4,
    name: 'Kenji T.',
    avatarUrl: 'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg',
    points: 990,
    lessons: 60,
    flag: '🇯🇵',
  ),
  LeaderboardEntry(
    rank: 5,
    name: 'Alex P.',
    avatarUrl: 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg',
    points: 910,
    lessons: 54,
    flag: '🇺🇸',
  ),
];

final immersionExperiences = [
  ImmersionExperience(
    id: 'imx1',
    title: 'Grand Bazaar bargaining sprint',
    city: 'Istanbul',
    imageUrl: 'https://images.pexels.com/photos/1796738/pexels-photo-1796738.jpeg',
    level: 'A2-B2',
    dateLabel: 'Mar 22 · 5:00 PM',
    isGuided: true,
    description: 'Practice negotiation phrases with a mentor shadowing your calls.',
  ),
  ImmersionExperience(
    id: 'imx2',
    title: 'Café conversation circuit',
    city: 'Amman',
    imageUrl: 'https://images.pexels.com/photos/3184183/pexels-photo-3184183.jpeg',
    level: 'B1-C1',
    dateLabel: 'Mar 24 · 7:30 PM',
    isGuided: false,
    description: 'Rotate through themed café tables and swap roles every 12 minutes.',
  ),
  ImmersionExperience(
    id: 'imx3',
    title: 'Market errands challenge',
    city: 'Dubai',
    imageUrl: 'https://images.pexels.com/photos/3186654/pexels-photo-3186654.jpeg',
    level: 'Any',
    dateLabel: 'Mar 27 · 4:00 PM',
    isGuided: true,
    description: 'Follow a checklist of errands, record yourself, and receive annotated notes.',
  ),
];

final mentorThreads = [
  MentorThread(
    id: 'mt1',
    title: 'Coach Yasmin',
    topic: 'Pronunciation polish',
    avatarUrl: 'https://images.pexels.com/photos/3760855/pexels-photo-3760855.jpeg',
    unreadCount: 2,
    messages: [
      MentorMessage(author: 'You', timeLabel: '09:10', text: 'Struggling with soft g vs hard g in Turkish'),
      MentorMessage(
        author: 'Yasmin',
        timeLabel: '09:11',
        text: 'Great catch! Record a 15-second clip saying “g” and “ğ” in contrast.',
        isMentor: true,
      ),
      MentorMessage(
        author: 'Yasmin',
        timeLabel: '09:12',
        text: 'Also try the “güneş” tongue placement—aim softer and smile.',
        isMentor: true,
      ),
    ],
  ),
  MentorThread(
    id: 'mt2',
    title: 'Coach Daniel',
    topic: 'Business pitches',
    avatarUrl: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
    unreadCount: 0,
    messages: [
      MentorMessage(author: 'Daniel', timeLabel: 'Yesterday', text: 'Tighten slide 3: lead with the user quote.', isMentor: true),
      MentorMessage(author: 'You', timeLabel: 'Yesterday', text: 'Updated with the quote and benefit statement.'),
    ],
  ),
  MentorThread(
    id: 'mt3',
    title: 'Coach Rina',
    topic: 'Interview prep',
    avatarUrl: 'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg',
    unreadCount: 1,
    messages: [
      MentorMessage(author: 'Rina', timeLabel: 'Mon', text: 'Let’s rehearse a STAR answer for “biggest challenge”.', isMentor: true),
      MentorMessage(author: 'You', timeLabel: 'Mon', text: 'Sure! I will type one up tonight.'),
      MentorMessage(author: 'Rina', timeLabel: 'Tue', text: 'Add a measurable outcome for clarity.', isMentor: true),
    ],
  ),
];

final guidedProjects = [
  GuidedProject(
    id: 'gp1',
    title: 'City market walkthrough',
    level: 'A2',
    progress: 0.65,
    estimatedMinutes: 30,
    heroImage: 'https://images.pexels.com/photos/1806032/pexels-photo-1806032.jpeg',
    tasks: ['Learn 6 bargaining verbs', 'Record 3 vendor dialogues', 'Self-review with checklists'],
  ),
  GuidedProject(
    id: 'gp2',
    title: 'Customer support mock',
    level: 'B1',
    progress: 0.3,
    estimatedMinutes: 45,
    heroImage: 'https://images.pexels.com/photos/3184306/pexels-photo-3184306.jpeg',
    tasks: ['Draft empathy scripts', 'Shadow call snippets', 'Deliver a 2-min resolution pitch'],
  ),
  GuidedProject(
    id: 'gp3',
    title: 'Founder pitch remix',
    level: 'B2',
    progress: 0.85,
    estimatedMinutes: 35,
    heroImage: 'https://images.pexels.com/photos/1181675/pexels-photo-1181675.jpeg',
    tasks: ['Rewrite hook in target language', 'Record 90-second pitch', 'Collect mentor annotations'],
  ),
];

final fluencyStages = [
  FluencyStage(
    id: 'fs1',
    title: 'Capstone warmup',
    description: 'Stabilize rhythm, vowels, and confidence before final review.',
    progress: 0.45,
    status: 'In progress',
  ),
  FluencyStage(
    id: 'fs2',
    title: 'Mock live interview',
    description: 'Two 12-min simulations with annotated feedback from mentors.',
    progress: 0.2,
    status: 'Scheduled',
  ),
  FluencyStage(
    id: 'fs3',
    title: 'Final showcase',
    description: 'Record your 90-second story and share with your tutor.',
    progress: 0.05,
    status: 'Next up',
  ),
];

final phraseCategories = [
  PhraseCategory(
    id: 'pc1',
    title: 'Travel confidence',
    language: 'Turkish',
    contextLabel: 'Airport & hotel',
    phrases: [
      'Nerede check-in yapabilirim?',
      'Bagajım gecikti, yardım eder misiniz?',
      'Kahvaltı saat kaçta başlıyor?'
    ],
  ),
  PhraseCategory(
    id: 'pc2',
    title: 'Team updates',
    language: 'English',
    contextLabel: 'Daily standup',
    phrases: [
      'I’m blocked by a dependency and need pairing.',
      'Shipping the fix to staging in 30 minutes.',
      'Let’s sync after lunch to demo the flow.'
    ],
  ),
  PhraseCategory(
    id: 'pc3',
    title: 'Polite asks',
    language: 'Arabic',
    contextLabel: 'Café & errands',
    phrases: [
      'من فضلك كوب قهوة بدون سكر.',
      'أين أستطيع استلام الطرد؟',
      'هل يمكنك تكرار ذلك ببطء؟'
    ],
  ),
];
