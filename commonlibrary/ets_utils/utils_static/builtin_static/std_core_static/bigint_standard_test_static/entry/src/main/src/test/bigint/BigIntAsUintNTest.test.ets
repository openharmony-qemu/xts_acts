/*
 * 依据 /Users/yuhu/word/harmony/test/BigInt_asUintN测试思维导图.md（ArkTS-Sta API）
 * 注：缺少第二参在 ECMAScript 中运行时抛 TypeError；ArkTS-Sta 对 asUintN 静态要求两参，无法在单测中书写单参调用。
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

function biInt(n: int): BigInt {
  return new BigInt(n);
}

function biStr(s: string): BigInt {
  return new BigInt(s);
}

export default function BigIntAsUintNTest(): void {
  describe('BigInt.asUintN（导图 asUintN）', (): void => {
    it('正常两参 8/32 位', TestType.STANDARD, (): void => {
      expect(BigInt.asUintN(8, biInt(127)).toString()).assertEqual('127');
      expect(BigInt.asUintN(32, biStr('4294967295')).toString()).assertEqual('4294967295');
    });

    it('bits=1 截断', TestType.STANDARD, (): void => {
      expect(BigInt.asUintN(1, biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, biInt(1)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, biInt(2)).toString()).assertEqual('0');
      expect(BigInt.asUintN(1, biInt(3)).toString()).assertEqual('1');
      expect(BigInt.asUintN(1, biInt(-1)).toString()).assertEqual('1');
    });

    it('bits=8 边界与溢出', TestType.STANDARD, (): void => {
      expect(BigInt.asUintN(8, biInt(255)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, biInt(256)).toString()).assertEqual('0');
      expect(BigInt.asUintN(8, biInt(257)).toString()).assertEqual('1');
      expect(BigInt.asUintN(8, biInt(-1)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, biInt(-128)).toString()).assertEqual('128');
      expect(BigInt.asUintN(8, biInt(-256)).toString()).assertEqual('0');
    });

    it('bits=16/32/64 最大值', TestType.STANDARD, (): void => {
      expect(BigInt.asUintN(16, biInt(65535)).toString()).assertEqual('65535');
      expect(BigInt.asUintN(16, biInt(65536)).toString()).assertEqual('0');
      expect(BigInt.asUintN(32, biStr('4294967295')).toString()).assertEqual('4294967295');
      expect(BigInt.asUintN(32, biStr('4294967296')).toString()).assertEqual('0');
      expect(BigInt.asUintN(64, biStr('18446744073709551615')).toString()).assertEqual('18446744073709551615');
      expect(BigInt.asUintN(64, biStr('18446744073709551616')).toString()).assertEqual('0');
    });

    it('bits=0 得 0', TestType.STANDARD, (): void => {
      expect(BigInt.asUintN(0, biInt(0)).toString()).assertEqual('0');
      expect(BigInt.asUintN(0, biInt(5)).toString()).assertEqual('0');
    });

    it('bits 为负抛 RangeError', TestType.STANDARD, (): void => {
      expect((): void => {
        BigInt.asUintN(-1, biInt(5));
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt.asUintN(-100, biInt(5));
      }).assertThrowError('RangeError');
    });

    it('与 asIntN 对比（8 位）', TestType.STANDARD, (): void => {
      const u = BigInt.asUintN(8, biInt(200));
      const s = BigInt.asIntN(8, biInt(200));
      expect(u.toString()).assertEqual('200');
      expect(s.toString()).assertEqual('-56');
      expect(BigInt.asUintN(8, biInt(127)).equals(BigInt.asIntN(8, biInt(127)))).assertTrue();
    });

    it('模等价 8 位 300', TestType.STANDARD, (): void => {
      const masked = BigInt.asUintN(8, biInt(300));
      const mod256 = biInt(300).operatorModule(biInt(256));
      const alt = mod256.operatorLessThan(biInt(0)) ? mod256.operatorAdd(biInt(256)) : mod256;
      expect(masked.equals(alt)).assertTrue();
      expect(masked.toString()).assertEqual('44');
    });

    it('连续截断幂等', TestType.STANDARD, (): void => {
      const x = biInt(12345);
      const once = BigInt.asUintN(8, x);
      const twice = BigInt.asUintN(8, once);
      expect(once.equals(twice)).assertTrue();
    });

    it('大指数截断 64 位', TestType.STANDARD, (): void => {
      const p100 = biInt(2).pow(biInt(100));
      expect(BigInt.asUintN(64, p100).toString()).assertEqual('0');
    });
    return;
  });
}
