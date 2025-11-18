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
