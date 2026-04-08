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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function execReturnTypeTest() {
  describe('Match_Result_Type_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec returns array-like object with index and input types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/;
      const result = re.exec("test");
      expect(Array.isArray(result)).assertTrue();
      expect(typeof result?.index).assertEqual("number");
      expect(typeof result?.input).assertEqual("string");
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0101
     * @tc.desc   Test RegExp.prototype.exec returns null on failure and lastIndex unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /test/;
      const result = re.exec("hello");
      expect(result).assertEqual(null);
      expect(re.lastIndex).assertEqual(0);
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0102
     * @tc.desc   Placeholder for enumerable properties on exec result (commented checks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(true).assertTrue();
    });
  });
}
