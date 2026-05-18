/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorBitwiseNot测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorBitwiseNotTest(): void {
  describe('BigInt.operatorBitwiseNot（导图 operatorBitwiseNot）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0100
     * @tc.name testBigIntOperatorBitwiseNotBasic0100
     * @tc.desc Verify basic bitwise NOT results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
        expect(new BigInt(-1).operatorBitwiseNot().toString()).assertEqual('0');
        expect(new BigInt(1).operatorBitwiseNot().toString()).assertEqual('-2');
        expect(new BigInt(-2).operatorBitwiseNot().toString()).assertEqual('1');
        expect(new BigInt(5).operatorBitwiseNot().toString()).assertEqual('-6');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0200
     * @tc.name testBigIntOperatorBitwiseNotFormula0200
     * @tc.desc Verify ~x equals -(x+1) for sample values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotFormula0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const x = new BigInt(100);
        const notX = x.operatorBitwiseNot();
        const minusXPlus1 = x.operatorAdd(new BigInt(1)).negate();
        expect(notX.toString()).assertEqual(minusXPlus1.toString());
        expect(new BigInt(999).operatorBitwiseNot().toString()).assertEqual('-1000');
        expect(new BigInt(-100).operatorBitwiseNot().toString()).assertEqual('99');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0300
     * @tc.name testBigIntOperatorBitwiseNotDouble0300
     * @tc.desc Verify double bitwise NOT restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotDouble0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('42');
        expect(new BigInt(-42).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-42');
        expect(new BigInt(0).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0400
     * @tc.name testBigIntOperatorBitwiseNotLarge0400
     * @tc.desc Verify bitwise NOT on large BigInt magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLarge0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const big = '999999999999999999999';
        const notBig = new BigInt(big).operatorBitwiseNot();
        const expected = new BigInt(big).operatorAdd(new BigInt(1)).negate();
        expect(notBig.toString()).assertEqual(expected.toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0500
     * @tc.name testBigIntOperatorBitwiseNotReturnType0500
     * @tc.desc Verify operatorBitwiseNot returns BigInt distinct from operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const five = new BigInt(5);
        const result = five.operatorBitwiseNot();
        expect(result instanceof BigInt).assertTrue();
        expect(result.equals(five)).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0600
     * @tc.name testBigIntOperatorBitwiseNotNoThrow0600
     * @tc.desc Verify operatorBitwiseNot does not throw on normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          new BigInt(5).operatorBitwiseNot();
          new BigInt('9999999999999999999999999').operatorBitwiseNot();
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
