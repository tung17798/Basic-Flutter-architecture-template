import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'domain_method_channel.dart';

abstract class DomainPlatform extends PlatformInterface {
  /// Constructs a DomainPlatform.
  DomainPlatform() : super(token: _token);

  static final Object _token = Object();

  static DomainPlatform _instance = MethodChannelDomain();

  /// The default instance of [DomainPlatform] to use.
  ///
  /// Defaults to [MethodChannelDomain].
  static DomainPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DomainPlatform] when
  /// they register themselves.
  static set instance(DomainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
