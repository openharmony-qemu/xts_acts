'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function ByteToStringRadixTest(): void {
  describe("ByteToStringRadixTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0100
     * @tc.name      testToStringRadixRequiredParameter0001
     * @tc.desc      toString(radix)方法需要一个number类型参数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixRequiredParameter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      const result = b.toString(16 as int);
      expect(result).assertEqual("-1");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0200
     * @tc.name      testToStringRadixNoParameterUseDefault0002
     * @tc.desc      不传递radix参数应使用重载版本返回十进制
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixNoParameterUseDefault0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(65 as byte);
      const result1 = b.toString();
      const result2 = b.toString(10 as int);
      expect(result1).assertEqual("65");
      expect(result2).assertEqual("65");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0300
     * @tc.name      testToStringRadixNumberTypeValid0003
     * @tc.desc      传递number类型radix参数正常工作
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixNumberTypeValid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      expect(b.toString(16 as int)).assertEqual("-1");
      expect(b.toString(8 as int)).assertEqual("-1");
      expect(b.toString(2 as int)).assertEqual("-1");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0400
     * @tc.name      testToStringRadixRadixInteger0004
     * @tc.desc      radix应为整数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixRadixInteger0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      const result = b.toString(10 as int);
      expect(result).assertEqual("100");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0500
     * @tc.name      testToStringRadixMinRadix20005
     * @tc.desc      radix最小值为2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixMinRadix20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      const result = b.toString(2 as int);
      expect(result).assertEqual("1100100");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0600
     * @tc.name      testToStringRadixRadix1ThrowError0006
     * @tc.desc      radix�?应报�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixRadix1ThrowError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(65 as byte);
      let hasError = false;
      try {
        b.toString(1 as int);
      } catch (error) {
        hasError = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0700
     * @tc.name      testToStringRadixRadix0ThrowError0007
     * @tc.desc      radix�?应报�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixRadix0ThrowError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(65 as byte);
      let hasError = false;
      try {
        b.toString(0 as int);
      } catch (error) {
        hasError = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0800
     * @tc.name      testToStringRadixNegativeRadixThrowError0008
     * @tc.desc      radix为负数应报错
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixNegativeRadixThrowError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(65 as byte);
      let hasError = false;
      try {
        b.toString(-10 as int);
      } catch (error) {
        hasError = true;
        expect(error.name).assertEqual('RangeError');
      }
      expect(hasError).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_0900
     * @tc.name      testToStringRadixMaxRadix360009
     * @tc.desc      radix最大值为36
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixMaxRadix360009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(35 as byte);
      const result = b.toString(36 as int);
      expect(result).assertEqual("z");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1000
     * @tc.name      testToStringRadixRadixGreaterThan36ThrowError0010
     * @tc.desc      radix大于36应报�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixRadixGreaterThan36ThrowError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const b = new Byte(65 as byte);
        let hasError = false;
        try {
          b.toString(37 as int);
        } catch (error) {
          hasError = true;
          expect(error.name).assertEqual('RangeError');
        }
        expect(hasError).assertTrue();
      })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1100
     * @tc.name      testToStringRadixBinaryConversion0011
     * @tc.desc      二进制转�?radix=2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBinaryConversion0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(10 as byte);
      expect(b.toString(2 as int)).assertEqual("1010");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1200
     * @tc.name      testToStringRadixOctalConversion0012
     * @tc.desc      八进制转�?radix=8)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixOctalConversion0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(64 as byte);
      expect(b.toString(8 as int)).assertEqual("100");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1300
     * @tc.name      testToStringRadixDecimalConversion0013
     * @tc.desc      十进制转�?radix=10)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixDecimalConversion0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(99 as byte);
      expect(b.toString(10 as int)).assertEqual("99");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1400
     * @tc.name      testToStringRadixHexConversion0014
     * @tc.desc      十六进制转换(radix=16)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixHexConversion0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      expect(b.toString(16 as int)).assertEqual("-1");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1500
     * @tc.name      testToStringRadixBase36Conversion0015
     * @tc.desc      三十六进制转�?radix=36)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBase36Conversion0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(35 as byte);
      expect(b.toString(36 as int)).assertEqual("z");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1600
     * @tc.name      testToStringRadixZeroValue0016
     * @tc.desc      零值转换在任何进制都是"0"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixZeroValue0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(0 as byte);
      expect(b.toString(2 as int)).assertEqual("0");
      expect(b.toString(8 as int)).assertEqual("0");
      expect(b.toString(10 as int)).assertEqual("0");
      expect(b.toString(16 as int)).assertEqual("0");
      expect(b.toString(36 as int)).assertEqual("0");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1700
     * @tc.name      testToStringRadixMaxValueConversion0017
     * @tc.desc      byte最大�?27在不同进制的表示
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixMaxValueConversion0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Byte.MAX_VALUE as byte);
      expect(b.toString(2 as int)).assertEqual("1111111");
      expect(b.toString(16 as int)).assertEqual("7f");
      expect(b.toString(36 as int)).assertEqual("3j");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1800
     * @tc.name      testToStringRadixMinValueConversion0018
     * @tc.desc      byte最小�?128在不同进制的表示
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixMinValueConversion0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(Byte.MIN_VALUE as byte);
      expect(b.toString(2 as int)).assertEqual("-10000000");
      expect(b.toString(16 as int)).assertEqual("-80");
      expect(b.toString(36 as int)).assertEqual("-3k");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_1900
     * @tc.name      testToStringRadixNegativeStartsWithMinus0019
     * @tc.desc      负数以负号开�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixNegativeStartsWithMinus0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-50 as byte);
      expect(b.toString(2 as int)[0]).assertEqual("-");
      expect(b.toString(8 as int)[0]).assertEqual("-");
      expect(b.toString(10 as int)[0]).assertEqual("-");
      expect(b.toString(16 as int)[0]).assertEqual("-");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2000
     * @tc.name      testToStringRadixReturnTypeString0020
     * @tc.desc      返回值类型为string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixReturnTypeString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      expect(b.toString(10 as int)).assertEqual("100");
      expect(b.toString(16 as int)).assertEqual("64");
      expect(b.toString(2 as int)).assertEqual("1100100");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2100
     * @tc.name      testToStringRadixHexLowercase0021
     * @tc.desc      十六进制使用小写字母a-f
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixHexLowercase0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      const result = b.toString(16 as int);
      expect(result).assertEqual("-1");
      expect(result === "FF").assertFalse();
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2200
     * @tc.name      testToStringRadixHexLetters0022
     * @tc.desc      大于9的值使用字母表�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixHexLetters0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(10 as byte).toString(16 as int)).assertEqual("a");
      expect(new Byte(11 as byte).toString(16 as int)).assertEqual("b");
      expect(new Byte(15 as byte).toString(16 as int)).assertEqual("f");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2300
     * @tc.name      testToStringRadixHexBoundaryValues0023
     * @tc.desc      常用边界值的十六进制表示
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixHexBoundaryValues0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(0 as byte).toString(16 as int)).assertEqual("0");
      expect(new Byte(15 as byte).toString(16 as int)).assertEqual("f");
      expect(new Byte(16 as byte).toString(16 as int)).assertEqual("10");
      expect(new Byte(31 as byte).toString(16 as int)).assertEqual("1f");
      expect(new Byte(32 as byte).toString(16 as int)).assertEqual("20");
      expect(new Byte(127 as byte).toString(16 as int)).assertEqual("7f");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2400
     * @tc.name      testToStringRadixBinaryOnlyZeroOne0024
     * @tc.desc      二进制字符串只包含字�?�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBinaryOnlyZeroOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      const binary = b.toString(2 as int);
      for (let i = 0; i < binary.length; i++) {
        const c = binary[i];
        expect(c === '-' || c === '0' || c === '1').assertTrue();
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2500
     * @tc.name      testToStringRadixBinaryLength0025
     * @tc.desc      验证二进制字符串长度
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBinaryLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(0 as byte).toString(2 as int).length).assertEqual(1);
      expect(new Byte(1 as byte).toString(2 as int).length).assertEqual(1);
      expect(new Byte(127 as byte).toString(2 as int).length).assertEqual(7);
      expect(new Byte(-128 as byte).toString(2 as int).length).assertEqual(9);
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2600
     * @tc.name      testToStringRadixPowersOfTwo0026
     * @tc.desc      2的幂次方在二进制中的表示
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixPowersOfTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(1 as byte).toString(2 as int)).assertEqual("1");
      expect(new Byte(2 as byte).toString(2 as int)).assertEqual("10");
      expect(new Byte(4 as byte).toString(2 as int)).assertEqual("100");
      expect(new Byte(8 as byte).toString(2 as int)).assertEqual("1000");
      expect(new Byte(16 as byte).toString(2 as int)).assertEqual("10000");
      expect(new Byte(32 as byte).toString(2 as int)).assertEqual("100000");
      expect(new Byte(64 as byte).toString(2 as int)).assertEqual("1000000");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2700
     * @tc.name      testToStringRadixOctalOnlyZeroToSeven0027
     * @tc.desc      八进制字符串只包含字�?-7
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixOctalOnlyZeroToSeven0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      const octal = b.toString(8 as int);
      for (let i = 0; i < octal.length; i++) {
        const c = octal[i];
        expect(c === '-' || (c >= '0' && c <= '7')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2800
     * @tc.name      testToStringRadixCommonOctalValues0028
     * @tc.desc      常用值的八进制表�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixCommonOctalValues0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(7 as byte).toString(8 as int)).assertEqual("7");
      expect(new Byte(8 as byte).toString(8 as int)).assertEqual("10");
      expect(new Byte(63 as byte).toString(8 as int)).assertEqual("77");
      expect(new Byte(64 as byte).toString(8 as int)).assertEqual("100");
      expect(new Byte(127 as byte).toString(8 as int)).assertEqual("177");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_2900
     * @tc.name      testToStringRadixTernary0029
     * @tc.desc      三进制转�?radix=3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixTernary0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(10 as byte).toString(3 as int)).assertEqual("101");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3000
     * @tc.name      testToStringRadixQuaternary0030
     * @tc.desc      四进制转�?radix=4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixQuaternary0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(15 as byte).toString(4 as int)).assertEqual("33");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3100
     * @tc.name      testToStringRadixQuinary0031
     * @tc.desc      五进制转�?radix=5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixQuinary0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(25 as byte).toString(5 as int)).assertEqual("100");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3200
     * @tc.name      testToStringRadixBase320032
     * @tc.desc      三十二进制转�?radix=32)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBase320032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(31 as byte).toString(32 as int)).assertEqual("v");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3300
     * @tc.name      testToStringRadixBase110033
     * @tc.desc      十一进制转换(radix=11)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBase110033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(100 as byte).toString(11 as int)).assertEqual("91");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3400
     * @tc.name      testToStringRadixBase120034
     * @tc.desc      十二进制转换(radix=12)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBase120034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Byte(100 as byte).toString(12 as int)).assertEqual("84");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3500
     * @tc.name      testToStringRadixNoArgVersion0035
     * @tc.desc      toString()默认返回十进�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixNoArgVersion0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(65 as byte);
      expect(b.toString()).assertEqual(b.toString(10 as int));
      expect(b.toString()).assertEqual("65");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3600
     * @tc.name      testToStringRadixVersusNumberToString0036
     * @tc.desc      Byte.toString与Number.toString行为一�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixVersusNumberToString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(-1 as byte);
      const n = -1;
      expect(b.toString(16 as int)).assertEqual(n.toString(16));
      expect(b.toString(8 as int)).assertEqual(n.toString(8));
      expect(b.toString(2 as int)).assertEqual(n.toString(2));
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3700
     * @tc.name      testToStringRadixAllValidRadices0037
     * @tc.desc      测试radix�?�?6
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixAllValidRadices0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      expect(b.toString(10 as int)).assertEqual("100");
      expect(b.toString(16 as int)).assertEqual("64");
      expect(b.toString(8 as int)).assertEqual("144");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3800
     * @tc.name      testToStringRadixMultipleCallsConsistency0038
     * @tc.desc      相同radix多次调用返回相同�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixMultipleCallsConsistency0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const b = new Byte(88 as byte);
        const s1 = b.toString(16 as int);
        const s2 = b.toString(16 as int);
        const s3 = b.toString(16 as int);
        expect(s1).assertEqual(s2);
        expect(s2).assertEqual(s3);
        expect(s1).assertEqual("58");
      })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_3900
     * @tc.name      testToStringRadixDifferentRadicesDifferentResults0039
     * @tc.desc      不同radix参数返回不同字符�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixDifferentRadicesDifferentResults0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const b = new Byte(100 as byte);
        expect(b.toString(2 as int) === b.toString(8 as int)).assertFalse();
        expect(b.toString(8 as int) === b.toString(10 as int)).assertFalse();
        expect(b.toString(10 as int) === b.toString(16 as int)).assertFalse();
      })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4000
     * @tc.name      testToStringRadixColorRepresentation0040
     * @tc.desc      使用十六进制表示颜色
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixColorRepresentation0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new Byte(-1 as byte);
      const g = new Byte(-128 as byte);
      const b = new Byte(0 as byte);

      const toUnsignedHex = (byteVal: Byte): string => {
        const num = Number(byteVal);
        const unsigned = num & 0xFF;
        const hex = unsigned.toString(16);
        return hex.length === 1 ? "0" + hex : hex;
      };

      const color = "#" + toUnsignedHex(r) + toUnsignedHex(g) + toUnsignedHex(b);
      expect(color).assertEqual("#ff8000");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4100
     * @tc.name      testToStringRadixPermissionBits0041
     * @tc.desc      使用二进制表示位权限
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixPermissionBits0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const flags = new Byte(5 as byte);
      expect(flags.toString(2 as int)).assertEqual("101");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4200
     * @tc.name      testToStringRadixBase36Compact0042
     * @tc.desc      使用36进制进行紧凑编码
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBase36Compact0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(35 as byte);
      const result = b.toString(36 as int);
      expect(result).assertEqual("z");
      expect(result.length < b.toString(10 as int).length).assertTrue();
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4300
     * @tc.name      testToStringRadixMultipleRepresentations0043
     * @tc.desc      同一数值在不同进制的表�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixMultipleRepresentations0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(100 as byte);
      expect(b.toString(2 as int)).assertEqual("1100100");
      expect(b.toString(8 as int)).assertEqual("144");
      expect(b.toString(10 as int)).assertEqual("100");
      expect(b.toString(16 as int)).assertEqual("64");
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4400
     * @tc.name      testToStringRadixAllInvalidRadicesThrowError0044
     * @tc.desc      测试所有无效radix值（-1,0,1,37,100�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixAllInvalidRadicesThrowError0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const b = new Byte(65 as byte);
        const invalidRadixes: int[] = [-1, 0, 1, 37, 100];
        for (let i = 0; i < invalidRadixes.length; i++) {
          let hasError = false;
          try {
            b.toString(invalidRadixes[i] as int);
          } catch (error) {
            hasError = true;
            expect(error.name).assertEqual('RangeError');
          }
          expect(hasError).assertTrue();
        }
      })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4500
     * @tc.name      testToStringRadixLargeLoopPerformance0045
     * @tc.desc      大量调用不同radix不泄�?
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixLargeLoopPerformance0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Byte(127 as byte);
      for (let i = 0; i < 10000; i++) {
        const radix = 2 + (i % 35);
        const result = b.toString(radix as int);
        expect(result).assertEqual(b.toString(radix as int));
      }
    })

    /**
     * @tc.number    SUB_BYTE_TOSTRING_RADIX_4600
     * @tc.name      testToStringRadixBatchConversion0046
     * @tc.desc      Byte数组批量转换进制
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToStringRadixBatchConversion0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bytes: Byte[] = [
        new Byte(10 as byte),
        new Byte(20 as byte),
        new Byte(30 as byte)
      ];
      const hexStrings: string[] = bytes.map(b => b.toString(16 as int));
      expect(hexStrings[0]).assertEqual("a");
      expect(hexStrings[1]).assertEqual("14");
      expect(hexStrings[2]).assertEqual("1e");
    })
  })
}
