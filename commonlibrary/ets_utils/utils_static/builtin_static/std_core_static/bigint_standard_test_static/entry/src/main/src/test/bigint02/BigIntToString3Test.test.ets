'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toString_3测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToString3Test(): void {
  describe('BigInt.toString(radix double)（导图 toString_3）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0100
     * @tc.name testBigIntToString3DoubleRadix0100
     * @tc.desc Verify toString accepts double radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3DoubleRadix0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const radix16: double = 16.0;
        const radix2: double = 2.0;
        const radix8: double = 8.0;
        expect(new BigInt(255).toString(Double.toInt(radix16))).assertEqual('ff');
        expect(new BigInt(10).toString(Double.toInt(radix2))).assertEqual('1010');
        expect(new BigInt(10).toString(Double.toInt(radix8))).assertEqual('12');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_3_0200
     * @tc.name testBigIntToString3Default0200
     * @tc.desc Verify toString without radix is decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString3Default0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toString()).assertEqual('255');
      });
  });
}
