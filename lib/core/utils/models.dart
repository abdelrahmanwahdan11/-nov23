class Tutor {
  Tutor({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.country,
    required this.flagEmoji,
    required this.isSuperTutor,
    required this.isTopRated,
    required this.isPopularChoice,
    required this.pricePerLesson,
    required this.rating,
    required this.reviewsCount,
    required this.studentsCount,
    required this.lessonsCount,
    required this.nativeLanguage,
    required this.otherLanguages,
    required this.shortDescription,
    required this.aboutMe,
    required this.tags,
    required this.videoThumbnailUrl,
    required this.locationImageUrl,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final String country;
  final String flagEmoji;
  final bool isSuperTutor;
  final bool isTopRated;
  final bool isPopularChoice;
  final double pricePerLesson;
  final double rating;
  final int reviewsCount;
  final int studentsCount;
  final int lessonsCount;
  final String nativeLanguage;
  final List<String> otherLanguages;
  final String shortDescription;
  final String aboutMe;
  final List<String> tags;
  final String videoThumbnailUrl;
  final String locationImageUrl;
}

class LessonSession {
  LessonSession({
    required this.id,
    required this.tutorId,
    required this.language,
    required this.durationMinutes,
    required this.date,
    required this.time,
    required this.price,
    required this.isTrial,
  });

  final String id;
  final String tutorId;
  final String language;
  final int durationMinutes;
  final DateTime date;
  final String time;
  final double price;
  final bool isTrial;
}

class Goal {
  Goal({required this.id, required this.title, required this.description});
  final String id;
  final String title;
  final String description;
}

class AppNotification {
  AppNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.timestamp,
    required this.type,
  });

  final String id;
  final String title;
  final String body;
  final DateTime timestamp;
  final String type;
}

class LearningMilestone {
  LearningMilestone({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  final String id;
  final String title;
  final String subtitle;
  final double progress;
}

class SessionStep {
  SessionStep({required this.label, required this.description, required this.isDone});

  final String label;
  final String description;
  final bool isDone;
}

class Achievement {
  Achievement({required this.id, required this.title, required this.subtitle, required this.progress, this.earned = false});

  final String id;
  final String title;
  final String subtitle;
  final double progress;
  final bool earned;
}

class FaqItem {
  FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}

class PlannerDay {
  PlannerDay({required this.date, required this.focus, required this.sessions});

  final DateTime date;
  final String focus;
  final List<LessonSession> sessions;
}

class SessionNote {
  SessionNote({required this.title, required this.snippet, required this.date});

  final String title;
  final String snippet;
  final DateTime date;
}

class Invoice {
  Invoice({required this.id, required this.label, required this.amount, required this.date, required this.status});

  final String id;
  final String label;
  final double amount;
  final DateTime date;
  final String status;
}

class JournalEntry {
  JournalEntry({required this.id, required this.title, required this.body, required this.date});

  final String id;
  final String title;
  final String body;
  final DateTime date;
}

class ResourceItem {
  ResourceItem({required this.id, required this.title, required this.type, required this.duration, required this.description});

  final String id;
  final String title;
  final String type;
  final String duration;
  final String description;
}
