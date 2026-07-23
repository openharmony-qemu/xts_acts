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
import * as ObjectIs from './ObjectIs';
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectIsTest() {
  describe('ObjectIsTest', () => {
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
     * @tc.name   ObjectIsTest001
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest001()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest002
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest002()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest003
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest003()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest004
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest004()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest005
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest005()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest006
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest006()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest007
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest007()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsTest008
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest008()).assertDeepEquals(["boolean", "boolean"]);
    });

    /**
     * @tc.name   ObjectIsTest009
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_0900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest009()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest010
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest010()).assertDeepEquals([false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest011
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest011()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest012
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest012()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsTest013
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest013()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest014
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest014()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest015
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest015()).assertDeepEquals([true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest016
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest016()).assertDeepEquals([false, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest017
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest017()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest018
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest018()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest019
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_1900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest019()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest020
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest020()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsTest021
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest021()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest022
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest022()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest023
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest023()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest024
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest024()).assertDeepEquals([false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest025
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest025()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest026
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest026()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest027
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest027()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsTest028
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest028()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsTest029
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_2900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest029()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsTest030
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest030()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsTest031
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest031()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsTest032
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest032()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest033
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest033()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest034
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest034()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest035
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest035()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest036
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest036()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest037
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest037()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest038
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest038()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest039
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_3900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest039()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest040
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest040()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest041
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest041()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest042
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest042()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest043
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest043()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest044
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest044()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsTest045
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest045()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest046
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest046()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest047
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest047()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest048
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest048()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest049
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_4900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest049()).assertDeepEquals([true, false, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest050
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest050()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsTest052
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest052()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest053
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest053()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest054
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest054()).assertDeepEquals([true, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest055
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest055()).assertDeepEquals([true, true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest056
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest056()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest057
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest057()).assertDeepEquals([true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest059
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_5900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest059()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest060
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest060()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest061
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest061()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest062
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest062()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest063
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest063()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest064
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest064()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest065
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest065()).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest066
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest066()).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest067
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest067()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest068
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest068()).assertDeepEquals([true, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest069
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_6900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest069()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest070
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest070()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest071
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest071()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest072
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest072()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest073
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest073()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest074
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest074()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest075
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest075()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest076
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest076()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest077
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest077()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsTest078
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest078()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsTest079
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_7900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsTest080
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest080()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsTest081
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest081()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest082
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest082()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsTest083
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest083()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest084
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest084()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest085
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest085()).assertDeepEquals([false, true, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest086
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest086()).assertDeepEquals([true, false, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest087
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest087()).assertDeepEquals([true, true, true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest088
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest088()).assertDeepEquals([false, true, false, true, false, true, false, true, false, true, false, true, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest089
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_8900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest089()).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest090
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9000
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest090()).assertDeepEquals([true, false, false, true, false, false, true, false, false, false, false, true, true, true, false]);
    });

    /**
     * @tc.name   ObjectIsTest091
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9100
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest091()).assertDeepEquals([true , false]);
    });

    /**
     * @tc.name   ObjectIsTest092
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9200
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest092()).assertDeepEquals([true, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest093
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9300
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest093()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsTest094
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9400
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest094()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsTest095
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9500
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest095()).assertDeepEquals([
        false, false, false, false, false, false,
        false, false, false, false,
        false, false, false, false,
        false, false, false,
        false, false, false,
        false, false, false,
        false, false
      ]);
    });

    /**
     * @tc.name   ObjectIsTest096
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9600
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest096()).assertDeepEquals([false, false, false, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest097
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9700
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest097()).assertDeepEquals([true, false, false, false, false, false, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest098
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9800
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest098()).assertDeepEquals([true, false, true, false, false, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectIsTest099
     * @tc.number SUB_BUILTINS_OBJECT_IS_TEST_9900
     * @tc.desc   Object Is Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIs.ObjectIsTest099()).assertDeepEquals([true, false, true, true, false, false, false]);
    });
  });
}