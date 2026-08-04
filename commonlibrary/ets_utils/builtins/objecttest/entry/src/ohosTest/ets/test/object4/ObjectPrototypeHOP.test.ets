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
import * as ObjectPrototypeHOP from './ObjectPrototypeHOP';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectPrototypeHOPTest() {
  describe('ObjectPrototypeHOPTest', () => {
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
     * @tc.name   ObjectPrototypeHOPTest001
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest001()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest003
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest004
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest004()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest005
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest005()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest006
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest006()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest007
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest007()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest008
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest008()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest009
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_0900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest009()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest010
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest010()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest011
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest011()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest012
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest012()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest013
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest013()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest014
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest014()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest015
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest015()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest016
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest017
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest017()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest018
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest018()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest019
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_1900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest019()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest020
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest020()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest022
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest022()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest023
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest023()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest024
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest024()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest025
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest025()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest026
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest026()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest027
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest027()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest028
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest028()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest029
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_2900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest029()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest030
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest030()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest031
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest031()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest032
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest032()).assertDeepEquals(["boolean", "boolean", true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest033
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest033()).assertDeepEquals([true, false, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest034
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest034()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest035
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest035()).assertDeepEquals([true, true, false, true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest036
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest036()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest037
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest037()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest038
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest038()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest039
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_3900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest039()).assertDeepEquals([false, false, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest040
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest040()).assertDeepEquals([true, false, false, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest041
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest041()).assertDeepEquals([true, true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest042
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest042()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest043
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest043()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest044
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest044()).assertDeepEquals([false, "value", false, undefined]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest045
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest045()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest046
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest046()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest047
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest047()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest048
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest048()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest049
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_4900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest049()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest051
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest051()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest052
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest052()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest053
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest053()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest054
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest054()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest055
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest055()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest056
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest056()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest057
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest057()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest058
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest058()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest059
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_5900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest059()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest060
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest060()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest061
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest061()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest062
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest062()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest064
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest064()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest066
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest066()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest068
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest068()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest069
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_6900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest069()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest070
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest070()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest071
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest071()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest072
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest072()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest073
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest073()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest074
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest074()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest075
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest075()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest076
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest076()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest077
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest077()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest078
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest078()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest079
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_7900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest079()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest080
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest080()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest081
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest081()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest082
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest082()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest083
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest083()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest084
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest084()).assertDeepEquals([true, true, true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest085
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest085()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest086
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest086()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest087
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest087()).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest088
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest088()).assertDeepEquals([true, 4]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest089
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_8900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest089()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest090
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9000
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest090()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest091
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9100
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest091()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest092
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9200
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest092()).assertDeepEquals([true, true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest093
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9300
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest093()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest094
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9400
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest094()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest095
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9500
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest095()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest096
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9600
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest096()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest097
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9700
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest097()).assertDeepEquals([true, "first"]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest098
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9800
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest098()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectPrototypeHOPTest099
     * @tc.number SUB_BUILTINS_OBJECT_PROTOTYPE_HOP_TEST_9900
     * @tc.desc   Object Prototype HOP Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPrototypeHOPTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPrototypeHOP.ObjectPrototypeHOPTest099()).assertDeepEquals([false, false, false]);
    });
  });
}