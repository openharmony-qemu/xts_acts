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
import * as ObjectPrototypeHOP2 from './ObjectPrototypeHOP2';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectPrototypeHOP2Test() {
  describe('ObjectPrototypeHOP2Test', () => {
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
     * @tc.name   ObjectPrototypeHOP2Test001
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0100
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test001()).assertDeepEquals([true, false, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test002
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0200
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test002()).assertDeepEquals([true, true, true, false, true, true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test003
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0300
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test003()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test004
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0400
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test004()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test005
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0500
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test005()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test007
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0700
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test007()).assertDeepEquals([false, 0]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test008
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_0800
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test008()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test010
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1000
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test010()).assertDeepEquals([true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test011
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1100
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test011()).assertDeepEquals([true, false, false, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test012
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1200
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test012()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test013
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1300
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test013()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test014
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1400
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test014()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test015
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1500
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test015()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test016
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1600
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test017
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1700
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test017()).assertEqual(true);;
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test018
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1800
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test018()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test019
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_1900
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test019()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test020
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2000
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test020()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test021
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2100
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test021()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test022
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2200
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test022()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test023
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2300
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test023()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test024
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2400
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test024()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test025
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2500
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test025()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test027
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2700
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test027()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test028
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2800
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test028()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test029
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_2900
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test029()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test030
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3000
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test030()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test031
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3100
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test031()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test032
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3200
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test032()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test033
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3300
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test033()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test034
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3400
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test034()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test035
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3500
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test035()).assertDeepEquals([true, true, false, true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test036
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3600
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test036()).assertDeepEquals([false, true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test037
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3700
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test037()).assertDeepEquals([true, true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test038
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3800
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test038()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test039
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_3900
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test039()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test040
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4000
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test040()).assertDeepEquals([true, false, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test041
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4100
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test041()).assertDeepEquals([true, false, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test042
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4200
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test042()).assertDeepEquals([true, true, ["visible"], false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test043
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4300
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test043()).assertDeepEquals([false, true, ["own"]]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test044
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4400
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test044()).assertDeepEquals([true, true, ["hidden", "visible"]]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test045
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4500
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test045()).assertDeepEquals([["nonEnumerable1", "nonEnumerable2", "enumerable"], true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test046
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4600
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test046()).assertDeepEquals(["this is fog (fog) for sure. Value: stack"]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test047
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4700
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test047()).assertDeepEquals([["own", "inherited"], ["own"]]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test048
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_4800
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test048()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test050
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_5000
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test050()).assertDeepEquals([true, true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test051
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_5100
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test051()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test052
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_5200
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test052()).assertDeepEquals([
        true,
        { value: "exists", writable: true, enumerable: true, configurable: true },
        false,
        undefined
      ]);
    });

    /**
     * @tc.name   ObjectPrototypeHOP2Test053
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP2_TEST_5300
     * @tc.desc   Object Prototype HOP2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOP2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP2.ObjectPrototypeHOP2Test053()).assertDeepEquals([false, undefined]);
    });
  });
}