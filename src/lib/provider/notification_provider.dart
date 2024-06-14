import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationState {
  final bool isGlobalNotification;
  final Map<String, bool> individualNotifications;

  NotificationState({
    required this.isGlobalNotification,
    required this.individualNotifications,
  });

  NotificationState copyWith({
    bool? isGlobalNotification,
    Map<String, bool>? individualNotifications,
  }) {
    return NotificationState(
      isGlobalNotification: isGlobalNotification ?? this.isGlobalNotification,
      individualNotifications: individualNotifications ?? this.individualNotifications,
    );
  }
}

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier()
      : super(NotificationState(
          isGlobalNotification: true,
          individualNotifications: {
            'New Job Alert': true,
            'Message from Company': true,
            'New Matches': true,
            'Application Rejection': true,
            'New Certificate Available': true,
          },
        ));

  void toggleGlobalNotification(bool value) {
    state = state.copyWith(isGlobalNotification: value);
  }

  void toggleIndividualNotification(String key, bool value) {
    final newNotifications = Map<String, bool>.from(state.individualNotifications);
    newNotifications[key] = value;
    state = state.copyWith(individualNotifications: newNotifications);
  }
}

final notificationProvider = StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier();
});
