/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorLessThanEqual测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorLessThanEqualTest(): void {
  describe('BigInt.operatorLessThanEqual（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0100
     * @tc.name testBigIntOperatorLessThanEqualBasic0100
     * @tc.desc Verify operatorLessThanEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(10).operatorLessThanEqual(new BigInt(10))).assertTrue();
        expect(new BigInt(5).operatorLessThanEqual(new BigInt(10))).assertTrue();
        expect(new BigInt(10).operatorLessThanEqual(new BigInt(5))).assertFalse();
        expect(new BigInt(-5).operatorLessThanEqual(new BigInt(-10))).assertFalse();
        expect(new BigInt(0).operatorLessThanEqual(new BigInt(0))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0200
     * @tc.name testBigIntOperatorLessThanEqualBoundary0200
     * @tc.desc Verify operatorLessThanEqual boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(new BigInt(maxSafe).operatorLessThanEqual(new BigInt(maxSafe))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0300
     * @tc.name testBigIntOperatorLessThanEqualReturnType0300
     * @tc.desc Verify operatorLessThanEqual returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof new BigInt(1).operatorLessThanEqual(new BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0400
     * @tc.name testBigIntOperatorLessThanEqualInvalidArg0400
     * @tc.desc Verify operatorLessThanEqual rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualInvalidArg0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorLessThanEqual(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
  });
}
