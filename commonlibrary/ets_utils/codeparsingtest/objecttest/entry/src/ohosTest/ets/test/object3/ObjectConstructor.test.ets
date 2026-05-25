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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import * as Object from './ObjectConstructor';
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectConstructorTest() {
  describe('ObjectConstructorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   ObjectConstructorTest001
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest001()).assertDeepEquals([{}, "object", true]);
    });

    /**
     * @tc.name   ObjectConstructorTest002
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest002()).assertDeepEquals([{}, "object", true]);
    });

    /**
     * @tc.name   ObjectConstructorTest003
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest003()).assertDeepEquals([{}, {}, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest004
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest004()).assertDeepEquals([{}, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest005
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest005()).assertDeepEquals([{}, {}, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest006
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest006()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest007
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest007()).assertDeepEquals(["object", true, 42, "42"]);
    });

    /**
     * @tc.name   ObjectConstructorTest008
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest008()).assertDeepEquals(["object", 0, -0, true, Infinity, -Infinity]);
    });

    /**
     * @tc.name   ObjectConstructorTest009
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_0900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest009()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest010
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest010()).assertDeepEquals([16, 8, 1000]);
    });

    /**
     * @tc.name   ObjectConstructorTest011
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest011()).assertDeepEquals(["object", true, "hello", 5]);
    });

    /**
     * @tc.name   ObjectConstructorTest012
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest012()).assertDeepEquals([true, true, 10]);
    });

    /**
     * @tc.name   ObjectConstructorTest013
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest013()).assertDeepEquals(["object", "", 0]);
    });

    /**
     * @tc.name   ObjectConstructorTest015
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest015()).assertDeepEquals(["object", true, true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest016
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest016()).assertDeepEquals(["object", true, "object", true]);
    });

    /**
     * @tc.name   ObjectConstructorTest017
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest017()).assertDeepEquals(["object", true, '9007199254740991']);
    });

    /**
     * @tc.name   ObjectConstructorTest018
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest018()).assertDeepEquals(['9223372036854775807', '18446744073709551615', '-9223372036854775808']);
    });

    /**
     * @tc.name   ObjectConstructorTest019
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_1900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest019()).assertDeepEquals(["object", "Symbol(test)", true, "string"]);
    });

    /**
     * @tc.name   ObjectConstructorTest020
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest020()).assertDeepEquals(["mySymbol", "mySymbol"]);
    });

    /**
     * @tc.name   ObjectConstructorTest021
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest021()).assertDeepEquals(["value", 1]);
    });

    /**
     * @tc.name   ObjectConstructorTest022
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest022()).assertDeepEquals([true, 1, "test"]);
    });

    /**
     * @tc.name   ObjectConstructorTest023
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest023()).assertDeepEquals([true, 2, 3]);
    });

    /**
     * @tc.name   ObjectConstructorTest024
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest024()).assertDeepEquals([true, 0]);
    });

    /**
     * @tc.name   ObjectConstructorTest025
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest025()).assertDeepEquals([true, true, 5]);
    });

    /**
     * @tc.name   ObjectConstructorTest026
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest026()).assertDeepEquals([true, 5, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest027
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest027()).assertDeepEquals([true, 101, false, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest028
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest028()).assertDeepEquals([true, "function", 42]);
    });

    /**
     * @tc.name   ObjectConstructorTest029
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_2900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest029()).assertDeepEquals([true, "function", "arrow"]);
    });

    /**
     * @tc.name   ObjectConstructorTest030
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest030()).assertDeepEquals([true, "AsyncFunction"]);
    });

    /**
     * @tc.name   ObjectConstructorTest031
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest031()).assertDeepEquals([true, true, "object"]);
    });

    /**
     * @tc.name   ObjectConstructorTest032
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest032()).assertDeepEquals([true, 2024]);
    });

    /**
     * @tc.name   ObjectConstructorTest033
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest033()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest034
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest034()).assertDeepEquals([true, "gim", "test"]);
    });

    /**
     * @tc.name   ObjectConstructorTest035
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest035()).assertDeepEquals([true, true, "test error"]);
    });

    /**
     * @tc.name   ObjectConstructorTest036
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest036()).assertDeepEquals([true, true, 127, -128]);
    });

    /**
     * @tc.name   ObjectConstructorTest037
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest037()).assertDeepEquals([true, 3, 255]);
    });

    /**
     * @tc.name   ObjectConstructorTest038
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest038()).assertDeepEquals([true, 4, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest039
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_3900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest039()).assertDeepEquals([true, 2, "value1"]);
    });

    /**
     * @tc.name   ObjectConstructorTest040
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest040()).assertDeepEquals([true, 3, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest041
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest041()).assertDeepEquals([true, 16]);
    });

    /**
     * @tc.name   ObjectConstructorTest042
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest042()).assertDeepEquals([true, 16]);
    });

    /**
     * @tc.name   ObjectConstructorTest043
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest043()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest044
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest044()).assertDeepEquals([true, true, 1]);
    });

    /**
     * @tc.name   ObjectConstructorTest045
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest045()).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectConstructorTest046
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest046()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest047
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest047()).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectConstructorTest048
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest048()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest049
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_4900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest049()).assertEqual('TypeError');
    });

    /**
     * @tc.name   ObjectConstructorTest050
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest050()).assertDeepEquals([true, 10]);
    });

    /**
     * @tc.name   ObjectConstructorTest051
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest051()).assertDeepEquals([100, 100]);
    });

    /**
     * @tc.name   ObjectConstructorTest052
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest052()).assertDeepEquals([true, "value", true]);
    });

    /**
     * @tc.name   ObjectConstructorTest053
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest053()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ObjectConstructorTest054
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest054()).assertDeepEquals([true, 42, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest055
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest055()).assertDeepEquals([true, "parent", "child"]);
    });

    /**
     * @tc.name   ObjectConstructorTest056
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest056()).assertDeepEquals([1, 2, ["a"]]);
    });

    /**
     * @tc.name   ObjectConstructorTest057
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest057()).assertDeepEquals([ "symbolValue", "[null]" ]);
    });

    /**
     * @tc.name   ObjectConstructorTest058
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest058()).assertDeepEquals([true, undefined, null]);
    });

    /**
     * @tc.name   ObjectConstructorTest059
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_5900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest059()).assertDeepEquals([true, Infinity, -Infinity]);
    });

    /**
     * @tc.name   ObjectConstructorTest061
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest061()).assertDeepEquals(["object", "object", 0, 0, true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest062
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest062()).assertDeepEquals(["object", "object", true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest063
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest063()).assertDeepEquals(["object", "object", true, true, 42, 42]);
    });

    /**
     * @tc.name   ObjectConstructorTest064
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest064()).assertDeepEquals(["object", "object", 4, 4]);
    });

    /**
     * @tc.name   ObjectConstructorTest065
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest065()).assertDeepEquals(["object", "object", true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest066
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest066()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest067
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest067()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest068
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest068()).assertDeepEquals(["object", "object", true, true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest069
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_6900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest069()).assertDeepEquals(["object", "object", "42", "42"]);
    });

    /**
     * @tc.name   ObjectConstructorTest070
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest070()).assertDeepEquals(["object", "object", 0, 0]);
    });

    /**
     * @tc.name   ObjectConstructorTest071
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest071()).assertDeepEquals([true, true, undefined]);
    });

    /**
     * @tc.name   ObjectConstructorTest072
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest072()).assertDeepEquals(["object", true,  "[object Object]"]);
    });

    /**
     * @tc.name   ObjectConstructorTest073
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest073()).assertDeepEquals(["object", false, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest074
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest074()).assertDeepEquals([ "{}", "\"object\"", "true" ]);
    });

    /**
     * @tc.name   ObjectConstructorTest075
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest075()).assertDeepEquals(["value", "hiddenValue", true]);
    });

    /**
     * @tc.name   ObjectConstructorTest076
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest076()).assertDeepEquals(["Hello", true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest077
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest077()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest078
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest078()).assertDeepEquals([true, 2, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest079
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_7900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest079()).assertDeepEquals([true, "Object", true, "Number"]);
    });

    /**
     * @tc.name   ObjectConstructorTest081
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest081()).assertDeepEquals(["[object Object]", false, "42"]);
    });

    /**
     * @tc.name   ObjectConstructorTest082
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest082()).assertDeepEquals([true, 42]);
    });

    /**
     * @tc.name   ObjectConstructorTest083
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest083()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest084
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest084()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest085
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest085()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest086
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest086()).assertDeepEquals(["object", "object", "object", "object", "object", "object", "object", "object", "object"]);
    });

    /**
     * @tc.name   ObjectConstructorTest087
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest087()).assertDeepEquals(["number", "object", "string", "object", "boolean", "object"]);
    });

    /**
     * @tc.name   ObjectConstructorTest088
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest088()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest089
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_8900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest089()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest090
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9000
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest090()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest091
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9100
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest091()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest092
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9200
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest092()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest093
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9300
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest093()).assertDeepEquals([true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructorTest094
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9400
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest094()).assertDeepEquals(["Number", "String", "Boolean", "Object", "Array", "Map"]);
    });

    /**
     * @tc.name   ObjectConstructorTest095
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9500
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest095()).assertDeepEquals([
        "[object Number]",
        "[object String]",
        "[object Boolean]",
        "[object Object]",
        "[object Array]",
        "[object Map]",
        "[object Set]"
      ]);
    });

    /**
     * @tc.name   ObjectConstructorTest096
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9600
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest096()).assertDeepEquals([
        "[object Date]",
        "[object RegExp]",
        "[object Error]",
        "[object Promise]",
        "[object Symbol]",
        "[object BigInt]"
      ]);
    });

    /**
     * @tc.name   ObjectConstructorTest097
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9700
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest097()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectConstructorTest098
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9800
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest098()).assertDeepEquals(["symbol", true, "[object Symbol]"]);
    });

    /**
     * @tc.name   ObjectConstructorTest099
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR_TEST_9900
     * @tc.desc   Object Constructor Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object.ObjectConstructorTest099()).assertDeepEquals(["bigint", true, "[object BigInt]"]);
    });
  });
}