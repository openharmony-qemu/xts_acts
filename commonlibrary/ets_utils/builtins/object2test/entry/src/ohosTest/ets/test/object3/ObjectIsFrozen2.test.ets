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
import * as ObjectIsFrozen2 from './ObjectIsFrozen2';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectIsFrozen2Test() {
  describe('ObjectIsFrozen2Test', () => {
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
     * @tc.name   ObjectIsFrozen2Test001
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0100
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test001()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test002
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0200
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test002()).assertDeepEquals([true, "value"]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test003
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0300
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test003()).assertDeepEquals([true, "newValue"]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test004
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0400
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test004()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test005
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0500
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test005()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test006
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0600
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test006()).assertDeepEquals([undefined, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test007
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0700
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test007()).assertDeepEquals([true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test008
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0800
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test008()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test009
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_0900
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test009()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test012
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1200
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test012()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test013
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1300
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test013()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test014
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1400
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test014()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test015
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1500
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test015()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test016
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1600
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test016()).assertDeepEquals([
        [true, false, false],
        [false, false, false],
        [false, true, false],
        [false, true, true]
      ]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test017
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1700
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test017()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test018
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1800
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test019
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_1900
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test019()).assertDeepEquals([true, '{"a":1,"b":"test","c":[1,2,3]}']);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test020
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_2000
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test020()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test021
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_2100
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test021()).assertDeepEquals([1, "isFrozen", true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test022
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_2200
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test022()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test025
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_2500
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test025()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test026
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_2600
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test026()).assertDeepEquals(1);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test027
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_2700
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test027()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test030
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3000
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test030()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test031
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3100
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test031()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test032
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3200
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test032()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test033
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3300
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test033()).assertDeepEquals([true, "#FF0000", true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test034
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3400
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test034()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test035
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3500
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test035()).assertDeepEquals([true, true, "2.0.0"]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test036
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3600
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test036()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test037
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3700
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test037()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test038
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3800
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test038()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test039
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_3900
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test039()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozen2Test040
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN2_TEST_4000
     * @tc.desc   Object IsFrozen2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozen2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen2.ObjectIsFrozen2Test040()).assertDeepEquals([false, false, false]);
    });
  });
}