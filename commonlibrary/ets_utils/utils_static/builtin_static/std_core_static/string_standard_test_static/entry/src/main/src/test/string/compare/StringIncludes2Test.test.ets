'use static';
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

import {
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getStringVal(): String {
  return new String('ArkTS');
}

function includesWrapper(obj: String, search: string, pos?: int): boolean {
  return obj.includes(search, pos);
}

export default function StringIncludes2Test(): void {
  describe('StringIncludes2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0100
     * @tc.name testIncludes001
     * @tc.desc Verify string literal as subject calling includes returns true for existing substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      expect(strLiteral.includes('TS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0200
     * @tc.name testIncludes002
     * @tc.desc Verify function returning String calls includes correctly and returns true for existing substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStringVal().includes('TS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0300
     * @tc.name testIncludes003
     * @tc.desc Verify empty new String("") as subject calling includes returns true for empty and false for non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.includes('')).assertTrue();
      expect(emptyObj.includes('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0400
     * @tc.name testIncludes004
     * @tc.desc Verify includes returns true for individual and multi-char ZWJ emoji family substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.includes('👨')).assertTrue();
      expect(family.includes('👨‍👩')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0500
     * @tc.name testIncludes005
     * @tc.desc Verify includes returns true for 4-byte supplementary plane Unicode character and multi-char substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ABC𠮷野家DEF');
      expect(text.includes('𠮷')).assertTrue();
      expect(text.includes('野家')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0600
     * @tc.name testIncludes006
     * @tc.desc Verify includes returns true for traditional Chinese substring and false for simplified variant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('測試繁體中文');
      expect(traditional.includes('繁體')).assertTrue();
      expect(traditional.includes('繁体')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0700
     * @tc.name testIncludes007
     * @tc.desc Verify includes returns true for Chinese emoji and English substrings in mixed script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀ABC');
      expect(mixed.includes('世界')).assertTrue();
      expect(mixed.includes('😀')).assertTrue();
      expect(mixed.includes('ABC')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0800
     * @tc.name testIncludes008
     * @tc.desc Verify includes with non-matching search parameter has result type of boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.includes('test');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_0900
     * @tc.name testIncludes009
     * @tc.desc Verify includes with numeric substring "23" in "12345" has result type of boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('12345');
      let result = text.includes('23');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_1000
     * @tc.name testIncludes010
     * @tc.desc Verify includes with boolean-like substring "true" in "trueValue" has result type of boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('trueValue');
      let result = text.includes('true');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_1100
     * @tc.name testIncludes011
     * @tc.desc Verify includes within generic function with T extends string returns true and false with position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(includesWrapper(text, 'Ark')).assertTrue();
      expect(includesWrapper(text, 'Ark', 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_1200
     * @tc.name testIncludes012
     * @tc.desc Verify includes and contains return consistent results for the same inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.includes('rk')).assertEqual(text.contains(new String('rk'), 0));
      expect(text.includes('xyz')).assertEqual(text.contains(new String('xyz'), 0));
      expect(text.includes('')).assertEqual(text.contains(new String(''), 0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_1300
     * @tc.name testIncludes013
     * @tc.desc Verify includes with position is equivalent to indexOf with the same position not equal to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS ArkTS');
      let search = 'Ark';
      let pos = 3;
      let incResult = text.includes(search, pos);
      let idxResult = text.indexOf(search, pos) !== -1;
      expect(incResult).assertEqual(idxResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_1400
     * @tc.name testIncludes014
     * @tc.desc Verify includes with position equals length only matches empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.includes('', text.length)).assertTrue();
      expect(text.includes('Ark', text.length)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INCLUDES2_1500
     * @tc.name testIncludes015
     * @tc.desc Verify includes and contains are fully consistent across all test case inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Hello世界😀ArkTS');
      let testCases = ['Hello', '世界', '😀', 'ArkTS', 'xyz', ''];
      for (let i = 0; i < testCases.length; i++) {
        let tc = testCases[i];
        expect(text.includes(tc)).assertEqual(text.contains(new String(tc), 0));
      }
    });
  });
}