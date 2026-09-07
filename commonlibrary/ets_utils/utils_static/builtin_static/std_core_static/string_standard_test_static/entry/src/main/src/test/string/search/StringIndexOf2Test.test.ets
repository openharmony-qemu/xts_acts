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

function getStr(): string {
  return 'Hello World';
}

function findIdx<T extends string>(s: T, sub: string): int {
  return s.indexOf(sub);
}

function getText<T extends string>(t: T): T {
  return t;
}

export default function StringIndexOf2Test(): void {
  describe('StringIndexOf2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0100
     * @tc.name testIndexOf001
     * @tc.desc Verify new String wrapper instance and literal have consistent indexOf behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: String = new String('ArkTS ArkTS');
      let s2: string = 'ArkTS ArkTS';
      expect(s1.indexOf('Ark')).assertEqual(s2.indexOf('Ark'));
      expect(s1.indexOf('Ark')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0200
     * @tc.name testIndexOf002
     * @tc.desc Verify function-returned string can chain-call indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStr().indexOf('World')).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0300
     * @tc.name testIndexOf003
     * @tc.desc Verify const and let declared strings have identical indexOf behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: string = 'ArkTS ArkTS';
      let l: string = 'ArkTS ArkTS';
      expect(c.indexOf('Ark')).assertEqual(l.indexOf('Ark'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0400
     * @tc.name testIndexOf004
     * @tc.desc Verify indexOf searches emoji substring in emoji-containing string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello🌍World🌍!';
      expect(str.indexOf('🌍')).assertEqual(5);
      expect(str.indexOf('🌍', 6)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0500
     * @tc.name testIndexOf005
     * @tc.desc Verify indexOf searches control characters null (U+0000), backspace (U+0008), form feed (U+000C) in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'start\0middle\bend\f';
      expect(str.indexOf('\0')).assertEqual(5);
      expect(str.indexOf('\b')).assertEqual(12);
      expect(str.indexOf('\f')).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0600
     * @tc.name testIndexOf006
     * @tc.desc Verify indexOf distinguishes non-breaking space from regular space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello World';
      expect(str.indexOf(' ')).assertEqual(5);
      expect(str.indexOf(' ')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0700
     * @tc.name testIndexOf007
     * @tc.desc Verify indexOf searches in mixed English-Chinese-emoji-newline text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hi你好😀\nWorld世界';
      expect(str.indexOf('😀')).assertEqual(4);
      expect(str.indexOf('\n')).assertEqual(6);
      expect(str.indexOf('世界')).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0800
     * @tc.name testIndexOf008
     * @tc.desc Verify indexOf with null/undefined cast to string throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let str: string = 'abcnullxyz';
        expect(str.indexOf(null as string)).assertEqual(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        let str2: string = 'abcundefinedxyz';
        expect(str2.indexOf(undefined as string)).assertEqual(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_0900
     * @tc.name testIndexOf009
     * @tc.desc Verify indexOf fromIndex 0 returns first match and large fromIndex 99 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS ArkTS';
      let r1: number = str.indexOf('Ark', 0);
      expect(r1).assertEqual(0);
      let r2: number = str.indexOf('Ark', 99);
      expect(r2).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1000
     * @tc.name testIndexOf010
     * @tc.desc Verify indexOf with positive fromIndex values returns correct positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcabc';
      let r1: number = str.indexOf('abc', 1);
      expect(r1).assertEqual(3);
      let r2: number = str.indexOf('abc', 3);
      expect(r2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1100
     * @tc.name testIndexOf011
     * @tc.desc Verify indexOf with empty string and negative fromIndex returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS';
      let r: int = str.indexOf('', -1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1200
     * @tc.name testIndexOf012
     * @tc.desc Verify indexOf !== -1 is equivalent to includes() returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS ArkTS';
      expect(str.indexOf('TS') !== -1).assertEqual(str.includes('TS'));
      expect(str.indexOf('xyz') !== -1).assertEqual(str.includes('xyz'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1300
     * @tc.name testIndexOf013
     * @tc.desc Verify indexOf and search return same position for plain string without regex metacharacters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello world';
      expect(str.indexOf('world')).assertEqual(str.search('world'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1400
     * @tc.name testIndexOf014
     * @tc.desc Verify generic function with T extends string constraint calls indexOf correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(findIdx('ArkTS ArkTS', 'Ark')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1500
     * @tc.name testIndexOf015
     * @tc.desc Verify string from generic variable can call indexOf normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getText('ArkTS ArkTS');
      expect(result.indexOf('TS')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1600
     * @tc.name testIndexOf016
     * @tc.desc Verify indexOf result can be used in chained arithmetic and charAt verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ArkTS ArkTS';
      let pos: int = str.indexOf('Ark') + 3;
      expect(str.charAt(pos).toString()).assertEqual('T');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1700
     * @tc.name testIndexOf017
     * @tc.desc Verify indexOf, search, and match three-way consistency for the same substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello World ArkTS';
      expect(str.indexOf('World')).assertEqual(6);
      expect(str.search('World')).assertEqual(6);
      let m: RegExpMatchArray | null = str.match('World');
      expect(m).not().assertNull();
      expect(m!.index).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1800
     * @tc.name testIndexOf018
     * @tc.desc Verify indexOf result plus search length equals string length when substring is at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'Hello ArkTS';
      let idx: int = str.indexOf('ArkTS');
      expect(idx + 'ArkTS'.length).assertEqual(str.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_1900
     * @tc.name testIndexOf019
     * @tc.desc Verify indexOf fromIndex at MAX_INT 2147483647 returns -1 since fromIndex exceeds string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcabc';
      let r: int = str.indexOf('abc', 2147483647);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2000
     * @tc.name testIndexOf020
     * @tc.desc Verify indexOf fromIndex at MIN_INT -2147483648 coerces to 0 and searches from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abcabc';
      let r: int = str.indexOf('abc', -2147483648);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2100
     * @tc.name testIndexOf021
     * @tc.desc Verify indexOf on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world';
      let result: number = str.indexOf('world');
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2200
     * @tc.name testIndexOf022
     * @tc.desc Verify indexOf on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('hello world');
      let result: number = str.indexOf('hello');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2300
     * @tc.name testIndexOf023
     * @tc.desc Verify indexOf does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let before: string = str;
      str.indexOf('hello');
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2400
     * @tc.name testIndexOf024
     * @tc.desc Verify indexOf with empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: number = str.indexOf('');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2500
     * @tc.name testIndexOf025
     * @tc.desc Verify indexOf with string number type coerced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc123';
      let result: number = str.indexOf('123');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2600
     * @tc.name testIndexOf026
     * @tc.desc Verify indexOf on emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀🎉😀';
      let result: number = str.indexOf('🎉');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2700
     * @tc.name testIndexOf027
     * @tc.desc Verify indexOf with position beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: number = str.indexOf('o', 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2800
     * @tc.name testIndexOf028
     * @tc.desc Verify indexOf with negative position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: number = str.indexOf('o', -5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_2900
     * @tc.name testIndexOf029
     * @tc.desc Verify indexOf on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = ('he' + 'llo').indexOf('l');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_3000
     * @tc.name testIndexOf030
     * @tc.desc Verify indexOf typeof number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      expect(str.indexOf('test')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_3100
     * @tc.name testIndexOf031
     * @tc.desc Verify indexOf after trim chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: number = str.trim().indexOf('h');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_INDEXOF2_3200
     * @tc.name testIndexOf032
     * @tc.desc Verify indexOf with emoji search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello😀world';
      let result: number = str.indexOf('😀');
      expect(result).assertEqual(5);
    });
  });
}