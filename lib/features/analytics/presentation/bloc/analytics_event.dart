abstract class AnalyticsEvent {}

class LoadAnalytics extends AnalyticsEvent {
  final String groupId;
  LoadAnalytics(this.groupId);
}
