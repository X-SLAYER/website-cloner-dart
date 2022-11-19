// import 'package:flutter_foreground_task/flutter_foreground_task.dart';

// class ForegroundHelper {
//   ForegroundHelper._();

//   static Future<void> init() async {
//     await FlutterForegroundTask.init(
//       androidNotificationOptions: AndroidNotificationOptions(
//         channelId: 'kids_notif',
//         channelName: 'Kids Protect',
//         channelDescription: 'Votre application est sous surveillance',
//         channelImportance: NotificationChannelImportance.DEFAULT,
//         priority: NotificationPriority.DEFAULT,
//         visibility: NotificationVisibility.VISIBILITY_SECRET,
//         iconData: const NotificationIconData(
//           resType: ResourceType.mipmap,
//           resPrefix: ResourcePrefix.ic,
//           name: 'launcher',
//         ),
//         buttons: [
//           const NotificationButton(id: 'STOP', text: 'Arrêter'),
//           const NotificationButton(id: 'LOCK_SCREEN', text: 'Lock'),
//         ],
//       ),
//       iosNotificationOptions: null,
//       foregroundTaskOptions: const ForegroundTaskOptions(
//         interval: 5000,
//         autoRunOnBoot: true,
//         allowWifiLock: true,
//       ),
//       printDevLog: true,
//     );
//   }
// }
