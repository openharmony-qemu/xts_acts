import { AbilityDelegatorRegistry } from '@kit.AbilityKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    it('testAbilityFunction', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      (done: Function) => {
        expect(true).assertTrue();
        done();
      }
    );
  });
}