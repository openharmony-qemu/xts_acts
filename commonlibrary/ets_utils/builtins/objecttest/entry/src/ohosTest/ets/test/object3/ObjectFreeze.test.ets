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
import * as ObjectFreeze from './ObjectFreeze';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectFreezeTest() {
  describe('ObjectFreezeTest', () => {
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
     * @tc.name   ObjectFreezeTest001
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest001()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest002
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest002()).assertEqual(42);
    });

    /**
     * @tc.name   ObjectFreezeTest003
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest003()).assertDeepEquals({ a: 100, b: "modified", c: false });
    });

    /**
     * @tc.name   ObjectFreezeTest004
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest004()).assertEqual('modified');
    });

    /**
     * @tc.name   ObjectFreezeTest005
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest005()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest006
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest006()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectFreezeTest007
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest007()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest008
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest008()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest009
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_0900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest009()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest010
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest010()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest014
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest014()).assertDeepEquals([undefined] || [true]);
    });

    /**
     * @tc.name   ObjectFreezeTest015
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest015()).assertDeepEquals([null] || [true]);
    });

    /**
     * @tc.name   ObjectFreezeTest016
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest016()).assertDeepEquals([42, 'number']);
    });

    /**
     * @tc.name   ObjectFreezeTest017
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest017()).assertDeepEquals(['hello', 'string']);
    });

    /**
     * @tc.name   ObjectFreezeTest018
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest018()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreezeTest019
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_1900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest019()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest020
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest020()).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   ObjectFreezeTest021
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest021()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest022
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest022()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectFreezeTest023
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest023()).assertDeepEquals([true, undefined]);
    });

    /**
     * @tc.name   ObjectFreezeTest024
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest024()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest025
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest025()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest026
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest026()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest027
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest027()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest028
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest028()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest029
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_2900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest029()).assertDeepEquals([true, 42]);
    });

    /**
     * @tc.name   ObjectFreezeTest030
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest030()).assertDeepEquals([1, "not nan", 0, 1.7976931348623157e+308, 5e-324]);
    });

    /**
     * @tc.name   ObjectFreezeTest031
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest031()).assertDeepEquals(["not empty", "world", "!@#$%^&*()", "👆👿👀💯", "👆"]);
    });

    /**
     * @tc.name   ObjectFreezeTest032
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest032()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest033
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest033()).assertDeepEquals([{ b: 2 }, [4, 5, 6]]);
    });

    /**
     * @tc.name   ObjectFreezeTest034
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest034()).assertDeepEquals(["not null", "not undefined"]);
    });

    /**
     * @tc.name   ObjectFreezeTest035
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest035()).assertDeepEquals([42, 100]);
    });

    /**
     * @tc.name   ObjectFreezeTest036
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest036()).assertDeepEquals([100, 100]);
    });

    /**
     * @tc.name   ObjectFreezeTest037
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest037()).assertEqual('getter value');
    });

    /**
     * @tc.name   ObjectFreezeTest038
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest038()).assertEqual('modified');
    });

    /**
     * @tc.name   ObjectFreezeTest039
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_3900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest039()).assertDeepEquals([true, undefined]);
    });

    /**
     * @tc.name   ObjectFreezeTest040
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest040()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest041
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest041()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest042
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest042()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectFreezeTest043
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest043()).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectFreezeTest044
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest044()).assertDeepEquals([true, 'value']);
    });

    /**
     * @tc.name   ObjectFreezeTest045
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest045()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest046
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest046()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest047
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest047()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest048
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest048()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest049
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_4900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest049()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest050
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest050()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest051
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest051()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest052
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest052()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectFreezeTest053
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest053()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest054
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest054()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest055
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest055()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest056
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest056()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest057
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest057()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest058
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest058()).assertDeepEquals([1, false, false, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest059
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_5900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest059()).assertDeepEquals([false, true, 'function', undefined]);
    });

    /**
     * @tc.name   ObjectFreezeTest060
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest060()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest061
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest061()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest062
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest062()).assertDeepEquals([100, 1]);
    });

    /**
     * @tc.name   ObjectFreezeTest063
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest063()).assertDeepEquals(['proto value', 'own value']);
    });

    /**
     * @tc.name   ObjectFreezeTest064
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest064()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectFreezeTest065
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest065()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest066
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest066()).assertDeepEquals([true, 1, 2]);
    });

    /**
     * @tc.name   ObjectFreezeTest067
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest067()).assertDeepEquals([true, null]);
    });

    /**
     * @tc.name   ObjectFreezeTest068
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest068()).assertDeepEquals([true, 42]);
    });

    /**
     * @tc.name   ObjectFreezeTest069
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_6900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest069()).assertDeepEquals([true, 0]);
    });

    /**
     * @tc.name   ObjectFreezeTest070
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest070()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectFreezeTest072
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest072()).assertDeepEquals([9, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest073
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest073()).assertEqual('!');
    });

    /**
     * @tc.name   ObjectFreezeTest074
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest074()).assertDeepEquals([3, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest075
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest075()).assertDeepEquals([true, 2]);
    });

    /**
     * @tc.name   ObjectFreezeTest076
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest076()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   ObjectFreezeTest077
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest077()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   ObjectFreezeTest078
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest078()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   ObjectFreezeTest079
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_7900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest079()).assertDeepEquals([true, [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectFreezeTest080
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest080()).assertDeepEquals([true, true, [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectFreezeTest081
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest081()).assertDeepEquals(['NaN', 'true']);
    });

    /**
     * @tc.name   ObjectFreezeTest082
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest082()).assertDeepEquals([null, undefined]);
    });

    /**
     * @tc.name   ObjectFreezeTest083
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest083()).assertDeepEquals({ a: 100 });
    });

    /**
     * @tc.name   ObjectFreezeTest084
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest084()).assertDeepEquals([[100, 2], [3, 4]]);
    });

    /**
     * @tc.name   ObjectFreezeTest085
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest085()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectFreezeTest086
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest086()).assertDeepEquals([4, undefined, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest087
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest087()).assertEqual(6);
    });

    /**
     * @tc.name   ObjectFreezeTest088
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest088()).assertDeepEquals([[2, 4, 6], [1, 2, 3]]);
    });

    /**
     * @tc.name   ObjectFreezeTest089
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_8900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest089()).assertDeepEquals([[3, 4, 5], [1, 2, 3, 4, 5]]);
    });

    /**
     * @tc.name   ObjectFreezeTest090
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9000
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest090()).assertDeepEquals([[2, 3], [1, 2, 3, 4, 5]]);
    });

    /**
     * @tc.name   ObjectFreezeTest091
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9100
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest091()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectFreezeTest092
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9200
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest092()).assertDeepEquals([true, 0]);
    });

    /**
     * @tc.name   ObjectFreezeTest093
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9300
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest093()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest094
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9400
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest094()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest095
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9500
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest095()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest096
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9600
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest096()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest097
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9700
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest097()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest098
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9800
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest098()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreezeTest099
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE_TEST_9900
     * @tc.desc   Object Freeze Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreezeTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze.ObjectFreezeTest099()).assertEqual(true);
    });
  });
}