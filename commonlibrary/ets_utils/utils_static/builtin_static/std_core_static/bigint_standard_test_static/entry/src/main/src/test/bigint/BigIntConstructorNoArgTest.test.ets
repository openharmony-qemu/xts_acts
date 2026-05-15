/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_1测试思维导图.md 生成
 * ArkTS-Sta：无参构造、返回值、运算与错误场景（可运行部分）
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

export default function BigIntConstructorNoArgTest(): void {
  describe('BigInt 无参构造函数（导图 constructor_1）', () => {
    it('无参 new BigInt() 得到 0', TestType.STANDARD, (): void => {
      const zero = new BigInt();
      expect(zero.toString()).assertEqual('0');
    });

    it('无参与 new BigInt(0) 数值一致', TestType.STANDARD, (): void => {
      const noArg = new BigInt();
      const withZero = new BigInt(0);
      expect(noArg.equals(withZero)).assertTrue();
    });

    it('返回值为 BigInt 实例', TestType.STANDARD, (): void => {
      const zero = new BigInt();
      expect(zero instanceof BigInt).assertTrue();
    });

    it('两次无参构造字符串均为 0（Sta 可能复用引用，不强制 !==）', TestType.STANDARD, (): void => {
      const a = new BigInt();
      const b = new BigInt();
      expect(a.toString()).assertEqual('0');
      expect(b.toString()).assertEqual('0');
      expect(a.toString()).assertEqual(b.toString());
    });

    it('循环多次无参构造均为 0', TestType.STANDARD, (): void => {
      for (let i = 0; i < 10; i++) {
        const v = new BigInt();
        expect(v.toString()).assertEqual('0');
      }
    });

    it('无参实例与 1 相加得 1', TestType.STANDARD, (): void => {
      const zero = new BigInt();
      const one = new BigInt(1);
      expect(zero.operatorAdd(one).toString()).assertEqual('1');
    });

    it('无参实例与 1 比较大小', TestType.STANDARD, (): void => {
      const zero = new BigInt();
      const one = new BigInt(1);
      expect(zero.operatorLessThan(one)).assertTrue();
      expect(zero.operatorGreaterThan(one)).assertFalse();
      expect(zero.equals(zero)).assertTrue();
    });

    it('大量连续无参构造稳定', TestType.STANDARD, (): void => {
      for (let i = 0; i < 1000; i++) {
        const v = new BigInt();
        expect(v.toString()).assertEqual('0');
      }
    });

    it('new BigInt(NaN as double) 应抛错', TestType.STANDARD, (): void => {
      expect((): void => {
        new BigInt(Number.NaN);
      }).assertThrowError('RangeError');
    });

    it('new BigInt(Infinity) 应抛错', TestType.STANDARD, (): void => {
      expect((): void => {
        new BigInt(Number.POSITIVE_INFINITY);
      }).assertThrowError('RangeError');
    });

    it('new BigInt(-Infinity) 应抛错', TestType.STANDARD, (): void => {
      expect((): void => {
        new BigInt(Number.NEGATIVE_INFINITY);
      }).assertThrowError('RangeError');
    });
  });
}
