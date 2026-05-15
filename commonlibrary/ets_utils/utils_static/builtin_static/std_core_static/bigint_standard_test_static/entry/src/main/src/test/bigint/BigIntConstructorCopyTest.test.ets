/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_9测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

export default function BigIntConstructorCopyTest(): void {
  describe('BigInt 拷贝构造（导图 constructor_9）', () => {
    it('拷贝构造数值相等', TestType.STANDARD, (): void => {
      const original = new BigInt(42);
      const copied = new BigInt(original);
      expect(copied.equals(original)).assertTrue();
      expect(copied.toString()).assertEqual('42');
    });

    it('拷贝与大字符串源一致', TestType.STANDARD, (): void => {
      const original = new BigInt('9007199254740993');
      const copied = new BigInt(original);
      expect(copied.equals(original)).assertTrue();
    });

    it('拷贝与源数值一致（Sta 可能复用引用，不强制 !==）', TestType.STANDARD, (): void => {
      const original = new BigInt(1);
      const copied = new BigInt(original);
      expect(copied.equals(original)).assertTrue();
      expect(copied.toString()).assertEqual('1');
    });
  });
}
