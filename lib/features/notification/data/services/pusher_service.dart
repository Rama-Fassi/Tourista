import 'dart:convert';

import 'package:tourista/constants.dart';
import 'package:tourista/features/notification/data/services/notification_services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  final String cluster = 'us2';
  final String appKey = 'a45dd1092196ff68d73e';
  final String channelName = 'quiet-guide-971';

  late WebSocketChannel channel;

  void connect() {
    String webSocketUrl =
        'wss://ws-$cluster.pusher.com/app/$appKey?client=custom_client_id&protocol=7&channel=$channelName';
    final wsUrl = Uri.parse(webSocketUrl);
    channel = WebSocketChannel.connect(wsUrl);
    channel.stream.listen(
      (message) {
        final decodedMessage = jsonDecode(message);

        if (decodedMessage['event'] == 'pusher:connection_established') {
          // Subscribe to the channel after the connection is established
          channel.sink.add(jsonEncode({
            'event': 'pusher:subscribe',
            'data': {'channel': channelName, "auth": kToken}
          }));
        }

        if (decodedMessage['event'] != 'pusher:connection_established' &&
            decodedMessage['event'] != 'pusher:subscribe' &&
            decodedMessage['event'] !=
                'pusher_internal:subscription_succeeded') {
          LocalNotificationService.showSchduledNotification(
              decodedMessage.toString());
        }
      },
    );
  }

  void subscribeToPrivateChannel(String authKey) {
    channel.sink.add(
        '{"event":"pusher:subscribe","data":{"channel":"$channelName","auth":"$authKey"}}');
  }
}
