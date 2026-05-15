/*
 * 依据 constructor_2(byte) ~ constructor_5(long) 导图合并：整型路径与边界
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType } from '../../../../hypium/Constant';

export default function BigIntConstructorIntegralTest(): void {
  describe('BigInt 整型构造（导图 constructor_2~5）', () => {
    it('byte 边界 127 / -128', TestType.STANDARD, (): void => {
      const hi: byte = 127;
      const lo: byte = -128;
      expect(new BigInt(hi).toString()).assertEqual('127');
      expect(new BigInt(lo).toString()).assertEqual('-128');
    });

    it('byte 常见值', TestType.STANDARD, (): void => {
      const z: byte = 0;
      const one: byte = 1;
      const neg: byte = -1;
      expect(new BigInt(z).toString()).assertEqual('0');
      expect(new BigInt(one).toString()).assertEqual('1');
      expect(new BigInt(neg).toString()).assertEqual('-1');
    });

    it('short 边界 32767 / -32768', TestType.STANDARD, (): void => {
      const hi: short = 32767;
      const lo: short = -32768;
      expect(new BigInt(hi).toString()).assertEqual('32767');
      expect(new BigInt(lo).toString()).assertEqual('-32768');
    });

    it('int 字面量常用值', TestType.STANDARD, (): void => {
      expect(new BigInt(0).toString()).assertEqual('0');
      expect(new BigInt(1).toString()).assertEqual('1');
      expect(new BigInt(-1).toString()).assertEqual('-1');
      expect(new BigInt(10000).toString()).assertEqual('10000');
      expect(new BigInt(-10000).toString()).assertEqual('-10000');
    });

    it('超大整数用十进制字符串构造', TestType.STANDARD, (): void => {
      expect(new BigInt('9223372036854775807').toString()).assertEqual('9223372036854775807');
    });
  });
}
