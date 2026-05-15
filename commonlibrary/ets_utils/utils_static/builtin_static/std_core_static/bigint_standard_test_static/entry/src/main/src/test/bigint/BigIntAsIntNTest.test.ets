/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_asIntN测试思维导图.md
 * 注：缺少第二参在 ECMAScript 中运行时抛 TypeError；ArkTS-Sta 对 asIntN 静态要求两参，无法在单测中书写单参调用。
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

function biInt(n: int): BigInt {
  return new BigInt(n);
}

function biStr(s: string): BigInt {
  return new BigInt(s);
}

export default function BigIntAsIntNTest(): void {
  describe('BigInt.asIntN（导图 asIntN）', (): void => {
    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0100
     * @tc.name testBigIntAsIntN8Bit0100
     * @tc.desc Verify 8-bit signed truncation via BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN8Bit0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.asIntN(8, biInt(127)).toString()).assertEqual('127');
        expect(BigInt.asIntN(8, biInt(-128)).toString()).assertEqual('-128');
        expect(BigInt.asIntN(8, biInt(128)).toString()).assertEqual('-128');
        expect(BigInt.asIntN(8, biInt(255)).toString()).assertEqual('-1');
        expect(BigInt.asIntN(8, biInt(-1)).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0200
     * @tc.name testBigIntAsIntN1Bit0200
     * @tc.desc Verify 1-bit signed truncation via BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN1Bit0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.asIntN(1, biInt(0)).toString()).assertEqual('0');
        expect(BigInt.asIntN(1, biInt(1)).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0300
     * @tc.name testBigIntAsIntN16Bit0300
     * @tc.desc Verify 16-bit signed truncation via BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN16Bit0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.asIntN(16, biInt(32767)).toString()).assertEqual('32767');
        expect(BigInt.asIntN(16, biInt(-32768)).toString()).assertEqual('-32768');
        expect(BigInt.asIntN(16, biInt(-1)).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0400
     * @tc.name testBigIntAsIntN32Bit0400
     * @tc.desc Verify 32-bit signed truncation for max unsigned and 2^31 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntN32Bit0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.asIntN(32, biStr('4294967295')).toString()).assertEqual('-1');
        expect(BigInt.asIntN(32, biStr('2147483648')).toString()).assertEqual('-2147483648');
      });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0500
     * @tc.name testBigIntAsIntNNegativeBits0500
     * @tc.desc Verify negative bits argument throws RangeError for BigInt.asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNNegativeBits0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          BigInt.asIntN(-1, biInt(5));
        }).assertThrowError('RangeError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0600
     * @tc.name testBigIntAsIntNVersusAsUintN0600
     * @tc.desc Verify asIntN and asUintN differ for negative one at 8 bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNVersusAsUintN0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const u = BigInt.asUintN(8, biInt(-1));
        const s = BigInt.asIntN(8, biInt(-1));
        expect(u.toString()).assertEqual('255');
        expect(s.toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_ASINTN_0700
     * @tc.name testBigIntAsIntNZero0700
     * @tc.desc Verify zero truncates to zero for 8-bit and 32-bit asIntN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntAsIntNZero0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt.asIntN(8, biInt(0)).toString()).assertEqual('0');
        expect(BigInt.asIntN(32, biInt(0)).toString()).assertEqual('0');
      });
  });
}
