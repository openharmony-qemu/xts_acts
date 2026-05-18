/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toStringAsDecimal测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToStringAsDecimalTest(): void {
  describe('BigInt.toStringAsDecimal（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_DECIMAL_0100
     * @tc.name testBigIntToStringAsDecimal0100
     * @tc.desc Verify toStringAsDecimal output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsDecimal0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toStringAsDecimal()).assertEqual('255');
        expect(new BigInt(-42).toStringAsDecimal()).assertEqual('42');
      });
  });
}
