enum Season {
  winter,
  spring,
  summer,
  autumn,
}

String seasonText(Season season) {
  switch (season) {
    case Season.winter:
      return 'شتاء';
    case Season.spring:
      return 'ربيع';
    case Season.summer:
      return 'صيف';
    case Season.autumn:
      return 'خريف';
    default:
      return 'غير معروف';
  }
}

enum TripType {
  exploration,
  recovery,
  activities,
  therapy,
}

String tripTypeText(TripType tripType) {
  switch (tripType) {
    case TripType.activities:
      return 'انشطه';
    case TripType.exploration:
      return 'استكشاف';
    case TripType.recovery:
      return 'نقاهة';
    case TripType.therapy:
      return 'معالجه';
    default:
      return 'غير معروف';
  }
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  const Trip({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });


}
