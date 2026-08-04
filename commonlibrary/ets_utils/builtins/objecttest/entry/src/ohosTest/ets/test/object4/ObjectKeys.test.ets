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
import * as ObjectKeys from './ObjectKeys';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectKeysTest() {
  describe('ObjectKeysTest', () => {
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
     * @tc.name   ObjectKeysTest002
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest002()).assertDeepEquals([true, true, true, true, false, false, false, false]);
    });

    /**
     * @tc.name   ObjectKeysTest003
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest003()).assertDeepEquals([true, true, true, false, false, false]);
    });

    /**
     * @tc.name   ObjectKeysTest004
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest004()).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   ObjectKeysTest005
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest005()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectKeysTest006
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest006()).assertDeepEquals([false, true, true]);
    });

    /**
     * @tc.name   ObjectKeysTest007
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest007()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectKeysTest008
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest008()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectKeysTest009
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_0900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest009()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeysTest010
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest010()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeysTest011
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest011()).assertDeepEquals([false, undefined, true]);
    });

    /**
     * @tc.name   ObjectKeysTest012
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest012()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeysTest013
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest013()).assertDeepEquals(["boolean", true, "boolean", true]);
    });

    /**
     * @tc.name   ObjectKeysTest014
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest014()).assertDeepEquals([true, false, false, false, false, true, false, true]);
    });

    /**
     * @tc.name   ObjectKeysTest015
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest015()).assertDeepEquals([true, false, false, false, false, true]);
    });

    /**
     * @tc.name   ObjectKeysTest016
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest016()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeysTest017
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest017()).assertDeepEquals([]);
    });

    /**
     * @tc.name   ObjectKeysTest018
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest018()).assertDeepEquals(['key']);
    });

    /**
     * @tc.name   ObjectKeysTest019
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_1900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest019()).assertDeepEquals(['0', '1', '2']);
    });

    /**
     * @tc.name   ObjectKeysTest020
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest020()).assertDeepEquals([]);
    });

    /**
     * @tc.name   ObjectKeysTest021
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest021()).assertDeepEquals(['0', '3', '10']);
    });

    /**
     * @tc.name   ObjectKeysTest022
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest022()).assertEqual(19);
    });

    /**
     * @tc.name   ObjectKeysTest023
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest023()).assertDeepEquals(['0', '1', '2', 'length']);
    });

    /**
     * @tc.name   ObjectKeysTest024
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest024()).assertDeepEquals(['2', '7', '100']);
    });

    /**
     * @tc.name   ObjectKeysTest025
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest025()).assertDeepEquals([['0', '1', '2'], [], ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']]);
    });

    /**
     * @tc.name   ObjectKeysTest026
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest026()).assertEqual(32);
    });

    /**
     * @tc.name   ObjectKeysTest027
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest027()).assertDeepEquals([["0", "1", "2", "3", "4", "5"], ["0", "1", "2", "3", "4"]]);
    });

    /**
     * @tc.name   ObjectKeysTest028
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest028()).assertDeepEquals([[], [], [], [], [], []]);
    });

    /**
     * @tc.name   ObjectKeysTest029
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_2900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest029()).assertDeepEquals([[], [], [], []]);
    });

    /**
     * @tc.name   ObjectKeysTest030
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest030()).assertDeepEquals([[], []]);
    });

    /**
     * @tc.name   ObjectKeysTest031
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest031()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeysTest032
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest032()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeysTest033
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest033()).assertDeepEquals(['0', '1', '2', '3', '4']);
    });

    /**
     * @tc.name   ObjectKeysTest034
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest034()).assertDeepEquals(['0', '1', '2']);
    });

    /**
     * @tc.name   ObjectKeysTest035
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest035()).assertDeepEquals(['0', '1', '2', '3']);
    });

    /**
     * @tc.name   ObjectKeysTest036
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest036()).assertDeepEquals(['0', '1', '2']);
    });

    /**
     * @tc.name   ObjectKeysTest037
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest037()).assertDeepEquals([[], []]);
    });

    /**
     * @tc.name   ObjectKeysTest038
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest038()).assertDeepEquals(['b']);
    });

    /**
     * @tc.name   ObjectKeysTest039
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_3900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest039()).assertDeepEquals(['a', 'b', 'd']);
    });

    /**
     * @tc.name   ObjectKeysTest040
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest040()).assertDeepEquals(['getBar', 'foo', 'bar']);
    });

    /**
     * @tc.name   ObjectKeysTest041
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest041()).assertDeepEquals(['own']);
    });

    /**
     * @tc.name   ObjectKeysTest042
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest042()).assertDeepEquals(['own']);
    });

    /**
     * @tc.name   ObjectKeysTest043
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest043()).assertDeepEquals(['own']);
    });

    /**
     * @tc.name   ObjectKeysTest044
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest044()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest045
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest045()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest046
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest046()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest047
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest047()).assertDeepEquals(['a', 'c']);
    });

    /**
     * @tc.name   ObjectKeysTest048
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_4800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest048()).assertDeepEquals(['a']);
    });

    /**
     * @tc.name   ObjectKeysTest050
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest050()).assertDeepEquals(['name', 'age', 'gender']);
    });

    /**
     * @tc.name   ObjectKeysTest051
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest051()).assertDeepEquals(['1', '2', '3']);
    });

    /**
     * @tc.name   ObjectKeysTest052
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest052()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest053
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest053()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest054
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest054()).assertDeepEquals(['1', '2', '10', '100']);
    });

    /**
     * @tc.name   ObjectKeysTest055
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest055()).assertDeepEquals(['c', 'a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest056
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest056()).assertDeepEquals(['1', '2', 'b', 'a', 'c']);
    });

    /**
     * @tc.name   ObjectKeysTest057
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest057()).assertDeepEquals(['0', '1', '-1']);
    });

    /**
     * @tc.name   ObjectKeysTest058
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest058()).assertDeepEquals(['1', '2', '1.5']);
    });

    /**
     * @tc.name   ObjectKeysTest059
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_5900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest059()).assertDeepEquals(['hello world', 'foo bar']);
    });

    /**
     * @tc.name   ObjectKeysTest060
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest060()).assertDeepEquals(['!@#$%^&*()', '中文键', '日本語']);
    });

    /**
     * @tc.name   ObjectKeysTest061
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest061()).assertDeepEquals(['', 'a']);
    });

    /**
     * @tc.name   ObjectKeysTest063
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest063()).assertDeepEquals(['customProp']);
    });

    /**
     * @tc.name   ObjectKeysTest064
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest064()).assertDeepEquals(['customProp']);
    });

    /**
     * @tc.name   ObjectKeysTest065
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest065()).assertDeepEquals(['customProp']);
    });

    /**
     * @tc.name   ObjectKeysTest066
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest066()).assertDeepEquals([]);
    });

    /**
     * @tc.name   ObjectKeysTest067
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest067()).assertDeepEquals([]);
    });

    /**
     * @tc.name   ObjectKeysTest068
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest068()).assertDeepEquals([[], []]);
    });

    /**
     * @tc.name   ObjectKeysTest069
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_6900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest069()).assertDeepEquals(['map', 'name']);
    });

    /**
     * @tc.name   ObjectKeysTest070
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest070()).assertDeepEquals(['set', 'id']);
    });

    /**
     * @tc.name   ObjectKeysTest071
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest071()).assertDeepEquals(['promise', 'status']);
    });

    /**
     * @tc.name   ObjectKeysTest072
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest072()).assertDeepEquals(['buffer', 'size']);
    });

    /**
     * @tc.name   ObjectKeysTest073
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest073()).assertDeepEquals(['view', 'offset']);
    });

    /**
     * @tc.name   ObjectKeysTest074
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest074()).assertDeepEquals(['buffer', 'encoding']);
    });

    /**
     * @tc.name   ObjectKeysTest075
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest075()).assertDeepEquals(['customProp']);
    });

    /**
     * @tc.name   ObjectKeysTest076
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest076()).assertDeepEquals(['a', 'method', 'name']);
    });

    /**
     * @tc.name   ObjectKeysTest077
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest077()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest078
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest078()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest079
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_7900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest079()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest080
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest080()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest081
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest081()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest082
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest082()).assertDeepEquals(['regex', 'flags']);
    });

    /**
     * @tc.name   ObjectKeysTest085
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest085()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectKeysTest087
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest087()).assertDeepEquals(['a', 'nested']);
    });

    /**
     * @tc.name   ObjectKeysTest088
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest088()).assertDeepEquals([[], []]);
    });

    /**
     * @tc.name   ObjectKeysTest089
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_8900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest089()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest090
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9000
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest090()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeysTest091
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9100
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest091()).assertDeepEquals([["b"], ["a", "b"]]);
    });

    /**
     * @tc.name   ObjectKeysTest092
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9200
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest092()).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   ObjectKeysTest093
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9300
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest093()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeysTest094
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9400
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest094()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectKeysTest095
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9500
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest095()).assertDeepEquals([['own'], ['own', 'inherited']]);
    });

    /**
     * @tc.name   ObjectKeysTest096
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9600
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest096()).assertDeepEquals([['a'], ['a']]);
    });

    /**
     * @tc.name   ObjectKeysTest097
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9700
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest097()).assertDeepEquals([['a', 1], ['b', 2], ['c', 3]]);
    });

    /**
     * @tc.name   ObjectKeysTest098
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9800
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest098()).assertDeepEquals([['1', '2', '3', 'name'], ['a', 'b', 'c', 'test']]);
    });

    /**
     * @tc.name   ObjectKeysTest099
     * @tc.number SUB_BUILTINS_OBJECT_KEYS_TEST_9900
     * @tc.desc   Object Keys Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectKeysTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectKeys.ObjectKeysTest099()).assertDeepEquals([['a', 'b'], [['a', 1], ['b', 2]], ['a', 'b']]);
    });
  });
}