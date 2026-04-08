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

export default function execCharClassTest() {
  describe('Character_Class_Tests', () => {
    /**
     * @tc.name testExecTest0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0100
     * @tc.desc   Test RegExp.prototype.exec simple character class [abc]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /[abc]/;
      const result1 = re.exec("a");
      const result2 = re.exec("b");
      const result3 = re.exec("d");
      expect(result1).not().assertEqual(null);
      expect(result2).not().assertEqual(null);
      expect(result3).assertEqual(null);
    });

    /**
     * @tc.name testExecTest0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0101
     * @tc.desc   Test RegExp.prototype.exec range character class [a-z]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /[a-z]/;
      const result1 = re.exec("a");
      const result2 = re.exec("z");
      const result3 = re.exec("A");
      expect(result1).not().assertEqual(null);
      expect(result2).not().assertEqual(null);
      expect(result3).assertEqual(null);
    });

    /**
     * @tc.name testExecTest0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0102
     * @tc.desc   Test RegExp.prototype.exec negated character class [^abc]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /[^abc]/;
      const result1 = re.exec("a");
      const result2 = re.exec("d");
      expect(result1).assertEqual(null);
      expect(result2).not().assertEqual(null);
      expect(result2?.[0]).assertEqual("d");
    });

    /**
     * @tc.name testExecTest0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_BUILTINS_REGEXP_EXEC_TEST_0103
     * @tc.desc   Test RegExp.prototype.exec predefined class \\d+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testExecTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const re = /\d+/;
      const result = re.exec("abc123def");
      expect(result).not().assertEqual(null);
      expect(result?.[0]).assertEqual("123");
    });
  });
}
