/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_pow测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntPowTest(): void {
  describe('BigInt.pow（导图 pow）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_POW_0100
     * @tc.name testBigIntPowBasic0100
     * @tc.desc Verify pow with non-negative exponents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(8).pow(new BigInt(2)).toString()).assertEqual('64');
        expect(new BigInt(2).pow(new BigInt(10)).toString()).assertEqual('1024');
        expect(new BigInt(8).pow(new BigInt(0)).toString()).assertEqual('1');
        expect(new BigInt(8).pow(new BigInt(1)).toString()).assertEqual('8');
        expect(new BigInt(-2).pow(new BigInt(3)).toString()).assertEqual('-8');
        expect(new BigInt(-2).pow(new BigInt(4)).toString()).assertEqual('16');
      });
    /**
     * @tc.number SUB_BIGINT_STD_POW_0200
     * @tc.name testBigIntPowSpecial0200
     * @tc.desc Verify pow special base and exponent cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowSpecial0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0).pow(new BigInt(5)).toString()).assertEqual('0');
        expect(new BigInt(1).pow(new BigInt(100)).toString()).assertEqual('1');
        expect(new BigInt(-1).pow(new BigInt(4)).toString()).assertEqual('1');
        expect(new BigInt(-1).pow(new BigInt(3)).toString()).assertEqual('-1');
      });
    /**
     * @tc.number SUB_BIGINT_STD_POW_0300
     * @tc.name testBigIntPowLarge0300
     * @tc.desc Verify pow with large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLarge0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(2).pow(new BigInt(64)).toString()).assertEqual('18446744073709551616');
        expect(new BigInt(999999999).pow(new BigInt(2)).toString()).assertEqual('999999998000000001');
      });
    /**
     * @tc.number SUB_BIGINT_STD_POW_0400
     * @tc.name testBigIntPowNegativeExponent0400
     * @tc.desc Verify pow throws for negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeExponent0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(8).pow(new BigInt(-1));
        }).assertThrowError('RangeError');
        expect((): void => {
          new BigInt(2).pow(new BigInt(-100));
        }).assertThrowError('RangeError');
      });
    /**
     * @tc.number SUB_BIGINT_STD_POW_0500
     * @tc.name testBigIntPowInvalidArg0500
     * @tc.desc Verify pow rejects invalid exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(8);
        expect((): void => {
          v.pow(null as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          v.pow(undefined as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          v.pow('abc' as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          v.pow(123 as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          v.pow(true as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          v.pow({} as BigInt);
        }).assertThrowError('TypeError');
      });
  });
}
