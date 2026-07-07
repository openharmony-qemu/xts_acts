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
import * as ObjectCreate2 from "./ObjectCreate2";

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectCreate2Test() {
  describe('ObjectCreate2Test', () => {
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
     * @tc.name   ObjectCreate2Test001
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0100
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test001()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectCreate2Test002
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0200
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test002()).assertEqual(1);
    });

    /**
     * @tc.name   ObjectCreate2Test003
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0300
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test003()).assertEqual(undefined);
    });

    /**
     * @tc.name   ObjectCreate2Test004
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0400
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test004()).assertDeepEquals(['own']);
    });

    /**
     * @tc.name   ObjectCreate2Test005
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0500
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test005()).assertDeepEquals([2]);
    });

    /**
     * @tc.name   ObjectCreate2Test006
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0600
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test006()).assertDeepEquals([['own', 2]]);
    });

    /**
     * @tc.name   ObjectCreate2Test007
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0700
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test007()).assertDeepEquals([2, 3, 1]);
    });

    /**
     * @tc.name   ObjectCreate2Test008
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0800
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test008()).assertDeepEquals([1, undefined]);
    });

    /**
     * @tc.name   ObjectCreate2Test009
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_0900
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test009()).assertDeepEquals(['own', 'inherited']);
    });

    /**
     * @tc.name   ObjectCreate2Test010
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_1000
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test010()).assertDeepEquals([true, true, false]);
    });

    /**
     * @tc.name   ObjectCreate2Test011
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_1100
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test011()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectCreate2Test012
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_1200
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test012()).assertDeepEquals(['object', 'object']);
    });

    /**
     * @tc.name   ObjectCreate2Test013
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_1300
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test013()).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ObjectCreate2Test016
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_1600
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test016()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ObjectCreate2Test017
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_1700
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test017()).assertDeepEquals([0, 0]);
    });

    /**
     * @tc.name   ObjectCreate2Test023
     * @tc.number SUB_BUILTINS_OBJECT_CREATE2_TEST_2300
     * @tc.desc   Object Create2 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectCreate2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectCreate2.ObjectCreate2Test023()).assertDeepEquals([1000, true]);
    });
  });
}