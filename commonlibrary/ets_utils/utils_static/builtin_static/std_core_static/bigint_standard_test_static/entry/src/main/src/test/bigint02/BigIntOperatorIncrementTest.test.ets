'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorIncrement测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorIncrementTest(): void {
  describe('BigInt.operatorIncrement（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0100
     * @tc.name testBigIntOperatorIncrementTestBasic0100
     * @tc.desc Verify operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementTestBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v1 = new BigInt(41);
        expect(v1.operatorIncrement().toString()).assertEqual('42');
        const v2 = new BigInt(0);
        expect(v2.operatorIncrement().toString()).assertEqual('1');
        const v3 = new BigInt(-2);
        expect(v3.operatorIncrement().toString()).assertEqual('-1');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0200
     * @tc.name testBigIntOperatorIncrementTestImmutable0200
     * @tc.desc Verify operatorIncrement does not mutate receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementTestImmutable0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(5);
        const orig = v.toString();
        v.operatorIncrement();
        expect(v.toString()).assertEqual(orig);
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0300
     * @tc.name testBigIntOperatorIncrementTestReturnType0300
     * @tc.desc Verify operatorIncrement returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrementTestReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(1).operatorIncrement() instanceof BigInt).assertTrue();
      });
  });
}
