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

class CommunityPost {
  CommunityPost({
    required this.id,
    required this.author,
    required this.avatarUrl,
    required this.title,
    required this.body,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.tags,
  });

  final String id;
  final String author;
  final String avatarUrl;
  final String title;
  final String body;
  final String timeAgo;
  final int likes;
  final int comments;
  final List<String> tags;
}

class PracticeDrill {
  PracticeDrill({
    required this.id,
    required this.title,
    required this.focus,
    required this.duration,
    required this.difficulty,
    required this.energy,
    required this.description,
    this.isNew = false,
  });

  final String id;
  final String title;
  final String focus;
  final String duration;
  final String difficulty;
  final String energy;
  final String description;
  final bool isNew;
}

class LiveEvent {
  LiveEvent({
    required this.id,
    required this.title,
    required this.host,
    required this.dateTime,
    required this.duration,
    required this.mode,
    required this.coverUrl,
    required this.spotsLeft,
  });

  final String id;
  final String title;
  final String host;
  final DateTime dateTime;
  final String duration;
  final String mode;
  final String coverUrl;
  final int spotsLeft;
}

class CertificateItem {
  CertificateItem({
    required this.id,
    required this.title,
    required this.issuer,
    required this.level,
    required this.earnedOn,
    required this.badge,
  });

  final String id;
  final String title;
  final String issuer;
  final String level;
  final DateTime earnedOn;
  final String badge;
}

class PlacementSection {
  PlacementSection({required this.id, required this.title, required this.subtitle, required this.completed});

  final String id;
  final String title;
  final String subtitle;
  final bool completed;
}

class CoachTip {
  CoachTip({
    required this.id,
    required this.title,
    required this.summary,
    required this.category,
    required this.isNew,
  });

  final String id;
  final String title;
  final String summary;
  final String category;
  final bool isNew;
}

class InsightMetric {
  InsightMetric({
    required this.id,
    required this.label,
    required this.value,
    required this.delta,
    required this.isPositive,
  });

  final String id;
  final String label;
  final String value;
  final String delta;
  final bool isPositive;
}

class StreakDay {
  StreakDay({required this.date, required this.completed, this.doubleXp = false});

  final DateTime date;
  final bool completed;
  final bool doubleXp;
}

class RewardItem {
  RewardItem({required this.id, required this.title, required this.points, required this.description, this.tag});

  final String id;
  final String title;
  final int points;
  final String description;
  final String? tag;
}

class SurveyQuestion {
  SurveyQuestion({required this.id, required this.prompt, required this.options});

  final String id;
  final String prompt;
  final List<String> options;
}

class LeaderboardEntry {
  LeaderboardEntry({
    required this.rank,
    required this.name,
    required this.avatarUrl,
    required this.points,
    required this.lessons,
    required this.flag,
  });

  final int rank;
  final String name;
  final String avatarUrl;
  final int points;
  final int lessons;
  final String flag;
}

class ImmersionExperience {
  ImmersionExperience({
    required this.id,
    required this.title,
    required this.city,
    required this.imageUrl,
    required this.level,
    required this.dateLabel,
    required this.isGuided,
    required this.description,
  });

  final String id;
  final String title;
  final String city;
  final String imageUrl;
  final String level;
  final String dateLabel;
  final bool isGuided;
  final String description;
}

class MentorMessage {
  MentorMessage({required this.author, required this.timeLabel, required this.text, this.isMentor = false});

  final String author;
  final String timeLabel;
  final String text;
  final bool isMentor;
}

class MentorThread {
  MentorThread({
    required this.id,
    required this.title,
    required this.topic,
    required this.avatarUrl,
    required this.unreadCount,
    required this.messages,
  });

  final String id;
  final String title;
  final String topic;
  final String avatarUrl;
  final int unreadCount;
  final List<MentorMessage> messages;
}

class GuidedProject {
  GuidedProject({
    required this.id,
    required this.title,
    required this.level,
    required this.progress,
    required this.estimatedMinutes,
    required this.tasks,
    required this.heroImage,
  });

  final String id;
  final String title;
  final String level;
  final double progress;
  final int estimatedMinutes;
  final List<String> tasks;
  final String heroImage;
}

class FluencyStage {
  FluencyStage({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.status,
  });

  final String id;
  final String title;
  final String description;
  final double progress;
  final String status;
}

class PhraseCategory {
  PhraseCategory({
    required this.id,
    required this.title,
    required this.language,
    required this.contextLabel,
    required this.phrases,
  });

  final String id;
  final String title;
  final String language;
  final String contextLabel;
  final List<String> phrases;
}

class CapstoneReview {
  CapstoneReview({
    required this.id,
    required this.title,
    required this.status,
    required this.mentor,
    required this.progress,
    required this.nextStep,
    required this.milestones,
    required this.heroImage,
  });

  final String id;
  final String title;
  final String status;
  final String mentor;
  final double progress;
  final String nextStep;
  final List<String> milestones;
  final String heroImage;
}

class DownloadableKit {
  DownloadableKit({
    required this.id,
    required this.title,
    required this.description,
    required this.sizeLabel,
    required this.updatedAt,
    required this.coverImage,
    this.isPinned = false,
  });

  final String id;
  final String title;
  final String description;
  final String sizeLabel;
  final String updatedAt;
  final String coverImage;
  final bool isPinned;
}

class MasteryChecklist {
  MasteryChecklist({
    required this.id,
    required this.title,
    required this.summary,
    required this.progress,
    required this.actions,
    required this.coach,
  });

  final String id;
  final String title;
  final String summary;
  final double progress;
  final List<String> actions;
  final String coach;
}

class PortfolioItem {
  PortfolioItem({
    required this.id,
    required this.title,
    required this.category,
    required this.updatedAt,
    required this.status,
    required this.coverImage,
    required this.highlight,
  });

  final String id;
  final String title;
  final String category;
  final String updatedAt;
  final String status;
  final String coverImage;
  final String highlight;
}

class CareerGuide {
  CareerGuide({
    required this.id,
    required this.title,
    required this.category,
    required this.duration,
    required this.summary,
  });

  final String id;
  final String title;
  final String category;
  final String duration;
  final String summary;
}

class InterviewQuestion {
  InterviewQuestion({
    required this.id,
    required this.question,
    required this.answer,
    required this.level,
  });

  final String id;
  final String question;
  final String answer;
  final String level;
}

class AlumniSpotlight {
  AlumniSpotlight({
    required this.id,
    required this.name,
    required this.role,
    required this.company,
    required this.story,
    required this.avatarUrl,
  });

  final String id;
  final String name;
  final String role;
  final String company;
  final String story;
  final String avatarUrl;
}

class SuccessStory {
  SuccessStory({
    required this.id,
    required this.name,
    required this.role,
    required this.company,
    required this.quote,
    required this.avatarUrl,
    required this.highlight,
    required this.skills,
  });

  final String id;
  final String name;
  final String role;
  final String company;
  final String quote;
  final String avatarUrl;
  final String highlight;
  final List<String> skills;
}

class ScholarshipOpportunity {
  ScholarshipOpportunity({
    required this.id,
    required this.title,
    required this.provider,
    required this.amount,
    required this.deadline,
    required this.level,
    required this.summary,
    required this.tag,
  });

  final String id;
  final String title;
  final String provider;
  final String amount;
  final String deadline;
  final String level;
  final String summary;
  final String tag;
}

class InternshipOpportunity {
  InternshipOpportunity({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.stipend,
    required this.type,
    required this.deadline,
    required this.tags,
    required this.description,
  });

  final String id;
  final String title;
  final String company;
  final String location;
  final String stipend;
  final String type;
  final String deadline;
  final List<String> tags;
  final String description;
}

class NewsArticle {
  NewsArticle({
    required this.id,
    required this.title,
    required this.source,
    required this.summary,
    required this.publishedAt,
    required this.imageUrl,
    required this.tag,
  });

  final String id;
  final String title;
  final String source;
  final String summary;
  final String publishedAt;
  final String imageUrl;
  final String tag;
}
