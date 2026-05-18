/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_toString_1测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntToString1Test(): void {
  describe('BigInt.toString 无参（导图 toString_1）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0100
     * @tc.name testBigIntToString1Decimal0100
     * @tc.desc Verify no-arg toString returns decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Decimal0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).toString()).assertEqual('42');
        expect(new BigInt(-42).toString()).assertEqual('-42');
        expect(new BigInt(0).toString()).assertEqual('0');
        expect(new BigInt(9007199254740993).toString()).assertEqual('9007199254740993');
      });
    /**
     * @tc.number SUB_BIGINT_STD_TOSTRING_1_0200
     * @tc.name testBigIntToString1Large0200
     * @tc.desc Verify toString on very large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntToString1Large0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('999999999999999999999999999999').toString())
          .assertEqual('999999999999999999999999999999');
      });
  });
}
