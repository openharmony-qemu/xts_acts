'use static'


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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ObjKey { name: string; value: number; }

export default function readonlyMapHasPart01TestTest(): void {
  describe('ReadonlyMapHasPart01TestTest', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0010
     * @tc.name readonlyMapHasPart01Test001
     * @tc.desc Verify has() 1 (key) key Map true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let result: boolean = map.has('a');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0020
     * @tc.name readonlyMapHasPart01Test002
     * @tc.desc Verify has() 1 (key) key Map false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let result: boolean = map.has('b');
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0030
     * @tc.name readonlyMapHasPart01Test003
     * @tc.desc Verify K=string "" key Map has("") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['', 100]]);
      expect(map.has('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0040
     * @tc.name readonlyMapHasPart01Test004
     * @tc.desc Verify K=string "" Map has("") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1]]);
      expect(map.has('')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0050
     * @tc.name readonlyMapHasPart01Test005
     * @tc.desc Verify K=string Unicode emoji " " key Map has(" ") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['😀', 42]]);
      expect(map.has('😀')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0060
     * @tc.name readonlyMapHasPart01Test006
     * @tc.desc Verify K=string Unicode emoji " " Map has(" ") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['key', 1]]);
      expect(map.has('😀')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0070
     * @tc.name readonlyMapHasPart01Test007
     * @tc.desc Verify K=string " " key Map has(" ") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['​', 99]]);
      expect(map.has('​')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0080
     * @tc.name readonlyMapHasPart01Test008
     * @tc.desc Verify K=string " " Map has(" ") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['visible', 1]]);
      expect(map.has('​')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0090
     * @tc.name readonlyMapHasPart01Test009
     * @tc.desc Verify K=string XSS "<script>alert(1)</script>" key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssKey: string = '<script>alert(1)</script>';
      const map: ReadonlyMap<string, int> = new Map<string, int>([[xssKey, 1]]);
      expect(map.has(xssKey)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0100
     * @tc.name readonlyMapHasPart01Test010
     * @tc.desc Verify K=string XSS Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let xssKey: string = '<script>alert(1)</script>';
      const map: ReadonlyMap<string, int> = new Map<string, int>([['safe', 1]]);
      expect(map.has(xssKey)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0110
     * @tc.name readonlyMapHasPart01Test011
     * @tc.desc Verify K=string (10000 ) key Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i: number = 0; i < 10000; i++) {
        longKey += 'a';
      }
      const map: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      expect(map.has(longKey)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0120
     * @tc.name readonlyMapHasPart01Test012
     * @tc.desc Verify K=string (10000 ) Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = '';
      for (let i: number = 0; i < 10000; i++) {
        longKey += 'a';
      }
      const map: ReadonlyMap<string, int> = new Map<string, int>([['short', 1]]);
      expect(map.has(longKey)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0130
     * @tc.name readonlyMapHasPart01Test013
     * @tc.desc Verify K=string "hello" key Map has("hello") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1], ['world', 2]]);
      expect(map.has('hello')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0140
     * @tc.name readonlyMapHasPart01Test014
     * @tc.desc Verify K=string "hello" Map has("world") true has("hello") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['world', 2]]);
      expect(map.has('hello')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0150
     * @tc.name readonlyMapHasPart01Test015
     * @tc.desc Verify K=string " " key Map has(" ") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['   ', 7]]);
      expect(map.has('   ')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0160
     * @tc.name readonlyMapHasPart01Test016
     * @tc.desc Verify K=string " " Map ( ) has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['  ', 1]]);
      expect(map.has('   ')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0170
     * @tc.name readonlyMapHasPart01Test017
     * @tc.desc Verify K=string "123" key Map has("123") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['123', 456]]);
      expect(map.has('123')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0180
     * @tc.name readonlyMapHasPart01Test018
     * @tc.desc Verify K=string "123" Map has("123") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['abc', 1]]);
      expect(map.has('123')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0190
     * @tc.name readonlyMapHasPart01Test019
     * @tc.desc Verify K=string "\n" key Map has("\n") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['\n', 10]]);
      expect(map.has('\n')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0200
     * @tc.name readonlyMapHasPart01Test020
     * @tc.desc Verify K=string "\0" key Map has("\0") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['\0', 5]]);
      expect(map.has('\0')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0210
     * @tc.name readonlyMapHasPart01Test021
     * @tc.desc Verify K=string "Key" "key" key has("key") false "Key"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['Key', 1]]);
      expect(map.has('key')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0220
     * @tc.name readonlyMapHasPart01Test022
     * @tc.desc Verify K=string "Key" Map has("Key") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['Key', 1]]);
      expect(map.has('Key')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0230
     * @tc.name readonlyMapHasPart01Test023
     * @tc.desc Verify K=string " key" key Map has(" key") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([[' key', 3]]);
      expect(map.has(' key')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0240
     * @tc.name readonlyMapHasPart01Test024
     * @tc.desc Verify K=string " key" "key" key has("key") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([[' key', 1]]);
      expect(map.has('key')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0250
     * @tc.name readonlyMapHasPart01Test025
     * @tc.desc Verify K=string "a\0b" key Map has("a\0b") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['a\0b', 8]]);
      expect(map.has('a\0b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0260
     * @tc.name readonlyMapHasPart01Test026
     * @tc.desc Verify K=string "." key Map has(".") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['.', 99]]);
      expect(map.has('.')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0270
     * @tc.name readonlyMapHasPart01Test027
     * @tc.desc Verify K=string "true" key Map has("true") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['true', 1]]);
      expect(map.has('true')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0280
     * @tc.name readonlyMapHasPart01Test028
     * @tc.desc Verify K=string "\\\\" key Map has("\\\\") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['\\\\', 2]]);
      expect(map.has('\\\\')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0290
     * @tc.name readonlyMapHasPart01Test029
     * @tc.desc Verify K=string "\t" key Map has("\t") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['\t', 15]]);
      expect(map.has('\t')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0300
     * @tc.name readonlyMapHasPart01Test030
     * @tc.desc Verify K=string Unicode" " key Map has(" ") true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['中文', 100]]);
      expect(map.has('中文')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0310
     * @tc.name readonlyMapHasPart01Test031
     * @tc.desc Verify K=string Unicode" " Map has(" ") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>([['en', 1]]);
      expect(map.has('中文')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0320
     * @tc.name readonlyMapHasPart01Test032
     * @tc.desc Verify K=int key=0 Map has(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero']]);
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0330
     * @tc.name readonlyMapHasPart01Test033
     * @tc.desc Verify K=int key=0 Map has(0) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one']]);
      expect(map.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0340
     * @tc.name readonlyMapHasPart01Test034
     * @tc.desc Verify K=int key=1 Map has(1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one']]);
      expect(map.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0350
     * @tc.name readonlyMapHasPart01Test035
     * @tc.desc Verify K=int key=1 Map has(1) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2, 'two']]);
      expect(map.has(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0360
     * @tc.name readonlyMapHasPart01Test036
     * @tc.desc Verify K=int key=-1 Map has(-1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-1, 'negative one']]);
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0370
     * @tc.name readonlyMapHasPart01Test037
     * @tc.desc Verify K=int key=-1 Map has(-1) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero']]);
      expect(map.has(-1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0380
     * @tc.name readonlyMapHasPart01Test038
     * @tc.desc Verify K=int key=2147483647(2147483647) Map has(2147483647) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[2147483647, 'max']]);
      expect(map.has(2147483647)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0390
     * @tc.name readonlyMapHasPart01Test039
     * @tc.desc Verify K=int key=2147483647(2147483647) Map has(2147483647) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[0, 'zero']]);
      expect(map.has(2147483647)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0400
     * @tc.name readonlyMapHasPart01Test040
     * @tc.desc Verify K=int key=(-2147483647 - 1)(-2147483648) Map has(-2147483648) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[-2147483648, 'min']]);
      expect(map.has(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0410
     * @tc.name readonlyMapHasPart01Test041
     * @tc.desc Verify K=int key=(-2147483647 - 1)(-2147483648) Map has(-2147483648) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one']]);
      expect(map.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0420
     * @tc.name readonlyMapHasPart01Test042
     * @tc.desc Verify K=long key=0n Map has(0n) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(0), 'zero']]);
      expect(map.has(Int.toLong(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0430
     * @tc.name readonlyMapHasPart01Test043
     * @tc.desc Verify K=long key=0n Map has(0n) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(1), 'one']]);
      expect(map.has(Int.toLong(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0440
     * @tc.name readonlyMapHasPart01Test044
     * @tc.desc Verify K=long key=-1n Map has(-1n) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(-1), 'negative one']]);
      expect(map.has(Int.toLong(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0450
     * @tc.name readonlyMapHasPart01Test045
     * @tc.desc Verify K=long key=-1n Map has(-1n) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(0), 'zero']]);
      expect(map.has(Int.toLong(-1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0460
     * @tc.name readonlyMapHasPart01Test046
     * @tc.desc Verify K=long key=long.MAX(9223372036854775807n) Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'max']]);
      expect(map.has(9223372036854775807)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0470
     * @tc.name readonlyMapHasPart01Test047
     * @tc.desc Verify K=long key=long.MAX Map has(9223372036854775807n) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(0), 'zero']]);
      expect(map.has(9223372036854775807)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0480
     * @tc.name readonlyMapHasPart01Test048
     * @tc.desc Verify K=long key=long.MIN(-9223372036854775808n) Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[(-9223372036854775807 - 1), 'min']]);
      expect(map.has((-9223372036854775807 - 1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0490
     * @tc.name readonlyMapHasPart01Test049
     * @tc.desc Verify K=long key=long.MIN Map has(-9223372036854775808n) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<long, string> = new Map<long, string>([[Int.toLong(1), 'one']]);
      expect(map.has((-9223372036854775807 - 1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0500
     * @tc.name readonlyMapHasPart01Test050
     * @tc.desc Verify K=number key=NaN Map has(NaN) true(SameValueZero NaN )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.NaN, 'not a number']]);
      expect(map.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0510
     * @tc.name readonlyMapHasPart01Test051
     * @tc.desc Verify K=number key=NaN Map has(NaN) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[1.0, 'one']]);
      expect(map.has(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0520
     * @tc.name readonlyMapHasPart01Test052
     * @tc.desc Verify K=number key=Number.POSITIVE_INFINITY Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.POSITIVE_INFINITY, 'pos inf']]);
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0530
     * @tc.name readonlyMapHasPart01Test053
     * @tc.desc Verify K=number key=Number.POSITIVE_INFINITY Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[0.0, 'zero']]);
      expect(map.has(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0540
     * @tc.name readonlyMapHasPart01Test054
     * @tc.desc Verify K=number key=Number.NEGATIVE_INFINITY Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.NEGATIVE_INFINITY, 'neg inf']]);
      expect(map.has(Number.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0550
     * @tc.name readonlyMapHasPart01Test055
     * @tc.desc Verify K=number key=Number.NEGATIVE_INFINITY Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[1.0, 'one']]);
      expect(map.has(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0560
     * @tc.name readonlyMapHasPart01Test056
     * @tc.desc Verify K=number key=-0.0 Map has(-0.0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[-0.0, 'negative zero']]);
      expect(map.has(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0570
     * @tc.name readonlyMapHasPart01Test057
     * @tc.desc Verify K=number Map key=-0.0 has(0.0) true(SameValueZero +0 -0 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[-0.0, 'negative zero']]);
      expect(map.has(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0580
     * @tc.name readonlyMapHasPart01Test058
     * @tc.desc Verify K=number Map key=0.0 has(-0.0) true( SameValueZero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[0.0, 'positive zero']]);
      expect(map.has(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0590
     * @tc.name readonlyMapHasPart01Test059
     * @tc.desc Verify K=number key=1.5 Map has(1.5) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[1.5, 'one point five']]);
      expect(map.has(1.5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0600
     * @tc.name readonlyMapHasPart01Test060
     * @tc.desc Verify K=number key=1.5 Map has(1.5) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[2.5, 'two point five']]);
      expect(map.has(1.5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0610
     * @tc.name readonlyMapHasPart01Test061
     * @tc.desc Verify K=number key=Number.EPSILON Map has(Number.EPSILON) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<number, string> = new Map<number, string>([[Number.EPSILON, 'epsilon']]);
      expect(map.has(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0620
     * @tc.name readonlyMapHasPart01Test062
     * @tc.desc Verify K=double key=NaN Map has(NaN) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[Number.NaN, 'nan']]);
      expect(map.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0630
     * @tc.name readonlyMapHasPart01Test063
     * @tc.desc Verify K=double key=NaN Map has(NaN) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[1.0, 'one']]);
      expect(map.has(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0640
     * @tc.name readonlyMapHasPart01Test064
     * @tc.desc Verify K=double key=Infinity Map has(Infinity) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[Number.POSITIVE_INFINITY, 'inf']]);
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0650
     * @tc.name readonlyMapHasPart01Test065
     * @tc.desc Verify K=double key=-Infinity Map has(-Infinity) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[-Number.POSITIVE_INFINITY, 'neg inf']]);
      expect(map.has(-Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0660
     * @tc.name readonlyMapHasPart01Test066
     * @tc.desc Verify K=double key=-0.0 Map has(0.0) true(SameValueZero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[-0.0, 'neg zero']]);
      expect(map.has(0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0670
     * @tc.name readonlyMapHasPart01Test067
     * @tc.desc Verify K=double key=0.0 Map has(-0.0) true(SameValueZero )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[0.0, 'pos zero']]);
      expect(map.has(-0.0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0680
     * @tc.name readonlyMapHasPart01Test068
     * @tc.desc Verify K=double key=1.7976931348623157e308(MAX_VALUE) Map has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[1.7976931348623157e308, 'max']]);
      expect(map.has(1.7976931348623157e308)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0690
     * @tc.name readonlyMapHasPart01Test069
     * @tc.desc Verify K=double key=Number.EPSILON Map has(Number.EPSILON) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<double, string> = new Map<double, string>([[Number.EPSILON, 'epsilon']]);
      expect(map.has(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0700
     * @tc.name readonlyMapHasPart01Test070
     * @tc.desc Verify K=byte key=127(byte.MAX) Map has(127) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[127, 'max']]);
      expect(map.has(127)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0710
     * @tc.name readonlyMapHasPart01Test071
     * @tc.desc Verify K=byte key=127 Map has(127) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[0, 'zero']]);
      expect(map.has(127)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0720
     * @tc.name readonlyMapHasPart01Test072
     * @tc.desc Verify K=byte key=-128(byte.MIN) Map has(-128) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[-128, 'min']]);
      expect(map.has(-128)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0730
     * @tc.name readonlyMapHasPart01Test073
     * @tc.desc Verify K=byte key=-128 Map has(-128) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[1, 'one']]);
      expect(map.has(-128)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0740
     * @tc.name readonlyMapHasPart01Test074
     * @tc.desc Verify K=byte key=0 Map has(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<byte, string> = new Map<byte, string>([[0, 'zero']]);
      expect(map.has(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0750
     * @tc.name readonlyMapHasPart01Test075
     * @tc.desc Verify K=short key=32767(short.MAX) Map has(32767) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[32767, 'max']]);
      expect(map.has(32767)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0760
     * @tc.name readonlyMapHasPart01Test076
     * @tc.desc Verify K=short key=32767 Map has(32767) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[0, 'zero']]);
      expect(map.has(32767)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0770
     * @tc.name readonlyMapHasPart01Test077
     * @tc.desc Verify K=short key=-32768(short.MIN) Map has(-32768) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[-32768, 'min']]);
      expect(map.has(-32768)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0780
     * @tc.name readonlyMapHasPart01Test078
     * @tc.desc Verify K=short key=-32768 Map has(-32768) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[1, 'one']]);
      expect(map.has(-32768)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0790
     * @tc.name readonlyMapHasPart01Test079
     * @tc.desc Verify K=short key=-1 Map has(-1) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<short, string> = new Map<short, string>([[-1, 'neg one']]);
      expect(map.has(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0800
     * @tc.name readonlyMapHasPart01Test080
     * @tc.desc Verify K=float key=NaN Map has(NaN) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Float.NaN, 'nan']]);
      expect(map.has(Float.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0810
     * @tc.name readonlyMapHasPart01Test081
     * @tc.desc Verify K=float key=Infinity Map has(Infinity) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Float.POSITIVE_INFINITY, 'inf']]);
      expect(map.has(Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0820
     * @tc.name readonlyMapHasPart01Test082
     * @tc.desc Verify K=float key=-Infinity Map has(-Infinity) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[-Float.POSITIVE_INFINITY, 'neg inf']]);
      expect(map.has(-Float.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0830
     * @tc.name readonlyMapHasPart01Test083
     * @tc.desc Verify K=float key=-0.0 Map has(0.0) true(SameValueZero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Double.toFloat(-0.0), 'neg zero']]);
      expect(map.has(Double.toFloat(0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0840
     * @tc.name readonlyMapHasPart01Test084
     * @tc.desc Verify K=float 3.14 Map has(3.14) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<float, string> = new Map<float, string>([[Double.toFloat(3.14), 'pi']]);
      expect(map.has(Double.toFloat(3.14))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0850
     * @tc.name readonlyMapHasPart01Test085
     * @tc.desc Verify K=boolean key=true Map has(true) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'true val']]);
      expect(map.has(true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0860
     * @tc.name readonlyMapHasPart01Test086
     * @tc.desc Verify K=boolean key=true Map ( false) has(true) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[false, 'false val']]);
      expect(map.has(true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0870
     * @tc.name readonlyMapHasPart01Test087
     * @tc.desc Verify K=boolean key=false Map has(false) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[false, 'false val']]);
      expect(map.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0880
     * @tc.name readonlyMapHasPart01Test088
     * @tc.desc Verify K=boolean key=false Map ( true) has(false) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'true val']]);
      expect(map.has(false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0890
     * @tc.name readonlyMapHasPart01Test089
     * @tc.desc Verify K=boolean Map true false has(true) true( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 't'], [false, 'f']]);
      expect(map.has(true)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0900
     * @tc.name readonlyMapHasPart01Test090
     * @tc.desc Verify K=boolean Map true false has(false) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 't'], [false, 'f']]);
      expect(map.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0910
     * @tc.name readonlyMapHasPart01Test091
     * @tc.desc Verify K=Date Date key has(sameRef) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d, 'date val']]);
      expect(map.has(d)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0920
     * @tc.name readonlyMapHasPart01Test092
     * @tc.desc Verify K=Date Date has(differentRef) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(1000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d1, 'date val']]);
      expect(map.has(d2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0930
     * @tc.name readonlyMapHasPart01Test093
     * @tc.desc Verify K=Date Date Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(2000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d1, 'date val']]);
      expect(map.has(d2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0940
     * @tc.name readonlyMapHasPart01Test094
     * @tc.desc Verify K=Date Date key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1000);
      let d2: Date = new Date(1000);
      const map: ReadonlyMap<Date, string> = new Map<Date, string>([[d1, 'first'], [d2, 'second']]);
      expect(map.has(d1)).assertTrue();
      expect(map.has(d2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0950
     * @tc.name readonlyMapHasPart01Test095
     * @tc.desc Verify K=Date Map has(new Date(0)) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<Date, string> = new Map<Date, string>();
      expect(map.has(new Date(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0960
     * @tc.name readonlyMapHasPart01Test096
     * @tc.desc Verify K=RegExp RegExp key has(sameRef) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('abc', 'g');
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[r, 'regex val']]);
      expect(map.has(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0970
     * @tc.name readonlyMapHasPart01Test097
     * @tc.desc Verify K=RegExp pattern RegExp has(differentRef) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[r1, 'regex val']]);
      expect(map.has(r2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0980
     * @tc.name readonlyMapHasPart01Test098
     * @tc.desc Verify K=RegExp pattern RegExp Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('def', 'i');
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[r1, 'regex val']]);
      expect(map.has(r2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_0990
     * @tc.name readonlyMapHasPart01Test099
     * @tc.desc Verify K=RegExp pattern flags RegExp has(differentFlags) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'i');
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[r1, 'global']]);
      expect(map.has(r2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1000
     * @tc.name readonlyMapHasPart01Test100
     * @tc.desc Verify K=RegExp Map has(new RegExp("x", "")) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<RegExp, string> = new Map<RegExp, string>();
      expect(map.has(new RegExp('x', ''))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1010
     * @tc.name readonlyMapHasPart01Test101
     * @tc.desc Verify K=object key has(sameRef) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ObjKey = { name: 'a', value: 1 };
      const map: ReadonlyMap<ObjKey, string> = new Map<ObjKey, string>([[obj, 'obj val']]);
      expect(map.has(obj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1020
     * @tc.name readonlyMapHasPart01Test102
     * @tc.desc Verify K=object has(differentRef) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: ObjKey = { name: 'a', value: 1 };
      let obj2: ObjKey = { name: 'a', value: 1 };
      const map: ReadonlyMap<ObjKey, string> = new Map<ObjKey, string>([[obj1, 'obj val']]);
      expect(map.has(obj2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1030
     * @tc.name readonlyMapHasPart01Test103
     * @tc.desc Verify K=object Map has false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: ObjKey = { name: 'a', value: 1 };
      let obj2: ObjKey = { name: 'b', value: 2 };
      const map: ReadonlyMap<ObjKey, string> = new Map<ObjKey, string>([[obj1, 'obj val']]);
      expect(map.has(obj2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1040
     * @tc.name readonlyMapHasPart01Test104
     * @tc.desc Verify K=object object key has true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: ObjKey = { name: 'a', value: 1 };
      let obj2: ObjKey = { name: 'a', value: 1 };
      const map: ReadonlyMap<ObjKey, string> = new Map<ObjKey, string>([[obj1, 'first'], [obj2, 'second']]);
      expect(map.has(obj1)).assertTrue();
      expect(map.has(obj2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1050
     * @tc.name readonlyMapHasPart01Test105
     * @tc.desc Verify K=object Map has( ) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ObjKey = { name: 'x', value: 0 };
      const map: ReadonlyMap<ObjKey, string> = new Map<ObjKey, string>();
      expect(map.has(obj)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1060
     * @tc.name readonlyMapHasPart01Test106
     * @tc.desc Verify K=object has false( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1: ObjKey = { name: 'same', value: 100 };
      let obj2: ObjKey = { name: 'same', value: 200 };
      const map: ReadonlyMap<ObjKey, string> = new Map<ObjKey, string>([[obj1, 'first']]);
      expect(map.has(obj2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1070
     * @tc.name readonlyMapHasPart01Test107
     * @tc.desc Verify K=string Map has("any") false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<string, int> = new Map<string, int>();
      expect(map.has('any')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1080
     * @tc.name readonlyMapHasPart01Test108
     * @tc.desc Verify K=int Map has(0) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>();
      expect(map.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_HAS_PART01_TEST_1090
     * @tc.name readonlyMapHasPart01Test109
     * @tc.desc Verify K=int Map has(2147483647) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapHasPart01Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, string> = new Map<int, string>();
      expect(map.has(2147483647)).assertFalse();
    });

  });
}
