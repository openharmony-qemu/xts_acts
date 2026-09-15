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
import * as Object2 from './ObjectConstructor2';
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectConstructor2Test() {
  describe('ObjectConstructor2Test', () => {
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
     * @tc.name   ObjectConstructor2Test001
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test001()).assertDeepEquals([1.7976931348623157e+308, "object"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test002
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test002()).assertDeepEquals([5e-324, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test003
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test003()).assertDeepEquals([9007199254740991, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test004
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test004()).assertDeepEquals([-9007199254740991, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test005
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0500
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test005()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectConstructor2Test006
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0600
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test006()).assertDeepEquals(["9223372036854775807", "-9223372036854775808", "9223372036854775808"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test007
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0700
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test007()).assertDeepEquals(["18446744073709551615", "18446744073709551616"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test008
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0800
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test008()).assertDeepEquals([0, ""]);
    });

    /**
     * @tc.name   ObjectConstructor2Test009
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_0900
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test009()).assertDeepEquals([1, "a"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test011
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test011()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test012
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test012()).assertDeepEquals([127, -128, -128]);
    });

    /**
     * @tc.name   ObjectConstructor2Test013
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test013()).assertDeepEquals([255, 0, 255]);
    });

    /**
     * @tc.name   ObjectConstructor2Test014
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test014()).assertDeepEquals([Infinity, -Infinity, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test015
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1500
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test015()).assertDeepEquals([undefined, false, 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test016
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1600
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test016()).assertDeepEquals([3, undefined, false]);
    });

    /**
     * @tc.name   ObjectConstructor2Test017
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1700
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test017()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectConstructor2Test018
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1800
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test018()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectConstructor2Test019
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_1900
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test019()).assertDeepEquals(["object", "object", 42]);
    });

    /**
     * @tc.name   ObjectConstructor2Test020
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2000
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test020()).assertDeepEquals([true, true, 1]);
    });

    /**
     * @tc.name   ObjectConstructor2Test021
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test021()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test022
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test022()).assertDeepEquals([["a", "b", "c"], 3]);
    });

    /**
     * @tc.name   ObjectConstructor2Test023
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test023()).assertDeepEquals([[1, "test", true], 3]);
    });

    /**
     * @tc.name   ObjectConstructor2Test024
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test024()).assertDeepEquals([[["a", 1], ["b", 2]], 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test025
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2500
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test025()).assertDeepEquals([true, 1, 2, 3]);
    });

    /**
     * @tc.name   ObjectConstructor2Test026
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2600
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test026()).assertDeepEquals([true, "value", true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test027
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2700
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test027()).assertDeepEquals([42, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test028
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2800
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test028()).assertDeepEquals([1, 2, ["a"]]);
    });

    /**
     * @tc.name   ObjectConstructor2Test029
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_2900
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test029()).assertDeepEquals([1, true, true, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test030
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3000
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test030()).assertDeepEquals([["a", "hidden"], 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test031
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test031()).assertDeepEquals([2, 1, 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test032
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test032()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test033
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test033()).assertDeepEquals([2, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test034
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test034()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test035
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3500
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test035()).assertDeepEquals([true, 10, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test036
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3600
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test036()).assertDeepEquals([false, 10, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test037
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3700
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test037()).assertDeepEquals([true, 1, 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test038
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3800
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test038()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectConstructor2Test039
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_3900
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test039()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test040
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4000
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test040()).assertDeepEquals(['{"a":1,"b":"test"}', 1]);
    });

    /**
     * @tc.name   ObjectConstructor2Test041
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test041()).assertDeepEquals([true, 1, 2]);
    });

    /**
     * @tc.name   ObjectConstructor2Test042
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test042()).assertDeepEquals([true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test043
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test043()).assertDeepEquals([3, "value", ["0", "1", "2", "customProp"]]);
    });

    /**
     * @tc.name   ObjectConstructor2Test044
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test044()).assertDeepEquals([true, 4, 4]);
    });

    /**
     * @tc.name   ObjectConstructor2Test045
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4500
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test045()).assertDeepEquals([["a", "b", "c"]]);
    });

    /**
     * @tc.name   ObjectConstructor2Test046
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4600
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test046()).assertDeepEquals([[1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectConstructor2Test047
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4700
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test047()).assertDeepEquals(["object", true, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test048
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4800
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test048()).assertDeepEquals(["object", "symbol", "[object Symbol]", true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test049
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_4900
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test049()).assertDeepEquals(["myDescription", "myDescription"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test050
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5000
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test050()).assertDeepEquals([true, "globalKey"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test051
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test051()).assertDeepEquals(["value", "normal", 1]);
    });

    /**
     * @tc.name   ObjectConstructor2Test052
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test052()).assertDeepEquals(["value", true, undefined]);
    });

    /**
     * @tc.name   ObjectConstructor2Test053
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test053()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test054
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test054()).assertDeepEquals(["symbol", true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test055
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5500
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test055()).assertDeepEquals(["object", "42", true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test056
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5600
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test056()).assertDeepEquals(["object", "bigint", "[object BigInt]", true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test057
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5700
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test057()).assertDeepEquals(['15', '50']);
    });

    /**
     * @tc.name   ObjectConstructor2Test058
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5800
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test058()).assertDeepEquals([true, 15]);
    });

    /**
     * @tc.name   ObjectConstructor2Test059
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_5900
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test059()).assertDeepEquals(["12345", "12345", "12345"]);
    });

    /**
     * @tc.name   ObjectConstructor2Test060
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_6000
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test060()).assertDeepEquals(["value", true, '42']);
    });

    /**
     * @tc.name   ObjectConstructor2Test061
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_6100
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test061()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test062
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_6200
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test062()).assertDeepEquals(["bigint", true]);
    });

    /**
     * @tc.name   ObjectConstructor2Test063
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_6300
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test063()).assertDeepEquals(['100', "bigint", '42', '200']);
    });

    /**
     * @tc.name   ObjectConstructor2Test064
     * @tc.number SUB_BUILTINS_OBJECT_CONSTRUCTOR2_TEST_6400
     * @tc.desc   Object Constructor2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectConstructor2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Object2.ObjectConstructor2Test064()).assertDeepEquals([true, true, "symbol", "bigint"]);
    });
  });
}