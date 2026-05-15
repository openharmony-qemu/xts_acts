/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_constructor_6测试思维导图.md
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

export default function BigIntConstructorDoubleTest(): void {
  describe('BigInt double 构造（导图 constructor_6）', () => {
    it('整数 double 0 / 1 / -1', TestType.STANDARD, (): void => {
      expect(new BigInt(0.0).toString()).assertEqual('0');
      expect(new BigInt(1.0).toString()).assertEqual('1');
      expect(new BigInt(-1.0).toString()).assertEqual('-1');
    });

    it('整数 double 100 / -999999', TestType.STANDARD, (): void => {
      expect(new BigInt(100.0).toString()).assertEqual('100');
      expect(new BigInt(-999999.0).toString()).assertEqual('-999999');
    });

    it('+0.0 与 -0.0 均为 0', TestType.STANDARD, (): void => {
      expect(new BigInt(+0.0).toString()).assertEqual('0');
      expect(new BigInt(-0.0).toString()).assertEqual('0');
    });

    it('安全整数边界 double', TestType.STANDARD, (): void => {
      expect(new BigInt(9007199254740991.0).toString()).assertEqual('9007199254740991');
      expect(new BigInt(-9007199254740991.0).toString()).assertEqual('-9007199254740991');
    });

    it('非整数 double 抛错', TestType.STANDARD, (): void => {
      expect((): void => {
        new BigInt(1.5);
      }).assertThrowError('RangeError');
      expect((): void => {
        new BigInt(3.14);
      }).assertThrowError('RangeError');
    });

    it('NaN / Infinity double 抛错', TestType.STANDARD, (): void => {
      expect((): void => {
        new BigInt(Number.NaN);
      }).assertThrowError('RangeError');
      expect((): void => {
        new BigInt(Number.POSITIVE_INFINITY);
      }).assertThrowError('RangeError');
      expect((): void => {
        new BigInt(Number.NEGATIVE_INFINITY);
      }).assertThrowError('RangeError');
    });
  });
}
