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
import * as ObjectFreeze3 from './ObjectFreeze3';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ObjectFreeze3Test() {
  describe('ObjectFreeze3Test', () => {
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
     * @tc.name   ObjectFreeze3Test001
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE3_TEST_0100
     * @tc.desc   Object Freeze3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze3Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze3.ObjectFreeze3Test001()).assertEqual('value');
    });

    /**
     * @tc.name   ObjectFreeze3Test003
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE3_TEST_0300
     * @tc.desc   Object Freeze3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze3Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze3.ObjectFreeze3Test003()).assertEqual(true);
    });

    /**
     * @tc.name   ObjectFreeze3Test004
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE3_TEST_0400
     * @tc.desc   Object Freeze3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze3Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze3.ObjectFreeze3Test004()).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   ObjectFreeze3Test005
     * @tc.number SUB_BUILTINS_OBJECT_FREEZE3_TEST_0500
     * @tc.desc   Object Freeze3 Test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ObjectFreeze3Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(ObjectFreeze3.ObjectFreeze3Test005()).assertEqual(true);
    });
  });
}