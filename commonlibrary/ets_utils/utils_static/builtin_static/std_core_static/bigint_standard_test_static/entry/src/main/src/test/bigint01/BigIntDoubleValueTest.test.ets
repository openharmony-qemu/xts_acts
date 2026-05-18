'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_doubleValue测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntDoubleValueTest(): void {
  describe('BigInt.doubleValue（导图 doubleValue）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0100
     * @tc.name testBigIntDoubleValueSigns0100
     * @tc.desc Verify doubleValue for positive, negative, and zero BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSigns0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).doubleValue()).assertEqual(42.0);
        expect(new BigInt(1).doubleValue()).assertEqual(1.0);
        expect(new BigInt(100).doubleValue()).assertEqual(100.0);
        expect(new BigInt(8).doubleValue()).assertEqual(8.0);
        expect(new BigInt(-42).doubleValue()).assertEqual(-42.0);
        expect(new BigInt(-1).doubleValue()).assertEqual(-1.0);
        expect(new BigInt(0).doubleValue()).assertEqual(0.0);
      });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0200
     * @tc.name testBigIntDoubleValueSafeInteger0200
     * @tc.desc Verify doubleValue near Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSafeInteger0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(9007199254740991).doubleValue()).assertEqual(9007199254740991.0);
        const a = new BigInt(9007199254740992).doubleValue();
        const b = new BigInt(9007199254740993).doubleValue();
        expect(a).assertEqual(9007199254740992.0);
        expect(b).assertEqual(9007199254740993.0);
      });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0300
     * @tc.name testBigIntDoubleValueReturnType0300
     * @tc.desc Verify doubleValue returns finite number with zero fractional part for integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const r = new BigInt(42).doubleValue();
        expect(typeof r === 'number').assertTrue();
        expect(r % 1).assertEqual(0);
        const bn = new BigInt(-42);
        const d1 = bn.doubleValue();
        const d2 = bn.doubleValue();
        expect(d1).assertEqual(d2);
      });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0400
     * @tc.name testBigIntDoubleValueFromExpression0400
     * @tc.desc Verify doubleValue on values produced by arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromExpression0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const sum = new BigInt(10).operatorAdd(new BigInt(20));
        expect(sum.doubleValue()).assertEqual(30.0);
      });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0500
     * @tc.name testBigIntDoubleValueNoThrow0500
     * @tc.desc Verify doubleValue does not throw on normal calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNoThrow0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          expect(new BigInt(999999).doubleValue()).assertEqual(999999.0);
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
