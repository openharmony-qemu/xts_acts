/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_7测试思维导图.md（十进制 string）
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

export default function BigIntConstructorStringTest(): void {
  describe('BigInt string 构造（导图 constructor_7）', () => {
    it('十进制正数字符串', TestType.STANDARD, (): void => {
      expect(new BigInt('0').toString()).assertEqual('0');
      expect(new BigInt('42').toString()).assertEqual('42');
      expect(new BigInt('9007199254740993').toString()).assertEqual('9007199254740993');
    });

    it('十进制负数字符串', TestType.STANDARD, (): void => {
      expect(new BigInt('-1').toString()).assertEqual('-1');
      expect(new BigInt('-256').toString()).assertEqual('-256');
    });

    it('前导零', TestType.STANDARD, (): void => {
      expect(new BigInt('007').toString()).assertEqual('7');
    });

    it('非法十进制字符串抛错', TestType.STANDARD, (): void => {
      expect((): void => {
        new BigInt('abc');
      }).assertThrowError('Error');
      expect((): void => {
        new BigInt('');
      }).assertThrowError('Error');
    });
  });
}
