/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_getULong测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

function ulongRoundTrip(bi: BigInt): string {
  return BigInt.fromULong(bi.getULong()).toString();
}

export default function BigIntGetULongTest(): void {
  describe('BigInt.getULong（导图 getULong）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0100
     * @tc.name testBigIntGetULongPositive0100
     * @tc.desc Verify getULong for small and medium positive BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongPositive0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).getULong()).assertEqual(42);
        expect(new BigInt(1).getULong()).assertEqual(1);
        expect(new BigInt(100).getULong()).assertEqual(100);
        expect(new BigInt(0).getULong()).assertEqual(0);
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0200
     * @tc.name testBigIntGetULongNegativeAsUnsigned0200
     * @tc.desc Verify negative BigInt values truncate to unsigned 64-bit long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegativeAsUnsigned0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(ulongRoundTrip(new BigInt(-1))).assertEqual('18446744073709551615');
        expect(ulongRoundTrip(new BigInt(-2))).assertEqual('18446744073709551614');
        expect(ulongRoundTrip(new BigInt(-42))).assertEqual('18446744073709551574');
        expect(ulongRoundTrip(new BigInt('-9223372036854775808'))).assertEqual('9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0300
     * @tc.name testBigIntGetULongLargePositive0300
     * @tc.desc Verify getULong for values at and beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongLargePositive0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(ulongRoundTrip(new BigInt('9223372036854775808'))).assertEqual('9223372036854775808');
        expect(ulongRoundTrip(new BigInt('18446744073709551614'))).assertEqual('18446744073709551614');
        expect(ulongRoundTrip(new BigInt('18446744073709551615'))).assertEqual('18446744073709551615');
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0400
     * @tc.name testBigIntGetULongOverflowWrap0400
     * @tc.desc Verify getULong wraps values beyond uint64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongOverflowWrap0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(ulongRoundTrip(new BigInt('18446744073709551616'))).assertEqual('0');
        expect(ulongRoundTrip(new BigInt('18446744073709551617'))).assertEqual('1');
        expect(ulongRoundTrip(new BigInt('18446744073709551716'))).assertEqual('100');
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0500
     * @tc.name testBigIntGetULongFromULongSymmetry0500
     * @tc.desc Verify getULong round-trips with BigInt.fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongFromULongSymmetry0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const cases: BigInt[] = [new BigInt(42), new BigInt(0), new BigInt('18446744073709551615')];
        for (let i = 0; i < cases.length; i++) {
          const original = cases[i];
          const restored = BigInt.fromULong(original.getULong());
          expect(restored.equals(original)).assertTrue();
        }
      });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0600
     * @tc.name testBigIntGetULongNoThrow0600
     * @tc.desc Verify getULong does not throw on large or negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          expect(new BigInt(8).getULong()).assertEqual(8);
          ulongRoundTrip(new BigInt('-99999999999999999999999'));
          ulongRoundTrip(new BigInt('99999999999999999999999'));
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
