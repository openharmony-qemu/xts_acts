'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_positive测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntPositiveTest(): void {
  describe('BigInt.positive（导图 positive）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0100
     * @tc.name testBigIntPositiveSignCases0100
     * @tc.desc Verify positive() for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveSignCases0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(123).positive()).assertTrue();
        expect(new BigInt(-123).positive()).assertFalse();
        expect(new BigInt(0).positive()).assertTrue();
        expect(new BigInt(1).positive()).assertTrue();
        expect(new BigInt(-1).positive()).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0200
     * @tc.name testBigIntPositiveComplementNegative0200
     * @tc.desc Verify positive and negative are complementary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveComplementNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).positive()).assertTrue();
        expect(new BigInt(42).negative()).assertFalse();
        expect(new BigInt(-42).positive()).assertFalse();
        expect(new BigInt(-42).negative()).assertTrue();
        expect(new BigInt(0).positive()).assertTrue();
        expect(new BigInt(0).negative()).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0300
     * @tc.name testBigIntPositiveReturnType0300
     * @tc.desc Verify positive returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof new BigInt(1).positive() === 'boolean').assertTrue();
      });
  });
}
