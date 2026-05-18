'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorGreaterThanEqual测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorGreaterThanEqualTest(): void {
  describe('BigInt.operatorGreaterThanEqual（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0100
     * @tc.name testBigIntOperatorGreaterThanEqualBasic0100
     * @tc.desc Verify operatorGreaterThanEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(10).operatorGreaterThanEqual(new BigInt(10))).assertTrue();
        expect(new BigInt(5).operatorGreaterThanEqual(new BigInt(10))).assertFalse();
        expect(new BigInt(10).operatorGreaterThanEqual(new BigInt(5))).assertTrue();
        expect(new BigInt(-5).operatorGreaterThanEqual(new BigInt(-10))).assertTrue();
        expect(new BigInt(0).operatorGreaterThanEqual(new BigInt(0))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0200
     * @tc.name testBigIntOperatorGreaterThanEqualBoundary0200
     * @tc.desc Verify operatorGreaterThanEqual boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(new BigInt(maxSafe).operatorGreaterThanEqual(new BigInt(maxSafe))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0300
     * @tc.name testBigIntOperatorGreaterThanEqualReturnType0300
     * @tc.desc Verify operatorGreaterThanEqual returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof new BigInt(1).operatorGreaterThanEqual(new BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0400
     * @tc.name testBigIntOperatorGreaterThanEqualInvalidArg0400
     * @tc.desc Verify operatorGreaterThanEqual rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualInvalidArg0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorGreaterThanEqual(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
  });
}
