import 'package:intl/intl.dart';

class DateConverter {

  static String formatDate({
    DateTime? dateTime,
    String format = 'MMM dd, yyyy',
  }) {
    try {
      final dt = dateTime ?? DateTime.now();
      return DateFormat(format).format(dt);
    } catch (e) {
      return dateTime?.toString() ?? '';
    }
  }

  static String formatDateRange({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    final start = startDate ?? DateTime.now();
    final end = endDate ?? start;

    final sameMonth = start.month == end.month;
    final sameYear = start.year == end.year;

    if (sameMonth && sameYear) {
      final month = DateFormat('MMMM').format(start);
      final startDay = DateFormat('d').format(start);
      final endDay = DateFormat('d').format(end);
      final year = DateFormat('y').format(start);
      return '$month $startDay–$endDay, $year'; /// "June 15–17, 2025"
    }

    if (!sameMonth && sameYear) {
      final startText = DateFormat('MMMM d').format(start);
      final endText = DateFormat('MMMM d').format(end);
      final year = DateFormat('y').format(start);
      return '$startText – $endText, $year'; /// "June 28 – July 2, 2025"
    }

    final startText = DateFormat('MMMM d, y').format(start);
    final endText = DateFormat('MMMM d, y').format(end);
    return '$startText – $endText'; /// "Dec 30, 2024 – Jan 2, 2025"
  }

  /// Returns time in "hh:mm a" (12-hour) format → 03:45 PM
  static String formatTime({DateTime? dateTime}) {
    final dt = dateTime ?? DateTime.now();
    return DateFormat('hh:mm a').format(dt);
  }

  /// Returns relative time like “5 minutes ago”, “Yesterday”, “2 days ago”, etc.
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) return '${diff.inHours} hr ago';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} week${diff.inDays >= 14 ? 's' : ''} ago';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()} month${diff.inDays >= 60 ? 's' : ''} ago';

    return '${(diff.inDays / 365).floor()} year${diff.inDays >= 730 ? 's' : ''} ago';
  }

  /// Returns formatted date + time (e.g. "Jun 12, 2025 10:30 AM")
  static String formatDateTime({DateTime? dateTime, String pattern = 'MMM dd, yyyy hh:mm a'}) {
    final dt = dateTime ?? DateTime.now();
    return DateFormat(pattern).format(dt);
  }

  /// Converts string → DateTime safely
  static DateTime? parseDate(String? dateString, {String pattern = 'yyyy-MM-dd HH:mm:ss'}) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateFormat(pattern).parse(dateString, true).toLocal();
    } catch (_) {
      return null;
    }
  }

  /// Converts DateTime → ISO8601 string (e.g. "2025-11-12T08:30:00Z")
  static String toIsoString(DateTime? dateTime) {
    final dt = dateTime ?? DateTime.now();
    return dt.toUtc().toIso8601String();
  }

  /// Formats duration like "1h 30m" or "45m"
  static String formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    if (hours > 0 && minutes > 0) return '${hours}h ${minutes}m';
    if (hours > 0) return '${hours}h';
    return '${minutes}m';
  }

  /// Checks if given date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  /// Returns day of week → “Monday”, “Tuesday”, etc.
  static String dayOfWeek(DateTime date) => DateFormat('EEEE').format(date);
}
