'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorBitwiseOr测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorBitwiseOrTest(): void {
  describe('BigInt.operatorBitwiseOr（导图 operatorBitwiseOr）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0100
     * @tc.name testBigIntOperatorBitwiseOrBasic0100
     * @tc.desc Verify basic bitwise OR results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(12).operatorBitwiseOr(new BigInt(10)).toString()).assertEqual('14');
        expect(new BigInt(5).operatorBitwiseOr(new BigInt(3)).toString()).assertEqual('7');
        expect(new BigInt(8).operatorBitwiseOr(new BigInt(1)).toString()).assertEqual('9');
        expect(new BigInt(255).operatorBitwiseOr(new BigInt(0)).toString()).assertEqual('255');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0200
     * @tc.name testBigIntOperatorBitwiseOrZeroMask0200
     * @tc.desc Verify zero mask and minus-one saturation for bitwise OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrZeroMask0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt(0);
        const val = new BigInt(42);
        expect(zero.operatorBitwiseOr(val).toString()).assertEqual('42');
        expect(val.operatorBitwiseOr(new BigInt(-1)).toString()).assertEqual('-1');
        expect(new BigInt(-1).operatorBitwiseOr(val).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0300
     * @tc.name testBigIntOperatorBitwiseOrIdempotent0300
     * @tc.desc Verify x or x equals x and commutative property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrIdempotent0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const val = new BigInt(99);
        expect(val.operatorBitwiseOr(val).toString()).assertEqual('99');
        const a = new BigInt(12);
        const b = new BigInt(10);
        expect(a.operatorBitwiseOr(b).toString()).assertEqual(b.operatorBitwiseOr(a).toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0400
     * @tc.name testBigIntOperatorBitwiseOrNegative0400
     * @tc.desc Verify bitwise OR with negative operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrNegative0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(-3).operatorBitwiseOr(new BigInt(-5)).toString()).assertEqual('-1');
        expect(new BigInt(-1).operatorBitwiseOr(new BigInt(255)).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0500
     * @tc.name testBigIntOperatorBitwiseOrReturnType0500
     * @tc.desc Verify operatorBitwiseOr returns BigInt without mutating operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const left = new BigInt(12);
        const right = new BigInt(5);
        const result = left.operatorBitwiseOr(right);
        expect(result instanceof BigInt).assertTrue();
        expect(left.toString()).assertEqual('12');
        expect(right.toString()).assertEqual('5');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0600
     * @tc.name testBigIntOperatorBitwiseOrInvalidArg0600
     * @tc.desc Verify operatorBitwiseOr rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrInvalidArg0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const left = new BigInt(12);
        expect((): void => {
          left.operatorBitwiseOr(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          left.operatorBitwiseOr(undefined as BigInt);
        }).assertThrowError('ClassCastError');
      });
  });
}
