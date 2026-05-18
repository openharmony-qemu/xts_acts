/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorSubtract测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorSubtractTest(): void {
  describe('BigInt.operatorSubtract（导图 operatorSubtract）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0100
     * @tc.name testBigIntOperatorSubtractBasic0100
     * @tc.desc Verify operatorSubtract basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(12).operatorSubtract(new BigInt(5)).toString()).assertEqual('7');
        expect(new BigInt(20).operatorSubtract(new BigInt(-5)).toString()).assertEqual('25');
        expect(new BigInt(-10).operatorSubtract(new BigInt(5)).toString()).assertEqual('-15');
        expect(new BigInt(-8).operatorSubtract(new BigInt(-3)).toString()).assertEqual('-5');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0200
     * @tc.name testBigIntOperatorSubtractZero0200
     * @tc.desc Verify operatorSubtract zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).operatorSubtract(new BigInt(0)).toString()).assertEqual('42');
        expect(new BigInt(0).operatorSubtract(new BigInt(0)).toString()).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0300
     * @tc.name testBigIntOperatorSubtractLarge0300
     * @tc.desc Verify operatorSubtract large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractLarge0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('99999999999999999999').operatorSubtract(new BigInt('12345678901234567890')).toString()).assertEqual('87654321098765432109');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0400
     * @tc.name testBigIntOperatorSubtractReturnType0400
     * @tc.desc Verify operatorSubtract returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = new BigInt(10).operatorSubtract(new BigInt(3));
        expect(result instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0500
     * @tc.name testBigIntOperatorSubtractInvalidArg0500
     * @tc.desc Verify operatorSubtract rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorSubtract(null as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorSubtract(undefined as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorSubtract('abc' as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorSubtract(123 as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorSubtract(true as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorSubtract({} as BigInt);
        }).assertThrowError('TypeError');
      });
  });
}
