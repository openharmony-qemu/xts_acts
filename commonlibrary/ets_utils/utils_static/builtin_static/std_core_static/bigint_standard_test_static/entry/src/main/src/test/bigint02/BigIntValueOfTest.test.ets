/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_valueOf测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntValueOfTest(): void {
  describe('BigInt.valueOf（导图 valueOf）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0100
     * @tc.name testBigIntValueOfEquals0100
     * @tc.desc Verify valueOf returns equal BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfEquals0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(123);
        expect(v.valueOf().equals(v)).assertTrue();
        expect(v.valueOf().toString()).assertEqual('123');
        expect(new BigInt(-456).valueOf().toString()).assertEqual('-456');
        expect(new BigInt(0).valueOf().toString()).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0200
     * @tc.name testBigIntValueOfReturnType0200
     * @tc.desc Verify valueOf returns BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfReturnType0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).valueOf() instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_VALUEOF_0300
     * @tc.name testBigIntValueOfStable0300
     * @tc.desc Verify repeated valueOf is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntValueOfStable0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const v = new BigInt(99);
        expect(v.valueOf().equals(v.valueOf())).assertTrue();
      });
  });
}
