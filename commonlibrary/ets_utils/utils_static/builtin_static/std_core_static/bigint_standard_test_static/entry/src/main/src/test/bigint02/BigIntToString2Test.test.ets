/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toString_2测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToString2Test(): void {
  describe('BigInt.toString(radix int)（导图 toString_2）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0100
     * @tc.name testBigIntToString2Radix0100
     * @tc.desc Verify toString with radix 2-36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Radix0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(255).toString(2)).assertEqual('11111111');
        expect(new BigInt(255).toString(8)).assertEqual('377');
        expect(new BigInt(255).toString(16)).assertEqual('ff');
        expect(new BigInt(36).toString(36)).assertEqual('10');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0200
     * @tc.name testBigIntToString2Negative0200
     * @tc.desc Verify toString radix with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2Negative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(-255).toString(16)).assertEqual('-ff');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_2_0300
     * @tc.name testBigIntToString2InvalidRadix0300
     * @tc.desc Verify toString throws for invalid radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString2InvalidRadix0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(10).toString(1);
        }).assertThrowError('RangeError');
        expect((): void => {
          new BigInt(10).toString(37);
        }).assertThrowError('RangeError');
      });
  });
}
