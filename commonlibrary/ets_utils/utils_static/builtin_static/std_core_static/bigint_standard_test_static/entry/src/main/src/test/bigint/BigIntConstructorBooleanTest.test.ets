/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_8测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

export default function BigIntConstructorBooleanTest(): void {
  describe('BigInt boolean 构造（导图 constructor_8）', () => {
    it('true -> 1, false -> 0', TestType.STANDARD, (): void => {
      expect(new BigInt(true).toString()).assertEqual('1');
      expect(new BigInt(false).toString()).assertEqual('0');
    });

    it('boolean 变量', TestType.STANDARD, (): void => {
      const t: boolean = true;
      const f: boolean = false;
      expect(new BigInt(t).toString()).assertEqual('1');
      expect(new BigInt(f).toString()).assertEqual('0');
    });
  });
}
