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
import * as ObjectFreeze2 from './ObjectFreeze2';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectFreeze2Test() {
  describe('ObjectFreeze2Test', () => {
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
     * @tc.name   ObjectFreeze2Test001
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test001()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test002
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test002()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test003
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test004
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test004()).assertDeepEquals("[object DataView]");
    });

    /**
     * @tc.name   ObjectFreeze2Test005
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test005()).assertDeepEquals([32, 0, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test006
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test006()).assertDeepEquals([true, 16]);
    });

    /**
     * @tc.name   ObjectFreeze2Test007
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test007()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test008
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test008()).assertDeepEquals([Infinity, 0]);
    });

    /**
     * @tc.name   ObjectFreeze2Test009
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_0900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test009()).assertDeepEquals(['NaN','0']);
    });

    /**
     * @tc.name   ObjectFreeze2Test010
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test010()).assertDeepEquals([255, 0, 0]);
    });

    /**
     * @tc.name   ObjectFreeze2Test011
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test011()).assertEqual('aValue');
    });

    /**
     * @tc.name   ObjectFreeze2Test012
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test012()).assertDeepEquals(['Mayank', 'Noida']);
    });

    /**
     * @tc.name   ObjectFreeze2Test013
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test013()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectFreeze2Test014
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test014()).assertEqual('modified');
    });

    /**
     * @tc.name   ObjectFreeze2Test015
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test015()).assertEqual(null);
    });

    /**
     * @tc.name   ObjectFreeze2Test016
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test016()).assertDeepEquals([1, 2, { nested: 'value' }]);
    });

    /**
     * @tc.name   ObjectFreeze2Test017
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test017()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test018
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test018()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test019
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_1900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test019()).assertDeepEquals([2, 1]);
    });

    /**
     * @tc.name   ObjectFreeze2Test020
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test020()).assertDeepEquals([true, false, true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test021
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test021()).assertDeepEquals([true, false, undefined]);
    });

    /**
     * @tc.name   ObjectFreeze2Test022
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test022()).assertDeepEquals([true, false, undefined]);
    });

    /**
     * @tc.name   ObjectFreeze2Test023
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test023()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test024
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test024()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test025
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test025()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectFreeze2Test026
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test026()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test027
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test027()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test028
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test028()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test029
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_2900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test029()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test030
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test030()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectFreeze2Test031
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test031()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test032
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test032()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test033
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test033()).assertDeepEquals([undefined, undefined]);
    });

    /**
     * @tc.name   ObjectFreeze2Test034
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test034()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test035
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test035()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test036
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test036()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test037
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test037()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test038
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test038()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test039
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_3900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test039()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreeze2Test040
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test040()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test041
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test041()).assertDeepEquals([true, { a: 1 }]);
    });

    /**
     * @tc.name   ObjectFreeze2Test042
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test042()).assertDeepEquals([true, { a: 1 }]);
    });

    /**
     * @tc.name   ObjectFreeze2Test043
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test043()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectFreeze2Test044
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test044()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectFreeze2Test045
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test045()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ObjectFreeze2Test046
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test046()).assertDeepEquals([['a', 1], ['b', 2], ['c', 3]]);
    });

    /**
     * @tc.name   ObjectFreeze2Test047
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test047()).assertDeepEquals([{ a: 1, b: 2 }, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test048
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test048()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test049
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_4900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test049()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test050
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test050()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test051
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test051()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test052
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test052()).assertDeepEquals([42, 'number', 'hello', 'string', true, 'boolean']);
    });

    /**
     * @tc.name   ObjectFreeze2Test053
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test053()).assertDeepEquals([undefined, undefined]);
    });

    /**
     * @tc.name   ObjectFreeze2Test054
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test054()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test055
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test055()).assertDeepEquals(["9007199254740991", true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test056
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test056()).assertDeepEquals([{ a: 1, b: 'test' }, true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test057
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test057()).assertDeepEquals([[1, 2, 3], true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test058
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test058()).assertDeepEquals([true, 'test', true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test059
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_5900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test059()).assertEqual('value');
    });

    /**
     * @tc.name   ObjectFreeze2Test060
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test060()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test061
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test061()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test062
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test062()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test063
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test063()).assertDeepEquals([[], 'secret']);
    });

    /**
     * @tc.name   ObjectFreeze2Test064
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test064()).assertDeepEquals([true, 1, 2]);
    });

    /**
     * @tc.name   ObjectFreeze2Test065
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test065()).assertDeepEquals([true, false, 2]);
    });

    /**
     * @tc.name   ObjectFreeze2Test066
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test066()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test067
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test067()).assertDeepEquals(['test', 'test']);
    });

    /**
     * @tc.name   ObjectFreeze2Test068
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test068()).assertEqual(10);
    });

    /**
     * @tc.name   ObjectFreeze2Test069
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_6900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test069()).assertDeepEquals([true, 16]);
    });

    /**
     * @tc.name   ObjectFreeze2Test070
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test070()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectFreeze2Test071
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test071()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreeze2Test072
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test072()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectFreeze2Test074
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test074()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectFreeze2Test075
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test075()).assertDeepEquals([true, 2]);
    });

    /**
     * @tc.name   ObjectFreeze2Test076
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test076()).assertDeepEquals([undefined, 'value1']);
    });

    /**
     * @tc.name   ObjectFreeze2Test077
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test077()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   ObjectFreeze2Test078
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test078()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test079
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_7900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test080
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8000
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test080()).assertDeepEquals([true, undefined]);
    });

    /**
     * @tc.name   ObjectFreeze2Test081
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test081()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test082
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8200
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test082()).assertDeepEquals(['TEST', 'test']);
    });

    /**
     * @tc.name   ObjectFreeze2Test083
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test083()).assertDeepEquals([true, 2024]);
    });

    /**
     * @tc.name   ObjectFreeze2Test084
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test084()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test086
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test086()).assertDeepEquals([true, 'deep']);
    });

    /**
     * @tc.name   ObjectFreeze2Test087
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test087()).assertDeepEquals([true, null, undefined]);
    });

    /**
     * @tc.name   ObjectFreeze2Test088
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test088()).assertDeepEquals([true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test089
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_8900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test089()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test091
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9100
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test091()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test093
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9300
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test093()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test094
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9400
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test094()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test095
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9500
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test095()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreeze2Test096
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9600
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test096()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test097
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9700
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test097()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze2Test098
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9800
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test098()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectFreeze2Test099
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE2_TEST_9900
     * @tc.desc   Object Freeze2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze2.ObjectFreeze2Test099()).assertEqual(true);
    });
  });
}