import 'package:mixin_bot_sdk_dart/mixin_bot_sdk_dart.dart';
import 'package:mixin_bot_sdk_dart/src/client.dart';
import 'package:test/test.dart';

import 'config.dart';

void main() {
  group('user apis', () {
    final client = Client(
      userId: uid,
      sessionId: sid,
      privateKey: private,
    );

    test('test getMe', () async {
      final resp = await client.accountApi.getMe();
      print(resp.data.toJson());
    });

    test('test getSignalCountKey', () async {
      final resp = await client.accountApi.getSignalKeyCount();
      print(resp.data.toString());
    });

    test('test logout', () async {
      await client.accountApi.logout(LogoutRequest(sid)).then((response) {});
    });

    test('test push signal keys', () async {
      await client.accountApi.pushSignalKeys({
        'identity_key': 'BcXnEPyxpRPfR637nI3KgCU6We2H9prpiaV1rE5qt99s',
        'one_time_pre_keys': [
          {
            'key_id': 1126195,
            'pub_key': 'BRSLKyumHm2x46o+JqSCRwHqX5FBy6H+0eOuBVGOEDwK'
          },
          {
            'key_id': 1126196,
            'pub_key': 'BaOfAdGrRm50DyUWRYKRogXjQvDxFq2asnLTU+7AIpZy'
          },
          {
            'key_id': 1126197,
            'pub_key': 'BdY4tizPp7obVStDu8JNwTmOdqk+jWv+pifBRXsVAFgl'
          }
        ],
        'signed_pre_key': {
          'signature':
              'Q9JWLXVLPKLDSvZxDnjdzZCn5tj9fe1PRpGTCuSlt/tZJg9ctwrIsFynEWrfT6wUNXPQkgyQgBwSw8kbhWVeAg\u003d\u003d',
          'key_id': 11000934,
          'pub_key': 'Bbs8UjA3rAMNueNWZrdqZJ7exRxTQOaVsJFQ5jeiHn0p'
        }
      }).then((response) => {print('response: $response')});
    });
  });
}
