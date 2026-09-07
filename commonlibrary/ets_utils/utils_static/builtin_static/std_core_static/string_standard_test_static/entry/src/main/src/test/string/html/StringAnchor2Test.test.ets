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

export default function StringAnchor2Test(): void {
  describe('StringAnchor2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0100
     * @tc.name testAnchor001
     * @tc.desc Verify anchor with Unicode surrogate pair name (𝄞 U+1D11E) is fully preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = 'music';
      let result: string = text.anchor('𝄞');
      expect(result).assertEqual('<a name="𝄞">music</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0200
     * @tc.name testAnchor002
     * @tc.desc Verify anchor name with mixed RTL Arabic and LTR English preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = 'link';
      let result: string = text.anchor('enالعربيen');
      expect(result).assertEqual('<a name="enالعربيen">link</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0300
     * @tc.name testAnchor003
     * @tc.desc Verify String wrapper object used as anchor name via explicit toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = 'data';
      let objName: String = new String('objName');
      let result: string = text.anchor(objName.toString());
      expect(result).assertEqual('<a name="objName">data</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0400
     * @tc.name testAnchor004
     * @tc.desc Verify scientific notation string as anchor name is preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = 'test';
      let result: string = text.anchor('1e3');
      expect(result).assertEqual('<a name="1e3">test</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0500
     * @tc.name testAnchor005
     * @tc.desc Verify both name and content containing emoji do not interfere with each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text: string = '🎉party🎉';
      let result: string = text.anchor('⭐section⭐');
      expect(result).assertEqual('<a name="⭐section⭐">🎉party🎉</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0600
     * @tc.name testAnchor006
     * @tc.desc Verify anchor name with RTL direction marks and LTR Latin preserves attribute value order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'item'.anchor('ar‎‏en');
      expect(result).assertEqual('<a name="ar‎‏en">item</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0700
     * @tc.name testAnchor007
     * @tc.desc Verify anchor().link() chain forms outer link wrapping inner anchor with both name and href
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'dual'.anchor('top').link('#top');
      expect(result).assertEqual('<a href="#top"><a name="top">dual</a></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0800
     * @tc.name testAnchor008
     * @tc.desc Verify anchor name composed of 100 repeated emoji characters is not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longEmoji: string = '🌟'.repeat(100);
      let result: string = 'long'.anchor(longEmoji);
      expect(result).assertEqual('<a name="' + longEmoji + '">long</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_0900
     * @tc.name testAnchor009
     * @tc.desc Verify dynamically constructed name and content variables produce correct anchor tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix: string = 'section-';
      let id: number = 42;
      let dynamicName: string = prefix + id.toString();
      let dynamicContent: string = 'Content ' + id.toString();
      let result: string = dynamicContent.anchor(dynamicName);
      expect(result).assertEqual('<a name="section-42">Content 42</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1000
     * @tc.name testAnchor010
     * @tc.desc Verify anchor with name containing tag-closing substring still produces structurally valid closing </a>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'x"></a><script>alert(1)</script><a name="y';
      let result: string = 'content'.anchor(name);
      expect(result).assertEqual('<a name="x"></a><script>alert(1)</script><a name="y">content</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1100
     * @tc.name testAnchor011
     * @tc.desc Verify anchor with tag-breaking name then link forms valid double-nested a-tag structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = '</a><script>alert(1)</script>';
      let result: string = 'x'.anchor(name).link('#s');
      expect(result).assertEqual('<a href="#s"><a name="</a><script>alert(1)</script>">x</a></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1200
     * @tc.name testAnchor012
     * @tc.desc Verify anchor on empty string produces empty anchor tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.anchor('name');
      expect(result).assertEqual('<a name="name"></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1300
     * @tc.name testAnchor013
     * @tc.desc Verify anchor on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'section';
      let result: string = str.anchor('top');
      expect(result).assertEqual('<a name="top">section</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1400
     * @tc.name testAnchor014
     * @tc.desc Verify String instance anchor returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.anchor('name');
      expect(result).assertEqual('<a name="name">test</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1500
     * @tc.name testAnchor015
     * @tc.desc Verify anchor post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().anchor('x');
      expect(result).assertEqual('<a name="x">hello</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1600
     * @tc.name testAnchor016
     * @tc.desc Verify anchor does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      expect(str).assertEqual('hello');
      expect(str.anchor('x')).assertEqual('<a name="x">hello</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1700
     * @tc.name testAnchor017
     * @tc.desc Verify anchor on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.anchor('emoji');
      expect(result).assertEqual('<a name="emoji">😀</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1800
     * @tc.name testAnchor018
     * @tc.desc Verify anchor with expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('he' + 'llo').anchor('x');
      expect(result).assertEqual('<a name="x">hello</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ANCHOR2_1900
     * @tc.name testAnchor019
     * @tc.desc Verify anchor on long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnchor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.repeat(50).anchor('id');
      expect(result).assertEqual('<a name="id">' + 'x'.repeat(50) + '</a>');
    });
  });
}