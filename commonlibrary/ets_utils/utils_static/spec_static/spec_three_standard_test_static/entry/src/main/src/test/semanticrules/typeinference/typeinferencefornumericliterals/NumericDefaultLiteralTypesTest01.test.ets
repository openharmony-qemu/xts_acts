'use static'
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

export default function NumericDefaultLiteralTypesTest01():void {
  describe('NumericDefaultLiteralTypesTest01', () => {
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
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0100
     * @tc.name      testNumericDefaultLiteralTypes0001
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : byte | Object = 127;
      a = 128;
      expect(a instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0200
     * @tc.name      testNumericDefaultLiteralTypes0002
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long | Object = 128;
      a = 9223372036854775807;
      expect(a instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0300
     * @tc.name      testNumericDefaultLiteralTypes0003
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short | Object = 128;
      a = 32768;
      expect(a instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0400
     * @tc.name      testNumericDefaultLiteralTypes0004
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int | double = 1.0;
      a = 1;
      expect(a instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0500
     * @tc.name      testNumericDefaultLiteralTypes0005
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int | float = 1.0f;
      a = 1;
      expect(a instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0600
     * @tc.name      testNumericDefaultLiteralTypes0006
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short = 123;
      a = 1 as byte;
      expect(a instanceof short).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0700
     * @tc.name      testNumericDefaultLiteralTypes0007
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 127;
      a = 1 as short;
      expect(a instanceof int).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0800
     * @tc.name      testNumericDefaultLiteralTypes0008
     * @tc.desc      The type of expression of a union numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated union numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralTypes0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 128;
      a = 1 as int;
      expect(a instanceof long).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_0900
     * @tc.name      testNumericDefaultLiterals0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float = 1.0f;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1000
     * @tc.name      testNumericDefaultLiterals0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : double = 1.0;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1100
     * @tc.name      testNumericDefaultLiterals0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1200
     * @tc.name      testNumericDefaultLiterals0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 127;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1300
     * @tc.name      testNumericDefaultLiterals0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 128;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1400
     * @tc.name      testNumericDefaultLiterals0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32767;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1500
     * @tc.name      testNumericDefaultLiterals0015
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 0x7FFF_FFFF_FFFF_FFFF;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1600
     * @tc.name      testNumericDefaultLiterals0016
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : byte = 16;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1700
     * @tc.name      testNumericDefaultLiterals0017
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : byte = 127;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1800
     * @tc.name      testNumericDefaultLiterals0018
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short = 128;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_1900
     * @tc.name      testNumericDefaultLiterals0019
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short = 32767;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2000
     * @tc.name      testNumericDefaultLiterals0020
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32768;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2100
     * @tc.name      testNumericDefaultLiterals0021
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 2147483647;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2200
     * @tc.name      testNumericDefaultLiterals0022
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 2147483648;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2300
     * @tc.name      testNumericDefaultLiterals0023
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 9223372036854775807;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2400
     * @tc.name      testNumericDefaultLiterals0024
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : byte = -16;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(-16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2500
     * @tc.name      testNumericDefaultLiterals0025
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : byte = -128;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2600
     * @tc.name      testNumericDefaultLiterals0026
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short = -129;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2700
     * @tc.name      testNumericDefaultLiterals0027
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short = -32768;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2800
     * @tc.name      testNumericDefaultLiterals0028
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x8000_0000;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_2900
     * @tc.name      testNumericDefaultLiterals0029
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -0x8000_0001;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0001);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3000
     * @tc.name      testNumericDefaultLiterals0030
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float = -1.0f;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(-1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3100
     * @tc.name      testNumericDefaultLiterals0031
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : double = -1.0;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(-1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3200
     * @tc.name      testNumericDefaultLiterals0032
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3300
     * @tc.name      testNumericDefaultLiterals0033
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -128;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3400
     * @tc.name      testNumericDefaultLiterals0034
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -129;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3500
     * @tc.name      testNumericDefaultLiterals0035
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32768;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3600
     * @tc.name      testNumericDefaultLiterals0036
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32769;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3700
     * @tc.name      testNumericDefaultLiterals0037
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -2147483648;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3800
     * @tc.name      testNumericDefaultLiterals0038
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -2147483649;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-2147483649);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_3900
     * @tc.name      testNumericDefaultLiterals0039
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -0x7FFF_FFFF_FFFF_FFFF - 1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF_FFFF_FFFF - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4000
     * @tc.name      testNumericDefaultLiterals0040
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : byte | int = 256;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4100
     * @tc.name      testNumericDefaultLiterals0041
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : short | int = 32768;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4200
     * @tc.name      testNumericDefaultLiterals0042
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int | long = 2147483648;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4300
     * @tc.name      testNumericDefaultLiterals0043
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float | double = Double.MAX_VALUE;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4400
     * @tc.name      testNumericDefaultLiterals0044
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiterals0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : float | double = Double.MIN_VALUE;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4500
     * @tc.name      testNumericDefaultLiteralsConst0045
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float = 1.0f;
      let a : float = value;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4600
     * @tc.name      testNumericDefaultLiteralsConst0046
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : double = 1.0;
      let a : double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4700
     * @tc.name      testNumericDefaultLiteralsConst0047
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4800
     * @tc.name      testNumericDefaultLiteralsConst0048
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 127;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_4900
     * @tc.name      testNumericDefaultLiteralsConst0049
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 128;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5000
     * @tc.name      testNumericDefaultLiteralsConst0050
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32767;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5100
     * @tc.name      testNumericDefaultLiteralsConst0051
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = 0x7FFF_FFFF_FFFF_FFFF;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5200
     * @tc.name      testNumericDefaultLiteralsConst0052
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : byte = 16;
      let a : byte = value;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5300
     * @tc.name      testNumericDefaultLiteralsConst0053
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : byte = 127;
      let a : byte = value;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5400
     * @tc.name      testNumericDefaultLiteralsConst0054
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : short = 128;
      let a : short = value;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5500
     * @tc.name      testNumericDefaultLiteralsConst0055
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : short = 32767;
      let a : short = value;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5600
     * @tc.name      testNumericDefaultLiteralsConst0056
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32768;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5700
     * @tc.name      testNumericDefaultLiteralsConst0057
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483647;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5800
     * @tc.name      testNumericDefaultLiteralsConst0058
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = 2147483648;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_5900
     * @tc.name      testNumericDefaultLiteralsConst0059
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = 9223372036854775807;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6000
     * @tc.name      testNumericDefaultLiteralsConst0060
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : byte = -16;
      let a : byte = value;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(-16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6100
     * @tc.name      testNumericDefaultLiteralsConst0061
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : byte = -128;
      let a : byte = value;
      expect(a instanceof byte).assertTrue();
      expect(a).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6200
     * @tc.name      testNumericDefaultLiteralsConst0062
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : short = -129;
      let a : short = value;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6300
     * @tc.name      testNumericDefaultLiteralsConst0063
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : short = -32768;
      let a : short = value;
      expect(a instanceof short).assertTrue();
      expect(a).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6400
     * @tc.name      testNumericDefaultLiteralsConst0064
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x8000_0000;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6500
     * @tc.name      testNumericDefaultLiteralsConst0065
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -0x8000_0001;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0001);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6600
     * @tc.name      testNumericDefaultLiteralsConst0066
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float = -1.0f;
      let a : float = value;
      expect(a instanceof float).assertTrue();
      expect(a).assertEqual(-1.0f);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6700
     * @tc.name      testNumericDefaultLiteralsConst0067
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : double = -1.0;
      let a : double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(-1.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6800
     * @tc.name      testNumericDefaultLiteralsConst0068
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_6900
     * @tc.name      testNumericDefaultLiteralsConst0069
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -128;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7000
     * @tc.name      testNumericDefaultLiteralsConst0070
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -129;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7100
     * @tc.name      testNumericDefaultLiteralsConst0071
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32768;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7200
     * @tc.name      testNumericDefaultLiteralsConst0072
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32769;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7300
     * @tc.name      testNumericDefaultLiteralsConst0073
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -2147483648;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7400
     * @tc.name      testNumericDefaultLiteralsConst0074
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -2147483649;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-2147483649);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7500
     * @tc.name      testNumericDefaultLiteralsConst0075
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -0x7FFF_FFFF_FFFF_FFFF - 1;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF_FFFF_FFFF - 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7600
     * @tc.name      testNumericDefaultLiteralsConst0076
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : byte | int = 256;
      let a : byte | int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7700
     * @tc.name      testNumericDefaultLiteralsConst0077
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : short | int = 32768;
      let a : short | int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7800
     * @tc.name      testNumericDefaultLiteralsConst0078
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int | long = 2147483648;
      let a : int | long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_7900
     * @tc.name      testNumericDefaultLiteralsConst0079
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float | double = Double.MAX_VALUE;
      let a : float | double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8000
     * @tc.name      testNumericDefaultLiteralsConst0080
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericDefaultLiteralsConst0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : float | double = Double.MIN_VALUE;
      let a : float | double = value;
      expect(a instanceof double).assertTrue();
      expect(a).assertEqual(Double.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8100
     * @tc.name      testNumericLogical0081
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 14|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(14|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8200
     * @tc.name      testNumericLogical0082
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 126|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8300
     * @tc.name      testNumericLogical0083
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 126|2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8400
     * @tc.name      testNumericLogical0084
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32766|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8500
     * @tc.name      testNumericLogical0085
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32766|2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8600
     * @tc.name      testNumericLogical0086
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 2147483646|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483646|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8700
     * @tc.name      testNumericLogical0087
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 2147483646|2;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483646|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8800
     * @tc.name      testNumericLogical0088
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 9223372036854775806|1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(9223372036854775806|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_8900
     * @tc.name      testNumericLogical0089
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9000
     * @tc.name      testNumericLogical0090
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -126|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-126|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9100
     * @tc.name      testNumericLogical0091
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -129|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9200
     * @tc.name      testNumericLogical0092
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32766|2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32766|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9300
     * @tc.name      testNumericLogical0093
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32769|1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9400
     * @tc.name      testNumericLogical0094
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x7FFF_FFFF|2;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9500
     * @tc.name      testNumericLogical0095
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -0x8000_0000|-1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0000|-1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9600
     * @tc.name      testNumericLogical0096
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -0x7FFF_FFFF_FFFF_FFFF|2;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF_FFFF_FFFF|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9700
     * @tc.name      testNumericLogical0097
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9800
     * @tc.name      testNumericLogical0098
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 127&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(127&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTONE_9900
     * @tc.name      testNumericLogical0099
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 128&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(128&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0100
     * @tc.name      testNumericLogical_A_0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32767&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32767&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0200
     * @tc.name      testNumericLogical_A_0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32768&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32768&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0300
     * @tc.name      testNumericLogical_A_0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 2147483647&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483647&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0400
     * @tc.name      testNumericLogical_A_0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 2147483648&1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483648&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0500
     * @tc.name      testNumericLogical_A_0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = 9223372036854775807&1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(9223372036854775807&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0600
     * @tc.name      testNumericLogical_A_0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0700
     * @tc.name      testNumericLogical_A_0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -128&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-128&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0800
     * @tc.name      testNumericLogical_A_0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -129&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_0900
     * @tc.name      testNumericLogical_A_0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32768&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32768&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_1000
     * @tc.name      testNumericLogical_A_0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -32769&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_1100
     * @tc.name      testNumericLogical_A_0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x8000_0000&1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8000_0000&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_1200
     * @tc.name      testNumericLogical_A_0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -0x8000_0001&1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0001&1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_1300
     * @tc.name      testNumericLogical_A_0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x7FFF_FFFF_FFFF_FFFF - 1) & 1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1) & 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_1400
     * @tc.name      testNumericLogical_A_0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16^1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16^1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTONE_1500
     * @tc.name      testNumericLogical_A_0015
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical_A_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 126^1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126^1);
    });

  })
}