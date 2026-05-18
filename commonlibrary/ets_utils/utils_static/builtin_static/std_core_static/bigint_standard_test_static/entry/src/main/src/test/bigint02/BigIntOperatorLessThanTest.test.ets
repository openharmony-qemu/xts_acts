/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorLessThan测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorLessThanTest(): void {
  describe('BigInt.operatorLessThan（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0100
     * @tc.name testBigIntOperatorLessThanBasic0100
     * @tc.desc Verify operatorLessThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(3).operatorLessThan(new BigInt(5))).assertTrue();
        expect(new BigInt(-10).operatorLessThan(new BigInt(-3))).assertTrue();
        expect(new BigInt(50).operatorLessThan(new BigInt(100))).assertTrue();
        expect(new BigInt(5).operatorLessThan(new BigInt(3))).assertFalse();
        expect(new BigInt(0).operatorLessThan(new BigInt(0))).assertFalse();
        expect(new BigInt(42).operatorLessThan(new BigInt(42))).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0200
     * @tc.name testBigIntOperatorLessThanBoundary0200
     * @tc.desc Verify operatorLessThan boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(new BigInt(maxSafe).operatorLessThan(new BigInt('9007199254740990'))).assertFalse();
        expect(new BigInt('9007199254740990').operatorLessThan(new BigInt(maxSafe))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0300
     * @tc.name testBigIntOperatorLessThanReturnType0300
     * @tc.desc Verify operatorLessThan returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof new BigInt(1).operatorLessThan(new BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0400
     * @tc.name testBigIntOperatorLessThanInvalidArg0400
     * @tc.desc Verify operatorLessThan rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanInvalidArg0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorLessThan(null as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLessThan(undefined as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLessThan('abc' as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLessThan(123 as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLessThan(true as object as BigInt);
        }).assertThrowError('TypeError');
        expect((): void => {
          a.operatorLessThan({} as BigInt);
        }).assertThrowError('TypeError');
      });
  });
}
