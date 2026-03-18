/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
} from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function NumericCastingConversionsTest() {

  describe("NumericCastingConversionsTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0100
     * @tc.name      testNumericCastingConversions0001
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Byte = 0x77 as byte;
      let data1: Short = s1.toShort();
      expect(data1).assertEqual(119);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0200
     * @tc.name      testNumericCastingConversions0002
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Byte = 0x77 as byte;
      let data2: Int = s2.toInt();
      expect(data2).assertEqual(119);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0300
     * @tc.name      testNumericCastingConversions0003
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Int = 47;
      let data11: Float = s11.toFloat();
      expect(data11).assertEqual(47);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0400
     * @tc.name      testNumericCastingConversions0004
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Int = 47;
      let data12: Double = s12.toDouble();
      expect(data12).assertEqual(47);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0500
     * @tc.name      testNumericCastingConversions0005
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Long = 4;
      let data13: Float = s13.toFloat();
      expect(data13).assertEqual(4.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0600
     * @tc.name      testNumericCastingConversions0006
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Long = 4;
      let data14: Double = s14.toDouble();
      expect(data14).assertEqual(4);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0700
     * @tc.name      testNumericCastingConversions0007
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = 0.5f;
      let data15: Double = s15.toDouble();
      expect(data15).assertEqual(0.5);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0800
     * @tc.name      testNumericCastingConversions0008
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Byte = 0x77 as byte;
      let data3: Long = s3.toLong();
      expect(data3).assertEqual(119);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_0900
     * @tc.name      testNumericCastingConversions0009
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Byte = 16 as byte;
      let data4: Float = s4.toFloat();
      expect(data4).assertEqual(16.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1000
     * @tc.name      testNumericCastingConversions0010
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Byte = 16 as byte;
      let data5: Double = s5.toDouble();
      expect(data5).assertEqual(16.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1100
     * @tc.name      testNumericCastingConversions0011
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Short = 21845;
      let data6: Int = s6.toInt();
      expect(data6).assertEqual(21845);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1200
     * @tc.name      testNumericCastingConversions0012
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Short = 21845;
      let data7: Long = s7.toLong();
      expect(data7).assertEqual(21845);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1300
     * @tc.name      testNumericCastingConversions0013
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Short = 32;
      let data8: Float = s8.toFloat();
      expect(data8).assertEqual(32.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1400
     * @tc.name      testNumericCastingConversions0014
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Short = 32;
      let data9: Double = s9.toDouble();
      expect(data9).assertEqual(32.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1500
     * @tc.name      testNumericCastingConversions0015
     * @tc.desc      Using conversion methods defined in the standard library
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Int = 303;
      let data10: Long = s10.toLong();
      expect(data10).assertEqual(303);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1600
     * @tc.name      testNumericCastingConversions0016
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NaN;
      let data1: Byte = Double.toByte(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1700
     * @tc.name      testNumericCastingConversions0017
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = Double.NEGATIVE_INFINITY;
      let data2: Byte = Double.toByte(s2);
      expect(data2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1800
     * @tc.name      testNumericCastingConversions0018
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32769.0;
      let data11: Byte = Double.toByte(s11);
      expect(data11).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_1900
     * @tc.name      testNumericCastingConversions0019
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Int = Double.toInt(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2000
     * @tc.name      testNumericCastingConversions0020
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Int = Double.toInt(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2100
     * @tc.name      testNumericCastingConversions0021
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Int = Double.toInt(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2200
     * @tc.name      testNumericCastingConversions0022
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Int = Double.toInt(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2300
     * @tc.name      testNumericCastingConversions0023
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Int = Double.toInt(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2400
     * @tc.name      testNumericCastingConversions0024
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Int = Double.toInt(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2500
     * @tc.name      testNumericCastingConversions0025
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Int = Double.toInt(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2600
     * @tc.name      testNumericCastingConversions0026
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Int = Double.toInt(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2700
     * @tc.name      testNumericCastingConversions0027
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Int = Double.toInt(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2800
     * @tc.name      testNumericCastingConversions0028
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Int = Double.toInt(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_2900
     * @tc.name      testNumericCastingConversions0029
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32768.0;
      let data12: Byte = Double.toByte(s12);
      expect(data12).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3000
     * @tc.name      testNumericCastingConversions0030
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Int = Double.toInt(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3100
     * @tc.name      testNumericCastingConversions0031
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Int = Double.toInt(s30);
      expect(data30).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3200
     * @tc.name      testNumericCastingConversions0032
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Int = Double.toInt(s31);
      expect(data31).assertEqual(65534);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3300
     * @tc.name      testNumericCastingConversions0033
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Int = Double.toInt(s32);
      expect(data32).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3400
     * @tc.name      testNumericCastingConversions0034
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65536.0;
      let data33: Int = Double.toInt(s33);
      expect(data33).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3500
     * @tc.name      testNumericCastingConversions0035
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483646E9;
      let data34: Int = Double.toInt(s34);
      expect(data34).assertEqual(2147483646);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3600
     * @tc.name      testNumericCastingConversions0036
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483647E9;
      let data35: Int = Double.toInt(s35);
      expect(data35).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3700
     * @tc.name      testNumericCastingConversions0037
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 9.223372036854776E18;
      let data36: Int = Double.toInt(s36);
      expect(data36).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3800
     * @tc.name      testNumericCastingConversions0038
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 3.4028234663852886E38;
      let data37: Int = Double.toInt(s37);
      expect(data37).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_3900
     * @tc.name      testNumericCastingConversions0039
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 1.7976931348623157E308;
      let data38: Int = Double.toInt(s38);
      expect(data38).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4000
     * @tc.name      testNumericCastingConversions0040
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = Double.POSITIVE_INFINITY;
      let data39: Int = Double.toInt(s39);
      expect(data39).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4100
     * @tc.name      testNumericCastingConversions0041
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Int = Double.toInt(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4200
     * @tc.name      testNumericCastingConversions0042
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Int = Double.toInt(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4300
     * @tc.name      testNumericCastingConversions0043
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NaN;
      let data1: Long = Double.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4400
     * @tc.name      testNumericCastingConversions0044
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = Double.NEGATIVE_INFINITY;
      let data2: Long = Double.toLong(s2);
      expect(data2).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4500
     * @tc.name      testNumericCastingConversions0045
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -1.7976931348623157E308;
      let data3: Long = Double.toLong(s3);
      expect(data3).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4600
     * @tc.name      testNumericCastingConversions0046
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -3.4028234663852886E38;
      let data4: Long = Double.toLong(s4);
      expect(data4).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4700
     * @tc.name      testNumericCastingConversions0047
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -9.22337203685478E18;
      let data5: Long = Double.toLong(s5);
      expect(data5).assertEqual(-9223372036854775808);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4800
     * @tc.name      testNumericCastingConversions0048
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483648E9;
      let data6: Long = Double.toLong(s6);
      expect(data6).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_4900
     * @tc.name      testNumericCastingConversions0049
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -2.147483647E9;
      let data7: Long = Double.toLong(s7);
      expect(data7).assertEqual(-2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5000
     * @tc.name      testNumericCastingConversions0050
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -129.0;
      let data14: Byte = Double.toByte(s14);
      expect(data14).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5100
     * @tc.name      testNumericCastingConversions0051
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65537.0;
      let data8: Long = Double.toLong(s8);
      expect(data8).assertEqual(-65537);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5200
     * @tc.name      testNumericCastingConversions0052
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65536.0;
      let data9: Long = Double.toLong(s9);
      expect(data9).assertEqual(-65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5300
     * @tc.name      testNumericCastingConversions0053
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -65535.0;
      let data10: Long = Double.toLong(s10);
      expect(data10).assertEqual(-65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5400
     * @tc.name      testNumericCastingConversions0054
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32769.0;
      let data11: Long = Double.toLong(s11);
      expect(data11).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5500
     * @tc.name      testNumericCastingConversions0055
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32768.0;
      let data12: Long = Double.toLong(s12);
      expect(data12).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5600
     * @tc.name      testNumericCastingConversions0056
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -32767.0;
      let data13: Long = Double.toLong(s13);
      expect(data13).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5700
     * @tc.name      testNumericCastingConversions0057
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -129.0;
      let data14: Long = Double.toLong(s14);
      expect(data14).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5800
     * @tc.name      testNumericCastingConversions0058
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -128.0;
      let data15: Byte = Double.toByte(s15);
      expect(data15).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_5900
     * @tc.name      testNumericCastingConversions0059
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -128.0;
      let data15: Long = Double.toLong(s15);
      expect(data15).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6000
     * @tc.name      testNumericCastingConversions0060
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -127.0;
      let data16: Byte = Double.toByte(s16);
      expect(data16).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6100
     * @tc.name      testNumericCastingConversions0061
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -127.0;
      let data16: Long = Double.toLong(s16);
      expect(data16).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6200
     * @tc.name      testNumericCastingConversions0062
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -3.1415926;
      let data17: Byte = Double.toByte(s17);
      expect(data17).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6300
     * @tc.name      testNumericCastingConversions0063
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -3.1415926;
      let data17: Long = Double.toLong(s17);
      expect(data17).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6400
     * @tc.name      testNumericCastingConversions0064
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Byte = Double.toByte(s18);
      expect(data18).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6500
     * @tc.name      testNumericCastingConversions0065
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Long = Double.toLong(s18);
      expect(data18).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6600
     * @tc.name      testNumericCastingConversions0066
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Long = Double.toLong(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6700
     * @tc.name      testNumericCastingConversions0067
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Long = Double.toLong(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6800
     * @tc.name      testNumericCastingConversions0068
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Long = Double.toLong(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_6900
     * @tc.name      testNumericCastingConversions0069
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Long = Double.toLong(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7000
     * @tc.name      testNumericCastingConversions0070
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Long = Double.toLong(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7100
     * @tc.name      testNumericCastingConversions0071
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Long = Double.toLong(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7200
     * @tc.name      testNumericCastingConversions0072
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Long = Double.toLong(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7300
     * @tc.name      testNumericCastingConversions0073
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Long = Double.toLong(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7400
     * @tc.name      testNumericCastingConversions0074
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Long = Double.toLong(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7500
     * @tc.name      testNumericCastingConversions0075
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Long = Double.toLong(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7600
     * @tc.name      testNumericCastingConversions0076
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Long = Double.toLong(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7700
     * @tc.name      testNumericCastingConversions0077
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Long = Double.toLong(s30);
      expect(data30).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7800
     * @tc.name      testNumericCastingConversions0078
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Long = Double.toLong(s31);
      expect(data31).assertEqual(65534);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_7900
     * @tc.name      testNumericCastingConversions0079
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Long = Double.toLong(s32);
      expect(data32).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8000
     * @tc.name      testNumericCastingConversions0080
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65536.0;
      let data33: Long = Double.toLong(s33);
      expect(data33).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8100
     * @tc.name      testNumericCastingConversions0081
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483646E9;
      let data34: Long = Double.toLong(s34);
      expect(data34).assertEqual(2147483646);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8200
     * @tc.name      testNumericCastingConversions0082
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483647E9;
      let data35: Long = Double.toLong(s35);
      expect(data35).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8300
     * @tc.name      testNumericCastingConversions0083
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 9.223372036854776E18;
      let data36: Long = Double.toLong(s36);
      expect(data36).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8400
     * @tc.name      testNumericCastingConversions0084
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 3.4028234663852886E38;
      let data37: Long = Double.toLong(s37);
      expect(data37).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8500
     * @tc.name      testNumericCastingConversions0085
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 1.7976931348623157E308;
      let data38: Long = Double.toLong(s38);
      expect(data38).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8600
     * @tc.name      testNumericCastingConversions0086
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = Double.POSITIVE_INFINITY;
      let data39: Long = Double.toLong(s39);
      expect(data39).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8700
     * @tc.name      testNumericCastingConversions0087
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Long = Double.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8800
     * @tc.name      testNumericCastingConversions0088
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Long = Double.toLong(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_8900
     * @tc.name      testNumericCastingConversions0089
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NEGATIVE_INFINITY;
      let data1: Float = Double.toFloat(s1);
      expect(data1).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9000
     * @tc.name      testNumericCastingConversions0090
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = -1.7976931348623157E308;
      let data2: Float = Double.toFloat(s2);
      expect(data2).assertEqual(Float.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9100
     * @tc.name      testNumericCastingConversions0091
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -3.4028234663852886E38;
      let data3: Float = Double.toFloat(s3);
      expect(data3).assertEqual(-3.4028235E38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9200
     * @tc.name      testNumericCastingConversions0092
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -9.223372036854776E18;
      let data4: Float = Double.toFloat(s4);
      expect(data4).assertEqual(-9.223372E18f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9300
     * @tc.name      testNumericCastingConversions0093
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -2.147483648E9;
      let data5: Float = Double.toFloat(s5);
      expect(data5).assertEqual(-2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9400
     * @tc.name      testNumericCastingConversions0094
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483647E9;
      let data6: Float = Double.toFloat(s6);
      expect(data6).assertEqual(-2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9500
     * @tc.name      testNumericCastingConversions0095
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -1.0;
      let data18: Byte = Double.toByte(s18);
      expect(data18).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9600
     * @tc.name      testNumericCastingConversions0096
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -65537.0;
      let data7: Float = Double.toFloat(s7);
      expect(data7).assertEqual(-65537.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9700
     * @tc.name      testNumericCastingConversions0097
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65536.0;
      let data8: Float = Double.toFloat(s8);
      expect(data8).assertEqual(-65536.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9800
     * @tc.name      testNumericCastingConversions0098
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65535.0;
      let data9: Float = Double.toFloat(s9);
      expect(data9).assertEqual(-65535.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_9900
     * @tc.name      testNumericCastingConversions0099
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -32769.0;
      let data10: Float = Double.toFloat(s10);
      expect(data10).assertEqual(-32769.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10000
     * @tc.name      testNumericCastingConversions0100
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32768.0;
      let data11: Float = Double.toFloat(s11);
      expect(data11).assertEqual(-32768.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10100
     * @tc.name      testNumericCastingConversions0101
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32767.0;
      let data12: Float = Double.toFloat(s12);
      expect(data12).assertEqual(-32767.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10200
     * @tc.name      testNumericCastingConversions0102
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -129.0;
      let data13: Float = Double.toFloat(s13);
      expect(data13).assertEqual(-129.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10300
     * @tc.name      testNumericCastingConversions0103
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -128.0;
      let data14: Float = Double.toFloat(s14);
      expect(data14).assertEqual(-128.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10400
     * @tc.name      testNumericCastingConversions0104
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -127.0;
      let data15: Float = Double.toFloat(s15);
      expect(data15).assertEqual(-127.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10500
     * @tc.name      testNumericCastingConversions0105
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -3.1415926;
      let data16: Float = Double.toFloat(s16);
      expect(data16).assertEqual(-3.1415925f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10600
     * @tc.name      testNumericCastingConversions0106
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -2.2250738585072014E-308;
      let data19: Byte = Double.toByte(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10700
     * @tc.name      testNumericCastingConversions0107
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -1.0;
      let data17: Float = Double.toFloat(s17);
      expect(data17).assertEqual(-1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10800
     * @tc.name      testNumericCastingConversions0108
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -2.2250738585072014E-308;
      let data18: Float = Double.toFloat(s18);
      expect(data18).assertEqual(-0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_10900
     * @tc.name      testNumericCastingConversions0109
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -0.0;
      let data19: Float = Double.toFloat(s19);
      expect(data19).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11000
     * @tc.name      testNumericCastingConversions0110
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = 0.0;
      let data20: Float = Double.toFloat(s20);
      expect(data20).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11100
     * @tc.name      testNumericCastingConversions0111
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 2.2250738585072014E-308;
      let data21: Float = Double.toFloat(s21);
      expect(data21).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11200
     * @tc.name      testNumericCastingConversions0112
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 1.0;
      let data22: Float = Double.toFloat(s22);
      expect(data22).assertEqual(1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11300
     * @tc.name      testNumericCastingConversions0113
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 3.1415926;
      let data23: Float = Double.toFloat(s23);
      expect(data23).assertEqual(3.1415925f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11400
     * @tc.name      testNumericCastingConversions0114
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 126.0;
      let data24: Float = Double.toFloat(s24);
      expect(data24).assertEqual(126.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11500
     * @tc.name      testNumericCastingConversions0115
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 127.0;
      let data25: Float = Double.toFloat(s25);
      expect(data25).assertEqual(127.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11600
     * @tc.name      testNumericCastingConversions0116
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 128.0;
      let data26: Float = Double.toFloat(s26);
      expect(data26).assertEqual(128.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11700
     * @tc.name      testNumericCastingConversions0117
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Byte = Double.toByte(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11800
     * @tc.name      testNumericCastingConversions0118
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 32766.0;
      let data27: Float = Double.toFloat(s27);
      expect(data27).assertEqual(32766.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_11900
     * @tc.name      testNumericCastingConversions0119
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32767.0;
      let data28: Float = Double.toFloat(s28);
      expect(data28).assertEqual(32767.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12000
     * @tc.name      testNumericCastingConversions0120
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32768.0;
      let data29: Float = Double.toFloat(s29);
      expect(data29).assertEqual(32768.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12100
     * @tc.name      testNumericCastingConversions0121
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 65534.0;
      let data30: Float = Double.toFloat(s30);
      expect(data30).assertEqual(65534.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12200
     * @tc.name      testNumericCastingConversions0122
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65535.0;
      let data31: Float = Double.toFloat(s31);
      expect(data31).assertEqual(65535.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12300
     * @tc.name      testNumericCastingConversions0123
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65536.0;
      let data32: Float = Double.toFloat(s32);
      expect(data32).assertEqual(65536.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12400
     * @tc.name      testNumericCastingConversions0124
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 2.147483646E9;
      let data33: Float = Double.toFloat(s33);
      expect(data33).assertEqual(2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12500
     * @tc.name      testNumericCastingConversions0125
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 2.147483647E9;
      let data34: Float = Double.toFloat(s34);
      expect(data34).assertEqual(2.14748365E9f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12600
     * @tc.name      testNumericCastingConversions0126
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 9.223372036854776E18;
      let data35: Float = Double.toFloat(s35);
      expect(data35).assertEqual(9.223372E18f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12700
     * @tc.name      testNumericCastingConversions0127
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 3.4028234663852886E38;
      let data36: Float = Double.toFloat(s36);
      expect(data36).assertEqual(3.4028235E38f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12800
     * @tc.name      testNumericCastingConversions0128
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -1.7976931348623157E308;
      let data3: Byte = Double.toByte(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_12900
     * @tc.name      testNumericCastingConversions0129
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Byte = Double.toByte(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13000
     * @tc.name      testNumericCastingConversions0130
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 1.7976931348623157E308;
      let data37: Float = Double.toFloat(s37);
      expect(data37).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13100
     * @tc.name      testNumericCastingConversions0131
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = Double.POSITIVE_INFINITY;
      let data38: Float = Double.toFloat(s38);
      expect(data38).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13200
     * @tc.name      testNumericCastingConversions0132
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = -4.9E-308;
      let data1: Float = Double.toFloat(s1);
      expect(data1).assertEqual(-0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13300
     * @tc.name      testNumericCastingConversions0133
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = 4.9E-308;
      let data1: Float = Double.toFloat(s1);
      expect(data1).assertEqual(0.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13400
     * @tc.name      testNumericCastingConversions0134
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Double = Double.NEGATIVE_INFINITY;
      let data1: Double = Double.toDouble(s1);
      expect(data1).assertEqual(Double.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13500
     * @tc.name      testNumericCastingConversions0135
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Double = -1.7976931348623157E308;
      let data2: Double = Double.toDouble(s2);
      expect(data2).assertEqual(-1.7976931348623157E308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13600
     * @tc.name      testNumericCastingConversions0136
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Double = -3.4028234663852886E38;
      let data3: Double = Double.toDouble(s3);
      expect(data3).assertEqual(-3.4028234663852886E38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13700
     * @tc.name      testNumericCastingConversions0137
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -9.223372036854776E18;
      let data4: Double = Double.toDouble(s4);
      expect(data4).assertEqual(-9.223372036854776E18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13800
     * @tc.name      testNumericCastingConversions0138
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Double = -2.147483648E9;
      let data5: Double = Double.toDouble(s5);
      expect(data5).assertEqual(-2.147483648E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_13900
     * @tc.name      testNumericCastingConversions0139
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Double = -2.147483647E9;
      let data6: Double = Double.toDouble(s6);
      expect(data6).assertEqual(-2.147483647E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14000
     * @tc.name      testNumericCastingConversions0140
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 2.2250738585072014E-308;
      let data22: Byte = Double.toByte(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14100
     * @tc.name      testNumericCastingConversions0141
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Double = -65537.0;
      let data7: Double = Double.toDouble(s7);
      expect(data7).assertEqual(-65537.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14200
     * @tc.name      testNumericCastingConversions0142
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Double = -65536.0;
      let data8: Double = Double.toDouble(s8);
      expect(data8).assertEqual(-65536.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14300
     * @tc.name      testNumericCastingConversions0143
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Double = -65535.0;
      let data9: Double = Double.toDouble(s9);
      expect(data9).assertEqual(-65535.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14400
     * @tc.name      testNumericCastingConversions0144
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Double = -32769.0;
      let data10: Double = Double.toDouble(s10);
      expect(data10).assertEqual(-32769.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14500
     * @tc.name      testNumericCastingConversions0145
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Double = -32768.0;
      let data11: Double = Double.toDouble(s11);
      expect(data11).assertEqual(-32768.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14600
     * @tc.name      testNumericCastingConversions0146
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Double = -32767.0;
      let data12: Double = Double.toDouble(s12);
      expect(data12).assertEqual(-32767.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14700
     * @tc.name      testNumericCastingConversions0147
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Double = -129.0;
      let data13: Double = Double.toDouble(s13);
      expect(data13).assertEqual(-129.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14800
     * @tc.name      testNumericCastingConversions0148
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Double = -128.0;
      let data14: Double = Double.toDouble(s14);
      expect(data14).assertEqual(-128.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_14900
     * @tc.name      testNumericCastingConversions0149
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Double = -127.0;
      let data15: Double = Double.toDouble(s15);
      expect(data15).assertEqual(-127.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15000
     * @tc.name      testNumericCastingConversions0150
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Double = -3.1415926;
      let data16: Double = Double.toDouble(s16);
      expect(data16).assertEqual(-3.1415926);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15100
     * @tc.name      testNumericCastingConversions0151
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 1.0;
      let data23: Byte = Double.toByte(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15200
     * @tc.name      testNumericCastingConversions0152
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Double = -1.0;
      let data17: Double = Double.toDouble(s17);
      expect(data17).assertEqual(-1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15300
     * @tc.name      testNumericCastingConversions0153
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Double = -2.2250738585072014E-308;
      let data18: Double = Double.toDouble(s18);
      expect(data18).assertEqual(-2.2250738585072014E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15400
     * @tc.name      testNumericCastingConversions0154
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Double = -4.9E-308;
      let data19: Double = Double.toDouble(s19);
      expect(data19).assertEqual(-4.9E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15500
     * @tc.name      testNumericCastingConversions0155
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Double = -0.0;
      let data20: Double = Double.toDouble(s20);
      expect(data20).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15600
     * @tc.name      testNumericCastingConversions0156
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Double = 0.0;
      let data21: Double = Double.toDouble(s21);
      expect(data21).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15700
     * @tc.name      testNumericCastingConversions0157
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Double = 4.9E-308;
      let data22: Double = Double.toDouble(s22);
      expect(data22).assertEqual(4.9E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15800
     * @tc.name      testNumericCastingConversions0158
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Double = 2.2250738585072014E-308;
      let data23: Double = Double.toDouble(s23);
      expect(data23).assertEqual(2.2250738585072014E-308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_15900
     * @tc.name      testNumericCastingConversions0159
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 1.0;
      let data24: Double = Double.toDouble(s24);
      expect(data24).assertEqual(1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16000
     * @tc.name      testNumericCastingConversions0160
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 3.1415926;
      let data25: Double = Double.toDouble(s25);
      expect(data25).assertEqual(3.1415926);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16100
     * @tc.name      testNumericCastingConversions0161
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 126.0;
      let data26: Double = Double.toDouble(s26);
      expect(data26).assertEqual(126.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16200
     * @tc.name      testNumericCastingConversions0162
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Double = 3.1415926;
      let data24: Byte = Double.toByte(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16300
     * @tc.name      testNumericCastingConversions0163
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 127.0;
      let data27: Double = Double.toDouble(s27);
      expect(data27).assertEqual(127.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16400
     * @tc.name      testNumericCastingConversions0164
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 128.0;
      let data28: Double = Double.toDouble(s28);
      expect(data28).assertEqual(128.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16500
     * @tc.name      testNumericCastingConversions0165
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32766.0;
      let data29: Double = Double.toDouble(s29);
      expect(data29).assertEqual(32766.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16600
     * @tc.name      testNumericCastingConversions0166
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32767.0;
      let data30: Double = Double.toDouble(s30);
      expect(data30).assertEqual(32767.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16700
     * @tc.name      testNumericCastingConversions0167
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 32768.0;
      let data31: Double = Double.toDouble(s31);
      expect(data31).assertEqual(32768.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16800
     * @tc.name      testNumericCastingConversions0168
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65534.0;
      let data32: Double = Double.toDouble(s32);
      expect(data32).assertEqual(65534.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_16900
     * @tc.name      testNumericCastingConversions0169
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Double = 65535.0;
      let data33: Double = Double.toDouble(s33);
      expect(data33).assertEqual(65535.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17000
     * @tc.name      testNumericCastingConversions0170
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Double = 65536.0;
      let data34: Double = Double.toDouble(s34);
      expect(data34).assertEqual(65536.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17100
     * @tc.name      testNumericCastingConversions0171
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Double = 2.147483646E9;
      let data35: Double = Double.toDouble(s35);
      expect(data35).assertEqual(2.147483646E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17200
     * @tc.name      testNumericCastingConversions0172
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Double = 2.147483647E9;
      let data36: Double = Double.toDouble(s36);
      expect(data36).assertEqual(2.147483647E9);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17300
     * @tc.name      testNumericCastingConversions0173
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Double = 126.0;
      let data25: Byte = Double.toByte(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17400
     * @tc.name      testNumericCastingConversions0174
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Double = 9.223372036854776E18;
      let data37: Double = Double.toDouble(s37);
      expect(data37).assertEqual(9.223372036854776E18);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17500
     * @tc.name      testNumericCastingConversions0175
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s38: Double = 3.4028234663852886E38;
      let data38: Double = Double.toDouble(s38);
      expect(data38).assertEqual(3.4028234663852886E38);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17600
     * @tc.name      testNumericCastingConversions0176
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s39: Double = 1.7976931348623157E308;
      let data39: Double = Double.toDouble(s39);
      expect(data39).assertEqual(1.7976931348623157E308);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17700
     * @tc.name      testNumericCastingConversions0177
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s40: Double = Double.POSITIVE_INFINITY;
      let data40: Double = Double.toDouble(s40);
      expect(data40).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17800
     * @tc.name      testNumericCastingConversions0178
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Byte = Float.toByte(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_17900
     * @tc.name      testNumericCastingConversions0179
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Byte = Float.toByte(s2);
      expect(data2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18000
     * @tc.name      testNumericCastingConversions0180
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Byte = Float.toByte(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18100
     * @tc.name      testNumericCastingConversions0181
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -9.223372E18f;
      let data4: Byte = Float.toByte(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18200
     * @tc.name      testNumericCastingConversions0182
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -2.14748365E9f;
      let data5: Byte = Float.toByte(s5);
      expect(data5).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18300
     * @tc.name      testNumericCastingConversions0183
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65537.0f;
      let data6: Byte = Float.toByte(s6);
      expect(data6).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18400
     * @tc.name      testNumericCastingConversions0184
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Double = 127.0;
      let data26: Byte = Double.toByte(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18500
     * @tc.name      testNumericCastingConversions0185
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65536.0f;
      let data7: Byte = Float.toByte(s7);
      expect(data7).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18600
     * @tc.name      testNumericCastingConversions0186
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -65535.0f;
      let data8: Byte = Float.toByte(s8);
      expect(data8).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18700
     * @tc.name      testNumericCastingConversions0187
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32769.0f;
      let data9: Byte = Float.toByte(s9);
      expect(data9).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18800
     * @tc.name      testNumericCastingConversions0188
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32768.0f;
      let data10: Byte = Float.toByte(s10);
      expect(data10).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_18900
     * @tc.name      testNumericCastingConversions0189
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -32767.0f;
      let data11: Byte = Float.toByte(s11);
      expect(data11).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19000
     * @tc.name      testNumericCastingConversions0190
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -129.0f;
      let data12: Byte = Float.toByte(s12);
      expect(data12).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19100
     * @tc.name      testNumericCastingConversions0191
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -128.0f;
      let data13: Byte = Float.toByte(s13);
      expect(data13).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19200
     * @tc.name      testNumericCastingConversions0192
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -127.0f;
      let data14: Byte = Float.toByte(s14);
      expect(data14).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19300
     * @tc.name      testNumericCastingConversions0193
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -3.1415925f;
      let data15: Byte = Float.toByte(s15);
      expect(data15).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19400
     * @tc.name      testNumericCastingConversions0194
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.0f;
      let data16: Byte = Float.toByte(s16);
      expect(data16).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19500
     * @tc.name      testNumericCastingConversions0195
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Double = 128.0;
      let data27: Byte = Double.toByte(s27);
      expect(data27).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19600
     * @tc.name      testNumericCastingConversions0196
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.17549435E-38f;
      let data17: Byte = Float.toByte(s17);
      expect(data17).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19700
     * @tc.name      testNumericCastingConversions0197
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -1.4E-45f;
      let data18: Byte = Float.toByte(s18);
      expect(data18).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19800
     * @tc.name      testNumericCastingConversions0198
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = -0.0f;
      let data19: Byte = Float.toByte(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_19900
     * @tc.name      testNumericCastingConversions0199
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 0.0f;
      let data20: Byte = Float.toByte(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20000
     * @tc.name      testNumericCastingConversions0200
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.4E-45f;
      let data21: Byte = Float.toByte(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20100
     * @tc.name      testNumericCastingConversions0201
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.17549435E-38f;
      let data22: Byte = Float.toByte(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20200
     * @tc.name      testNumericCastingConversions0202
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 1.0f;
      let data23: Byte = Float.toByte(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20300
     * @tc.name      testNumericCastingConversions0203
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 3.1415925f;
      let data24: Byte = Float.toByte(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20400
     * @tc.name      testNumericCastingConversions0204
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 126.0f;
      let data25: Byte = Float.toByte(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20500
     * @tc.name      testNumericCastingConversions0205
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 127.0f;
      let data26: Byte = Float.toByte(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20600
     * @tc.name      testNumericCastingConversions0206
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Double = 32766.0;
      let data28: Byte = Double.toByte(s28);
      expect(data28).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20700
     * @tc.name      testNumericCastingConversions0207
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 128.0f;
      let data27: Byte = Float.toByte(s27);
      expect(data27).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20800
     * @tc.name      testNumericCastingConversions0208
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32766.0f;
      let data28: Byte = Float.toByte(s28);
      expect(data28).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_20900
     * @tc.name      testNumericCastingConversions0209
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32767.0f;
      let data29: Byte = Float.toByte(s29);
      expect(data29).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21000
     * @tc.name      testNumericCastingConversions0210
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 32768.0f;
      let data30: Byte = Float.toByte(s30);
      expect(data30).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21100
     * @tc.name      testNumericCastingConversions0211
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65534.0f;
      let data31: Byte = Float.toByte(s31);
      expect(data31).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21200
     * @tc.name      testNumericCastingConversions0212
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65535.0f;
      let data32: Byte = Float.toByte(s32);
      expect(data32).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21300
     * @tc.name      testNumericCastingConversions0213
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 65536.0f;
      let data33: Byte = Float.toByte(s33);
      expect(data33).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21400
     * @tc.name      testNumericCastingConversions0214
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 2.14748365E9f;
      let data34: Byte = Float.toByte(s34);
      expect(data34).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21500
     * @tc.name      testNumericCastingConversions0215
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 9.223372E18f;
      let data35: Byte = Float.toByte(s35);
      expect(data35).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21600
     * @tc.name      testNumericCastingConversions0216
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = 3.4028235E38f;
      let data36: Byte = Float.toByte(s36);
      expect(data36).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21700
     * @tc.name      testNumericCastingConversions0217
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Double = 32767.0;
      let data29: Byte = Double.toByte(s29);
      expect(data29).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21800
     * @tc.name      testNumericCastingConversions0218
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Float = Float.POSITIVE_INFINITY;
      let data37: Byte = Float.toByte(s37);
      expect(data37).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_21900
     * @tc.name      testNumericCastingConversions0219
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Short = Float.toShort(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22000
     * @tc.name      testNumericCastingConversions0220
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Short = Float.toShort(s2);
      expect(data2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22100
     * @tc.name      testNumericCastingConversions0221
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Short = Float.toShort(s3);
      expect(data3).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22200
     * @tc.name      testNumericCastingConversions0222
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Float = -9.223372E18f;
      let data4: Short = Float.toShort(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22300
     * @tc.name      testNumericCastingConversions0223
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s5: Float = -2.14748365E9f;
      let data5: Short = Float.toShort(s5);
      expect(data5).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22400
     * @tc.name      testNumericCastingConversions0224
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s6: Float = -65537.0f;
      let data6: Short = Float.toShort(s6);
      expect(data6).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22500
     * @tc.name      testNumericCastingConversions0225
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s7: Float = -65536.0f;
      let data7: Short = Float.toShort(s7);
      expect(data7).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22600
     * @tc.name      testNumericCastingConversions0226
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s8: Float = -65535.0f;
      let data8: Short = Float.toShort(s8);
      expect(data8).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22700
     * @tc.name      testNumericCastingConversions0227
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s9: Float = -32769.0f;
      let data9: Short = Float.toShort(s9);
      expect(data9).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22800
     * @tc.name      testNumericCastingConversions0228
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Double = 32768.0;
      let data30: Byte = Double.toByte(s30);
      expect(data30).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_22900
     * @tc.name      testNumericCastingConversions0229
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s10: Float = -32768.0f;
      let data10: Short = Float.toShort(s10);
      expect(data10).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23000
     * @tc.name      testNumericCastingConversions0230
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s11: Float = -32767.0f;
      let data11: Short = Float.toShort(s11);
      expect(data11).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23100
     * @tc.name      testNumericCastingConversions0231
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s12: Float = -129.0f;
      let data12: Short = Float.toShort(s12);
      expect(data12).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23200
     * @tc.name      testNumericCastingConversions0232
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s13: Float = -128.0f;
      let data13: Short = Float.toShort(s13);
      expect(data13).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23300
     * @tc.name      testNumericCastingConversions0233
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s14: Float = -127.0f;
      let data14: Short = Float.toShort(s14);
      expect(data14).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23400
     * @tc.name      testNumericCastingConversions0234
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s15: Float = -3.1415925f;
      let data15: Short = Float.toShort(s15);
      expect(data15).assertEqual(-3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23500
     * @tc.name      testNumericCastingConversions0235
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s16: Float = -1.0f;
      let data16: Short = Float.toShort(s16);
      expect(data16).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23600
     * @tc.name      testNumericCastingConversions0236
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s17: Float = -1.17549435E-38f;
      let data17: Short = Float.toShort(s17);
      expect(data17).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23700
     * @tc.name      testNumericCastingConversions0237
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s18: Float = -1.4E-45f;
      let data18: Short = Float.toShort(s18);
      expect(data18).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23800
     * @tc.name      testNumericCastingConversions0238
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s19: Float = -0.0f;
      let data19: Short = Float.toShort(s19);
      expect(data19).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_23900
     * @tc.name      testNumericCastingConversions0239
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s4: Double = -3.4028234663852886E38;
      let data4: Byte = Double.toByte(s4);
      expect(data4).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24000
     * @tc.name      testNumericCastingConversions0240
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Double = 65534.0;
      let data31: Byte = Double.toByte(s31);
      expect(data31).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24100
     * @tc.name      testNumericCastingConversions0241
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s20: Float = 0.0f;
      let data20: Short = Float.toShort(s20);
      expect(data20).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24200
     * @tc.name      testNumericCastingConversions0242
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s21: Float = 1.4E-45f;
      let data21: Short = Float.toShort(s21);
      expect(data21).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24300
     * @tc.name      testNumericCastingConversions0243
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s22: Float = 1.17549435E-38f;
      let data22: Short = Float.toShort(s22);
      expect(data22).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24400
     * @tc.name      testNumericCastingConversions0244
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s23: Float = 1.0f;
      let data23: Short = Float.toShort(s23);
      expect(data23).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24500
     * @tc.name      testNumericCastingConversions0245
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s24: Float = 3.1415925f;
      let data24: Short = Float.toShort(s24);
      expect(data24).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24600
     * @tc.name      testNumericCastingConversions0246
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s25: Float = 126.0f;
      let data25: Short = Float.toShort(s25);
      expect(data25).assertEqual(126);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24700
     * @tc.name      testNumericCastingConversions0247
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s26: Float = 127.0f;
      let data26: Short = Float.toShort(s26);
      expect(data26).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24800
     * @tc.name      testNumericCastingConversions0248
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s27: Float = 128.0f;
      let data27: Short = Float.toShort(s27);
      expect(data27).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_24900
     * @tc.name      testNumericCastingConversions0249
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s28: Float = 32766.0f;
      let data28: Short = Float.toShort(s28);
      expect(data28).assertEqual(32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25000
     * @tc.name      testNumericCastingConversions0250
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s29: Float = 32767.0f;
      let data29: Short = Float.toShort(s29);
      expect(data29).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25100
     * @tc.name      testNumericCastingConversions0251
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65535.0;
      let data32: Byte = Double.toByte(s32);
      expect(data32).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25200
     * @tc.name      testNumericCastingConversions0252
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s30: Float = 32768.0f;
      let data30: Short = Float.toShort(s30);
      expect(data30).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25300
     * @tc.name      testNumericCastingConversions0253
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s31: Float = 65534.0f;
      let data31: Short = Float.toShort(s31);
      expect(data31).assertEqual(-2);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25400
     * @tc.name      testNumericCastingConversions0254
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Float = 65535.0f;
      let data32: Short = Float.toShort(s32);
      expect(data32).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25500
     * @tc.name      testNumericCastingConversions0255
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s33: Float = 65536.0f;
      let data33: Short = Float.toShort(s33);
      expect(data33).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25600
     * @tc.name      testNumericCastingConversions0256
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s34: Float = 2.14748365E9f;
      let data34: Short = Float.toShort(s34);
      expect(data34).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25700
     * @tc.name      testNumericCastingConversions0257
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s35: Float = 9.223372E18f;
      let data35: Short = Float.toShort(s35);
      expect(data35).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25800
     * @tc.name      testNumericCastingConversions0258
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s36: Float = 3.4028235E38f;
      let data36: Short = Float.toShort(s36);
      expect(data36).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_25900
     * @tc.name      testNumericCastingConversions0259
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s37: Float = Float.POSITIVE_INFINITY;
      let data37: Short = Float.toShort(s37);
      expect(data37).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26000
     * @tc.name      testNumericCastingConversions0260
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Float = Float.NaN;
      let data1: Int = Float.toInt(s1);
      expect(data1).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26100
     * @tc.name      testNumericCastingConversions0261
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: Float = Float.NEGATIVE_INFINITY;
      let data2: Int = Float.toInt(s2);
      expect(data2).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26200
     * @tc.name      testNumericCastingConversions0262
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s32: Double = 65536.0;
      let data32: Byte = Double.toByte(s32);
      expect(data32).assertEqual(0);
    });

    /**
     * @tc.number    SUB_NUMERIC_CASTING_CONVERSIONS_26300
     * @tc.name      testNumericCastingConversions0263
     * @tc.desc      A numeric casting conversion occurs if the target type and the expression type are both numeric or char.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericCastingConversions0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s3: Float = -3.4028235E38f;
      let data3: Int = Float.toInt(s3);
      expect(data3).assertEqual(-2147483648);
    });

  })
}