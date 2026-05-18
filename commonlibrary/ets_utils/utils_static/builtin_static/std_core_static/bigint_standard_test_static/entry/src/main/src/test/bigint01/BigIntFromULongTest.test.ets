'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_fromULong测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntFromULongTest(): void {
  describe('BigInt.fromULong（导图 fromULong）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0100
     * @tc.name testBigIntFromULongPositiveValues0100
     * @tc.desc Verify BigInt.fromULong maps non-negative long values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongPositiveValues0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.fromULong(0).toString()).assertEqual('0');
        expect(BigInt.fromULong(1).toString()).assertEqual('1');
        expect(BigInt.fromULong(100).toString()).assertEqual('100');
        expect(BigInt.fromULong(2147483647).toString()).assertEqual('2147483647');
        expect(BigInt.fromULong(2147483648).toString()).assertEqual('2147483648');
        expect(BigInt.fromULong(4294967295).toString()).assertEqual('4294967295');
        expect(BigInt.fromULong(4294967296).toString()).assertEqual('4294967296');
        expect(BigInt.fromULong(9223372036854775807).toString()).assertEqual('9223372036854775807');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0200
     * @tc.name testBigIntFromULongUnsignedInterpretation0200
     * @tc.desc Verify negative long arguments are interpreted as unsigned 64-bit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongUnsignedInterpretation0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
        expect(BigInt.fromULong(-2).toString()).assertEqual('18446744073709551614');
        expect(BigInt.fromULong(-100).toString()).assertEqual('18446744073709551516');
        expect(BigInt.fromULong(-2147483648).toString()).assertEqual('18446744071562067968');
        expect(BigInt.fromULong(-4294967296).toString()).assertEqual('18446744069414584320');
        expect(BigInt.fromULong(-9223372036854775808).toString()).assertEqual('9223372036854775808');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0300
     * @tc.name testBigIntFromULongReturnType0300
     * @tc.desc Verify fromULong returns a non-null BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = BigInt.fromULong(1);
        expect(result instanceof BigInt).assertTrue();
        expect(result.toString()).assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0400
     * @tc.name testBigIntFromULongVsSignedValue0400
     * @tc.desc Compare fromULong with valueOf for positive and negative long inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongVsSignedValue0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const unsignedPos = BigInt.fromULong(100);
        const signedPos = new BigInt(100);
        expect(unsignedPos.toString()).assertEqual(signedPos.toString());
        const unsignedNeg = BigInt.fromULong(-1);
        const signedNeg = new BigInt(-1);
        expect(unsignedNeg.toString()).assertEqual('18446744073709551615');
        expect(signedNeg.toString()).assertEqual('-1');
        expect(unsignedNeg.equals(signedNeg)).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0500
     * @tc.name testBigIntFromULongResultUsable0500
     * @tc.desc Verify fromULong result supports add, equals, and toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongResultUsable0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt.fromULong(5);
        const sum = a.operatorAdd(new BigInt(3));
        expect(sum.toString()).assertEqual('8');
        const hundred = BigInt.fromULong(100);
        expect(hundred.equals(new BigInt(100))).assertTrue();
        expect(BigInt.fromULong(123).toString()).assertEqual('123');
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0600
     * @tc.name testBigIntFromULongNormalPathNoThrow0600
     * @tc.desc Verify fromULong on valid input does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongNormalPathNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          BigInt.fromULong(1);
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_FROMULONG_0700
     * @tc.name testBigIntFromULongInvalidArgThrows0700
     * @tc.desc Verify fromULong rejects null cast to long at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongInvalidArgThrows0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          BigInt.fromULong(null as long);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          BigInt.fromULong(undefined as long);
        }).assertThrowError('ClassCastError');
      });
  });
}
