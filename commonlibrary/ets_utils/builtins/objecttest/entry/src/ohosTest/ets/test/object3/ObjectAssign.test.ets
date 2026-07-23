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
import * as ObjectAssign from  './ObjectAssign';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectAssignTest() {
  describe('ObjectAssignTest', () => {
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
     * @tc.name   ObjectAssignTest001
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest001()).assertDeepEquals([{ a: 1, b: 2 }, true]);
    });

    /**
     * @tc.name   ObjectAssignTest002
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest002()).assertDeepEquals({ a: 1, b: 2, c: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest003
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest003()).assertDeepEquals({ a: 1, b: 2, c: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest004
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest004()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest005
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest005()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest006
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest006()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest007
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest007()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssignTest008
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest008()).assertDeepEquals({ x: 1, y: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest009
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_0900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest009()).assertDeepEquals({ a: { b: 1 }, c: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest010
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest010()).assertDeepEquals(['a', 'b', 3]);
    });

    /**
     * @tc.name   ObjectAssignTest011
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest011()).assertDeepEquals({ prop: 1, newProp: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest012
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest012()).assertEqual('value');
    });

    /**
     * @tc.name   ObjectAssignTest013
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest013()).assertEqual(123);
    });

    /**
     * @tc.name   ObjectAssignTest014
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest014()).assertDeepEquals({ type: 'object', d: 4 });
    });

    /**
     * @tc.name   ObjectAssignTest015
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest015()).assertDeepEquals({ type: 'object', a: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest016
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest016()).assertDeepEquals({ type: 'object', flag: 'yes' });
    });

    /**
     * @tc.name   ObjectAssignTest017
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest017()).assertDeepEquals({ type: 'object', prop: 'value' });
    });

    /**
     * @tc.name   ObjectAssignTest018
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest019
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_1900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest019()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest020
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest020()).assertDeepEquals({ a: 1, b: 'test', c: true });
    });

    /**
     * @tc.name   ObjectAssignTest021
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest021()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest022
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest022()).assertDeepEquals({ arr: [1, 2, 3], isSameRef: true });
    });

    /**
     * @tc.name   ObjectAssignTest023
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest023()).assertDeepEquals({ method: 'hello', arrow: 'world' });
    });

    /**
     * @tc.name   ObjectAssignTest024
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest024()).assertDeepEquals({ '0': 'a', '1': 'b', '2': 'c' });
    });

    /**
     * @tc.name   ObjectAssignTest025
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest025()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest026
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest026()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest027
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest027()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest028
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest028()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest029
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_2900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest029()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest030
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest030()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest031
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest031()).assertDeepEquals({ '0': 'a', '1': 'b', '2': 'c' });
    });

    /**
     * @tc.name   ObjectAssignTest032
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest032()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssignTest033
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest033()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssignTest034
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest034()).assertDeepEquals({ '0': 72, '1': 101, '2': 108, '3': 108, '4': 111 });
    });

    /**
     * @tc.name   ObjectAssignTest035
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest035()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssignTest036
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest036()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssignTest037
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest037()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssignTest038
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest038()).assertDeepEquals({ result: { a: 1, b: undefined, c: 2 }, hasB: true });
    });

    /**
     * @tc.name   ObjectAssignTest039
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_3900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest039()).assertDeepEquals({ a: 1, b: null, c: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest040
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest040()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest042
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest042()).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name   ObjectAssignTest043
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest043()).assertDeepEquals({
        special: "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~",
        emoji: "👆👿👀💯🎅",
        unicode: "\ud83d\udc46"
      });
    });

    /**
     * @tc.name   ObjectAssignTest044
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest044()).assertDeepEquals({ result: { enumerable: 1 }, nonEnumerable: undefined });
    });

    /**
     * @tc.name   ObjectAssignTest045
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest045()).assertDeepEquals({ keys: ['a', 'b'], isEnumerable: true });
    });

    /**
     * @tc.name   ObjectAssignTest046
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest046()).assertDeepEquals({ result: { own: 'own property' }, inherited: undefined });
    });

    /**
     * @tc.name   ObjectAssignTest047
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest047()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest048
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest048()).assertDeepEquals(["value", "[null]"]);
    });

    /**
     * @tc.name   ObjectAssignTest049
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_4900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest049()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectAssignTest050
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest050()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ObjectAssignTest051
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest051()).assertDeepEquals({
        sym1Value: 1,
        sym2Value: 2,
        isSameSym: false
      });
    });

    /**
     * @tc.name   ObjectAssignTest052
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest052()).assertDeepEquals({ writable: true, configurable: true });
    });

    /**
     * @tc.name   ObjectAssignTest053
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest053()).assertEqual('changed');
    });

    /**
     * @tc.name   ObjectAssignTest054
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest054()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectAssignTest055
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest055()).assertDeepEquals({ strKey: 'a', numKey: 'a' });
    });

    /**
     * @tc.name   ObjectAssignTest056
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest056()).assertDeepEquals({ dynamic: 'value', three: 'three' });
    });

    /**
     * @tc.name   ObjectAssignTest058
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest058()).assertDeepEquals({ existing: 1, single: 'value' });
    });

    /**
     * @tc.name   ObjectAssignTest059
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_5900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest059()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest060
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest060()).assertDeepEquals({ a: 1, b: 4, c: 5 });
    });

    /**
     * @tc.name   ObjectAssignTest061
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest061()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest062
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest062()).assertDeepEquals({ a: 1, b: 2, c: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest063
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest063()).assertDeepEquals({ a: 3, b: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest064
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest064()).assertDeepEquals({ a: 3, b: 2, c: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest065
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest065()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectAssignTest066
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest066()).assertDeepEquals([2, 'sym2']);
    });

    /**
     * @tc.name   ObjectAssignTest067
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest067()).assertDeepEquals({ c: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest068
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest068()).assertDeepEquals({ x: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest069
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_6900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest069()).assertEqual('string');
    });

    /**
     * @tc.name   ObjectAssignTest070
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest070()).assertDeepEquals({
        prop: { nested: 1 },
        type: 'object'
      });
    });

    /**
     * @tc.name   ObjectAssignTest071
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest071()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectAssignTest072
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest072()).assertEqual(null);
    });

    /**
     * @tc.name   ObjectAssignTest073
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest073()).assertDeepEquals(['a', 'b', 3]);
    });

    /**
     * @tc.name   ObjectAssignTest074
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest074()).assertDeepEquals({
        result: [1, 2, 'c', 'd'],
        length: 4
      });
    });

    /**
     * @tc.name   ObjectAssignTest075
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest075()).assertEqual('changed');
    });

    /**
     * @tc.name   ObjectAssignTest076
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest076()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest077
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest077()).assertDeepEquals({
        bar: 2,
        getterType: 'undefined'
      });
    });

    /**
     * @tc.name   ObjectAssignTest078
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest078()).assertDeepEquals({ first: 1, second: 1 });
    });

    /**
     * @tc.name   ObjectAssignTest079
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_7900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest080
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest080()).assertDeepEquals({ computed: 20, base: 10 });
    });

    /**
     * @tc.name   ObjectAssignTest081
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest081()).assertDeepEquals({ _value: 10, value: 10 });
    });

    /**
     * @tc.name   ObjectAssignTest082
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest082()).assertEqual('123');
    });

    /**
     * @tc.name   ObjectAssignTest083
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest083()).assertDeepEquals({
        _prop: 'HELLO',
        prop: undefined
      });
    });

    /**
     * @tc.name   ObjectAssignTest084
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest084()).assertEqual('processed:fromGetter');
    });

    /**
     * @tc.name   ObjectAssignTest085
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest085()).assertEqual(105);
    });

    /**
     * @tc.name   ObjectAssignTest086
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest086()).assertDeepEquals({
        getter: undefined,
        value: 1
      });
    });

    /**
     * @tc.name   ObjectAssignTest087
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest087()).assertDeepEquals({
        bar: 10,
        setterType: 'undefined'
      });
    });

    /**
     * @tc.name   ObjectAssignTest088
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest088()).assertDeepEquals({
        errorMsg: 'getter error',
        aVal: 1,
        bVal: undefined
      });
    });

    /**
     * @tc.name   ObjectAssignTest089
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_8900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest089()).assertDeepEquals({
        undef: undefined,
        hasUndef: true
      });
    });

    /**
     * @tc.name   ObjectAssignTest090
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9000
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest090()).assertDeepEquals({
        errorMsg: 'setter error',
        aVal: 1,
        bVal: undefined
      });
    });

    /**
     * @tc.name   ObjectAssignTest091
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9100
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest091()).assertEqual(10);
    });

    /**
     * @tc.name   ObjectAssignTest092
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9200
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest092()).assertDeepEquals({
        result: { own: 'property' },
        inherited: undefined
      });
    });

    /**
     * @tc.name   ObjectAssignTest093
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9300
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest093()).assertDeepEquals({ baz: 3 });
    });

    /**
     * @tc.name   ObjectAssignTest094
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9400
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest094()).assertDeepEquals({ own: 'own' });
    });

    /**
     * @tc.name   ObjectAssignTest095
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9500
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest095()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest096
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9600
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest096()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest097
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9700
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest097()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssignTest098
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9800
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest098()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssignTest099
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN_TEST_9900
     * @tc.desc   ObjectAssign Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssignTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign.ObjectAssignTest099()).assertEqual(true);
    });
  });
}