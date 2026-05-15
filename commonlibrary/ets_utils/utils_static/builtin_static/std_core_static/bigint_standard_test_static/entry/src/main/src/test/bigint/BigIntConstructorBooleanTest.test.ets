/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_8测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntConstructorBooleanTest(): void {
  describe('BigInt boolean 构造（导图 constructor_8）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0100
     * @tc.name testBigIntConstructorBooleanLiterals0100
     * @tc.desc Verify true maps to 1 and false maps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanLiterals0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(true).toString()).assertEqual('1');
        expect(new BigInt(false).toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_BOOLEAN_0200
     * @tc.name testBigIntConstructorBooleanVariables0200
     * @tc.desc Verify boolean variables construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorBooleanVariables0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const t: boolean = true;
        const f: boolean = false;
        expect(new BigInt(t).toString()).assertEqual('1');
        expect(new BigInt(f).toString()).assertEqual('0');
      });
  });
}
