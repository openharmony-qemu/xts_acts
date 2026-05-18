'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_negate测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntNegateTest(): void {
  describe('BigInt.negate（导图 negate）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0100
     * @tc.name testBigIntNegateSigns0100
     * @tc.desc Verify negate for positive, negative, and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateSigns0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(8).negate().toString()).assertEqual('-8');
        expect(new BigInt(1).negate().toString()).assertEqual('-1');
        expect(new BigInt(-8).negate().toString()).assertEqual('8');
        expect(new BigInt(-1).negate().toString()).assertEqual('1');
        expect(new BigInt(0).negate().toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0200
     * @tc.name testBigIntNegateLarge0200
     * @tc.desc Verify negate on very large BigInt magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const huge = '999999999999999999999999999999';
        expect(new BigInt(huge).negate().toString()).assertEqual('-' + huge);
        expect(new BigInt('-' + huge).negate().toString()).assertEqual(huge);
      });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0300
     * @tc.name testBigIntNegateDoubleNegate0300
     * @tc.desc Verify double negate restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDoubleNegate0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(8).negate().negate().toString()).assertEqual('8');
        expect(new BigInt(-123).negate().negate().toString()).assertEqual('-123');
        expect(new BigInt(0).negate().negate().toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0400
     * @tc.name testBigIntNegateEquivalentMultiply0400
     * @tc.desc Verify negate matches operatorMultiply by negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateEquivalentMultiply0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const value = new BigInt(8);
        const neg = value.negate();
        const mul = value.operatorMultiply(new BigInt(-1));
        expect(neg.toString()).assertEqual(mul.toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0500
     * @tc.name testBigIntNegateReturnType0500
     * @tc.desc Verify negate returns new BigInt without mutating receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const value = new BigInt(8);
        const result = value.negate();
        expect(result instanceof BigInt).assertTrue();
        expect(value.toString()).assertEqual('8');
        expect(result !== value).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_0600
     * @tc.name testBigIntNegateNoThrow0600
     * @tc.desc Verify negate does not throw on normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          expect(new BigInt(8).negate().toString()).assertEqual('-8');
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
