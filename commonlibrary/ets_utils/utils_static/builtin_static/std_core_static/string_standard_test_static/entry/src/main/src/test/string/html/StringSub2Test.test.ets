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

function makeSub<T extends string>(val: T): string {
  return val.sub();
}

export default function StringSub2Test(): void {
  describe('StringSub2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0100
     * @tc.name testSub001
     * @tc.desc Verify new String() object calling sub() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('subscript');
      let objResult: string = objStr.sub();
      expect(objResult).assertEqual('<sub>subscript</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0200
     * @tc.name testSub002
     * @tc.desc Verify emoji and special characters preserved by sub() wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let formula: string = 'H₂O🔥';
      let result: string = formula.sub();
      let inner: string = result.substring(5, result.length - 6);
      expect(inner).assertEqual('H₂O🔥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0300
     * @tc.name testSub003
     * @tc.desc Verify String() factory wrapping integer 256 and null before calling sub() produces correct HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(256).sub();
      expect(r1).assertEqual('<sub>256</sub>');
      let r2: string = String(null).sub();
      expect(r2).assertEqual('<sub>null</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0400
     * @tc.name testSub004
     * @tc.desc Verify sub().sup() chain forms sup > sub nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.sub().sup();
      expect(result).assertEqual('<sup><sub>x</sub></sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0500
     * @tc.name testSub005
     * @tc.desc Verify generic T extends string can still call sub() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = makeSub('genericSub');
      expect(result).assertEqual('<sub>genericSub</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0600
     * @tc.name testSub006
     * @tc.desc Verify sub on empty string produces empty sub tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.sub()).assertEqual('<sub></sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0700
     * @tc.name testSub007
     * @tc.desc Verify sub() correctly wraps Japanese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'こんにちは'.sub();
      expect(result).assertEqual('<sub>こんにちは</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0800
     * @tc.name testSub008
     * @tc.desc Verify sub() correctly wraps Cyrillic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'привет'.sub();
      expect(result).assertEqual('<sub>привет</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_0900
     * @tc.name testSub009
     * @tc.desc Verify sub() correctly wraps Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'اختبار'.sub();
      expect(result).assertEqual('<sub>اختبار</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_1000
     * @tc.name testSub010
     * @tc.desc Verify sub() can be chained with trim() post-operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.sub().trim();
      expect(result).assertEqual('<sub>hello</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_1100
     * @tc.name testSub011
     * @tc.desc Verify three-method chain with sub as middle operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.trim().sub().concat('!');
      expect(result).assertEqual('<sub>hello</sub>!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_1200
     * @tc.name testSub012
     * @tc.desc Verify sub() correctly wraps a long repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abc'.repeat(100);
      let result: string = longStr.sub();
      expect(result).assertEqual('<sub>' + longStr + '</sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUB2_1300
     * @tc.name testSub013
     * @tc.desc Verify sub() correctly wraps Korean text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSub013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '안녕하세요'.sub();
      expect(result).assertEqual('<sub>안녕하세요</sub>');
    });

  });
}