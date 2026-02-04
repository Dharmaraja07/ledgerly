import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/network/network_info.dart';
import '../core/sync/sync_manager.dart';

class AppLifecycleCubit extends Cubit<void> {
  final NetworkInfo networkInfo;
  final SyncManager syncManager;

  bool _syncInProgress = false;

  AppLifecycleCubit(
    this.networkInfo,
    this.syncManager,
  ) : super(null);

  Future<void> triggerSync() async {
    if (_syncInProgress) return;

    final connected = await networkInfo.isConnected;
    if (!connected) return;

    _syncInProgress = true;
    try {
      await syncManager.sync();
    } finally {
      _syncInProgress = false;
    }
  }
}
