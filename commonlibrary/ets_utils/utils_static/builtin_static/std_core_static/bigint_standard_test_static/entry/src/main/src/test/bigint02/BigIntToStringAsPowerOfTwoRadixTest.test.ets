'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toStringAsPowerOfTwoRadix测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToStringAsPowerOfTwoRadixTest(): void {
  describe('BigInt.toStringAsPowerOfTwoRadix（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0100
     * @tc.name testBigIntToStringAsPowerOfTwoRadix0100
     * @tc.desc Verify valid power-of-two radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadix0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toStringAsPowerOfTwoRadix(16)).assertEqual('ff');
        expect(new BigInt(8).toStringAsPowerOfTwoRadix(2)).assertEqual('1000');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_POT_RADIX_0200
     * @tc.name testBigIntToStringAsPowerOfTwoRadixInvalid0200
     * @tc.desc Verify invalid radix throws on current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToStringAsPowerOfTwoRadixInvalid0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(255);
        expect(v.toStringAsPowerOfTwoRadix(3).length > 0).assertTrue();
        expect((): void => {
          v.toStringAsPowerOfTwoRadix(0);
        }).assertThrowError('Error');
        expect((): void => {
          v.toStringAsPowerOfTwoRadix(-2);
        }).assertThrowError('Error');
      });
  });
}
