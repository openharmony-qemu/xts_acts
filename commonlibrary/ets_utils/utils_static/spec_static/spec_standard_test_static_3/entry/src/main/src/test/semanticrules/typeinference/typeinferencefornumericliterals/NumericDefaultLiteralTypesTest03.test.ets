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

export default function NumericDefaultLiteralTypesTest03():void {
  describe('NumericDefaultLiteralTypesTest03', () => {
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
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0100
     * @tc.name      testNumericLogicalShift0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 8 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(8 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0200
     * @tc.name      testNumericLogicalShift0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 63 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(63 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0300
     * @tc.name      testNumericLogicalShift0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 64 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(64 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0400
     * @tc.name      testNumericLogicalShift0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16383 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16383 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0500
     * @tc.name      testNumericLogicalShift0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 16384 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16384 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0600
     * @tc.name      testNumericLogicalShift0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 1073741823 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(1073741823 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0700
     * @tc.name      testNumericLogicalShift0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (1073741824).toLong() << (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((1073741824).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0800
     * @tc.name      testNumericLogicalShift0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (9223372036854775807).toLong() << (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_0900
     * @tc.name      testNumericLogicalShift0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -8 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-8 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1000
     * @tc.name      testNumericLogicalShift0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -64 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-64 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1100
     * @tc.name      testNumericLogicalShift0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1200
     * @tc.name      testNumericLogicalShift0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16384 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16384 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1300
     * @tc.name      testNumericLogicalShift0013
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16385 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16385 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1400
     * @tc.name      testNumericLogicalShift0014
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x4000_0000 << 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x4000_0000 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1500
     * @tc.name      testNumericLogicalShift0015
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x4000_0001).toLong() << (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x4000_0001).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1600
     * @tc.name      testNumericLogicalShift0016
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() << (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1700
     * @tc.name      testNumericLogicalShift0017
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1800
     * @tc.name      testNumericLogicalShift0018
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 255 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(255 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_1900
     * @tc.name      testNumericLogicalShift0019
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 256 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2000
     * @tc.name      testNumericLogicalShift0020
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 65535 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65535 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2100
     * @tc.name      testNumericLogicalShift0021
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 65536 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65536 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2200
     * @tc.name      testNumericLogicalShift0022
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 4294967295 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(4294967295 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2300
     * @tc.name      testNumericLogicalShift0023
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (4294967296).toLong() >> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((4294967296).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2400
     * @tc.name      testNumericLogicalShift0024
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (8223372036854775808).toLong() >> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((8223372036854775808).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2500
     * @tc.name      testNumericLogicalShift0025
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2600
     * @tc.name      testNumericLogicalShift0026
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -256 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2700
     * @tc.name      testNumericLogicalShift0027
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -257 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-257 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2800
     * @tc.name      testNumericLogicalShift0028
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65536 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_2900
     * @tc.name      testNumericLogicalShift0029
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65537 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65537 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3000
     * @tc.name      testNumericLogicalShift0030
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x1_0000_0000 >> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x1_0000_0000 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3100
     * @tc.name      testNumericLogicalShift0031
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x1_0000_0010).toLong() >> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x1_0000_0010).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3200
     * @tc.name      testNumericLogicalShift0032
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-8223372036854775808).toLong() >> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-8223372036854775808).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3300
     * @tc.name      testNumericLogicalShift0033
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 32 >>> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3400
     * @tc.name      testNumericLogicalShift0034
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 255 >>> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(255 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3500
     * @tc.name      testNumericLogicalShift0035
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 256 >>> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3600
     * @tc.name      testNumericLogicalShift0036
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 65535 >>> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65535 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3700
     * @tc.name      testNumericLogicalShift0037
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 65536 >>> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65536 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3800
     * @tc.name      testNumericLogicalShift0038
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = 4294967295 >>> 1;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(4294967295 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_3900
     * @tc.name      testNumericLogicalShift0039
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (4294967296).toLong() >>> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((4294967296).toLong() >>> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4000
     * @tc.name      testNumericLogicalShift0040
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (9223372036854775807).toLong() >>> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() >>> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4100
     * @tc.name      testNumericLogicalShift0041
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -16 >>> 25;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 >>> 25);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4200
     * @tc.name      testNumericLogicalShift0042
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -256 >>> 25;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 >>> 25);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4300
     * @tc.name      testNumericLogicalShift0043
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -256 >>> 24;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 >>> 24);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4400
     * @tc.name      testNumericLogicalShift0044
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65536 >>> 17;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 >>> 17);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4500
     * @tc.name      testNumericLogicalShift0045
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -65536 >>> 16;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 >>> 16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4600
     * @tc.name      testNumericLogicalShift0046
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : int = -0x1_0000_0000 >>> 33;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x1_0000_0000 >>> 33);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4700
     * @tc.name      testNumericLogicalShift0047
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x1_0000_0000).toLong() >>> (32).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x1_0000_0000).toLong() >>> (32).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4800
     * @tc.name      testNumericLogicalShift0048
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShift0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() >>> (1).toLong();
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() >>> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_4900
     * @tc.name      testNumericLogicalShiftConst0049
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 8 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(8 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5000
     * @tc.name      testNumericLogicalShiftConst0050
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 63 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(63 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5100
     * @tc.name      testNumericLogicalShiftConst0051
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 64 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(64 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5200
     * @tc.name      testNumericLogicalShiftConst0052
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16383 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16383 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5300
     * @tc.name      testNumericLogicalShiftConst0053
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 16384 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(16384 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5400
     * @tc.name      testNumericLogicalShiftConst0054
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 1073741823 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(1073741823 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5500
     * @tc.name      testNumericLogicalShiftConst0055
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (1073741824).toLong() << (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((1073741824).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5600
     * @tc.name      testNumericLogicalShiftConst0056
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775807).toLong() << (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5700
     * @tc.name      testNumericLogicalShiftConst0057
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -8 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-8 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5800
     * @tc.name      testNumericLogicalShiftConst0058
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -64 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-64 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_5900
     * @tc.name      testNumericLogicalShiftConst0059
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6000
     * @tc.name      testNumericLogicalShiftConst0060
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16384 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16384 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6100
     * @tc.name      testNumericLogicalShiftConst0061
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16385 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16385 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6200
     * @tc.name      testNumericLogicalShiftConst0062
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x4000_0000 << 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x4000_0000 << 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6300
     * @tc.name      testNumericLogicalShiftConst0063
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x4000_0001).toLong() << (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x4000_0001).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6400
     * @tc.name      testNumericLogicalShiftConst0064
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() << (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x3FFF_FFFF_FFFF_FFFF - 1).toLong() << (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6500
     * @tc.name      testNumericLogicalShiftConst0065
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6600
     * @tc.name      testNumericLogicalShiftConst0066
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 255 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(255 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6700
     * @tc.name      testNumericLogicalShiftConst0067
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 256 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6800
     * @tc.name      testNumericLogicalShiftConst0068
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 65535 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65535 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_6900
     * @tc.name      testNumericLogicalShiftConst0069
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 65536 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65536 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7000
     * @tc.name      testNumericLogicalShiftConst0070
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 4294967295 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(4294967295 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7100
     * @tc.name      testNumericLogicalShiftConst0071
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (4294967296).toLong() >> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((4294967296).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7200
     * @tc.name      testNumericLogicalShiftConst0072
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (8223372036854775808).toLong() >> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((8223372036854775808).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7300
     * @tc.name      testNumericLogicalShiftConst0073
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7400
     * @tc.name      testNumericLogicalShiftConst0074
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -256 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7500
     * @tc.name      testNumericLogicalShiftConst0075
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -257 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-257 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7600
     * @tc.name      testNumericLogicalShiftConst0076
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65536 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7700
     * @tc.name      testNumericLogicalShiftConst0077
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65537 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65537 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7800
     * @tc.name      testNumericLogicalShiftConst0078
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x1_0000_0000 >> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x1_0000_0000 >> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_7900
     * @tc.name      testNumericLogicalShiftConst0079
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x1_0000_0010).toLong() >> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x1_0000_0010).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8000
     * @tc.name      testNumericLogicalShiftConst0080
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-8223372036854775808).toLong() >> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-8223372036854775808).toLong() >> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8100
     * @tc.name      testNumericLogicalShiftConst0081
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32 >>> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8200
     * @tc.name      testNumericLogicalShiftConst0082
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 255 >>> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(255 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8300
     * @tc.name      testNumericLogicalShiftConst0083
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 256 >>> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(256 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8400
     * @tc.name      testNumericLogicalShiftConst0084
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 65535 >>> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65535 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8500
     * @tc.name      testNumericLogicalShiftConst0085
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 65536 >>> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(65536 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8600
     * @tc.name      testNumericLogicalShiftConst0086
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 4294967295 >>> 1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(4294967295 >>> 1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8700
     * @tc.name      testNumericLogicalShiftConst0087
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (4294967296).toLong() >>> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((4294967296).toLong() >>> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8800
     * @tc.name      testNumericLogicalShiftConst0088
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775807).toLong() >>> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775807).toLong() >>> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_8900
     * @tc.name      testNumericLogicalShiftConst0089
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16 >>> 25;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16 >>> 25);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9000
     * @tc.name      testNumericLogicalShiftConst0090
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -256 >>> 25;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 >>> 25);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9100
     * @tc.name      testNumericLogicalShiftConst0091
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -256 >>> 24;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-256 >>> 24);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9200
     * @tc.name      testNumericLogicalShiftConst0092
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65536 >>> 17;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 >>> 17);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9300
     * @tc.name      testNumericLogicalShiftConst0093
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -65536 >>> 16;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-65536 >>> 16);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9400
     * @tc.name      testNumericLogicalShiftConst0094
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x1_0000_0000 >>> 33;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x1_0000_0000 >>> 33);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9500
     * @tc.name      testNumericLogicalShiftConst0095
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x1_0000_0000).toLong() >>> (32).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x1_0000_0000).toLong() >>> (32).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9600
     * @tc.name      testNumericLogicalShiftConst0096
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalShiftConst0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() >>> (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((-0x7FFF_FFFF_FFFF_FFFF - 1).toLong() >>> (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9700
     * @tc.name      testNumericLogicalConst0097
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 14|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(14|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9800
     * @tc.name      testNumericLogicalConst0098
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 126|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_TYPESTESTTHREE_9900
     * @tc.name      testNumericLogicalConst0099
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 126|2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(126|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0100
     * @tc.name      testNumericLogicalConst_A_0001
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32766|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0200
     * @tc.name      testNumericLogicalConst_A_0002
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 32766|2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(32766|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0300
     * @tc.name      testNumericLogicalConst_A_0003
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = 2147483646|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(2147483646|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0400
     * @tc.name      testNumericLogicalConst_A_0004
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = 2147483646|2;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(2147483646|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0500
     * @tc.name      testNumericLogicalConst_A_0005
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = (9223372036854775806).toLong() | (1).toLong();
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual((9223372036854775806).toLong() | (1).toLong());
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0600
     * @tc.name      testNumericLogicalConst_A_0006
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -16|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-16|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0700
     * @tc.name      testNumericLogicalConst_A_0007
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -126|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-126|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0800
     * @tc.name      testNumericLogicalConst_A_0008
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -129|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-129|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_0900
     * @tc.name      testNumericLogicalConst_A_0009
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32766|2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32766|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_1000
     * @tc.name      testNumericLogicalConst_A_0010
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -32769|1;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-32769|1);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_1100
     * @tc.name      testNumericLogicalConst_A_0011
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : int = -0x7FFF_FFFF|2;
      let a : int = value;
      expect(a instanceof int).assertTrue();
      expect(a).assertEqual(-0x7FFF_FFFF|2);
    });

    /**
     * @tc.number    SUB_NUMERIC_DEFAULT_LITERAL_A_TYPESTESTTHREE_1200
     * @tc.name      testNumericLogicalConst_A_0012
     * @tc.desc      The type of expression of a numeric type for Constant Expressions is first
     * evaluated from the expression. The evaluated numeric result type can be inferred
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericLogicalConst_A_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value : long = -0x8000_0000|-1;
      let a : long = value;
      expect(a instanceof long).assertTrue();
      expect(a).assertEqual(-0x8000_0000|-1);
    });

  })
}