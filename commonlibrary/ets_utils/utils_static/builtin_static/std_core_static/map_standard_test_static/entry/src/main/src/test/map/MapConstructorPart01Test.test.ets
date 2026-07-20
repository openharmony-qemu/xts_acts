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

interface KeyObj { id: int; }
interface ValObj { name: string; }

export default function mapConstructorPart01TestTest(): void {
  describe('MapConstructorPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0100
     * @tc.name mapConstructorPart01Test001
     * @tc.desc Verify Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0200
     * @tc.name mapConstructorPart01Test002
     * @tc.desc Verify entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0300
     * @tc.name mapConstructorPart01Test003
     * @tc.desc Verify entries=null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(null);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0400
     * @tc.name mapConstructorPart01Test004
     * @tc.desc Verify entries=null set get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(null);
      map.set('key', 100);
      expect(map.get('key')).assertEqual(100);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0500
     * @tc.name mapConstructorPart01Test005
     * @tc.desc Verify entries=null, has key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(null);
      expect(map.has('any')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0600
     * @tc.name mapConstructorPart01Test006
     * @tc.desc Verify entries=, Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[string, int]> = [];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0700
     * @tc.name mapConstructorPart01Test007
     * @tc.desc Verify entries=, Map size=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>();
      const map: Map<string, int> = new Map<string, int>(source.entries());
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0800
     * @tc.name mapConstructorPart01Test008
     * @tc.desc Verify entries null, null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: (([string, int]) | null)[] = [['a', 1], null, ['b', 2]];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_0900
     * @tc.name mapConstructorPart01Test009
     * @tc.desc Verify entries undefined, undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: (([string, int]) | undefined)[] = [['a', 1], undefined, ['b', 2]];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1000
     * @tc.name mapConstructorPart01Test010
     * @tc.desc Verify entries null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: (([string, int]) | null)[] = [null, null];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1100
     * @tc.name mapConstructorPart01Test011
     * @tc.desc Verify entries undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: (([string, int]) | undefined)[] = [undefined, undefined];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1200
     * @tc.name mapConstructorPart01Test012
     * @tc.desc Verify K=string, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['hello', 42]]);
      expect(map.get('hello')).assertEqual(42);
    });
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1300
     * @tc.name mapConstructorPart01Test013
     * @tc.desc Verify K=string "", get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['', 99]]);
      expect(map.get('')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1400
     * @tc.name mapConstructorPart01Test014
     * @tc.desc Verify K=string Unicode emoji, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['😀', 1]]);
      expect(map.get('😀')).assertEqual(1);
    }); 

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1500
     * @tc.name mapConstructorPart01Test015
     * @tc.desc Verify K=string, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['​', 5]]);
      expect(map.get('​')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1600
     * @tc.name mapConstructorPart01Test016
     * @tc.desc Verify K=string XSS, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['<script>alert(1)</script>', 7]]);
      expect(map.get('<script>alert(1)</script>')).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1700
     * @tc.name mapConstructorPart01Test017
     * @tc.desc Verify K=string (10000 ), get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'x'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>([[longKey, 888]]);
      expect(map.get(longKey)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1800
     * @tc.name mapConstructorPart01Test018
     * @tc.desc Verify K=string, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['line1\nline2', 3]]);
      expect(map.get('line1\nline2')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_1900
     * @tc.name mapConstructorPart01Test019
     * @tc.desc Verify K=string, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['   ', 10]]);
      expect(map.get('   ')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2000
     * @tc.name mapConstructorPart01Test020
     * @tc.desc Verify K=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map2: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20], ['z', 30]]);
      expect(map2.get('x')).assertEqual(10);
      expect(map2.get('y')).assertEqual(20);
      expect(map2.get('z')).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2100
     * @tc.name mapConstructorPart01Test021
     * @tc.desc Verify K=int 0, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[0, 'zero']]);
      expect(map.get(0)).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2200
     * @tc.name mapConstructorPart01Test022
     * @tc.desc Verify K=int 1, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, 'one']]);
      expect(map.get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2300
     * @tc.name mapConstructorPart01Test023
     * @tc.desc Verify K=int -1, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[-1, 'minus one']]);
      expect(map.get(-1)).assertEqual('minus one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2400
     * @tc.name mapConstructorPart01Test024
     * @tc.desc Verify K=int MAX, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>([[2147483647, 100]]);
      expect(map.get(2147483647)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2500
     * @tc.name mapConstructorPart01Test025
     * @tc.desc Verify K=int MIN, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>([[-2147483648, 200]]);
      expect(map.get(-2147483648)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2600
     * @tc.name mapConstructorPart01Test026
     * @tc.desc Verify K=boolean true, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>([[true, 'yes']]);
      expect(map.get(true)).assertEqual('yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2700
     * @tc.name mapConstructorPart01Test027
     * @tc.desc Verify K=boolean false, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>([[false, 'no']]);
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2800
     * @tc.name mapConstructorPart01Test028
     * @tc.desc Verify K=boolean true false Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      expect(map.get(true)).assertEqual(1);
      expect(map.get(false)).assertEqual(0);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_2900
     * @tc.name mapConstructorPart01Test029
     * @tc.desc Verify K=long, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>([[Int.toLong(100), 'hundred']]);
      expect(map.get(Int.toLong(100))).assertEqual('hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3000
     * @tc.name mapConstructorPart01Test030
     * @tc.desc Verify K=long MAX, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>([[9223372036854775807, 1]]);
      expect(map.get(9223372036854775807)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3100
     * @tc.name mapConstructorPart01Test031
     * @tc.desc Verify K=long MIN, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>([[(-9223372036854775807 - 1), -1]]);
      expect(map.get((-9223372036854775807 - 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3200
     * @tc.name mapConstructorPart01Test032
     * @tc.desc Verify K=Date, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2026, 0, 1);
      const map: Map<Date, string> = new Map<Date, string>([[d, 'new year']]);
      expect(map.get(d)).assertEqual('new year');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3300
     * @tc.name mapConstructorPart01Test033
     * @tc.desc Verify K=Date, equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2026, 6, 8);
      const d2: Date = new Date(2026, 6, 8);
      const map: Map<Date, string> = new Map<Date, string>([[d1, 'first']]);
      const result: string | undefined = map.get(d2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3400
     * @tc.name mapConstructorPart01Test034
     * @tc.desc Verify K=Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2026, 0, 1);
      const d2: Date = new Date(2026, 5, 1);
      const map: Map<Date, string> = new Map<Date, string>([[d1, 'jan'], [d2, 'jun']]);
      expect(map.size).assertEqual(2);
      expect(map.get(d1)).assertEqual('jan');
      expect(map.get(d2)).assertEqual('jun');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3500
     * @tc.name mapConstructorPart01Test035
     * @tc.desc Verify K=RegExp, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('abc', 'g');
      const map: Map<RegExp, string> = new Map<RegExp, string>([[re, 'pattern abc']]);
      expect(map.get(re)).assertEqual('pattern abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3600
     * @tc.name mapConstructorPart01Test036
     * @tc.desc Verify K=RegExp pattern, equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re1: RegExp = new RegExp('xyz', 'i');
      const re2: RegExp = new RegExp('xyz', 'i');
      const map: Map<RegExp, string> = new Map<RegExp, string>([[re1, 'matched']]);
      const result: string | undefined = map.get(re2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3700
     * @tc.name mapConstructorPart01Test037
     * @tc.desc Verify K=object, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: KeyObj = { id: 1 };
      const map: Map<KeyObj, string> = new Map<KeyObj, string>([[key, 'val1']]);
      expect(map.get(key)).assertEqual('val1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3800
     * @tc.name mapConstructorPart01Test038
     * @tc.desc Verify K=object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const k1: KeyObj = { id: 100 };
      const k2: KeyObj = { id: 100 };
      const map: Map<KeyObj, string> = new Map<KeyObj, string>([[k1, 'first']]);
      expect(map.get(k1)).assertEqual('first');
      expect(map.has(k2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_3900
     * @tc.name mapConstructorPart01Test039
     * @tc.desc Verify V=null, get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>([['key', null]]);
      expect(map.get('key')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4000
     * @tc.name mapConstructorPart01Test040
     * @tc.desc Verify V=null, has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>([['a', null]]);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4100
     * @tc.name mapConstructorPart01Test041
     * @tc.desc Verify V=null, null key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>([['exists', null]]);
      expect(map.get('exists')).assertNull();
      expect(map.get('notexist')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4200
     * @tc.name mapConstructorPart01Test042
     * @tc.desc Verify V=undefined, get undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>([['key', undefined]]);
      expect(map.has('key')).assertTrue();
      expect(map.get('key')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4300
     * @tc.name mapConstructorPart01Test043
     * @tc.desc Verify V=undefined, has key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | undefined> = new Map<string, string | undefined>([['a', undefined]]);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4400
     * @tc.name mapConstructorPart01Test044
     * @tc.desc Verify V=Date, get Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2026, 0, 1);
      const map: Map<string, Date> = new Map<string, Date>([['date', d]]);
      expect(map.has('date')).assertTrue();
      expect(map.get('date')).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4500
     * @tc.name mapConstructorPart01Test045
     * @tc.desc Verify V=Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(2026, 6, 8);
      const d2: Date = new Date(2026, 6, 8);
      const map: Map<string, Date> = new Map<string, Date>([['a', d1], ['b', d2]]);
      expect(map.get('a')).assertEqual(d1);
      expect(map.get('b')).assertEqual(d2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4600
     * @tc.name mapConstructorPart01Test046
     * @tc.desc Verify V=object, get object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: ValObj = { name: 'test' };
      const map: Map<string, ValObj> = new Map<string, ValObj>([['obj', v]]);
      expect(map.has('obj')).assertTrue();
      expect(map.get('obj')).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4700
     * @tc.name mapConstructorPart01Test047
     * @tc.desc Verify V=object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1: ValObj = { name: 'alpha' };
      const v2: ValObj = { name: 'alpha' };
      const map: Map<string, ValObj> = new Map<string, ValObj>([['k1', v1], ['k2', v2]]);
      expect(map.get('k1')).assertEqual(v1);
      expect(map.get('k2')).assertEqual(v2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4800
     * @tc.name mapConstructorPart01Test048
     * @tc.desc Verify entries=Map.entries(), size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const map: Map<string, int> = new Map<string, int>(source.entries());
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_4900
     * @tc.name mapConstructorPart01Test049
     * @tc.desc Verify entries=Map.entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const map: Map<string, int> = new Map<string, int>(source.entries());
      expect(map.get('x')).assertEqual(10);
      expect(map.get('y')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5000
     * @tc.name mapConstructorPart01Test050
     * @tc.desc Verify entries=Map.entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['x', 10]]);
      const map: Map<string, int> = new Map<string, int>(source.entries());
      map.set('x', 999);
      expect(source.get('x')).assertEqual(10);
      expect(map.get('x')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5100
     * @tc.name mapConstructorPart01Test051
     * @tc.desc Verify string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 99]]);
      expect(map.get('a')).assertEqual(99);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5200
     * @tc.name mapConstructorPart01Test052
     * @tc.desc Verify int key, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[1, 'first'], [1, 'second']]);
      expect(map.get(1)).assertEqual('second');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5300
     * @tc.name mapConstructorPart01Test053
     * @tc.desc Verify entries key, size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['x', 1], ['x', 2], ['x', 3]]);
      expect(map.size).assertEqual(1);
      expect(map.get('x')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5400
     * @tc.name mapConstructorPart01Test054
     * @tc.desc Verify key, key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['dup', 1], ['mid', 5], ['dup', 10]]);
      expect(map.size).assertEqual(2);
      expect(map.get('dup')).assertEqual(10);
      expect(map.get('mid')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5500
     * @tc.name mapConstructorPart01Test055
     * @tc.desc Verify keys iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['a', 3]]);
      const keys: string[] = [];
      const iter: IterableIterator<string> = map.keys();
      let result: IteratorResult<string> = iter.next();
      while (!result.done) {
        keys.push(result.value!);
        result = iter.next();
      }
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5600
     * @tc.name mapConstructorPart01Test056
     * @tc.desc Verify Map instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(map instanceof Map).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5700
     * @tc.name mapConstructorPart01Test057
     * @tc.desc Verify size == 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5800
     * @tc.name mapConstructorPart01Test058
     * @tc.desc Verify get() key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['target', 777]]);
      expect(map.get('target')).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_5900
     * @tc.name mapConstructorPart01Test059
     * @tc.desc Verify get() key undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(map.get('missing')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6000
     * @tc.name mapConstructorPart01Test060
     * @tc.desc Verify has() key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['exists', 5]]);
      expect(map.has('exists')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6100
     * @tc.name mapConstructorPart01Test061
     * @tc.desc Verify has() key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(map.has('ghost')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6200
     * @tc.name mapConstructorPart01Test062
     * @tc.desc Verify keys() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['k1', 10], ['k2', 20]]);
      const iter: IterableIterator<string> = map.keys();
      expect(iter.next().value!).assertEqual('k1');
      expect(iter.next().value!).assertEqual('k2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6300
     * @tc.name mapConstructorPart01Test063
     * @tc.desc Verify values() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 100], ['b', 200]]);
      const iter: IterableIterator<int> = map.values();
      expect(iter.next().value!).assertEqual(100);
      expect(iter.next().value!).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6400
     * @tc.name mapConstructorPart01Test064
     * @tc.desc Verify entries iterator == 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const first: IteratorResult<[string, int]> = iter.next();
      expect(first.value![0]).assertEqual('a');
      expect(first.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6500
     * @tc.name mapConstructorPart01Test065
     * @tc.desc Verify forEach size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      map.forEach((value: int, key: string): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6600
     * @tc.name mapConstructorPart01Test066
     * @tc.desc Verify forEach (value, key)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = [];
      const values: int[] = [];
      const map: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      map.forEach((value: int, key: string): void => {
        keys.push(key);
        values.push(value);
      });
      expect(keys[0]).assertEqual('x');
      expect(values[0]).assertEqual(10);
      expect(keys[1]).assertEqual('y');
      expect(values[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6700
     * @tc.name mapConstructorPart01Test067
     * @tc.desc Verify keys iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      const iter: IterableIterator<string> = map.keys();
      expect(iter.next().value!).assertEqual('first');
      expect(iter.next().value!).assertEqual('second');
      expect(iter.next().value!).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6800
     * @tc.name mapConstructorPart01Test068
     * @tc.desc Verify values iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 10], ['b', 20], ['c', 30]]);
      const iter: IterableIterator<int> = map.values();
      expect(iter.next().value!).assertEqual(10);
      expect(iter.next().value!).assertEqual(20);
      expect(iter.next().value!).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_6900
     * @tc.name mapConstructorPart01Test069
     * @tc.desc Verify entries iterator == 'p'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['p', 1], ['q', 2]]);
      const iter: IterableIterator<[string, int]> = map.entries();
      const r1: IteratorResult<[string, int]> = iter.next();
      expect(r1.value![0]).assertEqual('p');
      const r2: IteratorResult<[string, int]> = iter.next();
      expect(r2.value![0]).assertEqual('q');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7000
     * @tc.name mapConstructorPart01Test070
     * @tc.desc Verify forEach == 'z'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keys: string[] = [];
      const map: Map<string, int> = new Map<string, int>([['z', 1], ['y', 2], ['x', 3]]);
      map.forEach((value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('z');
      expect(keys[1]).assertEqual('y');
      expect(keys[2]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7100
     * @tc.name mapConstructorPart01Test071
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      try {
        map.forEach((value: int, key: string): void => {
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7200
     * @tc.name mapConstructorPart01Test072
     * @tc.desc Verify K=number, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>([[3.14, 'pi']]);
      expect(map.get(3.14)).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7300
     * @tc.name mapConstructorPart01Test073
     * @tc.desc Verify K=number NaN, NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>([[Number.NaN, 'nan_val']]);
      expect(map.get(Number.NaN)).assertEqual('nan_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7400
     * @tc.name mapConstructorPart01Test074
     * @tc.desc Verify K=number Infinity, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>([[Number.POSITIVE_INFINITY, 'inf']]);
      expect(map.get(Number.POSITIVE_INFINITY)).assertEqual('inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7500
     * @tc.name mapConstructorPart01Test075
     * @tc.desc Verify K=number -Infinity, get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>([[Number.NEGATIVE_INFINITY, 'neg_inf']]);
      expect(map.get(Number.NEGATIVE_INFINITY)).assertEqual('neg_inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7600
     * @tc.name mapConstructorPart01Test076
     * @tc.desc Verify 100 entries, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[string, int]> = [];
      for (let i: int = 0; i < 100; i++) {
        entries.push(['key' + i.toString(), i]);
      }
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(100);
      expect(map.get('key0')).assertEqual(0);
      expect(map.get('key99')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7700
     * @tc.name mapConstructorPart01Test077
     * @tc.desc Verify K=string V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['score', 95]]);
      expect(map.get('score')).assertEqual(95);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7800
     * @tc.name mapConstructorPart01Test078
     * @tc.desc Verify K=int V=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>([[404, 'not found']]);
      expect(map.get(404)).assertEqual('not found');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_7900
     * @tc.name mapConstructorPart01Test079
     * @tc.desc Verify K=boolean V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, int> = new Map<boolean, int>([[true, 1]]);
      expect(map.get(true)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8000
     * @tc.name mapConstructorPart01Test080
     * @tc.desc Verify K=int V=boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, boolean> = new Map<int, boolean>([[0, false]]);
      expect(map.get(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8100
     * @tc.name mapConstructorPart01Test081
     * @tc.desc Verify K=string V=Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(2026, 6, 1);
      const map: Map<string, Date> = new Map<string, Date>([['today', d]]);
      expect(map.get('today')).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8200
     * @tc.name mapConstructorPart01Test082
     * @tc.desc Verify K=RegExp V=int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('test', 'g');
      const map: Map<RegExp, int> = new Map<RegExp, int>([[re, 42]]);
      expect(map.get(re)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8300
     * @tc.name mapConstructorPart01Test083
     * @tc.desc Verify K=string V=null, has true get null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string | null> = new Map<string, string | null>([['empty', null]]);
      expect(map.has('empty')).assertTrue();
      expect(map.get('empty')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8400
     * @tc.name mapConstructorPart01Test084
     * @tc.desc Verify entries=, size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[string, int]> = [['r1', 10], ['r2', 20]];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.size).assertEqual(2);
      expect(map.get('r1')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8500
     * @tc.name mapConstructorPart01Test085
     * @tc.desc Verify entries= key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[string, int]> = [['dup', 1], ['dup', 2]];
      const map: Map<string, int> = new Map<string, int>(entries);
      expect(map.get('dup')).assertEqual(2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8600
     * @tc.name mapConstructorPart01Test086
     * @tc.desc Verify V=Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>([['nested', 99]]);
      const outer: Map<string, Map<string, int>> = new Map<string, Map<string, int>>([['container', inner]]);
      const retrieved: Map<string, int> | undefined = outer.get('container');
      expect(outer.has('container')).assertTrue();
      expect(retrieved!.get('nested')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART01_TEST_8700
     * @tc.name mapConstructorPart01Test087
     * @tc.desc Verify entries=Map.keys(), key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart01Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const keysIter: IterableIterator<string> = source.keys();
      const map: Map<string, int> = new Map<string, int>(source.entries());
      expect(map.size).assertEqual(2);
    });

  });
}
