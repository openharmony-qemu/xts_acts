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

function endsWithWrapper<T extends String>(obj: String, suffix: T): boolean {
  return obj.endsWith(suffix);
}

export default function StringEndsWith2Test(): void {
  describe('StringEndsWith2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0100
     * @tc.name testEndsWith001
     * @tc.desc Verify string literal as subject calling endsWith returns true for matching suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      expect(strLiteral.endsWith(new String('TS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0200
     * @tc.name testEndsWith002
     * @tc.desc Verify function returning String calls endsWith correctly and returns true for matching suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStringVal().endsWith(new String('TS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0300
     * @tc.name testEndsWith003
     * @tc.desc Verify empty new String("") as subject calling endsWith returns true for empty and false for non-empty suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.endsWith(new String(''))).assertTrue();
      expect(emptyObj.endsWith(new String('a'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0400
     * @tc.name testEndsWith004
     * @tc.desc Verify endsWith returns true for last character of ZWJ emoji family and false for first character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.endsWith(new String('👦'))).assertTrue();
      expect(family.endsWith(new String('👨'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0500
     * @tc.name testEndsWith005
     * @tc.desc Verify endsWith returns true for 4-byte supplementary plane Unicode character suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('前缀𠮷');
      expect(text.endsWith(new String('𠮷'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0600
     * @tc.name testEndsWith006
     * @tc.desc Verify endsWith returns true for traditional Chinese suffix and false for simplified variant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('測試繁體');
      expect(traditional.endsWith(new String('繁體'))).assertTrue();
      expect(traditional.endsWith(new String('繁体'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0700
     * @tc.name testEndsWith007
     * @tc.desc Verify endsWith returns true for emoji suffix and false for English prefix in mixed script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀');
      expect(mixed.endsWith(new String('😀'))).assertTrue();
      expect(mixed.endsWith(new String('Hello'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0800
     * @tc.name testEndsWith008
     * @tc.desc Verify endsWith with valid String suffix parameter returns a boolean result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.endsWith(new String('test'));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_0900
     * @tc.name testEndsWith009
     * @tc.desc Verify endsWith within generic function with T extends String returns true for matching suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(endsWithWrapper(text, new String('TS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_1000
     * @tc.name testEndsWith010
     * @tc.desc Verify endsWith is equivalent to lastIndexOf matching from the end position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTSArkTS');
      let suffix = 'TS';
      let ewResult = text.endsWith(new String(suffix));
      let expectedIdx = text.length - suffix.length;
      let liResult = text.lastIndexOf(suffix) === expectedIdx;
      expect(ewResult).assertEqual(liResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_1100
     * @tc.name testEndsWith011
     * @tc.desc Verify endsWith result is consistent with slice extraction and equals comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let suffix = 'TS';
      let ewResult = text.endsWith(new String(suffix));
      let slicedEnd = text.slice(text.length - suffix.length);
      expect(ewResult).assertEqual(slicedEnd.equals(suffix));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_1200
     * @tc.name testEndsWith012
     * @tc.desc Verify mid-substring is neither startsWith nor endsWith but contains returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const mid: String = new String('rkT');
      expect(text.startsWith(mid)).assertFalse();
      expect(text.endsWith(mid)).assertFalse();
      expect(text.contains(mid, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_1300
     * @tc.name testEndsWith013
     * @tc.desc Verify when suffix length is not greater than subject length endsWith equals lastIndexOf matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const suffix: String = new String('TS');
      expect(suffix.length).assertLessOrEqual(text.length);
      expect(text.endsWith(suffix)).assertEqual(text.lastIndexOf(suffix.toString()) === text.length - suffix.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ENDSWITH2_1400
     * @tc.name testEndsWith014
     * @tc.desc Verify endsWith returns false when suffix length exceeds subject length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndsWith014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('TS');
      const suffix: String = new String('ArkTS');
      expect(text.endsWith(suffix)).assertFalse();
    });
  });
}