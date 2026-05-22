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
import * as ObjectAssign2 from './ObjectAssign2';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectAssign2Test() {
  describe('ObjectAssign2Test', () => {
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
     * @tc.name   ObjectAssign2Test001
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test001()).assertEqual('new');
    });

    /**
     * @tc.name   ObjectAssign2Test002
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test002()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test003
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test003()).assertEqual('new');

    });

    /**
     * @tc.name   ObjectAssign2Test004
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test004()).assertDeepEquals(['value', undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test005
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test005()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectAssign2Test006
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test006()).assertDeepEquals([1, 'proxied']);
    });

    /**
     * @tc.name   ObjectAssign2Test007
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test007()).assertEqual('modified:value');
    });

    /**
     * @tc.name   ObjectAssign2Test008
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test008()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssign2Test009
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_0900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test009()).assertDeepEquals({});
    });

    /**
     * @tc.name   ObjectAssign2Test010
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test010()).assertDeepEquals({ '0': 1, '1': 2, '2': 3 });
    });

    /**
     * @tc.name   ObjectAssign2Test011
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test011()).assertDeepEquals({ globalProp: 'value' });
    });

    /**
     * @tc.name   ObjectAssign2Test012
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test012()).assertDeepEquals(['TypeError', true]);
    });

    /**
     * @tc.name   ObjectAssign2Test013
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test013()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test014
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test015
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test016
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test017
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test017()).assertDeepEquals([2, 3, 1, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test018
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test018()).assertDeepEquals(['success', 'original', undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test019
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_1900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test019()).assertDeepEquals([1, 2, 3, 0, undefined, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test020
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test020()).assertDeepEquals(['setter throws', 1, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test021
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test021()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test022
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test022()).assertDeepEquals(['proxy get error', 1, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test023
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test023()).assertDeepEquals(['proxy set error', 1, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test024
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test024()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test025
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test025()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test026
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test026()).assertDeepEquals([{ a: 1 }, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test027
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test027()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test029
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_2900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test029()).assertDeepEquals([{ a: 1, b: 2 }, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test030
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test030()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssign2Test031
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test031()).assertDeepEquals([1, 0, 3, 3]);
    });

    /**
     * @tc.name   ObjectAssign2Test032
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test032()).assertDeepEquals([[1, 2, 3, 4], [1, 2, 3, 4]]);
    });

    /**
     * @tc.name   ObjectAssign2Test033
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test033()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test034
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test034()).assertDeepEquals([1, 'hello', true]);
    });

    /**
     * @tc.name   ObjectAssign2Test035
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test035()).assertDeepEquals([null, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test036
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test036()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test037
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test037()).assertDeepEquals(['123', '456']);
    });

    /**
     * @tc.name   ObjectAssign2Test038
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test038()).assertEqual('changed');
    });

    /**
     * @tc.name   ObjectAssign2Test039
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_3900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test039()).assertDeepEquals([{ a: 1, b: 2 }, { c: 3 }]);
    });

    /**
     * @tc.name   ObjectAssign2Test040
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test040()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectAssign2Test041
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test041()).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.name   ObjectAssign2Test042
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test042()).assertDeepEquals([100, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test043
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test043()).assertDeepEquals(['function', undefined, 'string']);
    });

    /**
     * @tc.name   ObjectAssign2Test044
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test044()).assertDeepEquals([{ debug: false }, false]);
    });

    /**
     * @tc.name   ObjectAssign2Test045
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test045()).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   ObjectAssign2Test046
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test046()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectAssign2Test047
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test047()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectAssign2Test048
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test048()).assertDeepEquals(['normal']);
    });

    /**
     * @tc.name   ObjectAssign2Test049
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_4900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test049()).assertDeepEquals(['x', 'y', 'z']);
    });

    /**
     * @tc.name   ObjectAssign2Test050
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test050()).assertDeepEquals(['second']);
    });

    /**
     * @tc.name   ObjectAssign2Test051
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test051()).assertDeepEquals([['a', 1], ['b', 2]]);
    });

    /**
     * @tc.name   ObjectAssign2Test052
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test052()).assertDeepEquals([['x', 1], ['y', 2]]);
    });

    /**
     * @tc.name   ObjectAssign2Test053
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test053()).assertDeepEquals([{ a: 1, b: 2 }, true, false]);
    });

    /**
     * @tc.name   ObjectAssign2Test054
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test054()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test055
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test055()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test056
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test056()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectAssign2Test057
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test057()).assertEqual('modified');
    });

    /**
     * @tc.name   ObjectAssign2Test058
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test058()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test059
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_5900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test059()).assertEqual('defined');
    });

    /**
     * @tc.name   ObjectAssign2Test060
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test060()).assertDeepEquals([1, 2, ['a']]);
    });

    /**
     * @tc.name   ObjectAssign2Test061
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test061()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test062
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test062()).assertDeepEquals([['a', 'b'], ['a', 'b', 'c']]);
    });

    /**
     * @tc.name   ObjectAssign2Test063
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test063()).assertDeepEquals(["Symbol(a)", "Symbol(b)"]);
    });

    /**
     * @tc.name   ObjectAssign2Test064
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test064()).assertDeepEquals(['property', undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test065
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test065()).assertDeepEquals(['value', 'proto']);
    });

    /**
     * @tc.name   ObjectAssign2Test066
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test066()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test067
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test067()).assertDeepEquals([{ a: 1, b: 2 }, { a: 1, b: 2 }]);
    });

    /**
     * @tc.name   ObjectAssign2Test068
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test068()).assertDeepEquals([{ a: 1, b: 2, c: 3 }, { a: 1, b: 2, c: 3 }]);
    });

    /**
     * @tc.name   ObjectAssign2Test069
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_6900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test069()).assertDeepEquals([{ original: 1, new: 2 }, { original: 1 }]);
    });

    /**
     * @tc.name   ObjectAssign2Test070
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test070()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign2Test071
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test071()).assertEqual(3);
    });

    /**
     * @tc.name   ObjectAssign2Test072
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test072()).assertDeepEquals([{ a: 1, b: 2, c: 3 }, { x: 1, y: 2 }]);
    });

    /**
     * @tc.name   ObjectAssign2Test073
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test073()).assertDeepEquals(['object', true]);
    });

    /**
     * @tc.name   ObjectAssign2Test074
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test074()).assertDeepEquals(['object', true]);
    });

    /**
     * @tc.name   ObjectAssign2Test075
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test075()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test076
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test076()).assertDeepEquals([{ a: 1 }, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test077
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test077()).assertDeepEquals([{ a: 1 }, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test078
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test078()).assertDeepEquals([{ a: 1 }, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test079
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_7900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test079()).assertDeepEquals([1, undefined]);
    });

    /**
     * @tc.name   ObjectAssign2Test080
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test080()).assertDeepEquals([true, 'config']);
    });

    /**
     * @tc.name   ObjectAssign2Test081
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test081()).assertEqual(2);
    });

    /**
     * @tc.name   ObjectAssign2Test082
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test082()).assertEqual('Operation succeeded');
    });

    /**
     * @tc.name   ObjectAssign2Test084
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test084()).assertEqual('object');
    });

    /**
     * @tc.name   ObjectAssign2Test086
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test086()).assertDeepEquals([Number.MAX_VALUE, Number.MIN_VALUE]);
    });

    /**
     * @tc.name   ObjectAssign2Test087
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test087()).assertEqual('emptyKey');
    });

    /**
     * @tc.name   ObjectAssign2Test088
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test088()).assertDeepEquals(['', 0]);
    });

    /**
     * @tc.name   ObjectAssign2Test089
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_8900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test089()).assertDeepEquals([null, null, ['a', 'b', 'c']]);
    });

    /**
     * @tc.name   ObjectAssign2Test090
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9000
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test090()).assertDeepEquals([undefined, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test091
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9100
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test091()).assertDeepEquals({ injected: true });
    });

    /**
     * @tc.name   ObjectAssign2Test092
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9200
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test092()).assertEqual('custom');
    });

    /**
     * @tc.name   ObjectAssign2Test093
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9300
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test093()).assertDeepEquals(['overwritten', 'string']);
    });

    /**
     * @tc.name   ObjectAssign2Test094
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9400
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test094()).assertDeepEquals(['shadowed', true]);
    });

    /**
     * @tc.name   ObjectAssign2Test095
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9500
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test095()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectAssign2Test096
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9600
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test096()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectAssign2Test097
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9700
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test097()).assertDeepEquals([Infinity, -Infinity, true]);
    });

    /**
     * @tc.name   ObjectAssign2Test098
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9800
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test098()).assertDeepEquals(['number', 'object', 'function']);
    });

    /**
     * @tc.name   ObjectAssign2Test099
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN2_TEST_9900
     * @tc.desc   ObjectAssign2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign2Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign2.ObjectAssign2Test099()).assertDeepEquals([false, false]);
    });
  });
}