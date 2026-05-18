'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_7测试思维导图.md（十进制 string）
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntConstructorStringTest(): void {
  describe('BigInt string 构造（导图 constructor_7）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0100
     * @tc.name testBigIntConstructorStringDecimalPositive0100
     * @tc.desc Verify BigInt construction from positive decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringDecimalPositive0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('0').toString()).assertEqual('0');
        expect(new BigInt('42').toString()).assertEqual('42');
        expect(new BigInt('9007199254740993').toString()).assertEqual('9007199254740993');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0200
     * @tc.name testBigIntConstructorStringDecimalNegative0200
     * @tc.desc Verify BigInt construction from negative decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringDecimalNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('-1').toString()).assertEqual('-1');
        expect(new BigInt('-256').toString()).assertEqual('-256');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0300
     * @tc.name testBigIntConstructorStringLeadingZeros0300
     * @tc.desc Verify BigInt construction ignores leading zeros in decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringLeadingZeros0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('007').toString()).assertEqual('7');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0400
     * @tc.name testBigIntConstructorStringEmptyString0400
     * @tc.desc Verify empty decimal string constructs BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringEmptyString0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('').toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0500
     * @tc.name testBigIntConstructorStringInvalidDecimal0500
     * @tc.desc Verify invalid decimal string throws when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringInvalidDecimal0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const invalidMsg = 'BigInt.parseFromString(): provided string is invalid';
        expect((): void => {
          new BigInt('abc');
        }).assertThrow(invalidMsg);
      });
  });
}
