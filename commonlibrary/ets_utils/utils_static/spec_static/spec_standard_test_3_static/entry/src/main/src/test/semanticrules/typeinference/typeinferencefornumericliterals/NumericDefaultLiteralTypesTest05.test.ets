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

export default function NumericDefaultLiteralTypesTest05():void {
  describe('NumericDefaultLiteralTypesTest05', () => {
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
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0100
     * @tc.name      testNumericOperationsConst0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 127 % 128;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127 % 128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0200
     * @tc.name      testNumericOperationsConst0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 128 % 129;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128 % 129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0300
     * @tc.name      testNumericOperationsConst0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32767 % 32768;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767 % 32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0400
     * @tc.name      testNumericOperationsConst0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32768 % 32769;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768 % 32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0500
     * @tc.name      testNumericOperationsConst0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483647 % 2147483648;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483647 % 2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0600
     * @tc.name      testNumericOperationsConst0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (2147483648).toLong() % (2147483649).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((2147483648).toLong() % (2147483649).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0700
     * @tc.name      testNumericOperationsConst0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775806).toLong() % (9223372036854775807).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() % (9223372036854775807).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0800
     * @tc.name      testNumericOperationsConst0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -128 % 129;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128 % 129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_0900
     * @tc.name      testNumericOperationsConst0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -129 % 130;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129 % 130);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1000
     * @tc.name      testNumericOperationsConst0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32768 % 32769;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768 % 32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1100
     * @tc.name      testNumericOperationsConst0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32769 % 32740;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769 % 32740);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1200
     * @tc.name      testNumericOperationsConst0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x8000 % 0x8001;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000 % 0x8001);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1300
     * @tc.name      testNumericOperationsConst0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x8000_0001).toLong() % (0x8000_0002).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x8000_0001).toLong() % (0x8000_0002).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1400
     * @tc.name      testNumericOperationsConst0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsConst0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() % (-0x7FFF_FFFF_FFFF_FFFF).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() % (-0x7FFF_FFFF_FFFF_FFFF).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1500
     * @tc.name      testNumericOperationsMultiplyDivide0015
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float = 1.0f * 1.0f;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f * 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1600
     * @tc.name      testNumericOperationsMultiplyDivide0016
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : double = 1.0 * 1.0;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 * 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1700
     * @tc.name      testNumericOperationsMultiplyDivide0017
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 8 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(8 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1800
     * @tc.name      testNumericOperationsMultiplyDivide0018
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 63 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(63 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_1900
     * @tc.name      testNumericOperationsMultiplyDivide0019
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 64 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(64 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2000
     * @tc.name      testNumericOperationsMultiplyDivide0020
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16383 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16383 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2100
     * @tc.name      testNumericOperationsMultiplyDivide0021
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16384 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16384 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2200
     * @tc.name      testNumericOperationsMultiplyDivide0022
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 1073741823 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(1073741823 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2300
     * @tc.name      testNumericOperationsMultiplyDivide0023
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long | int = (1073741824).toLong() * (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((1073741824).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2400
     * @tc.name      testNumericOperationsMultiplyDivide0024
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (9223372036854775807).toLong() * (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2500
     * @tc.name      testNumericOperationsMultiplyDivide0025
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -8 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-8 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2600
     * @tc.name      testNumericOperationsMultiplyDivide0026
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -64 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-64 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2700
     * @tc.name      testNumericOperationsMultiplyDivide0027
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2800
     * @tc.name      testNumericOperationsMultiplyDivide0028
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16384 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16384 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_2900
     * @tc.name      testNumericOperationsMultiplyDivide0029
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16385 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16385 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3000
     * @tc.name      testNumericOperationsMultiplyDivide0030
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x4000_0000 * 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x4000_0000 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3100
     * @tc.name      testNumericOperationsMultiplyDivide0031
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x4000_0001).toLong() * (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x4000_0001).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3200
     * @tc.name      testNumericOperationsMultiplyDivide0032
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() * (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3300
     * @tc.name      testNumericOperationsMultiplyDivide0033
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float = 1.0f / 1.0f;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f / 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3400
     * @tc.name      testNumericOperationsMultiplyDivide0034
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : double = 1.0 / 1.0;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 / 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3500
     * @tc.name      testNumericOperationsMultiplyDivide0035
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3600
     * @tc.name      testNumericOperationsMultiplyDivide0036
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 255 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(255 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3700
     * @tc.name      testNumericOperationsMultiplyDivide0037
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 256 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3800
     * @tc.name      testNumericOperationsMultiplyDivide0038
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 65535 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65535 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_3900
     * @tc.name      testNumericOperationsMultiplyDivide0039
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 65536 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65536 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4000
     * @tc.name      testNumericOperationsMultiplyDivide0040
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 4294967295 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(4294967295 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4100
     * @tc.name      testNumericOperationsMultiplyDivide0041
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (4294967296).toLong() / (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((4294967296).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4200
     * @tc.name      testNumericOperationsMultiplyDivide0042
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (8223372036854775808).toLong() / (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((8223372036854775808).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4300
     * @tc.name      testNumericOperationsMultiplyDivide0043
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4400
     * @tc.name      testNumericOperationsMultiplyDivide0044
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -256 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4500
     * @tc.name      testNumericOperationsMultiplyDivide0045
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -257 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-257 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4600
     * @tc.name      testNumericOperationsMultiplyDivide0046
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65536 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4700
     * @tc.name      testNumericOperationsMultiplyDivide0047
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65537 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65537 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4800
     * @tc.name      testNumericOperationsMultiplyDivide0048
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x1_0000_0000 / 2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x1_0000_0000 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_4900
     * @tc.name      testNumericOperationsMultiplyDivide0049
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x1_0000_0010).toLong() / (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x1_0000_0010).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5000
     * @tc.name      testNumericOperationsMultiplyDivide0050
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivide0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-8223372036854775808).toLong() / (2).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-8223372036854775808).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5100
     * @tc.name      testNumericOperationsMultiplyDivideConst0051
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float = 1.0f * 1.0f;
      let a : float = value;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f * 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5200
     * @tc.name      testNumericOperationsMultiplyDivideConst0052
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : double = 1.0 * 1.0;
      let a : double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 * 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5300
     * @tc.name      testNumericOperationsMultiplyDivideConst0053
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 8 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(8 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5400
     * @tc.name      testNumericOperationsMultiplyDivideConst0054
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 63 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(63 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5500
     * @tc.name      testNumericOperationsMultiplyDivideConst0055
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 64 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(64 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5600
     * @tc.name      testNumericOperationsMultiplyDivideConst0056
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16383 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16383 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5700
     * @tc.name      testNumericOperationsMultiplyDivideConst0057
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16384 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16384 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5800
     * @tc.name      testNumericOperationsMultiplyDivideConst0058
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 1073741823 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(1073741823 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_5900
     * @tc.name      testNumericOperationsMultiplyDivideConst0059
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (1073741824).toLong() * (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((1073741824).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6000
     * @tc.name      testNumericOperationsMultiplyDivideConst0060
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775807).toLong() * (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6100
     * @tc.name      testNumericOperationsMultiplyDivideConst0061
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -8 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-8 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6200
     * @tc.name      testNumericOperationsMultiplyDivideConst0062
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -64 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-64 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6300
     * @tc.name      testNumericOperationsMultiplyDivideConst0063
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6400
     * @tc.name      testNumericOperationsMultiplyDivideConst0064
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16384 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16384 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6500
     * @tc.name      testNumericOperationsMultiplyDivideConst0065
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16385 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16385 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6600
     * @tc.name      testNumericOperationsMultiplyDivideConst0066
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x4000_0000 * 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x4000_0000 * 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6700
     * @tc.name      testNumericOperationsMultiplyDivideConst0067
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x4000_0001).toLong() * (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x4000_0001).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6800
     * @tc.name      testNumericOperationsMultiplyDivideConst0068
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() * (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() * (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_6900
     * @tc.name      testNumericOperationsMultiplyDivideConst0069
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float = 1.0f / 1.0f;
      let a : float = value;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f / 1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7000
     * @tc.name      testNumericOperationsMultiplyDivideConst0070
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : double = 1.0 / 1.0;
      let a : double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0 / 1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7100
     * @tc.name      testNumericOperationsMultiplyDivideConst0071
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7200
     * @tc.name      testNumericOperationsMultiplyDivideConst0072
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 255 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(255 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7300
     * @tc.name      testNumericOperationsMultiplyDivideConst0073
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 256 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7400
     * @tc.name      testNumericOperationsMultiplyDivideConst0074
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 65535 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65535 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7500
     * @tc.name      testNumericOperationsMultiplyDivideConst0075
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 65536 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65536 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7600
     * @tc.name      testNumericOperationsMultiplyDivideConst0076
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 4294967295 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(4294967295 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7700
     * @tc.name      testNumericOperationsMultiplyDivideConst0077
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (4294967296).toLong() / (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((4294967296).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7800
     * @tc.name      testNumericOperationsMultiplyDivideConst0078
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (8223372036854775808).toLong() / (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((8223372036854775808).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_7900
     * @tc.name      testNumericOperationsMultiplyDivideConst0079
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8000
     * @tc.name      testNumericOperationsMultiplyDivideConst0080
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -256 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8100
     * @tc.name      testNumericOperationsMultiplyDivideConst0081
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -257 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-257 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8200
     * @tc.name      testNumericOperationsMultiplyDivideConst0082
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65536 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8300
     * @tc.name      testNumericOperationsMultiplyDivideConst0083
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65537 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65537 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8400
     * @tc.name      testNumericOperationsMultiplyDivideConst0084
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x1_0000_0000 / 2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x1_0000_0000 / 2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8500
     * @tc.name      testNumericOperationsMultiplyDivideConst0085
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x1_0000_0010).toLong() / (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x1_0000_0010).toLong() / (2).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTFIVE_8600
     * @tc.name      testNumericOperationsMultiplyDivideConst0086
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperationsMultiplyDivideConst0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() / (2).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() / (2).toLong());
    });

  });
}