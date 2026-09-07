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

function checkEmpty<T extends string>(s: T): boolean {
  return s.isEmpty();
}

export default function StringIsEmpty2Test(): void {
  describe('StringIsEmpty2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0100
     * @tc.name testIsEmpty001
     * @tc.desc Verify three forms of empty string all return true for isEmpty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.isEmpty()).assertTrue();
      expect(new String('').isEmpty()).assertTrue();
      expect(new String().isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0200
     * @tc.name testIsEmpty002
     * @tc.desc Verify const and let empty strings have same isEmpty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: string = '';
      expect(c.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0300
     * @tc.name testIsEmpty003
     * @tc.desc Verify non-breaking space string is not empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = ' ';
      expect(s.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0400
     * @tc.name testIsEmpty004
     * @tc.desc Verify multiple whitespace string isEmpty returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '   ';
      expect(s.isEmpty()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0500
     * @tc.name testIsEmpty005
     * @tc.desc Verify isEmpty returns true for non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '';
      let r: boolean = s.isEmpty();
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0600
     * @tc.name testIsEmpty006
     * @tc.desc Verify generic function with T extends string calls isEmpty correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(checkEmpty('')).assertTrue();
      expect(checkEmpty('ArkTS')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0700
     * @tc.name testIsEmpty007
     * @tc.desc Verify isEmpty is equivalent to length equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = '';
      let s2: string = 'ArkTS';
      expect(s1.isEmpty()).assertEqual(s1.length === 0);
      expect(s2.isEmpty()).assertEqual(s2.length === 0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0800
     * @tc.name testIsEmpty008
     * @tc.desc Verify isEmpty on let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: boolean = str.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISEMPTY2_0900
     * @tc.name testIsEmpty009
     * @tc.desc Verify isEmpty returns false for non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsEmpty009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      expect(str.isEmpty()).assertFalse();
    });
  });
}