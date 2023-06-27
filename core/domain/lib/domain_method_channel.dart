import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'domain_platform_interface.dart';

/// An implementation of [DomainPlatform] that uses method channels.
class MethodChannelDomain extends DomainPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('domain');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
