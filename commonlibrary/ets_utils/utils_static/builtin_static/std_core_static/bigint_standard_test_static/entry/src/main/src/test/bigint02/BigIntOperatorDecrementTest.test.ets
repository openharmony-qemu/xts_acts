'use static'
/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_operatorDecrement测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorDecrementTest(): void {
  describe('BigInt.operatorDecrement（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0100
     * @tc.name testBigIntOperatorDecrementTestBasic0100
     * @tc.desc Verify operatorDecrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementTestBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v1 = new BigInt(43);
        expect(v1.operatorDecrement().toString()).assertEqual('42');
        const v2 = new BigInt(1);
        expect(v2.operatorDecrement().toString()).assertEqual('0');
        const v3 = new BigInt(0);
        expect(v3.operatorDecrement().toString()).assertEqual('-1');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0200
     * @tc.name testBigIntOperatorDecrementTestImmutable0200
     * @tc.desc Verify operatorDecrement does not mutate receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementTestImmutable0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(5);
        const orig = v.toString();
        v.operatorDecrement();
        expect(v.toString()).assertEqual(orig);
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DECREMENT_0300
     * @tc.name testBigIntOperatorDecrementTestReturnType0300
     * @tc.desc Verify operatorDecrement returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrementTestReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(1).operatorDecrement() instanceof BigInt).assertTrue();
      });
  });
}
