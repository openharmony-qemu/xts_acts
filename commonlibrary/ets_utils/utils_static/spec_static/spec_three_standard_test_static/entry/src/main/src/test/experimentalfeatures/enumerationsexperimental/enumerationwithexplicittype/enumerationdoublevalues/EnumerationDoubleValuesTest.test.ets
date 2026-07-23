'use static'
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../../hypium/index';
import Utils from '../../../../Util.test'

const a: number = 1.23;
const b: number = 1.234;
const a1: number = 0;
const b1: number = 200;

class Enum0 {
  static readonly first: number = 1.1;
  static readonly second: number = 1.2;
  static readonly third: number = 1.3;
}

class Enum1 {
  static readonly first: number = 10e1;
  static readonly second: number = 1.2;
  static readonly third: number = 1.1;
}

class Enum2 {
  static readonly first: number = 1.7976931348623155e+308;
  static readonly second: number = 1.7976931348623157e+308;
}

class Enum3 {
  static readonly first: number = a;
  static readonly second: number = b;
  static readonly third: number = b - 1.1;
}

class Enum4 {
  static readonly first: number = -1.1;
  static readonly second: number = -1.2;
  static readonly third: number = -42.43;
}

class Enum5 {
  static readonly first: number = -2;
  static readonly second: number = -1;
  static readonly third: number = 0;
  static readonly fourth: number = 1;
}

class Enum6 {
  static readonly first: number = -2;
  static readonly second: number = -1;
  static readonly third: number = 0;
  static readonly fourth: number = 1;
}

class Enum7 {
  static readonly first: number = -300;
  static readonly second: number = -1;
  static readonly third: number = 0;
  static readonly fourth: number = 300;
}

class Enum8 {
  static readonly first: number = 0;
  static readonly second: number = 200;
}

class Enum9 {
  static readonly a: number = 0x0;
  static readonly b: number = 0x1;
  static readonly c: number = 0x5;
  static readonly d: number = 0x6;
}

class Enum10 {
  static readonly a: number = 0;
  static readonly b: number = 1;
  static readonly c: number = 5;
  static readonly d: number = 6;
}

export default function EnumerationDoubleValuesTest(): void {
  describe('EnumerationDoubleValuesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0100
     * @tc.name      testEnumerationDoubleValues0001
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum0.first).assertEqual(1.1);
      expect(Enum0.second).assertEqual(1.2);
      expect(Enum0.third).assertEqual(1.3);
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0200
     * @tc.name      testEnumerationDoubleValues0002
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum1.first).assertEqual(100);
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0300
     * @tc.name      testEnumerationDoubleValues0003
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum2.first).assertEqual(1.7976931348623155e+308);
      expect(Enum2.second).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0400
     * @tc.name      testEnumerationDoubleValues0004
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum3.first).assertEqual(a);
      expect(Enum3.second).assertEqual(b);
      expect(Enum3.third).assertEqual(b - 1.1);
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0500
     * @tc.name      testEnumerationDoubleValues0005
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('' + Enum4.first).assertEqual('-1.1');
      expect('' + Enum4.second).assertEqual('-1.2');
      expect('' + Enum4.third).assertEqual('-42.43');
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0600
     * @tc.name      testEnumerationDoubleValues0006
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('' + Enum5.first).assertEqual('-2');
      expect('' + Enum5.second).assertEqual('-1');
      expect('' + Enum5.third).assertEqual('0');
      expect('' + Enum5.fourth).assertEqual('1');
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0800
     * @tc.name      testEnumerationDoubleValues0008
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('' + Enum7.first).assertEqual('-300');
      expect('' + Enum7.second).assertEqual('-1');
      expect('' + Enum7.third).assertEqual('0');
      expect('' + Enum7.fourth).assertEqual('300');
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_0900
     * @tc.name      testEnumerationDoubleValues0009
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('' + Enum8.first).assertEqual('0');
      expect('' + Enum8.second).assertEqual('200');
    });

    /**
     * @tc.number    SUB_ENUMERATION_DOUBLE_VALUES_TEST_1000
     * @tc.name      testEnumerationDoubleValues0010
     * @tc.desc      The integer value of an enum constant is set implicitly if an enumeration constant specifies no value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationDoubleValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum9.a).assertEqual(0x0);
      expect(Enum9.b).assertEqual(0x1);
      expect(Enum9.d).assertEqual(0x6);
    });
  })
}