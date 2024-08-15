import 'dart:convert';

import 'package:tourista/features/notification/data/services/notification_services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String cluster = 'ap1';
  final String appKey = '645e69e0cf30d1ca3934';
  final String channelName = 'popup-channel';

  late WebSocketChannel channel;

  void connect() {
    String webSocketUrl = 'wss://ws-$cluster.pusher.com/app/$appKey?protocol=7';
    final wsUrl = Uri.parse(webSocketUrl);
    channel = WebSocketChannel.connect(wsUrl);

    channel.stream.listen(
      (message) {
        final decodedMessage = jsonDecode(message);
        print(decodedMessage);
        LocalNotificationService.showSchduledNotification(
            decodedMessage.toString());
        if (decodedMessage['event'] == 'pusher:connection_established') {
          channel.sink.add(jsonEncode({
            'event': 'pusher:subscribe',
            'data': {
              'channel': channelName,
            },
          }));
        }
        // if (decodedMessage['event'] !=
        //             'pusher_internal:subscription_succeeded' &&
        //         decodedMessage['event'] != 'pusher:connection_established' &&
        //         jsonDecode(decodedMessage['data'])['userId'] == '1'
        //     //   kUserId.toString()
        //     ) {
        //   LocalNotificationService.showSchduledNotification(
        //       decodedMessage.toString());
        // }
      },
      onError: (error) {
        print('Error: $error');
      },
      onDone: () {
        connect(); // Attempt to reconnect
      },
    );
  }
}
