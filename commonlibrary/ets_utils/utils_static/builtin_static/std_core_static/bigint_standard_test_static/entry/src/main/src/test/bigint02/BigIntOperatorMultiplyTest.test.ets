/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorMultiply测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorMultiplyTest(): void {
  describe('BigInt.operatorMultiply（导图 operatorMultiply）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0100
     * @tc.name testBigIntOperatorMultiplyBasic0100
     * @tc.desc Verify operatorMultiply basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(3).operatorMultiply(new BigInt(5)).toString()).assertEqual('15');
        expect(new BigInt(6).operatorMultiply(new BigInt(-2)).toString()).assertEqual('-12');
        expect(new BigInt(-3).operatorMultiply(new BigInt(-4)).toString()).assertEqual('12');
        expect(new BigInt(7).operatorMultiply(new BigInt(7)).toString()).assertEqual('49');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0200
     * @tc.name testBigIntOperatorMultiplyZero0200
     * @tc.desc Verify operatorMultiply zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(100).operatorMultiply(new BigInt(0)).toString()).assertEqual('0');
        expect(new BigInt(99).operatorMultiply(new BigInt(1)).toString()).assertEqual('99');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0300
     * @tc.name testBigIntOperatorMultiplyLarge0300
     * @tc.desc Verify operatorMultiply large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyLarge0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('999999999').operatorMultiply(new BigInt('999999999')).toString()).assertEqual('999999998000000001');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0400
     * @tc.name testBigIntOperatorMultiplyReturnType0400
     * @tc.desc Verify operatorMultiply returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = new BigInt(10).operatorMultiply(new BigInt(3));
        expect(result instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0500
     * @tc.name testBigIntOperatorMultiplyInvalidArg0500
     * @tc.desc Verify operatorMultiply rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorMultiply(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorMultiply(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorMultiply('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorMultiply(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorMultiply(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
  });
}
