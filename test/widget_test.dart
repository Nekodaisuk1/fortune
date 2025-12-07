import 'package:flutter_test/flutter_test.dart';
import 'package:fortune/viewmodel.dart';
import 'package:fortune/model.dart';

ResultNode testFortune(List<bool> answers) {
  final vm = FortuneViewModel();
  vm.restart();
  for (final a in answers) {
    if (vm.isFinished) break;
    vm.answer(a);
  }
  return vm.currentNode as ResultNode;
}

void main() {
  const yes = true;
  const no = false;

  test('エネルギータイプ', () {
    final r = testFortune([yes, yes, yes]);
    expect(r.title, 'エネルギータイプ');
    expect(r.emoji, '🔥');
  });

  test('アクションタイプ', () {
    final r = testFortune([yes, yes, no]);
    expect(r.title, 'アクションタイプ');
    expect(r.emoji, '🎯');
  });

  test('アイデアタイプ', () {
    final r = testFortune([yes, no, yes]);
    expect(r.title, 'アイデアタイプ');
    expect(r.emoji, '💡');
  });

  test('バランスタイプ', () {
    final r = testFortune([yes, no, no]);
    expect(r.title, 'バランスタイプ');
    expect(r.emoji, '🤝');
  });

  test('マイペースタイプ', () {
    final r = testFortune([no, yes, yes]);
    expect(r.title, 'マイペースタイプ');
    expect(r.emoji, '🌱');
  });

  test('安定タイプ', () {
    final r = testFortune([no, yes, no]);
    expect(r.title, '安定タイプ');
    expect(r.emoji, '🧱');
  });

  test('クリエイティブタイプ', () {
    final r = testFortune([no, no, yes]);
    expect(r.title, 'クリエイティブタイプ');
    expect(r.emoji, '🌙');
  });

  test('マイワールドタイプ', () {
    final r = testFortune([no, no, no]);
    expect(r.title, 'マイワールドタイプ');
    expect(r.emoji, '☁️');
  });
}
