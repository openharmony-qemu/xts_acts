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

export default function NumericDefaultLiteralTypesTest02():void {
  describe('NumericDefaultLiteralTypesTest02', () => {
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
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0100
     * @tc.name      testNumericLogical0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 129 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(129 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0200
     * @tc.name      testNumericLogical0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 32766 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0300
     * @tc.name      testNumericLogical0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 32769 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32769 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0400
     * @tc.name      testNumericLogical0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483646 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483646 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0500
     * @tc.name      testNumericLogical0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 2147483649 ^ 1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483649 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0600
     * @tc.name      testNumericLogicalOne0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 9223372036854775806 ^ 1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(9223372036854775806 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0700
     * @tc.name      testNumericLogicalOne0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -16 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0800
     * @tc.name      testNumericLogical0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -127 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-127 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_0900
     * @tc.name      testNumericLogical0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -130 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-130 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1000
     * @tc.name      testNumericLogical0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -32767 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32767 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1100
     * @tc.name      testNumericLogical0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -32770 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32770 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1200
     * @tc.name      testNumericLogical0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -0x8001 ^ 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x8001 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1300
     * @tc.name      testNumericLogical0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -0x8000_0000 ^ 1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0000 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1400
     * @tc.name      testNumericLogical0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogical0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -0x8000_0000_0001 ^ 1;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0000_0001 ^ 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1500
     * @tc.name      testNumericLogicalComplement0015
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~16;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1600
     * @tc.name      testNumericLogicalComplement0016
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~127;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1700
     * @tc.name      testNumericLogicalComplement0017
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~128;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1800
     * @tc.name      testNumericLogicalComplement0018
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~32768;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_1900
     * @tc.name      testNumericLogicalComplement0019
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~32769;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2000
     * @tc.name      testNumericLogicalComplement0020
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~2147483647;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2100
     * @tc.name      testNumericLogicalComplement0021
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = ~2147483648;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2200
     * @tc.name      testNumericLogicalComplement0022
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = ~0x7FFF_FFFF_FFFF_FFFF;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2300
     * @tc.name      testNumericLogicalComplement0023
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-16;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2400
     * @tc.name      testNumericLogicalComplement0024
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-127;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2500
     * @tc.name      testNumericLogicalComplement0025
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-128;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2600
     * @tc.name      testNumericLogicalComplement0026
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-32767;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2700
     * @tc.name      testNumericLogicalComplement0027
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-32768;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2800
     * @tc.name      testNumericLogicalComplement0028
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-2147483648;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_2900
     * @tc.name      testNumericLogicalComplement0029
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = ~-2147483649;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~-2147483649);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3000
     * @tc.name      testNumericLogicalComplement0030
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = ~-0x7FFF_FFFF_FFFF_FFFF;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~-0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3100
     * @tc.name      testNumericLogicalComplement0031
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -~16;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3200
     * @tc.name      testNumericLogicalComplement0032
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -~126;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~126);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3300
     * @tc.name      testNumericLogicalComplement0033
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -~127;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3400
     * @tc.name      testNumericLogicalComplement0034
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -~32766;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3500
     * @tc.name      testNumericLogicalComplement0035
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -~32767;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3600
     * @tc.name      testNumericLogicalComplement0036
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -~2147483647;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3700
     * @tc.name      testNumericLogicalComplement0037
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -~2147483648;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-~2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_3800
     * @tc.name      testNumericLogicalComplement0038
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -~0x7FFF_FFFF_FFFF_FFFF;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-~0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_4200
     * @tc.name      testNumericLogicalComplement0042
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~32767;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_4600
     * @tc.name      testNumericLogicalComplement0046
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = ~9223372036854775807;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_4900
     * @tc.name      testNumericLogicalComplement0049
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-129;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_5100
     * @tc.name      testNumericLogicalComplement0051
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = ~-32769;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_5400
     * @tc.name      testNumericLogicalComplement0054
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = ~-9223372036854775807;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~-9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6200
     * @tc.name      testNumericLogicalComplement0062
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplement0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = -~9223372036854775807;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-~9223372036854775807);
    });
    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6300
     * @tc.name      testNumericLogicalComplementConst0063
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~16;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6400
     * @tc.name      testNumericLogicalComplementConst0064
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~127;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6500
     * @tc.name      testNumericLogicalComplementConst0065
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~128;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6600
     * @tc.name      testNumericLogicalComplementConst0066
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~32768;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6700
     * @tc.name      testNumericLogicalComplementConst0067
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~32769;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6800
     * @tc.name      testNumericLogicalComplementConst0068
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~2147483647;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_6900
     * @tc.name      testNumericLogicalComplementConst0069
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = ~2147483648;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7000
     * @tc.name      testNumericLogicalComplementConst0070
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = ~0x7FFF_FFFF_FFFF_FFFF;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7100
     * @tc.name      testNumericLogicalComplementConst0071
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-16;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7200
     * @tc.name      testNumericLogicalComplementConst0072
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-127;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7300
     * @tc.name      testNumericLogicalComplementConst0073
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-128;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-128);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7400
     * @tc.name      testNumericLogicalComplementConst0074
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-32767;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7500
     * @tc.name      testNumericLogicalComplementConst0075
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-32768;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-32768);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7600
     * @tc.name      testNumericLogicalComplementConst0076
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-2147483648;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7700
     * @tc.name      testNumericLogicalComplementConst0077
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = ~-2147483649;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~-2147483649);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7800
     * @tc.name      testNumericLogicalComplementConst0078
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = ~-0x7FFF_FFFF_FFFF_FFFF;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~-0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_7900
     * @tc.name      testNumericLogicalComplementConst0079
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -~16;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_8000
     * @tc.name      testNumericLogicalComplementConst0080
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -~126;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~126);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_8100
     * @tc.name      testNumericLogicalComplementConst0081
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -~127;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~127);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_8200
     * @tc.name      testNumericLogicalComplementConst0082
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -~32766;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~32766);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_8400
     * @tc.name      testNumericLogicalComplementConst0084
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -~2147483647;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~2147483647);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_8500
     * @tc.name      testNumericLogicalComplementConst0085
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -~2147483648;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-~2147483648);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_8600
     * @tc.name      testNumericLogicalComplementConst0086
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -~0x7FFF_FFFF_FFFF_FFFF;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-~0x7FFF_FFFF_FFFF_FFFF);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_9000
     * @tc.name      testNumericLogicalComplementConst0090
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~32767;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_9400
     * @tc.name      testNumericLogicalComplementConst0094
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = ~9223372036854775807;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_9700
     * @tc.name      testNumericLogicalComplementConst0097
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-129;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-129);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTWO_9900
     * @tc.name      testNumericLogicalComplementConst0099
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = ~-32769;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(~-32769);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTWO_0300
     * @tc.name      testNumericLogicalComplementConst0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = ~-9223372036854775807;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(~-9223372036854775807);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTWO_0800
     * @tc.name      testNumericLogicalComplementConst0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -~32767;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-~32767);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTWO_1100
     * @tc.name      testNumericLogicalComplementConst0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalComplementConst0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -~9223372036854775807;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-~9223372036854775807);
    });

  });
}
