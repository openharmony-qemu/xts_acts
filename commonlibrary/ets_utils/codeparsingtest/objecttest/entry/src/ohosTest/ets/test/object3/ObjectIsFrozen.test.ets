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
import * as ObjectIsFrozen from './ObjectIsFrozen';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectIsFrozenTest() {
  describe('ObjectIsFrozenTest', () => {
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
     * @tc.name   ObjectIsFrozenTest001
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest001()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest002
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest002()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest003
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest004
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest004()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest005
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest005()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest006
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest006()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest007
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest007()).assertDeepEquals([true, true, true, true, true, true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest008
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest008()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest009
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_0900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest009()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest010
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest010()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest011
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest011()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest012
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest012()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest013
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest013()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest014
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest015
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest016
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest016()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest017
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest017()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest018
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest018()).assertDeepEquals([false, true, false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest019
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_1900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest019()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest021
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest021()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest023
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest023()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest024
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest024()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest025
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest025()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest026
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest026()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest027
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest027()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest028
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest028()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest029
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_2900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest029()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest030
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest030()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest031
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest031()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest032
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest032()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest033
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest033()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest034
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest034()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest035
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest035()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest036
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest036()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest037
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest037()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest038
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest038()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest039
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_3900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest039()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest040
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest040()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest041
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest041()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest042
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest042()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest043
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest043()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest044
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest044()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest045
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest045()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest046
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest046()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest047
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest047()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest048
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest048()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest049
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_4900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest049()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest050
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest050()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest051
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest051()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest052
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest052()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest053
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest053()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest054
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest054()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest055
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest055()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest056
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest056()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest057
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest057()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest058
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest058()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest059
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_5900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest059()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest060
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest060()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest061
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest061()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest062
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest062()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest063
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest063()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest064
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest064()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest065
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest065()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest066
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest066()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest067
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest067()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest068
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest068()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest069
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_6900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest069()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest070
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest070()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest071
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest071()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest072
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest072()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest073
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest073()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest074
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest074()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest075
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest075()).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest076
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest076()).assertDeepEquals([true, false, 2, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest077
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest077()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest078
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest078()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest079
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_7900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest080
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest080()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest081
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest081()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest082
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest082()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest083
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest083()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectIsFrozenTest084
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest084()).assertDeepEquals([1, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest085
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest085()).assertDeepEquals([true, ['a', 'b', 'c']]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest086
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest086()).assertDeepEquals([true, [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest087
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest087()).assertDeepEquals([true, [['a', 1], ['b', 2], ['c', 3]]]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest088
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest088()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest089
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_8900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest089()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest090
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9000
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest090()).assertDeepEquals([false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest091
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9100
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest091()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest092
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9200
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest092()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest093
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9300
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest093()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectIsFrozenTest094
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9400
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest094()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest095
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9500
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest095()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest096
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9600
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest096()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest097
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9700
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest097()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest098
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9800
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest098()).assertDeepEquals([false, true, false]);
    });

    /**
     * @tc.name   ObjectIsFrozenTest099
     * @tc.number SUB_BUILTINS_OBJECT_FROZEN_TEST_9900
     * @tc.desc   Object IsFrozen Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectIsFrozenTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectIsFrozen.ObjectIsFrozenTest099()).assertDeepEquals([false, true, false]);
    });
  });
}