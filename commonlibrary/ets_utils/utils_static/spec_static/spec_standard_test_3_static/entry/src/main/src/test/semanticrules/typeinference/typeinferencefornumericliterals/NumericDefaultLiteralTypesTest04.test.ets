/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function NumericDefaultLiteralTypesTest04():void {
  describe('NumericDefaultLiteralTypesTest04', () => {
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
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0100
     * @tc.name      testNumericLogicalConst0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x7FFF_FFFF_FFFF_FFFF).toLong() | (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF).toLong() | (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0200
     * @tc.name      testNumericLogicalConst0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0300
     * @tc.name      testNumericLogicalConst0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 127&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0400
     * @tc.name      testNumericLogicalConst0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 128&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0500
     * @tc.name      testNumericLogicalConst0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32767&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0600
     * @tc.name      testNumericLogicalConst0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32768&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0700
     * @tc.name      testNumericLogicalConst0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483647&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483647&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0800
     * @tc.name      testNumericLogicalConst0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (2147483648).toLong() & (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483648).toLong() & (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_0900
     * @tc.name      testNumericLogicalConst0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775806).toLong() & (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() & (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1000
     * @tc.name      testNumericLogicalConst0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1100
     * @tc.name      testNumericLogicalConst0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -128&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1200
     * @tc.name      testNumericLogicalConst0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -129&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1300
     * @tc.name      testNumericLogicalConst0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32768&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1400
     * @tc.name      testNumericLogicalConst0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32769&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1500
     * @tc.name      testNumericLogicalConst0015
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x8000_0000&1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1600
     * @tc.name      testNumericLogicalConst0016
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0001).toLong() & (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0001).toLong() & (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1700
     * @tc.name      testNumericLogicalConst0017
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() & (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() & (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1800
     * @tc.name      testNumericLogicalConst0018
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_1900
     * @tc.name      testNumericLogicalConst0019
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 126^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2000
     * @tc.name      testNumericLogicalConst0020
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 129^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(129^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2100
     * @tc.name      testNumericLogicalConst0021
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32766^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2200
     * @tc.name      testNumericLogicalConst0022
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32769^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32769^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2300
     * @tc.name      testNumericLogicalConst0023
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483646^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483646^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2400
     * @tc.name      testNumericLogicalConst0024
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (2147483649).toLong() ^ (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483649).toLong() ^ (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2500
     * @tc.name      testNumericLogicalConst0025
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775806).toLong() ^ (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() ^ (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2600
     * @tc.name      testNumericLogicalConst0026
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2700
     * @tc.name      testNumericLogicalConst0027
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -127^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-127^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2800
     * @tc.name      testNumericLogicalConst0028
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -130^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-130^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_2900
     * @tc.name      testNumericLogicalConst0029
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32767^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32767^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3000
     * @tc.name      testNumericLogicalConst0030
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32770^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32770^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3100
     * @tc.name      testNumericLogicalConst0031
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x8001^1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8001^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3200
     * @tc.name      testNumericLogicalConst0032
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0000).toLong() ^ (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0000).toLong() ^ (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3300
     * @tc.name      testNumericLogicalConst0033
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0000_0001).toLong() ^ (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0000_0001).toLong() ^ (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3400
     * @tc.name      testNumericOperations0034
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float = 1.0f + 1.0f;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f + 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3500
     * @tc.name      testNumericOperations0035
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : double = 1.0 + 1.0;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 + 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3600
     * @tc.name      testNumericOperations0036
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 126 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3700
     * @tc.name      testNumericOperations0037
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 127 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3800
     * @tc.name      testNumericOperations0038
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32766 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_3900
     * @tc.name      testNumericOperations0039
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32767 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4000
     * @tc.name      testNumericOperations0040
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 2147483646 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483646 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4100
     * @tc.name      testNumericOperations0041
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (2147483647).toLong() + (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483647).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4200
     * @tc.name      testNumericOperations0042
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (9223372036854775806).toLong() + (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4300
     * @tc.name      testNumericOperations0043
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -17 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-17 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4400
     * @tc.name      testNumericOperations0044
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -129 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4500
     * @tc.name      testNumericOperations0045
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -130 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-130 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4600
     * @tc.name      testNumericOperations0046
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32769 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4700
     * @tc.name      testNumericOperations0047
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32770 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32770 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4800
     * @tc.name      testNumericOperations0048
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x8000_0000 + 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_4900
     * @tc.name      testNumericOperations0049
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x8000_0002).toLong() + (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0002).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5000
     * @tc.name      testNumericOperations0050
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x8000_0000_0001).toLong() + (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0000_0001).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5100
     * @tc.name      testNumericOperations0051
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float = 1.0f - 1.0f;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f - 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5200
     * @tc.name      testNumericOperations0052
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : double = 1.0 - 1.0;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 - 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5300
     * @tc.name      testNumericOperations0053
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 128 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5400
     * @tc.name      testNumericOperations0054
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 129 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(129 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5500
     * @tc.name      testNumericOperations0055
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32768 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5600
     * @tc.name      testNumericOperations0056
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32769 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32769 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5700
     * @tc.name      testNumericOperations0057
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 2147483648 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483648 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5800
     * @tc.name      testNumericOperations0058
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (2147483649).toLong() - (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483649).toLong() - (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_5900
     * @tc.name      testNumericOperations0059
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (9223372036854775807).toLong() - (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() - (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6000
     * @tc.name      testNumericOperations0060
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -127 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-127 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6100
     * @tc.name      testNumericOperations0061
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -128 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6200
     * @tc.name      testNumericOperations0062
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32767 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32767 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6300
     * @tc.name      testNumericOperations0063
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32768 - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6400
     * @tc.name      testNumericOperations0064
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x7FFF_FFFF - 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6500
     * @tc.name      testNumericOperations0065
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x8000_0000).toLong() - (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0000).toLong() - (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6600
     * @tc.name      testNumericOperations0066
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6700
     * @tc.name      testNumericOperations0067
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 127 % 128;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127 % 128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6800
     * @tc.name      testNumericOperations0068
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 128 % 129;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128 % 129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_6900
     * @tc.name      testNumericOperations0069
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32767 % 32768;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767 % 32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7000
     * @tc.name      testNumericOperations0070
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32768 % 32769;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768 % 32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7100
     * @tc.name      testNumericOperations0071
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 2147483647 % 2147483648;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483647 % 2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7200
     * @tc.name      testNumericOperations0072
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (2147483648).toLong() % (2147483649).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483648).toLong() % (2147483649).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7300
     * @tc.name      testNumericOperations0073
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (9223372036854775806).toLong() % (9223372036854775807).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() % (9223372036854775807).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7400
     * @tc.name      testNumericOperations0074
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -128 % 129;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128 % 129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7500
     * @tc.name      testNumericOperations0075
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -129 % 130;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129 % 130);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7600
     * @tc.name      testNumericOperations0076
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32768 % 32769;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768 % 32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7700
     * @tc.name      testNumericOperations0077
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32769 % 32740;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769 % 32740);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7800
     * @tc.name      testNumericOperations0078
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x8000_0000 % 0x8000_0001;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000 % 0x8000_0001);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_7900
     * @tc.name      testNumericOperations0079
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x8000_0001).toLong() % (0x8000_0002).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0001).toLong() % (0x8000_0002).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8000
     * @tc.name      testNumericOperations0080
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperations0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() % (-0x7FFF_FFFF_FFFF_FFFF).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() % (-0x7FFF_FFFF_FFFF_FFFF).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8100
     * @tc.name      testNumericOperationsConst0081
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float = 1.0f + 1.0f;
      let a : float = value;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f + 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8200
     * @tc.name      testNumericOperationsConst0082
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : double = 1.0 + 1.0;
      let a : double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 + 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8300
     * @tc.name      testNumericOperationsConst0083
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 126 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8400
     * @tc.name      testNumericOperationsConst0084
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 127 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8500
     * @tc.name      testNumericOperationsConst0085
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32766 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8600
     * @tc.name      testNumericOperationsConst0086
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32767 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8700
     * @tc.name      testNumericOperationsConst0087
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483646 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483646 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8800
     * @tc.name      testNumericOperationsConst0088
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (2147483647).toLong() + (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483647).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_8900
     * @tc.name      testNumericOperationsConst0089
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775806).toLong() + (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9000
     * @tc.name      testNumericOperationsConst0090
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -17 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-17 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9100
     * @tc.name      testNumericOperationsConst0091
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -129 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9200
     * @tc.name      testNumericOperationsConst0092
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -130 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-130 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9300
     * @tc.name      testNumericOperationsConst0093
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32769 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9400
     * @tc.name      testNumericOperationsConst0094
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32770 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32770 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9500
     * @tc.name      testNumericOperationsConst0095
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x8000_0000 + 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000 + 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9600
     * @tc.name      testNumericOperationsConst0096
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0002).toLong() + (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0002).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9700
     * @tc.name      testNumericOperationsConst0097
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0000_0001).toLong() + (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0000_0001).toLong() + (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9800
     * @tc.name      testNumericOperationsConst0098
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float = 1.0f - 1.0f;
      let a : float = value;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f - 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFOUR_9900
     * @tc.name      testNumericOperationsConst0099
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : double = 1.0 - 1.0;
      let a : double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 - 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0100
     * @tc.name      testNumericOperationsConst_A_0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 128 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0200
     * @tc.name      testNumericOperationsConst_A_0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 129 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(129 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0300
     * @tc.name      testNumericOperationsConst_A_0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32768 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0400
     * @tc.name      testNumericOperationsConst_A_0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32769 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32769 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0500
     * @tc.name      testNumericOperationsConst_A_0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483648 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483648 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0600
     * @tc.name      testNumericOperationsConst_A_0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (2147483649).toLong() - (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483649).toLong() - (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0700
     * @tc.name      testNumericOperationsConst_A_0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775807).toLong() - (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() - (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0800
     * @tc.name      testNumericOperationsConst_A_0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -127 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-127 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_0900
     * @tc.name      testNumericOperationsConst_A_0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -128 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_1000
     * @tc.name      testNumericOperationsConst_A_0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32767 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32767 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_1100
     * @tc.name      testNumericOperationsConst_A_0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32768 - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768 - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_1200
     * @tc.name      testNumericOperationsConst_A_0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x7FFF_FFFF - 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_1300
     * @tc.name      testNumericOperationsConst_A_0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0000).toLong() - (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0000).toLong() - (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTFOUR_1400
     * @tc.name      testNumericOperationsConst_A_0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst_A_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong());
    });

  });
}