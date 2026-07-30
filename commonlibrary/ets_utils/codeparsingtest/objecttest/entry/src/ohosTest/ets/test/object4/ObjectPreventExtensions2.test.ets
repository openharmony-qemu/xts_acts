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
import * as ObjectPreventExtensions2 from './ObjectPreventExtensions2';
function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectPreventExtensions2Test() {
  describe('ObjectPreventExtensions2Test', () => {
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
     * @tc.name   ObjectPreventExtensions2Test001
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0100
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test001()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test002
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0200
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test002()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test003
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0300
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test004
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0400
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test004()).assertDeepEquals([['a', 'b'], ['b']]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test005
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0500
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test005()).assertDeepEquals([[1, 2], [10, 2]]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test006
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0600
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test006()).assertDeepEquals([[['a', 1], ['b', 2]], [['a', 10], ['b', 2]]]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test007
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0700
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test007()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test008
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0800
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test008()).assertDeepEquals([1, true]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test009
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_0900
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test009()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test010
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1000
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test010()).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test012
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1200
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test012()).assertDeepEquals([true, false, false]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test013
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1300
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test013()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test014
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1400
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test014()).assertDeepEquals(['{"a":1,"b":2}', '{"a":10,"b":2}']);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test015
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1500
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test015()).assertDeepEquals([false, 10]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test016
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1600
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test016()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test017
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1700
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test017()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test018
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1800
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test018()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test019
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_1900
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test019()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test020
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_2000
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test020()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test021
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_2100
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test021()).assertEqual(false);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test022
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_2200
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test022()).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ObjectPreventExtensions2Test023
     * @tc.number SUB_BUILTINS_OBJECT_PREVENT_EXTENSIONS2_TEST_2300
     * @tc.desc   Object Prevent Extensions2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectPreventExtensions2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectPreventExtensions2.ObjectPreventExtensions2Test023()).assertDeepEquals([true, undefined]);
    });
  });
}