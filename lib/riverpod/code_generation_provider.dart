import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 1) 어떤 Provider(Provider, FutureProvider, SteamProvider(22년 12월 31일 기준 x)
// 를 사용할지 결정할 고민할 필요 없도록 자동 결정됨
// StateNotifierProvider

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');

@riverpod
String gState(GStateRef ref) { // G대문자로 해줘야 함
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 이렇게 하면 캐싱이 가능해짐
@Riverpod(
  // 살려둬라
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(Duration(seconds: 3));
  return 10;
}

// 2) Parameter > Family 파라미터를 일반 함수처럼 사용할 수 있도록