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
import * as ObjectDefineProperties3 from './ObjectDefineProperties3'

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectDefineProperties3Test() {
  describe('ObjectDefineProperties3Test', () => {
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
     * @tc.name   ObjectDefineProperties3Test001
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0100
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test001()).assertDeepEquals(['testRegex', true]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test002
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0200
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test002()).assertEqual('gim');
    });

    /**
     * @tc.name   ObjectDefineProperties3Test003
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0300
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test003()).assertEqual('promise-001');
    });

    /**
     * @tc.name   ObjectDefineProperties3Test004
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0400
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test004()).assertDeepEquals(['Hello, John', 30]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test005
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0500
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test005()).assertEqual('getter for add');
    });

    /**
     * @tc.name   ObjectDefineProperties3Test006
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0600
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test006()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test007
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0700
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test007()).assertEqual('deep-value');
    });

    /**
     * @tc.name   ObjectDefineProperties3Test008
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0800
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test008()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test009
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_0900
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test009()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test010
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1000
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test010()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test011
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1100
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test011()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test012
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1200
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test012()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test013
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1300
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test013()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test014
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1400
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test014()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test015
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1500
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test015()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test016
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1600
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test016()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test017
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1700
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test017()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test018
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1800
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test018()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test019
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_1900
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test019()).assertDeepEquals([true, 'Getter error']);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test020
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2000
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test020()).assertEqual(0);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test021
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2100
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test021()).assertDeepEquals([1, ['prop']]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test022
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2200
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test022()).assertDeepEquals([1000, 999]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test024
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2400
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test024()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test027
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2700
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test027()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test028
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2800
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test028()).assertDeepEquals([['a', 'b', 'c'], 1, 2, 3]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test029
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_2900
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test029()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test030
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3000
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test030()).assertDeepEquals([99, 99]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test031
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3100
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test031()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test032
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3200
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test032()).assertDeepEquals([2, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test033
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3300
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test033()).assertDeepEquals([2, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test034
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3400
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test034()).assertDeepEquals([
        1, true, true, true,
        'function', true, false
      ]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test035
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3500
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test035()).assertDeepEquals([
        ['a', 'b', 'c'],
        1,
        'function'
      ]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test036
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3600
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test036()).assertDeepEquals([1, 2, undefined]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test037
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3700
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test037()).assertDeepEquals(['proto method', 'proto accessor']);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test038
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3800
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test038()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test039
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_3900
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test039()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test040
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_4000
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test040()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test042
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_4200
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test042()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test043
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_4300
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test043()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectDefineProperties3Test044
     * @tc.number SUB_BUILTINS_OBJECT_DEFINE_PROPERTIES3_TEST_4400
     * @tc.desc   Object Define Proper3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectDefineProperties3Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectDefineProperties3.ObjectDefineProperties3Test044()).assertDeepEquals([[10, 10], [10, 20]]);
    });
  });
}