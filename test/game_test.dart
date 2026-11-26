import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_iz_surme/oyun_iz_surme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(izSurmeConfig.title.length, 33);
    expect(izSurmeConfig.tagline.length, 33);
    for (final s in izSurmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(izSurmeConfig.gameId, izSurmeId);
    expect(izSurmeRules.gameId, izSurmeId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(izSurmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: izSurmeId, optionalMechanics: izSurmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(izSurmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
