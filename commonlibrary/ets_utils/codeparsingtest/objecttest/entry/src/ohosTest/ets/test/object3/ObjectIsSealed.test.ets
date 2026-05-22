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
import * as ObjectIsSealed from './ObjectIsSealed';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectIsSealedTest() {
  describe('ObjectIsSealedTest', () => {
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
     * @tc.name   ObjectIsSealedTest001
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest001()).assertDeepEquals(["boolean", false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest002
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest002()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealedTest003
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest004
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest004()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealedTest005
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest005()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest006
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest006()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest007
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest007()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest008
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest008()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest009
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_0900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest009()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest010
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest010()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest011
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest011()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest012
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest012()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest013
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest013()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest014
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest014()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest015
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest015()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest016
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest016()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest017
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest017()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest018
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest018()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest019
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_1900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest019()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest020
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest020()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest021
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest021()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest022
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest022()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest023
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest023()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest024
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest024()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest025
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest025()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest026
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest026()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest027
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest027()).assertDeepEquals([2, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest028
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest028()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest029
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_2900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest029()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest030
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest030()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest031
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest031()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest032
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest032()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest033
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest033()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealedTest034
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest034()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest035
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest035()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest036
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest036()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest037
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest037()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest038
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest038()).assertDeepEquals([false, true, 1]);
    });

    /**
     * @tc.name   ObjectIsSealedTest039
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_3900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest039()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest040
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest040()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest041
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest041()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealedTest042
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest042()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest043
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest043()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest044
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest044()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest045
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest045()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealedTest046
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest046()).assertDeepEquals([undefined, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest047
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest047()).assertDeepEquals([undefined, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest048
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest048()).assertDeepEquals([2, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest049
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_4900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest049()).assertDeepEquals([1, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest050
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest050()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest051
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest051()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest052
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest052()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest053
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest053()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest054
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest054()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest055
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest055()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest056
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest056()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest057
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest057()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest058
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest058()).assertDeepEquals([true, false, 4]);
    });

    /**
     * @tc.name   ObjectIsSealedTest059
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_5900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest059()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest060
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest060()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest061
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest061()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest062
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest062()).assertDeepEquals([true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest063
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest063()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest064
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest064()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest065
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest065()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsSealedTest066
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest066()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest067
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest067()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsSealedTest068
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest068()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest069
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_6900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest069()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest070
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest070()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest071
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest071()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest072
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest072()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest073
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest073()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest074
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest074()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest075
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest075()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest076
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest076()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest077
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest077()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest078
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest078()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest079
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_7900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest079()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest080
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest080()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest081
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest081()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest082
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest082()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest083
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest083()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest084
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest084()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest085
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest085()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest086
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8600
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest086()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest087
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8700
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest087()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest088
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest088()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest089
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_8900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest089()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest090
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9000
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest090()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsSealedTest091
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9100
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest091()).assertDeepEquals([false, false, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest092
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9200
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest092()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest093
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9300
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest093()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest094
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9400
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest094()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest095
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9500
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest095()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest098
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9800
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest098()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsSealedTest099
     * @tc.number SUB_BUILTINS_OBJECT_SEALED_TEST_9900
     * @tc.desc   Object IsSealed Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsSealedTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsSealed.ObjectIsSealedTest099()).assertDeepEquals([false, true]);
    });
  });
}