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
import {
  assignSourceStrictStillOriginal,
  regexpWithDFlagHasIndicesTrue,
  regexpLiteralWithoutDNotHasIndices
} from './RegExpHelper';

function supportsRegExp(pattern: string, flags: string = ''): boolean {
  try {
    new RegExp(pattern, flags);
    return true;
  } catch (_) {
    return false;
  }
}

export default function instancePropertiesTest() {
  describe('Instance_Properties', () => {
    /**
     * @tc.name testRegExpInstanceTest0100
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0100
     * @tc.desc   Test source_abc_i_and_dollar_plus_g
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex1 = /abc/i;
      const regex2 = new RegExp('\\d+', 'g');
      const regex3 = /\\w+/;
      expect(regex1.source).assertEqual('abc');
      expect(regex2.source).assertEqual('\\d+');

      expect(regex3.source).assertEqual('\\\\w+');
    });

    /**
     * @tc.name testRegExpInstanceTest0101
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0101
     * @tc.desc   Test source_readonly_strict
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstanceTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(assignSourceStrictStillOriginal()).assertTrue();
    });

    /**
     * @tc.name testRegExpInstanceTest0102
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0102
     * @tc.desc   Test flags_gim_empty_and_s_when_supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstanceTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex1 = /abc/gim;
      const regex2 = /test/;
      expect(regex1.flags).assertEqual('gim');
      expect(regex2.flags).assertEqual('');
      if (supportsRegExp('hello', 's')) {
        const regex3 = new RegExp('hello', 's');
        expect(regex3.flags.indexOf('s') >= 0).assertTrue();
      } else {
        expect(true).assertTrue();
      }
    });

    /**
     * @tc.name testRegExpInstanceTest0103
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0103
     * @tc.desc   Test global_ignoreCase_multiline
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstanceTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(/test/g.global).assertTrue();
      expect(/test/.global).assertFalse();
      expect(/test/i.ignoreCase).assertTrue();
      expect(/test/.ignoreCase).assertFalse();
      expect(/test/m.multiline).assertTrue();
      expect(/test/.multiline).assertFalse();
    });

    /**
     * @tc.name testRegExpInstanceTest0104
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0104
     * @tc.desc   Test dotAll_sticky_unicode_when_supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstanceTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('test', 's')) {
        expect(new RegExp('test', 's').dotAll).assertTrue();
      }
      expect(/test/.dotAll).assertFalse();
      expect(/test/y.sticky).assertTrue();
      expect(/test/.sticky).assertFalse();
      expect(/test/u.unicode).assertTrue();
      expect(/test/.unicode).assertFalse();
    });

    /**
     * @tc.name testRegExpInstanceTest0105
     * @tc.number SUB_COMMONLIBRARY_REGEXP_INSTANCE_TEST_0105
     * @tc.desc   Test hasIndices_when_supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRegExpInstanceTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      if (supportsRegExp('test', 'd')) {
        expect(regexpWithDFlagHasIndicesTrue()).assertTrue();
      }
      expect(regexpLiteralWithoutDNotHasIndices()).assertTrue();
    });
  });
}

