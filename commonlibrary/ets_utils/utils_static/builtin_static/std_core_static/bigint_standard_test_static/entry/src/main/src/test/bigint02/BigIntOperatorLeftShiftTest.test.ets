/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorLeftShift测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorLeftShiftTest(): void {
  describe('BigInt.operatorLeftShift（导图 operatorLeftShift）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0100
     * @tc.name testBigIntOperatorLeftShiftBasic0100
     * @tc.desc Verify operatorLeftShift basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(1).operatorLeftShift(new BigInt(8)).toString()).assertEqual('256');
        expect(new BigInt(5).operatorLeftShift(new BigInt(1)).toString()).assertEqual('10');
        expect(new BigInt(-1).operatorLeftShift(new BigInt(1)).toString()).assertEqual('-2');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0200
     * @tc.name testBigIntOperatorLeftShiftZero0200
     * @tc.desc Verify operatorLeftShift with zero shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).operatorLeftShift(new BigInt(0)).toString()).assertEqual('42');
        expect(new BigInt(0).operatorLeftShift(new BigInt(5)).toString()).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0300
     * @tc.name testBigIntOperatorLeftShiftReturn0300
     * @tc.desc Verify operatorLeftShift returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftReturn0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(1).operatorLeftShift(new BigInt(2)) instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0400
     * @tc.name testBigIntOperatorLeftShiftInvalid0400
     * @tc.desc Verify operatorLeftShift rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftInvalid0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(1);
        expect((): void => {
          a.operatorLeftShift(null as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLeftShift(undefined as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLeftShift('abc' as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLeftShift(123 as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLeftShift(true as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLeftShift({} as BigInt);
        }).assertThrowError('TypeError');
      });
  });
}
