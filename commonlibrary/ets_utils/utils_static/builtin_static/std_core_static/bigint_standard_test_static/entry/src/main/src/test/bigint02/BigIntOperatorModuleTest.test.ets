/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorModule测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorModuleTest(): void {
  describe('BigInt.operatorModule（导图 operatorModule）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0100
     * @tc.name testBigIntOperatorModuleBasic0100
     * @tc.desc Verify operatorModule basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(12).operatorModule(new BigInt(5)).toString()).assertEqual('2');
        expect(new BigInt(20).operatorModule(new BigInt(-5)).toString()).assertEqual('0');
        expect(new BigInt(-10).operatorModule(new BigInt(3)).toString()).assertEqual('-1');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0200
     * @tc.name testBigIntOperatorModuleZero0200
     * @tc.desc Verify operatorModule zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).operatorModule(new BigInt(10)).toString()).assertEqual('2');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0400
     * @tc.name testBigIntOperatorModuleReturnType0400
     * @tc.desc Verify operatorModule returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = new BigInt(10).operatorModule(new BigInt(3));
        expect(result instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0500
     * @tc.name testBigIntOperatorModuleInvalidArg0500
     * @tc.desc Verify operatorModule rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorModule(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorModule(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorModule('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorModule(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorModule(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MODULE_0600
     * @tc.name testBigIntOperatorModuleDivByZero0600
     * @tc.desc Verify operatorModule throws on zero divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorModuleDivByZero0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(10).operatorModule(new BigInt(0));
        }).assertThrowError('Error');
      });
  });
}
