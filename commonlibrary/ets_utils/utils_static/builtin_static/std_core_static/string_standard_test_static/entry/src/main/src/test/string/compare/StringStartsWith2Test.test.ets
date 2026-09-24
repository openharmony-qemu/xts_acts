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

function startsWithWrapper<T extends String>(obj: String, prefix: T): boolean {
  return obj.startsWith(prefix);
}

export default function StringStartsWith2Test(): void {
  describe('StringStartsWith2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0100
     * @tc.name testStartsWith001
     * @tc.desc Verify string literal as subject calling startsWith returns true for matching prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      expect(strLiteral.startsWith(new String('Ark'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0200
     * @tc.name testStartsWith002
     * @tc.desc Verify function returning String calls startsWith correctly and returns true for matching prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStringVal().startsWith(new String('Ark'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0300
     * @tc.name testStartsWith003
     * @tc.desc Verify empty new String("") as subject calling startsWith returns true for empty and false for non-empty prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.startsWith(new String(''))).assertTrue();
      expect(emptyObj.startsWith(new String('a'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0400
     * @tc.name testStartsWith004
     * @tc.desc Verify startsWith returns true for first character of ZWJ emoji family and false for second character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.startsWith(new String('👨'))).assertTrue();
      expect(family.startsWith(new String('👩'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0500
     * @tc.name testStartsWith005
     * @tc.desc Verify startsWith returns true for 4-byte supplementary plane Unicode character prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('𠮷野家');
      expect(text.startsWith(new String('𠮷'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0600
     * @tc.name testStartsWith006
     * @tc.desc Verify startsWith returns true for traditional Chinese prefix and false for simplified variant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('繁體中文測試');
      expect(traditional.startsWith(new String('繁體'))).assertTrue();
      expect(traditional.startsWith(new String('繁体'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0700
     * @tc.name testStartsWith007
     * @tc.desc Verify startsWith returns true for English prefix and false for Chinese mid-string in mixed script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀');
      expect(mixed.startsWith(new String('Hello'))).assertTrue();
      expect(mixed.startsWith(new String('世界'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0800
     * @tc.name testStartsWith008
     * @tc.desc Verify startsWith returns false for non-matching prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.startsWith(new String('test'));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_0900
     * @tc.name testStartsWith009
     * @tc.desc Verify startsWith returns true for matching numeric string prefix "12" on "12345"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('12345');
      let result = text.startsWith(new String('12'));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1000
     * @tc.name testStartsWith010
     * @tc.desc Verify startsWith within generic function with T extends String returns true for matching prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(startsWithWrapper(text, new String('Ark'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1100
     * @tc.name testStartsWith011
     * @tc.desc Verify startsWith with a prefix is equivalent to indexOf being 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let swResult = text.startsWith(new String('Ark'));
      let idxResult = text.indexOf('Ark') === 0;
      expect(swResult).assertEqual(idxResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1200
     * @tc.name testStartsWith012
     * @tc.desc Verify startsWith result is consistent with substring extraction and equals comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let prefix = 'Ark';
      let swResult = text.startsWith(new String(prefix));
      let subResult = text.substring(0, prefix.length);
      expect(swResult).assertEqual(subResult.equals(prefix));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1300
     * @tc.name testStartsWith013
     * @tc.desc Verify when prefix length is not greater than subject length startsWith equals indexOf being 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const prefix: String = new String('Ark');
      expect(prefix.length).assertLessOrEqual(text.length);
      expect(text.startsWith(prefix)).assertEqual(text.indexOf(prefix.toString()) === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1400
     * @tc.name testStartsWith014
     * @tc.desc Verify startsWith and endsWith are equivalent to indexOf and lastIndexOf checks respectively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS ArkTS');
      let prefixes = ['Ark', 'Ar', 'TS', ''];
      for (let i = 0; i < prefixes.length; i++) {
        let p = prefixes[i];
        expect(text.startsWith(new String(p))).assertEqual(text.indexOf(p) === 0);
      }
      let suffixes = ['TS', 'ArkTS', 'S', ''];
      for (let j = 0; j < suffixes.length; j++) {
        let s = suffixes[j];
        let expectedIdx = text.length - s.length;
        expect(text.endsWith(new String(s))).assertEqual(text.lastIndexOf(s) === expectedIdx);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1500
     * @tc.name testStartsWith015
     * @tc.desc Verify startsWith on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world';
      let result: boolean = str.startsWith('hello');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1600
     * @tc.name testStartsWith016
     * @tc.desc Verify startsWith post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello world  ';
      let result: boolean = str.trim().startsWith('hello');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STARTSWITH2_1700
     * @tc.name testStartsWith017
     * @tc.desc Verify startsWith on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStartsWith017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: boolean = str.startsWith('');
      expect(result).assertTrue();
    });
  });
}