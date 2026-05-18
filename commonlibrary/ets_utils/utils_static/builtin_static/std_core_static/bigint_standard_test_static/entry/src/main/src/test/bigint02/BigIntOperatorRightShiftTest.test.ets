/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorRightShift测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorRightShiftTest(): void {
  describe('BigInt.operatorRightShift（导图 operatorRightShift）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0100
     * @tc.name testBigIntOperatorRightShiftBasic0100
     * @tc.desc Verify operatorRightShift basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(256).operatorRightShift(new BigInt(8)).toString()).assertEqual('1');
        expect(new BigInt(10).operatorRightShift(new BigInt(1)).toString()).assertEqual('5');
        expect(new BigInt(-8).operatorRightShift(new BigInt(1)).toString()).assertEqual('-4');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0200
     * @tc.name testBigIntOperatorRightShiftNegative0200
     * @tc.desc Verify operatorRightShift on negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(-1).operatorRightShift(new BigInt(100)).toString()).assertEqual('-1');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0300
     * @tc.name testBigIntOperatorRightShiftInvalid0300
     * @tc.desc Verify operatorRightShift rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftInvalid0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(256);
        expect((): void => {
          a.operatorRightShift(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
  });
}
