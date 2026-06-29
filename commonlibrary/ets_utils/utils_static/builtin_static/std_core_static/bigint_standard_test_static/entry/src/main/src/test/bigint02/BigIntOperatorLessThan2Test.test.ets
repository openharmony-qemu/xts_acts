'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorLessThan2Test(): void {
  describe('testBigIntOperatorLessThan2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0100
     * @tc.name testBigIntOperatorLessThan2Test0100
     * @tc.desc operatorLessThan zero-related boundary comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt(0).operatorLessThan(BigInt(1))).assertTrue();
      expect(BigInt(0).operatorLessThan(BigInt(-1))).assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt(-1))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0200
     * @tc.name testBigIntOperatorLessThan2Test0200
     * @tc.desc operatorLessThan across byte/short/int/long min/max boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorLessThan(BigInt(-128))).assertFalse();
      expect(BigInt(-128).operatorLessThan(BigInt(127))).assertTrue();
      expect(BigInt(32767).operatorLessThan(BigInt(127))).assertFalse();
      expect(BigInt(-32768).operatorLessThan(BigInt(-128))).assertTrue();
      expect(BigInt(2147483647).operatorLessThan(BigInt(32767))).assertFalse();
      expect(BigInt(-2147483648).operatorLessThan(BigInt(-32768))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThan(BigInt(2147483647))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt(-2147483648))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0300
     * @tc.name testBigIntOperatorLessThan2Test0300
     * @tc.desc operatorLessThan large positive number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('99999999999999999999').operatorLessThan(BigInt(1))).assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('9223372036854775806').operatorLessThan(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('88888888888888888888').operatorLessThan(BigInt('77777777777777777777'))).assertFalse();
      expect(BigInt('11111111111111111111').operatorLessThan(BigInt('22222222222222222222'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0400
     * @tc.name testBigIntOperatorLessThan2Test0400
     * @tc.desc operatorLessThan large negative number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-22222222222222222222').operatorLessThan(BigInt('-11111111111111111111'))).assertTrue();
      expect(BigInt('-11111111111111111111').operatorLessThan(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThan(BigInt('-9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0500
     * @tc.name testBigIntOperatorLessThan2Test0500
     * @tc.desc operatorLessThan cross-sign and large-value cross comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('99999999999999999999').operatorLessThan(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThan(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('1000000000000000000000000000000').operatorLessThan(BigInt('-1000000000000000000000000000000')))
        .assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt('-9223372036854775808'))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt(1).operatorLessThan(BigInt('-999999999999'))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt('999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0600
     * @tc.name testBigIntOperatorLessThan2Test0600
     * @tc.desc operatorLessThan equal value comparisons return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).operatorLessThan(BigInt(42))).assertFalse();
      expect(BigInt(-42).operatorLessThan(BigInt(-42))).assertFalse();
      expect(BigInt('12345678901234567890').operatorLessThan(BigInt('12345678901234567890'))).assertFalse();
      expect(BigInt('-12345678901234567890').operatorLessThan(BigInt('-12345678901234567890'))).assertFalse();
      expect(BigInt('9223372036854775807').operatorLessThan(BigInt('9223372036854775807'))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0700
     * @tc.name testBigIntOperatorLessThan2Test0700
     * @tc.desc operatorLessThan does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const b = BigInt(200);
      const origA = a.toString();
      const origB = b.toString();
      a.operatorLessThan(b);
      expect(a.toString()).assertEqual(origA);
      expect(b.toString()).assertEqual(origB);

      const c = BigInt(42);
      const d = BigInt(42);
      c.operatorLessThan(d);
      c.operatorLessThan(BigInt(100));
      c.operatorLessThan(BigInt(0));
      expect(c.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0800
     * @tc.name testBigIntOperatorLessThan2Test0800
     * @tc.desc operatorLessThan returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof BigInt(5).operatorLessThan(BigInt(10))).assertEqual('boolean');
      expect(typeof BigInt(10).operatorLessThan(BigInt(5))).assertEqual('boolean');
      expect(typeof BigInt(7).operatorLessThan(BigInt(7))).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0900
     * @tc.name testBigIntOperatorLessThan2Test0900
     * @tc.desc operatorLessThan various construction source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorLessThan(BigInt('100'))).assertFalse();
      expect(BigInt('99').operatorLessThan(BigInt(100))).assertTrue();
      const original = BigInt(50);
      expect(BigInt(original).operatorLessThan(BigInt(51))).assertTrue();
      expect(BigInt(2.0).operatorLessThan(BigInt(3))).assertTrue();
      expect(BigInt(false).operatorLessThan(BigInt(1))).assertTrue();
      expect(BigInt(false).operatorLessThan(BigInt(true))).assertTrue();
      expect(BigInt('-9223372036854775807').operatorLessThan(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1000
     * @tc.name testBigIntOperatorLessThan2Test1000
     * @tc.desc operatorLessThan byte/short/int/long extrema vs zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-128).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt(32767).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-32768).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt(2147483647).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-2147483648).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1100
     * @tc.name testBigIntOperatorLessThan2Test1100
     * @tc.desc operatorLessThan adjacent small value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLessThan(BigInt(127))).assertTrue();
      expect(BigInt(127).operatorLessThan(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1200
     * @tc.name testBigIntOperatorLessThan2Test1200
     * @tc.desc operatorLessThan 超长正整数仅末位不同，小值小于大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('12345678901234567890').operatorLessThan(BigInt('12345678901234567891'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1300
     * @tc.name testBigIntOperatorLessThan2Test1300
     * @tc.desc operatorLessThan 超长负整数仅末位不同，更负值小于更大值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-12345678901234567891').operatorLessThan(BigInt('-12345678901234567890'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1400
     * @tc.name testBigIntOperatorLessThan2Test1400
     * @tc.desc operatorLessThan boolean true 构造的 BigInt(1) 与数值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(true).operatorLessThan(BigInt(1))).assertFalse();
      expect(BigInt(true).operatorLessThan(BigInt(2))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1500
     * @tc.name testBigIntOperatorLessThan2Test1500
     * @tc.desc operatorLessThan double 构造与 int 构造的等值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42.0).operatorLessThan(BigInt(42))).assertFalse();
      expect(BigInt(100.0).operatorLessThan(BigInt(200.0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1600
     * @tc.name testBigIntOperatorLessThan2Test1600
     * @tc.desc operatorLessThan byte/short/int 类型极值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-128).operatorLessThan(BigInt(-127))).assertTrue();
      expect(BigInt(32767).operatorLessThan(BigInt(32768))).assertTrue();
      expect(BigInt(2147483647).operatorLessThan(BigInt(2147483648))).assertTrue();
      expect(BigInt(-2147483648).operatorLessThan(BigInt(2147483647))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1700
     * @tc.name testBigIntOperatorLessThan2Test1700
     * @tc.desc operatorLessThan fromULong 无符号构造的 BigInt 比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).operatorLessThan(BigInt.fromULong(1))).assertTrue();
      expect(BigInt.fromULong(-1).operatorLessThan(BigInt('18446744073709551615'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1800
     * @tc.name testBigIntOperatorLessThan2Test1800
     * @tc.desc operatorLessThan 2的幂相关边界比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLessThan(BigInt(2))).assertTrue();
      expect(BigInt(1024).operatorLessThan(BigInt(1024))).assertFalse();
      expect(BigInt(-1024).operatorLessThan(BigInt(-1023))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_1900
     * @tc.name testBigIntOperatorLessThan2Test1900
     * @tc.desc operatorLessThan 幂运算结果比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(3)).operatorLessThan(BigInt(10))).assertTrue();
      expect(BigInt(1).operatorLessThan(BigInt(2).pow(BigInt(20)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2000
     * @tc.name testBigIntOperatorLessThan2Test2000
     * @tc.desc operatorLessThan 正数取反结果（负数）与原正数比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).negate().operatorLessThan(BigInt(10))).assertTrue();
      expect(BigInt(2).pow(BigInt(20)).negate().operatorLessThan(BigInt(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2100
     * @tc.name testBigIntOperatorLessThan2Test2100
     * @tc.desc operatorLessThan asIntN 截断值与原始值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(4, BigInt(15)).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt.asIntN(4, BigInt(20)).operatorLessThan(BigInt(20))).assertTrue();
      expect(BigInt.asIntN(64, BigInt(100)).operatorLessThan(BigInt(100))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2200
     * @tc.name testBigIntOperatorLessThan2Test2200
     * @tc.desc operatorLessThan asUintN 截断值与原始值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(4, BigInt(20)).operatorLessThan(BigInt(20))).assertTrue();
      expect(BigInt.asUintN(8, BigInt(255)).operatorLessThan(BigInt(256))).assertTrue();
      expect(BigInt.asUintN(64, BigInt(100)).operatorLessThan(BigInt(100))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2300
     * @tc.name testBigIntOperatorLessThan2Test2300
     * @tc.desc operatorLessThan double/long/ulong/string 往返转换后的等值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(100).doubleValue()).operatorLessThan(BigInt(100))).assertFalse();
      expect(BigInt(BigInt(100).getLong()).operatorLessThan(BigInt(100))).assertFalse();
      let uLong=BigInt('18446744073709551615').getULong()
      expect(BigInt.fromULong(uLong).operatorLessThan(BigInt('18446744073709551615')))
        .assertFalse();
      expect(BigInt(BigInt(12345).toString()).operatorLessThan(BigInt(12345))).assertFalse();
      expect(BigInt("0x"+BigInt(255).toString(16)).operatorLessThan(BigInt(255))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2400
     * @tc.name testBigIntOperatorLessThan2Test2400
     * @tc.desc operatorLessThan 相邻大素数级边界比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999989').operatorLessThan(BigInt('999999999999999991'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2500
     * @tc.name testBigIntOperatorLessThan2Test2500
     * @tc.desc operatorLessThan 默认空构造 BigInt(0) 与数值比较
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt().operatorLessThan(BigInt(1))).assertTrue();
      expect(new BigInt().operatorLessThan(BigInt(0))).assertFalse();
      expect(new BigInt().operatorLessThan(BigInt(-1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2600
     * @tc.name testBigIntOperatorLessThan2Test2600
     * @tc.desc operatorLessThan 绝对值对称的正负值，负数小于正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9999999999999999999').operatorLessThan(BigInt('9999999999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_2700
     * @tc.name testBigIntOperatorLessThan2Test2700
     * @tc.desc operatorLessThan on null/undefined/string receiver throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        (null as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (undefined as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        ('abc' as object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (123 as object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (true as object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
    });
  });
}
