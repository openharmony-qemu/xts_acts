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
import * as ObjectAssign3 from './ObjectAssign3'

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectAssign3Test() {
  describe('ObjectAssign3Test', () => {
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
     * @tc.name   ObjectAssign3Test001
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0100
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test001()).assertDeepEquals([true, 'self']);
    });

    /**
     * @tc.name   ObjectAssign3Test002
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0200
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test002()).assertDeepEquals(['b', true]);
    });

    /**
     * @tc.name   ObjectAssign3Test003
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0300
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectAssign3Test004
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0400
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test004()).assertEqual(100);
    });

    /**
     * @tc.name   ObjectAssign3Test005
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0500
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test005()).assertDeepEquals([{ a: 1 }, true]);
    });

    /**
     * @tc.name   ObjectAssign3Test006
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0600
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test006()).assertDeepEquals({ a: 1, b: 2, c: 3 });
    });

    /**
     * @tc.name   ObjectAssign3Test007
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0700
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test007()).assertDeepEquals({ a: 1 });
    });

    /**
     * @tc.name   ObjectAssign3Test008
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0800
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test008()).assertDeepEquals({ a: 1, b: 2, c: 3 });
    });

    /**
     * @tc.name   ObjectAssign3Test009
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_0900
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test009()).assertDeepEquals({ a: 1, b: 2 });
    });

    /**
     * @tc.name   ObjectAssign3Test010
     * @tc.number SUB_BUILTINS_OBJECT_ASSIGN3_TEST_1000
     * @tc.desc   ObjectAssign3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectAssign3Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectAssign3.ObjectAssign3Test010()).assertDeepEquals({ a: 1 });
    });
  });
}