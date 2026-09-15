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
import * as ObjectKeys2 from  './ObjectKeys2';
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectKeys2Test() {
  describe('ObjectKeys2Test', () => {
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
     * @tc.name   ObjectKeys2Test001
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test001()).assertDeepEquals([['a'], ['a', 'b']]);
    });

    /**
     * @tc.name   ObjectKeys2Test002
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test002()).assertDeepEquals([['a'], ['a', 'b'], "[null]"]);
    });

    /**
     * @tc.name   ObjectKeys2Test003
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test003()).assertDeepEquals([['a', 'b'], "[null,null]", 4]);
    });

    /**
     * @tc.name   ObjectKeys2Test005
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test005()).assertDeepEquals([['own'], ['own']]);
    });

    /**
     * @tc.name   ObjectKeys2Test006
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test006()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeys2Test007
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test007()).assertDeepEquals(['["a","b","c"]', '["a","b","c"]']);
    });

    /**
     * @tc.name   ObjectKeys2Test008
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test008()).assertDeepEquals(['name', 'age']);
    });

    /**
     * @tc.name   ObjectKeys2Test009
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_0900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test009()).assertDeepEquals(['a: 1', 'b: 2', 'c: 3']);
    });

    /**
     * @tc.name   ObjectKeys2Test010
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test010()).assertDeepEquals(['A', 'B', 'C']);
    });

    /**
     * @tc.name   ObjectKeys2Test011
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test011()).assertDeepEquals(['a1', 'a2']);
    });

    /**
     * @tc.name   ObjectKeys2Test012
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test012()).assertEqual(6);
    });

    /**
     * @tc.name   ObjectKeys2Test013
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test013()).assertEqual('b');
    });

    /**
     * @tc.name   ObjectKeys2Test014
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test014()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test015
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test015()).assertDeepEquals(['a']);
    });

    /**
     * @tc.name   ObjectKeys2Test016
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test016()).assertDeepEquals([['a'], [], ['a']]);
    });

    /**
     * @tc.name   ObjectKeys2Test017
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test017()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeys2Test018
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test018()).assertDeepEquals(['a']);
    });

    /**
     * @tc.name   ObjectKeys2Test019
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_1900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test019()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeys2Test020
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test020()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeys2Test021
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test021()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeys2Test022
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test022()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeys2Test024
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test024()).assertDeepEquals(['0', '1', '2', '3', '4']);
    });

    /**
     * @tc.name   ObjectKeys2Test025
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test025()).assertDeepEquals(['0', 'abc', 'aaa']);
    });

    /**
     * @tc.name   ObjectKeys2Test026
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test026()).assertDeepEquals(['0', '1', '2', '3', '4', '5']);
    });

    /**
     * @tc.name   ObjectKeys2Test027
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test027()).assertDeepEquals(['0', '1', '2', '3', '4', '5']);
    });

    /**
     * @tc.name   ObjectKeys2Test028
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test028()).assertDeepEquals(['0', '1', '2']);
    });

    /**
     * @tc.name   ObjectKeys2Test029
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_2900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test029()).assertEqual(256);
    });

    /**
     * @tc.name   ObjectKeys2Test030
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test030()).assertDeepEquals(['0', '32767', '-32768']);
    });

    /**
     * @tc.name   ObjectKeys2Test031
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test031()).assertDeepEquals(['2147483647', '-2147483648']);
    });

    /**
     * @tc.name   ObjectKeys2Test032
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test032()).assertDeepEquals(['-9223372036854776000', '9223372036854776000']);
    });

    /**
     * @tc.name   ObjectKeys2Test033
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test033()).assertDeepEquals(['16053919793946753024']);
    });

    /**
     * @tc.name   ObjectKeys2Test034
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test034()).assertDeepEquals(['1e3', '2.5e-2']);
    });

    /**
     * @tc.name   ObjectKeys2Test035
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test035()).assertDeepEquals(['true', 'false']);
    });

    /**
     * @tc.name   ObjectKeys2Test036
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test036()).assertDeepEquals(["0", "NaN", "", "null", "undefined"]);
    });

    /**
     * @tc.name   ObjectKeys2Test037
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test037()).assertEqual(95);
    });

    /**
     * @tc.name   ObjectKeys2Test038
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test038()).assertEqual(32);
    });

    /**
     * @tc.name   ObjectKeys2Test039
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_3900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test039()).assertDeepEquals(['👆', '👿', '👀', '💯']);
    });

    /**
     * @tc.name   ObjectKeys2Test040
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_4000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test040()).assertDeepEquals(['👆', '👿']);
    });

    /**
     * @tc.name   ObjectKeys2Test041
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_4100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test041()).assertDeepEquals(['\\a', '\\b', '\\n', '\\t']);
    });

    /**
     * @tc.name   ObjectKeys2Test046
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_4600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test046()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test047
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_4700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test047()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeys2Test048
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_4800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test048()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test049
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_4900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test049()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeys2Test050
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test050()).assertEqual(3);
    });

    /**
     * @tc.name   ObjectKeys2Test051
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test051()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeys2Test052
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test052()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeys2Test053
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test053()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeys2Test054
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test054()).assertDeepEquals([['modified', 'b', 'newKey'], ['a', 'b']]);
    });

    /**
     * @tc.name   ObjectKeys2Test055
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test055()).assertDeepEquals([['a', 'b', 'c'], ['b', 'a', 'c']]);
    });

    /**
     * @tc.name   ObjectKeys2Test056
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test056()).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.name   ObjectKeys2Test058
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test058()).assertDeepEquals([['a', 'b', 'c'], ['a', 'b', 'c']]);
    });

    /**
     * @tc.name   ObjectKeys2Test059
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_5900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test059()).assertDeepEquals([0, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test060
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test060()).assertDeepEquals([0, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test061
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test061()).assertDeepEquals([0, 0, 0]);
    });

    /**
     * @tc.name   ObjectKeys2Test062
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test062()).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.name   ObjectKeys2Test063
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test063()).assertEqual(3);
    });

    /**
     * @tc.name   ObjectKeys2Test064
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test064()).assertEqual(3.5);
    });

    /**
     * @tc.name   ObjectKeys2Test065
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test065()).assertDeepEquals({ id: 1, name: 'test' });
    });

    /**
     * @tc.name   ObjectKeys2Test066
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test066()).assertDeepEquals({ newName1: 1, newName2: 2 });
    });

    /**
     * @tc.name   ObjectKeys2Test067
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test067()).assertDeepEquals([{ a: 1, b: { c: 2 } }, true, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test068
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test068()).assertDeepEquals([['level1', 'other'], ['level2'], ['level3'], ['value']]);
    });

    /**
     * @tc.name   ObjectKeys2Test069
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_6900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test069()).assertDeepEquals(['obj', 'arr', 'func', 'num', 'str', 'bool', 'null', 'undef']);
    });

    /**
     * @tc.name   ObjectKeys2Test070
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test070()).assertDeepEquals([['a: 1', 'b: 2', 'c: 3'], ['a: 1', 'b: 2', 'c: 3']]);
    });

    /**
     * @tc.name   ObjectKeys2Test071
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test071()).assertDeepEquals(['自有属性: a', '自有属性: b']);
    });

    /**
     * @tc.name   ObjectKeys2Test072
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test072()).assertDeepEquals(['a 可枚举: true', 'b 可枚举: true']);
    });

    /**
     * @tc.name   ObjectKeys2Test073
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test073()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test074
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test074()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectKeys2Test075
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test075()).assertDeepEquals([
        ['a'],
        ['0', '1'],
        ['0', '1', '2'],
        []
      ]);
    });

    /**
     * @tc.name   ObjectKeys2Test077
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test077()).assertDeepEquals(['constructor', 'normal']);
    });

    /**
     * @tc.name   ObjectKeys2Test078
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test078()).assertDeepEquals([['a', 'self'], true]);
    });

    /**
     * @tc.name   ObjectKeys2Test079
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_7900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test079()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectKeys2Test080
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test080()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectKeys2Test081
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test081()).assertEqual(3);
    });

    /**
     * @tc.name   ObjectKeys2Test082
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test082()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectKeys2Test083
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test083()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectKeys2Test084
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test084()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectKeys2Test085
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test085()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectKeys2Test086
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test086()).assertDeepEquals([1, 'test', [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectKeys2Test087
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test087()).assertEqual('value');
    });

    /**
     * @tc.name   ObjectKeys2Test088
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test088()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectKeys2Test089
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_8900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test089()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectKeys2Test090
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9000
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test090()).assertEqual('value');
    });

    /**
     * @tc.name   ObjectKeys2Test091
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9100
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test091()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectKeys2Test092
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9200
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test092()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectKeys2Test093
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9300
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test093()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectKeys2Test094
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9400
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test094()).assertDeepEquals([undefined, null, true, Infinity]);
    });

    /**
     * @tc.name   ObjectKeys2Test095
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9500
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test095()).assertDeepEquals(new Uint8Array([72, 101, 108, 108, 111]));
    });

    /**
     * @tc.name   ObjectKeys2Test096
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9600
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test096()).assertEqual('value1');
    });

    /**
     * @tc.name   ObjectKeys2Test097
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9700
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test097()).assertEqual(3);
    });

    /**
     * @tc.name   ObjectKeys2Test098
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9800
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test098()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeys2Test099
     * @tc.number SUB_BUILTINS_OBJECT_KEYS2_TEST_9900
     * @tc.desc   Object Keys2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeys2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys2.ObjectKeys2Test099()).assertEqual(true);
    });
  });
}