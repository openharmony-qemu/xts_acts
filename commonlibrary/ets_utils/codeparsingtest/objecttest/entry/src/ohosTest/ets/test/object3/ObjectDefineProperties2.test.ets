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
import * as ObjectDefineProperties2 from './ObjectDefineProperties2'

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectDefineProperties2Test() {
  describe('ObjectDefineProperties2Test', () => {
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
     * @tc.name   ObjectDefineProperties2Test001
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test001()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test002
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test002()).assertDeepEquals([[], ['prop']]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test003
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test003()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test004
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test004()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test005
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test005()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test006
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test006()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test007
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test007()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test008
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test008()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test009
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_0900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test009()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test010
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test010()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test011
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test011()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test012
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test012()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test013
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test013()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test014
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test015
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test015()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test016
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test016()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test017
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test017()).assertDeepEquals(['prop1', 'prop2']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test018
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test018()).assertDeepEquals(['prop1', 'prop2']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test019
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_1900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test019()).assertEqual('{"prop":1}');
    });

    /**
     * @tc.name   ObjectDefineProperties2Test020
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test020()).assertDeepEquals([['prop1', 1], ['prop2', 2]]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test021
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test021()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test022
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test022()[0]).assertDeepEquals(['normal']);
      expect(Array.isArray(ObjectDefineProperties2.ObjectDefineProperties2Test022()[1])).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test023
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test023()).assertDeepEquals([['visible'], 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test024
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test024()).assertDeepEquals(['visible']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test025
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test025()).assertEqual('{"visible":1}');
    });

    /**
     * @tc.name   ObjectDefineProperties2Test026
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test026()).assertDeepEquals(['visible', 'hidden']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test027
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test027()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test028
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test028()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test029
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_2900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test029()).assertDeepEquals([false, []]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test030
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test030()).assertDeepEquals([true, ['prop']]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test031
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test031()).assertDeepEquals([[], ['prop']]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test032
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test032()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test033
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test033()).assertDeepEquals([true, ['prop']]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test034
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test034()).assertDeepEquals([true, ['prop']]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test035
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test035()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test036
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test036()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test038
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test038()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test039
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_3900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test039()).assertDeepEquals([100, 42]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test040
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test040()).assertDeepEquals(['world', 'hello']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test041
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test041()).assertDeepEquals({ a: 100, b: 2 });
    });

    /**
     * @tc.name   ObjectDefineProperties2Test042
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test042()).assertDeepEquals([100, 2, 3, 4]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test043
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test043()).assertEqual('defined');
    });

    /**
     * @tc.name   ObjectDefineProperties2Test044
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test044()).assertEqual('not null');
    });

    /**
     * @tc.name   ObjectDefineProperties2Test045
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test045()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test046
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test046()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test047
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test047()).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test048
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test048()).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test049
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_4900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test049()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test050
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test050()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test051
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test051()).assertDeepEquals([false, 1]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test052
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test052()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test053
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test053()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test054
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test054()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test055
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test055()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test056
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test056()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test057
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test057()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test058
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test058()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test059
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_5900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test059()).assertDeepEquals([100, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test060
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test060()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test061
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test061()).assertDeepEquals([20, 10]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test062
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test062()).assertDeepEquals([300, 100]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test063
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test063()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test064
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test064()).assertDeepEquals([42, 42, 0]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test065
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test065()).assertDeepEquals(['obj', 'obj', 'proto']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test066
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test066()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test067
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test067()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test068
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test068()).assertDeepEquals([55, 66]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test069
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_6900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test069()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test070
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test070()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test071
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test071()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test072
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test072()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test073
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test073()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test074
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test074()).assertDeepEquals([undefined, false, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test075
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test075()).assertDeepEquals([true, undefined, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test076
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test076()).assertDeepEquals([undefined, true, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test077
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test077()).assertDeepEquals([100, undefined, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test078
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test078()).assertDeepEquals([100, 200]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test079
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_7900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test080
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test080()).assertDeepEquals([['b', 'a', 'c'], [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test081
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test081()).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test082
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test082()).assertDeepEquals([true, undefined, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test083
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test083()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test084
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test084()).assertDeepEquals(['prop1', 'prop3']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test085
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test085()).assertDeepEquals([100, 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test086
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test086()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test087
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test087()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test088
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test088()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test089
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_8900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test089()).assertDeepEquals(['int8-custom', 1]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test090
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9000
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test090()).assertDeepEquals([255, 383]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test091
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9100
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test091()).assertEqual(2.5);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test092
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9200
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test092()).assertEqual(600n);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test093
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9300
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test093()).assertDeepEquals(["my-buffer", 16]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test094
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9400
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test094()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test095
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9500
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test095()).assertDeepEquals([0, 16]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test096
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9600
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test096()).assertDeepEquals(['custom-value', 1, 'value1']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test097
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9700
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test097()).assertDeepEquals(['John', 'Jane']);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test098
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9800
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test098()).assertDeepEquals(['number-set', 3]);
    });

    /**
     * @tc.name   ObjectDefineProperties2Test099
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES2_TEST_9900
     * @tc.desc   Object Define Properties2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties2.ObjectDefineProperties2Test099()).assertDeepEquals(['UTC', '2024-01-01', 2024]);
    });
  });
}