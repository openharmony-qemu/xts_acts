/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_asIntN测试思维导图.md
 * 注：缺少第二参在 ECMAScript 中运行时抛 TypeError；ArkTS-Sta 对 asIntN 静态要求两参，无法在单测中书写单参调用。
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

function biInt(n: int): BigInt {
  return new BigInt(n);
}

function biStr(s: string): BigInt {
  return new BigInt(s);
}

export default function BigIntAsIntNTest(): void {
  describe('BigInt.asIntN（导图 asIntN）', (): void => {
    it('8 位有符号截断', TestType.STANDARD, (): void => {
      expect(BigInt.asIntN(8, biInt(127)).toString()).assertEqual('127');
      expect(BigInt.asIntN(8, biInt(-128)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, biInt(128)).toString()).assertEqual('-128');
      expect(BigInt.asIntN(8, biInt(255)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(8, biInt(-1)).toString()).assertEqual('-1');
    });

    it('bits=1', TestType.STANDARD, (): void => {
      expect(BigInt.asIntN(1, biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asIntN(1, biInt(1)).toString()).assertEqual('-1');
    });

    it('16 位', TestType.STANDARD, (): void => {
      expect(BigInt.asIntN(16, biInt(32767)).toString()).assertEqual('32767');
      expect(BigInt.asIntN(16, biInt(-32768)).toString()).assertEqual('-32768');
      expect(BigInt.asIntN(16, biInt(-1)).toString()).assertEqual('-1');
    });

    it('32 位全 1 与 2^31', TestType.STANDARD, (): void => {
      expect(BigInt.asIntN(32, biStr('4294967295')).toString()).assertEqual('-1');
      expect(BigInt.asIntN(32, biStr('2147483648')).toString()).assertEqual('-2147483648');
    });

    it('bits 为负抛 RangeError', TestType.STANDARD, (): void => {
      expect((): void => {
        BigInt.asIntN(-1, biInt(5));
      }).assertThrowError('RangeError');
    });

    it('与 asUintN 对 -1 的差异', TestType.STANDARD, (): void => {
      const u = BigInt.asUintN(8, biInt(-1));
      const s = BigInt.asIntN(8, biInt(-1));
      expect(u.toString()).assertEqual('255');
      expect(s.toString()).assertEqual('-1');
    });

    it('零截断', TestType.STANDARD, (): void => {
      expect(BigInt.asIntN(8, biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asIntN(32, biInt(0)).toString()).assertEqual('0');
    });
    return;
  });
}
