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

function makeSmall<T extends string>(val: T): string {
  return val.small();
}

export default function StringSmall2Test(): void {
  describe('StringSmall2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0100
     * @tc.name testSmall001
     * @tc.desc Verify new String() object calling small() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('tiny');
      let litResult: string = 'tiny'.small();
      let objResult: string = objStr.small();
      expect(objResult).assertEqual(litResult);
      expect(objResult).assertEqual('<small>tiny</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0200
     * @tc.name testSmall002
     * @tc.desc Verify emoji and Chinese mixed content preserved after small() wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let smallText: string = '🔍缩小文字🔍';
      let result: string = smallText.small();
      let inner: string = result.substring(7, result.length - 8);
      expect(inner).assertEqual('🔍缩小文字🔍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0300
     * @tc.name testSmall003
     * @tc.desc Verify small().big() chain forms big > small size tag nesting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'size'.small().big();
      expect(result).assertEqual('<big><small>size</small></big>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0400
     * @tc.name testSmall004
     * @tc.desc Verify generic T extends string can still call small() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = makeSmall('genericSmall');
      expect(result).assertEqual('<small>genericSmall</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0500
     * @tc.name testSmall005
     * @tc.desc Verify small on empty string produces empty small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.small()).assertEqual('<small></small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0600
     * @tc.name testSmall006
     * @tc.desc Verify small correctly wraps Japanese characters in small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('こんにちは'.small()).assertEqual('<small>こんにちは</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0700
     * @tc.name testSmall007
     * @tc.desc Verify small correctly wraps Cyrillic characters in small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('привет'.small()).assertEqual('<small>привет</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0800
     * @tc.name testSmall008
     * @tc.desc Verify small correctly wraps Arabic characters in small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('اختبار'.small()).assertEqual('<small>اختبار</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_0900
     * @tc.name testSmall009
     * @tc.desc Verify small correctly wraps single emoji character in small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('😀'.small()).assertEqual('<small>😀</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_1000
     * @tc.name testSmall010
     * @tc.desc Verify small correctly wraps zero-width space in small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('\u200B'.small()).assertEqual('<small>\u200B</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_1100
     * @tc.name testSmall011
     * @tc.desc Verify small can chain with trim method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.small().trim();
      expect(result).assertEqual('<small>hello</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_1200
     * @tc.name testSmall012
     * @tc.desc Verify small in a three-method chain with trim and concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.trim().small().concat('!');
      expect(result).assertEqual('<small>hello</small>!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_1300
     * @tc.name testSmall013
     * @tc.desc Verify small works correctly on a long repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abc'.repeat(100);
      let result: string = longStr.small();
      expect(result).assertEqual('<small>' + longStr + '</small>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SMALL2_1400
     * @tc.name testSmall014
     * @tc.desc Verify small correctly wraps mixed Latin and CJK text in small tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmall014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('hello测试'.small()).assertEqual('<small>hello测试</small>');
    });
  });
}