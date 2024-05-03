import 'dart:io';
import 'dart:convert';
import 'main.dart';
import 'dart:async'; 
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

enum MqttCurrentConnectionState {
  IDLE,
  CONNECTING,
  CONNECTED,
  DISCONNECTED,
  ERROR_WHEN_CONNECTING
}

enum MqttSubscriptionState {
  IDLE,
  SUBSCRIBED
}

class MQTTClientWrapper {

  late MqttServerClient client;

  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;

  void prepareMqttClient() async {
    _setupMqttClient();
    await _connectClient();
    _subscribeToTopic('fall_detection/alert');
    publishMessage('hello1');
  }

  Future<void> _connectClient() async {
    try {
      print('client baglaniyor...');
      connectionState = MqttCurrentConnectionState.CONNECTING;
      await client.connect('cokgucluisim', 'cokguclubirsifre');
    } on Exception catch (e) {
      print('client hata - $e');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      connectionState = MqttCurrentConnectionState.CONNECTED;
      print('client baglandi');
    } else {
      print(
          'hata client baglantisi basarisiz - baglanti kesiliyor, durum ${client.connectionStatus}');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }
  }

  void _setupMqttClient() {
    client = MqttServerClient.withPort('12b10b214cce489e91869af533703219.s1.eu.hivemq.cloud', 'flutter', 8883);
    client.secure = true;
    client.securityContext = SecurityContext.defaultContext;
    client.keepAlivePeriod = 20;
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.onSubscribed = _onSubscribed;
  }
  

  void _subscribeToTopic(String topicName) {
    print(' $topicName basligina abone olunuyor');
    client.subscribe(topicName, MqttQos.atMostOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      var message = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print('Yeni bir mesaj geldi:');
      print(message);
      if(message == "fallen")
        isFallDetected = true;
      else if(message == "kapali"){
        isRaspiConnected = true;
        isAlarmActive = false;
        timer3?.cancel();
        timer3 = Timer.periodic(Duration(seconds: 150), (Timer t) {
        isRaspiConnected = false;
  });
        
        }
    
      else if(message == "acik"){
        isRaspiConnected = true;
        isAlarmActive = true;
        timer3?.cancel();
        timer3 = Timer.periodic(Duration(seconds: 150), (Timer t) {
        isRaspiConnected = false;
  });
        
        
        }

      else
      {
        decodedImage = base64.decode(message);
      }
    }

    
    );

  }

  void publishMessage(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);

    print('Mesaj gonderiliyor: "$message" Su basliga: ${'fall_detection/alert'}');
    client.publishMessage('fall_detection/alert', MqttQos.exactlyOnce, builder.payload!);
  }

  void _onSubscribed(String topic) {
    print('Abone dogrulandi $topic');
    subscriptionState = MqttSubscriptionState.SUBSCRIBED;
  }

  void _onDisconnected() {
    print('client baglantisi kesildi');
    connectionState = MqttCurrentConnectionState.DISCONNECTED;
  }

  void _onConnected() {
    connectionState = MqttCurrentConnectionState.CONNECTED;
    print('client baglantisi basarili');
  }

}
