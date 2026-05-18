/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toLocaleString_1测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToLocaleString1Test(): void {
  describe('BigInt.toLocaleString 无参（导图 toLocaleString_1）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOLOCALE_1_0100
     * @tc.name testBigIntToLocaleString1Default0100
     * @tc.desc Verify default toLocaleString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToLocaleString1Default0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const s = new BigInt(1000000).toLocaleString();
        expect(s.length > 0).assertTrue();
      });
  });
}
