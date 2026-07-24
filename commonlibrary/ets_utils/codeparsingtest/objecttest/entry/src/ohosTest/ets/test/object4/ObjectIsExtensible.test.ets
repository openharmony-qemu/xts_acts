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
import * as ObjectIsExtensible from './ObjectIsExtensible';
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectIsExtensibleTest() {
  describe('ObjectIsExtensibleTest', () => {
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
     * @tc.name   ObjectIsExtensibleTest002
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest002()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest003
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest003()).assertDeepEquals([true, true, true, true, true, true, true, true, true, false, false]);

    });

    /**
     * @tc.name   ObjectIsExtensibleTest004
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest004()).assertDeepEquals(["boolean", "boolean", "boolean", "boolean", "boolean", "boolean"]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest005
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest005()).assertDeepEquals([true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest006
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest006()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest007
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest007()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest008
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest008()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest009
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_0900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest009()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest010
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest010()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest011
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest011()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest012
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest012()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest013
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest013()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest014
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest015
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest016
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest017
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest017()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest018
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest019
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_1900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest019()).assertDeepEquals([true, true, true, true, true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest020
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest020()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest021
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest021()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest022
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest022()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest023
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest023()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest025
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest025()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest026
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest026()).assertDeepEquals([false, false, false, false, false, false, false, false, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest027
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest027()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest028
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest028()).assertDeepEquals([true,true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest029
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_2900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest029()).assertDeepEquals([true,true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest030
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest030()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest031
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest031()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest032
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest032()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest033
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest033()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest034
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest034()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest035
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest035()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest036
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest036()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest037
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest037()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest038
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest038()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest039
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_3900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest039()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest040
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest040()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest041
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest041()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest042
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest042()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest043
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest043()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest044
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest044()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest045
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest045()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest046
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest046()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest047
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest047()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest048
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest048()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest049
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_4900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest049()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest051
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest051()).assertDeepEquals([100, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest052
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest052()).assertDeepEquals([undefined, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest053
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest053()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest054
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest054()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest055
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest055()).assertDeepEquals([100, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest056
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest056()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest057
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest057()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest058
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_5800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest058()).assertDeepEquals([false, false, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest060
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest060()).assertDeepEquals([
        true, false, false,
        false, false, false,
        false, true, false,
        false, true, true
      ]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest061
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest061()).assertDeepEquals([true, true, false, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest062
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest062()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest063
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest063()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest064
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest064()).assertDeepEquals([false, true, 100]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest065
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest065()).assertDeepEquals([true, 100, false, undefined]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest066
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest066()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest067
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest067()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest068
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest068()).assertDeepEquals([true, "value"]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest069
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_6900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest069()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest070
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest070()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest071
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest071()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest072
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest072()).assertDeepEquals([true, true, false, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest073
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest073()).assertDeepEquals([true, true, true, false, true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest074
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest074()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest076
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest076()).assertDeepEquals([
        true, true, true, true, true, true, true, true, true, true,
        true, true, true, true, true, true, true
      ]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest077
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest077()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest078
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest078()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest079
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_7900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest080
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest080()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest081
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest081()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest082
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest082()).assertDeepEquals([true, true, true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest084
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest084()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest085
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest085()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest086
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest086()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest087
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest087()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest088
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest088()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest089
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_8900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest089()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest090
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9000
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest090()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest091
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9100
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest091()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest092
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9200
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest092()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest093
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9300
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest093()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest094
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9400
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest094()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest095
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9500
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest095()).assertDeepEquals([false, true, false, false, false, true,true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest096
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9600
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest096()).assertDeepEquals([false, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest097
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9700
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest097()).assertDeepEquals([1, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest098
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9800
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest098()).assertDeepEquals([true, true, true, false, false]);
    });

    /**
     * @tc.name   ObjectIsExtensibleTest099
     * @tc.number SUB_BUILTINS_OBJECT_IS_EXTENSIBLE_TEST_9900
     * @tc.desc   Object IsExtensible Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsExtensibleTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsExtensible.ObjectIsExtensibleTest099()).assertDeepEquals([true, false, false]);
    });
  });
}