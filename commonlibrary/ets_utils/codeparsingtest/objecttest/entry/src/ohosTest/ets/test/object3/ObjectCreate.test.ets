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
import * as ObjectCreate from './ObjectCreate';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectCreateTest() {
  describe('ObjectCreateTest', () => {
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
     * @tc.name   ObjectCreateTest001
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest001()).assertDeepEquals([null, undefined]);
    });

    /**
     * @tc.name   ObjectCreateTest002
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest002()).assertDeepEquals([true, "function"]);
    });

    /**
     * @tc.name   ObjectCreateTest003
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest003()).assertDeepEquals(['prototype', 'Hello']);
    });

    /**
     * @tc.name   ObjectCreateTest004
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest004()).assertDeepEquals(["object", true]);
    });

    /**
     * @tc.name   ObjectCreateTest005
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest005()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest006
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest006()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest007
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest007()).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.name   ObjectCreateTest008
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest008()).assertDeepEquals(["function", "function"]);
    });

    /**
     * @tc.name   ObjectCreateTest009
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_0900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest009()).assertDeepEquals(["function", "function"]);
    });

    /**
     * @tc.name   ObjectCreateTest010
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest010()).assertEqual('Hi, John');
    });

    /**
     * @tc.name   ObjectCreateTest011
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest011()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest012
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest012()).assertDeepEquals([false, false, []]);
    });

    /**
     * @tc.name   ObjectCreateTest013
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest013()).assertDeepEquals([1, undefined]);
    });

    /**
     * @tc.name   ObjectCreateTest014
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest014()).assertEqual('{"name":"test","value":123}');
    });

    /**
     * @tc.name   ObjectCreateTest015
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest015()).assertDeepEquals([true, 'TypeError']);

    });

    /**
     * @tc.name   ObjectCreateTest016
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest017
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest017()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest018
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest019
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_1900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest019()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest020
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest020()).assertEqual('John');
    });

    /**
     * @tc.name   ObjectCreateTest021
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest021()).assertDeepEquals(['John Doe', 'Jane Smith']);
    });

    /**
     * @tc.name   ObjectCreateTest022
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest022()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ObjectCreateTest023
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest023()).assertDeepEquals(['immutable', 'TypeError']);
    });

    /**
     * @tc.name   ObjectCreateTest024
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest024()).assertDeepEquals([['visible'], true]);
    });

    /**
     * @tc.name   ObjectCreateTest025
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest025()).assertEqual('unchangeable');
    });

    /**
     * @tc.name   ObjectCreateTest026
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest026()).assertDeepEquals([false, false, false]);
    });

    /**
     * @tc.name   ObjectCreateTest027
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest027()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectCreateTest028
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest028()).assertEqual('symbol value');
    });

    /**
     * @tc.name   ObjectCreateTest029
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_2900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest029()).assertEqual(0);
    });

    /**
     * @tc.name   ObjectCreateTest030
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest030()).assertEqual('test');
    });

    /**
     * @tc.name   ObjectCreateTest031
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest031()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest032
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest032()).assertEqual('custom');
    });

    /**
     * @tc.name   ObjectCreateTest033
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest033()).assertDeepEquals(['parent', 'parent']);
    });

    /**
     * @tc.name   ObjectCreateTest034
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest034()).assertDeepEquals(['method1', 100]);

    });

    /**
     * @tc.name   ObjectCreateTest035
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest035()).assertDeepEquals(['initial', 'modified']);
    });

    /**
     * @tc.name   ObjectCreateTest036
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest036()).assertEqual('symbol value');
    });

    /**
     * @tc.name   ObjectCreateTest037
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest037()).assertDeepEquals([1, 1]);
    });

    /**
     * @tc.name   ObjectCreateTest038
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest038()).assertDeepEquals([2, 1]);
    });

    /**
     * @tc.name   ObjectCreateTest039
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_3900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest039()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectCreateTest040
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest040()).assertDeepEquals(1);
    });

    /**
     * @tc.name   ObjectCreateTest041
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest041()).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.name   ObjectCreateTest042
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest042()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ObjectCreateTest043
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest043()).assertDeepEquals([100, 200, 100]);
    });

    /**
     * @tc.name   ObjectCreateTest044
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest044()).assertDeepEquals([200, 100]);
    });

    /**
     * @tc.name   ObjectCreateTest045
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest045()).assertDeepEquals([2, 1]);
    });

    /**
     * @tc.name   ObjectCreateTest046
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest046()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest047
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest047()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectCreateTest048
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest048()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectCreateTest049
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_4900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest049()).assertDeepEquals(['parent', 'child', 'parent method']);
    });

    /**
     * @tc.name   ObjectCreateTest050
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest050()).assertDeepEquals(['base', 'derived']);
    });

    /**
     * @tc.name   ObjectCreateTest051
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest051()).assertDeepEquals(['Dog barks', 'Cat meows', 'Animal speaks']);
    });

    /**
     * @tc.name   ObjectCreateTest052
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest052()).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   ObjectCreateTest053
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest053()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectCreateTest054
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest054()).assertDeepEquals([1, undefined, 2]);
    });

    /**
     * @tc.name   ObjectCreateTest055
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest055()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectCreateTest056
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest056()).assertDeepEquals([null, 1]);
    });

    /**
     * @tc.name   ObjectCreateTest057
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest057()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest058
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest058()).assertDeepEquals([Infinity, -Infinity]);
    });

    /**
     * @tc.name   ObjectCreateTest059
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_5900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest059()).assertDeepEquals(['', 0]);
    });

    /**
     * @tc.name   ObjectCreateTest060
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest060()).assertDeepEquals(['!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~', '👆👀💯']);

    });

    /**
     * @tc.name   ObjectCreateTest061
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest061()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest062
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest062()).assertDeepEquals([9007199254740991, -9007199254740991]);
    });

    /**
     * @tc.name   ObjectCreateTest063
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest063()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest064
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest064()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest065
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest065()).assertDeepEquals([0, true]);
    });

    /**
     * @tc.name   ObjectCreateTest067
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest067()).assertEqual('deep');
    });

    /**
     * @tc.name   ObjectCreateTest068
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest068()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreateTest069
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_6900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest069()).assertDeepEquals([true, 'TypeError']);

    });

    /**
     * @tc.name   ObjectCreateTest070
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest070()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest071
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest071()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest072
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest072()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest073
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest073()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest074
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest074()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest075
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest075()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest076
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest076()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest077
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest077()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest078
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest078()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest079
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_7900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest080
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest080()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest081
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest081()).assertEqual('modified');
    });

    /**
     * @tc.name   ObjectCreateTest082
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest082()).assertEqual('immutable');
    });

    /**
     * @tc.name   ObjectCreateTest083
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest083()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest084
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest084()).assertDeepEquals([['visible'], 'visible']);
    });

    /**
     * @tc.name   ObjectCreateTest085
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest085()).assertDeepEquals(['value', false, true]);
    });

    /**
     * @tc.name   ObjectCreateTest086
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest086()).assertEqual('{"visible":1}');
    });

    /**
     * @tc.name   ObjectCreateTest087
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest087()).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectCreateTest088
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest088()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectCreateTest089
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_8900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest089()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectCreateTest090
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9000
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest090()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest091
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9100
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest091()).assertEqual(3.14159);
    });

    /**
     * @tc.name   ObjectCreateTest092
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9200
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest092()).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectCreateTest093
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9300
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest093()).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   ObjectCreateTest094
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9400
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest094()).assertDeepEquals([2, undefined]);
    });

    /**
     * @tc.name   ObjectCreateTest095
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9500
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest095()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectCreateTest096
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9600
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest096()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectCreateTest097
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9700
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest097()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectCreateTest098
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9800
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest098()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectCreateTest099
     * @tc.number SUB_BUILTINS_OBJECT_CREATE_TEST_9900
     * @tc.desc   Object Create Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreateTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate.ObjectCreateTest099()).assertDeepEquals([1, undefined, 2]);
    });
  });
}