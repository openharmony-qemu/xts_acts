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

interface ObjVal {
  x: int;
  y: int;
}
interface ObjVal2 {
  id: int;
}

interface ObjKey {
  id: int;
  name: string;
}

export default function mapConstructorPart02TestTest(): void {
  describe('MapConstructorPart02TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0100
     * @tc.name mapConstructorPart02Test001
     * @tc.desc Verify arity=1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0200
     * @tc.name mapConstructorPart02Test002
     * @tc.desc Verify Map size=0 Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0300
     * @tc.name mapConstructorPart02Test003
     * @tc.desc Verify Map size=1 Map size=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['x', 42]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.size).assertEqual(1);
      expect(copy.get('x')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0400
     * @tc.name mapConstructorPart02Test004
     * @tc.desc Verify Map size=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.size).assertEqual(3);
      expect(copy.get('a')).assertEqual(1);
      expect(copy.get('b')).assertEqual(2);
      expect(copy.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0500
     * @tc.name mapConstructorPart02Test005
     * @tc.desc Verify Map delete key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      src.delete('b');
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.size).assertEqual(2);
      expect(copy.has('a')).assertTrue();
      expect(copy.has('b')).assertFalse();
      expect(copy.has('c')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0600
     * @tc.name mapConstructorPart02Test006
     * @tc.desc Verify get == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['a', 99], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('a')).assertEqual(99);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0700
     * @tc.name mapConstructorPart02Test007
     * @tc.desc Verify Map entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[string, int]> = [['k1', 10], ['k2', 20]];
      const src: Map<string, int> = new Map<string, int>(entries);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('k1')).assertEqual(10);
      expect(copy.get('k2')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0800
     * @tc.name mapConstructorPart02Test008
     * @tc.desc Verify K=string ASCII key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['hello', 100]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('hello')).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_0900
     * @tc.name mapConstructorPart02Test009
     * @tc.desc Verify K=string "" key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, string> = new Map<string, string>([['', 'empty']]);
      const copy: Map<string, string> = new Map<string, string>(src);
      expect(copy.get('')).assertEqual('empty');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1000
     * @tc.name mapConstructorPart02Test010
     * @tc.desc Verify K=string Unicode emoji " " key emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['😀', 99]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('😀')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1100
     * @tc.name mapConstructorPart02Test011
     * @tc.desc Verify K=string " " key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['​', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('​')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1200
     * @tc.name mapConstructorPart02Test012
     * @tc.desc Verify K=string key(1000+ ) key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'x'.repeat(1000);
      const src: Map<string, int> = new Map<string, int>([[longKey, 5]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get(longKey)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1300
     * @tc.name mapConstructorPart02Test013
     * @tc.desc Verify K=string "<script>alert(1)</script>" key XSS key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['<script>alert(1)</script>', 7]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('<script>alert(1)</script>')).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1400
     * @tc.name mapConstructorPart02Test014
     * @tc.desc Verify K=int key=0 0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[0, 'zero']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(0)).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1500
     * @tc.name mapConstructorPart02Test015
     * @tc.desc Verify K=int key=-1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[-1, 'minus one']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(-1)).assertEqual('minus one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1600
     * @tc.name mapConstructorPart02Test016
     * @tc.desc Verify K=int key=1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[1, 'one']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1700
     * @tc.name mapConstructorPart02Test017
     * @tc.desc Verify K=int key=2147483647(2147483647) 32 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[2147483647, 'max']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(2147483647 as int)).assertEqual('max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1800
     * @tc.name mapConstructorPart02Test018
     * @tc.desc Verify K=int key=(-2147483647 - 1)(-2147483648) 32 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[-2147483648, 'min']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(-2147483648 as int)).assertEqual('min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_1900
     * @tc.name mapConstructorPart02Test019
     * @tc.desc Verify K=number key=0.0 0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<number, string> = new Map<number, string>([[0.0, 'float zero']]);
      const copy: Map<number, string> = new Map<number, string>(src);
      expect(copy.get(0.0)).assertEqual('float zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2000
     * @tc.name mapConstructorPart02Test020
     * @tc.desc Verify K=number key=NaN NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<number, string> = new Map<number, string>([[Number.NaN, 'nan val']]);
      const copy: Map<number, string> = new Map<number, string>(src);
      expect(copy.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2100
     * @tc.name mapConstructorPart02Test021
     * @tc.desc Verify K=number key=Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<number, string> = new Map<number, string>([[Number.POSITIVE_INFINITY, 'inf']]);
      const copy: Map<number, string> = new Map<number, string>(src);
      expect(copy.get(Number.POSITIVE_INFINITY)).assertEqual('inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2200
     * @tc.name mapConstructorPart02Test022
     * @tc.desc Verify K=number key=-Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<number, string> = new Map<number, string>([[Number.NEGATIVE_INFINITY, 'neg inf']]);
      const copy: Map<number, string> = new Map<number, string>(src);
      expect(copy.get(Number.NEGATIVE_INFINITY)).assertEqual('neg inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2300
     * @tc.name mapConstructorPart02Test023
     * @tc.desc Verify K=number key=Number.EPSILON key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<number, string> = new Map<number, string>([[Number.EPSILON, 'epsilon']]);
      const copy: Map<number, string> = new Map<number, string>(src);
      expect(copy.get(Number.EPSILON)).assertEqual('epsilon');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2400
     * @tc.name mapConstructorPart02Test024
     * @tc.desc Verify K=long key=0n 64 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>([[Int.toLong(0), 'zero long']]);
      const copy: Map<long, string> = new Map<long, string>(src);
      expect(copy.get(Int.toLong(0))).assertEqual('zero long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2500
     * @tc.name mapConstructorPart02Test025
     * @tc.desc Verify K=long key=1n 64 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>([[Int.toLong(1), 'one long']]);
      const copy: Map<long, string> = new Map<long, string>(src);
      expect(copy.get(Int.toLong(1))).assertEqual('one long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2600
     * @tc.name mapConstructorPart02Test026
     * @tc.desc Verify K=long key=long.MAX 64 key ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>([[9223372036854775807, 'max long']]);
      const copy: Map<long, string> = new Map<long, string>(src);
      expect(copy.get(9223372036854775807)).assertEqual('max long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2700
     * @tc.name mapConstructorPart02Test027
     * @tc.desc Verify K=long key=long.MIN 64 key ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>([[(-9223372036854775807 - 1), 'min long']]);
      const copy: Map<long, string> = new Map<long, string>(src);
      expect(copy.get((-9223372036854775807 - 1))).assertEqual('min long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2800
     * @tc.name mapConstructorPart02Test028
     * @tc.desc Verify K=long key= long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, string> = new Map<long, string>([[Int.toLong(-100), 'neg long']]);
      const copy: Map<long, string> = new Map<long, string>(src);
      expect(copy.get(Int.toLong(-100))).assertEqual('neg long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_2900
     * @tc.name mapConstructorPart02Test029
     * @tc.desc Verify K=boolean key=true true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<boolean, string> = new Map<boolean, string>([[true, 't']]);
      const copy: Map<boolean, string> = new Map<boolean, string>(src);
      expect(copy.get(true)).assertEqual('t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3000
     * @tc.name mapConstructorPart02Test030
     * @tc.desc Verify K=boolean key=false false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<boolean, string> = new Map<boolean, string>([[false, 'f']]);
      const copy: Map<boolean, string> = new Map<boolean, string>(src);
      expect(copy.get(false)).assertEqual('f');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3100
     * @tc.name mapConstructorPart02Test031
     * @tc.desc Verify K=boolean Map true false key ( 2 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<boolean, int> = new Map<boolean, int>([[true, 1], [false, 0]]);
      const copy: Map<boolean, int> = new Map<boolean, int>(src);
      expect(copy.get(true)).assertEqual(1);
      expect(copy.get(false)).assertEqual(0);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3200
     * @tc.name mapConstructorPart02Test032
     * @tc.desc Verify K=double key=0.0 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, string> = new Map<double, string>([[0.0, 'd zero']]);
      const copy: Map<double, string> = new Map<double, string>(src);
      expect(copy.get(0.0)).assertEqual('d zero');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3300
     * @tc.name mapConstructorPart02Test033
     * @tc.desc Verify K=double key=NaN NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, string> = new Map<double, string>([[Number.NaN, 'd nan']]);
      const copy: Map<double, string> = new Map<double, string>(src);
      expect(copy.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3400
     * @tc.name mapConstructorPart02Test034
     * @tc.desc Verify K=double key=Infinity key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<double, string> = new Map<double, string>([[Number.POSITIVE_INFINITY, 'd inf']]);
      const copy: Map<double, string> = new Map<double, string>(src);
      expect(copy.get(Number.POSITIVE_INFINITY)).assertEqual('d inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3500
     * @tc.name mapConstructorPart02Test035
     * @tc.desc Verify K=byte key=0 byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<byte, string> = new Map<byte, string>([[0 as byte, 'b zero']]);
      const copy: Map<byte, string> = new Map<byte, string>(src);
      expect(copy.get(0 as byte)).assertEqual('b zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3600
     * @tc.name mapConstructorPart02Test036
     * @tc.desc Verify K=byte key=127(MAX) byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<byte, string> = new Map<byte, string>([[127 as byte, 'b max']]);
      const copy: Map<byte, string> = new Map<byte, string>(src);
      expect(copy.get(127 as byte)).assertEqual('b max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3700
     * @tc.name mapConstructorPart02Test037
     * @tc.desc Verify K=byte key=-128(MIN) byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<byte, string> = new Map<byte, string>([[-128 as byte, 'b min']]);
      const copy: Map<byte, string> = new Map<byte, string>(src);
      expect(copy.get(-128 as byte)).assertEqual('b min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3800
     * @tc.name mapConstructorPart02Test038
     * @tc.desc Verify K=short key=0 short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<short, string> = new Map<short, string>([[0 as short, 's zero']]);
      const copy: Map<short, string> = new Map<short, string>(src);
      expect(copy.get(0 as short)).assertEqual('s zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_3900
     * @tc.name mapConstructorPart02Test039
     * @tc.desc Verify K=short key=32767(MAX) short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<short, string> = new Map<short, string>([[32767 as short, 's max']]);
      const copy: Map<short, string> = new Map<short, string>(src);
      expect(copy.get(32767 as short)).assertEqual('s max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4000
     * @tc.name mapConstructorPart02Test040
     * @tc.desc Verify K=short key=-32768(MIN) short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<short, string> = new Map<short, string>([[-32768 as short, 's min']]);
      const copy: Map<short, string> = new Map<short, string>(src);
      expect(copy.get(-32768 as short)).assertEqual('s min');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4100
     * @tc.name mapConstructorPart02Test041
     * @tc.desc Verify K=float key=0.0 float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<float, string> = new Map<float, string>([[Double.toFloat(0.0), 'f zero']]);
      const copy: Map<float, string> = new Map<float, string>(src);
      expect(copy.get(Double.toFloat(0.0))).assertEqual('f zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4200
     * @tc.name mapConstructorPart02Test042
     * @tc.desc Verify K=float key=NaN float NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<float, string> = new Map<float, string>([[Float.NaN, 'f nan']]);
      const copy: Map<float, string> = new Map<float, string>(src);
      expect(copy.has(Float.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4300
     * @tc.name mapConstructorPart02Test043
     * @tc.desc Verify K=char key='a' char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<char, string> = new Map<char, string>([[c'a', 'char a']]);
      const copy: Map<char, string> = new Map<char, string>(src);
      expect(copy.get(c'a')).assertEqual('char a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4400
     * @tc.name mapConstructorPart02Test044
     * @tc.desc Verify K=char key=' ' char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<char, string> = new Map<char, string>([[c'\u0000', 'null char']]);
      const copy: Map<char, string> = new Map<char, string>(src);
      expect(copy.get(c'\u0000')).assertEqual('null char');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4500
     * @tc.name mapConstructorPart02Test045
     * @tc.desc Verify K=Date Date key Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date(1700000000000);
      const src: Map<Date, string> = new Map<Date, string>([[d, 'date val']]);
      const copy: Map<Date, string> = new Map<Date, string>(src);
      expect(copy.get(d)).assertEqual('date val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4600
     * @tc.name mapConstructorPart02Test046
     * @tc.desc Verify K=Date Date key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1700000000000);
      const d2: Date = new Date(1700000000000);
      const src: Map<Date, string> = new Map<Date, string>([[d1, 'first'], [d2, 'second']]);
      const copy: Map<Date, string> = new Map<Date, string>(src);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4700
     * @tc.name mapConstructorPart02Test047
     * @tc.desc Verify K=RegExp key RegExp value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: RegExp = new RegExp('abc', 'g');
      const src: Map<RegExp, string> = new Map<RegExp, string>([[r, 'regex val']]);
      const copy: Map<RegExp, string> = new Map<RegExp, string>(src);
      expect(copy.get(r)).assertEqual('regex val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4800
     * @tc.name mapConstructorPart02Test048
     * @tc.desc Verify K=RegExp pattern RegExp key content-equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp('abc', 'g');
      const r2: RegExp = new RegExp('abc', 'g');
      const src: Map<RegExp, int> = new Map<RegExp, int>([[r1, 1], [r2, 2]]);
      const copy: Map<RegExp, int> = new Map<RegExp, int>(src);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_4900
     * @tc.name mapConstructorPart02Test049
     * @tc.desc Verify K=object interface object key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ok: ObjKey = { id: 1, name: 'alpha' } as ObjKey;
      const src: Map<ObjKey, string> = new Map<ObjKey, string>([[ok, 'obj val']]);
      const copy: Map<ObjKey, string> = new Map<ObjKey, string>(src);
      expect(copy.get(ok)).assertEqual('obj val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5000
     * @tc.name mapConstructorPart02Test050
     * @tc.desc Verify K=object object key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ok1: ObjKey = { id: 1, name: 'alpha' } as ObjKey;
      const ok2: ObjKey = { id: 1, name: 'alpha' } as ObjKey;
      const src: Map<ObjKey, int> = new Map<ObjKey, int>([[ok1, 1], [ok2, 2]]);
      const copy: Map<ObjKey, int> = new Map<ObjKey, int>(src);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5100
     * @tc.name mapConstructorPart02Test051
     * @tc.desc Verify V=string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[1, 'hello']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(1)).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5200
     * @tc.name mapConstructorPart02Test052
     * @tc.desc Verify V=int int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['k', 42]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('k')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5300
     * @tc.name mapConstructorPart02Test053
     * @tc.desc Verify V=number number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, number> = new Map<string, number>([['pi', 3.14]]);
      const copy: Map<string, number> = new Map<string, number>(src);
      expect(copy.get('pi')).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5400
     * @tc.name mapConstructorPart02Test054
     * @tc.desc Verify V=boolean boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, boolean> = new Map<string, boolean>([['flag', true]]);
      const copy: Map<string, boolean> = new Map<string, boolean>(src);
      expect(copy.get('flag')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5500
     * @tc.name mapConstructorPart02Test055
     * @tc.desc Verify V=long long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, long> = new Map<string, long>([['big', 9223372036854775807]]);
      const copy: Map<string, long> = new Map<string, long>(src);
      expect(copy.get('big')).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5600
     * @tc.name mapConstructorPart02Test056
     * @tc.desc Verify V=double double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, double> = new Map<string, double>([['d', 1.7976931348623157e+308]]);
      const copy: Map<string, double> = new Map<string, double>(src);
      expect(copy.get('d')).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5700
     * @tc.name mapConstructorPart02Test057
     * @tc.desc Verify V=byte byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, byte> = new Map<string, byte>([['b', 127 as byte]]);
      const copy: Map<string, byte> = new Map<string, byte>(src);
      expect(copy.get('b')).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5800
     * @tc.name mapConstructorPart02Test058
     * @tc.desc Verify V=short short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, short> = new Map<string, short>([['s', 32767 as short]]);
      const copy: Map<string, short> = new Map<string, short>(src);
      expect(copy.get('s')).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_5900
     * @tc.name mapConstructorPart02Test059
     * @tc.desc Verify V=float float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, float> = new Map<string, float>([['f', Float.MAX_VALUE]]);
      const copy: Map<string, float> = new Map<string, float>(src);
      expect(copy.get('f')).assertEqual(Float.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6000
     * @tc.name mapConstructorPart02Test060
     * @tc.desc Verify V=char char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, char> = new Map<string, char>([['c', c'A']]);
      const copy: Map<string, char> = new Map<string, char>(src);
      expect(copy.get('c')).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6100
     * @tc.name mapConstructorPart02Test061
     * @tc.desc Verify V=Date Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dv: Date = new Date(1700000000000);
      const src: Map<string, Date> = new Map<string, Date>([['d', dv]]);
      const copy: Map<string, Date> = new Map<string, Date>(src);
      expect(copy.get('d')).assertEqual(dv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6200
     * @tc.name mapConstructorPart02Test062
     * @tc.desc Verify V=RegExp RegExp value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rv: RegExp = new RegExp('pattern', 'g');
      const src: Map<string, RegExp> = new Map<string, RegExp>([['r', rv]]);
      const copy: Map<string, RegExp> = new Map<string, RegExp>(src);
      expect(copy.get('r')).assertEqual(rv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6300
     * @tc.name mapConstructorPart02Test063
     * @tc.desc Verify V=object object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ov: ObjVal = { x: 1, y: 2 } as ObjVal;
      const src: Map<string, ObjVal> = new Map<string, ObjVal>([['o', ov]]);
      const copy: Map<string, ObjVal> = new Map<string, ObjVal>(src);
      expect(copy.get('o')).assertEqual(ov);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6400
     * @tc.name mapConstructorPart02Test064
     * @tc.desc Verify V=null null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, string | null> = new Map<string, string | null>([['n', null]]);
      const copy: Map<string, string | null> = new Map<string, string | null>(src);
      expect(copy.get('n')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6500
     * @tc.name mapConstructorPart02Test065
     * @tc.desc Verify V=undefined undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, string | undefined> = new Map<string, string | undefined>([['u', undefined]]);
      const copy: Map<string, string | undefined> = new Map<string, string | undefined>(src);
      expect(copy.has('u')).assertTrue();
      expect(copy.get('u')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6600
     * @tc.name mapConstructorPart02Test066
     * @tc.desc Verify V=Date Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1700000000000);
      const d2: Date = new Date(1700000000000);
      const src: Map<string, Date> = new Map<string, Date>([['a', d1], ['b', d2]]);
      const copy: Map<string, Date> = new Map<string, Date>(src);
      expect(copy.get('a')).assertEqual(d1);
      expect(copy.get('b')).assertEqual(d2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6700
     * @tc.name mapConstructorPart02Test067
     * @tc.desc Verify V=object object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1: ObjVal2 = { id: 1 } as ObjVal2;
      const o2: ObjVal2 = { id: 1 } as ObjVal2;
      const src: Map<string, ObjVal2> = new Map<string, ObjVal2>([['x', o1], ['y', o2]]);
      const copy: Map<string, ObjVal2> = new Map<string, ObjVal2>(src);
      expect(copy.get('x')).assertEqual(o1);
      expect(copy.get('y')).assertEqual(o2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6800
     * @tc.name mapConstructorPart02Test068
     * @tc.desc Verify Map set() key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      src.set('a', 999);
      expect(copy.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_6900
     * @tc.name mapConstructorPart02Test069
     * @tc.desc Verify set() key Map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      copy.set('a', 999);
      expect(src.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7000
     * @tc.name mapConstructorPart02Test070
     * @tc.desc Verify Map delete() key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      src.delete('a');
      expect(copy.has('a')).assertTrue();
      expect(copy.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7100
     * @tc.name mapConstructorPart02Test071
     * @tc.desc Verify delete() key Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      copy.delete('a');
      expect(src.has('a')).assertTrue();
      expect(src.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7200
     * @tc.name mapConstructorPart02Test072
     * @tc.desc Verify Map clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      src.clear();
      expect(copy.size).assertEqual(3);
      expect(copy.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7300
     * @tc.name mapConstructorPart02Test073
     * @tc.desc Verify clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      copy.clear();
      expect(src.size).assertEqual(2);
      expect(src.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7400
     * @tc.name mapConstructorPart02Test074
     * @tc.desc Verify Map set() key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      src.set('newKey', 100);
      expect(copy.has('newKey')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7500
     * @tc.name mapConstructorPart02Test075
     * @tc.desc Verify set() key Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      copy.set('newKey', 200);
      expect(src.has('newKey')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7600
     * @tc.name mapConstructorPart02Test076
     * @tc.desc Verify for...of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['c', 3], ['a', 1], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      const srcKeys: string[] = [];
      const copyKeys: string[] = [];
      for (let e of src) {
        srcKeys.push(e[0]);
      }
      for (let e of copy) {
        copyKeys.push(e[0]);
      }
      expect(srcKeys[0]).assertEqual(copyKeys[0]);
      expect(srcKeys[1]).assertEqual(copyKeys[1]);
      expect(srcKeys[2]).assertEqual(copyKeys[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7700
     * @tc.name mapConstructorPart02Test077
     * @tc.desc Verify Map key set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      src.set('a', 99);
      src.set('c', 3);
      const copy: Map<string, int> = new Map<string, int>(src);
      const keys: string[] = [];
      for (let e of copy) {
        keys.push(e[0]);
      }
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7800
     * @tc.name mapConstructorPart02Test078
     * @tc.desc Verify (Chain copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1: Map<string, int> = new Map<string, int>([['x', 10], ['y', 20]]);
      const m2: Map<string, int> = new Map<string, int>(m1);
      const m3: Map<string, int> = new Map<string, int>(m2);
      m1.set('x', 999);
      m2.delete('y');
      expect(m3.get('x')).assertEqual(10);
      expect(m3.get('y')).assertEqual(20);
      expect(m3.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_7900
     * @tc.name mapConstructorPart02Test079
     * @tc.desc Verify instanceof Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy instanceof Map).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8000
     * @tc.name mapConstructorPart02Test080
     * @tc.desc Verify size Map size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.size).assertEqual(src.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8100
     * @tc.name mapConstructorPart02Test081
     * @tc.desc Verify size int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(typeof copy.size).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8200
     * @tc.name mapConstructorPart02Test082
     * @tc.desc Verify get() Map key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['one', 1], ['two', 2], ['three', 3]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.get('one')).assertEqual(1);
      expect(copy.get('two')).assertEqual(2);
      expect(copy.get('three')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8300
     * @tc.name mapConstructorPart02Test083
     * @tc.desc Verify has() Map key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['k1', 10], ['k2', 20]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.has('k1')).assertTrue();
      expect(copy.has('k2')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8400
     * @tc.name mapConstructorPart02Test084
     * @tc.desc Verify has() key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.has('nonexist')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8500
     * @tc.name mapConstructorPart02Test085
     * @tc.desc Verify constructor copy new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy).not().assertEqual(src as Map<string, int>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8600
     * @tc.name mapConstructorPart02Test086
     * @tc.desc Verify size == 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>([['a', 1], ['b', 2]]);
      const copy: Map<string, int> = new Map<string, int>(src);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8700
     * @tc.name mapConstructorPart02Test087
     * @tc.desc Verify K=int, V=string int string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<int, string> = new Map<int, string>([[1, 'one'], [2, 'two']]);
      const copy: Map<int, string> = new Map<int, string>(src);
      expect(copy.get(1)).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8800
     * @tc.name mapConstructorPart02Test088
     * @tc.desc Verify K=string, V=long string long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, long> = new Map<string, long>([['max', 9223372036854775807]]);
      const copy: Map<string, long> = new Map<string, long>(src);
      expect(copy.get('max')).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_8900
     * @tc.name mapConstructorPart02Test089
     * @tc.desc Verify K=long, V=int long int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<long, int> = new Map<long, int>([[Int.toLong(1), 100], [Int.toLong(2), 200]]);
      const copy: Map<long, int> = new Map<long, int>(src);
      expect(copy.get(Int.toLong(1))).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_9000
     * @tc.name mapConstructorPart02Test090
     * @tc.desc Verify K=string, V=boolean string boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, boolean> = new Map<string, boolean>([['active', true], ['deleted', false]]);
      const copy: Map<string, boolean> = new Map<string, boolean>(src);
      expect(copy.get('active')).assertTrue();
      expect(copy.get('deleted')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_9100
     * @tc.name mapConstructorPart02Test091
     * @tc.desc Verify K=Date, V=string Date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dk: Date = new Date(1700000000000);
      const src: Map<Date, string> = new Map<Date, string>([[dk, 'timestamp']]);
      const copy: Map<Date, string> = new Map<Date, string>(src);
      expect(copy.get(dk)).assertEqual('timestamp');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_9200
     * @tc.name mapConstructorPart02Test092
     * @tc.desc Verify K=number, V=Date number Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dv: Date = new Date(1700000000000);
      const src: Map<number, Date> = new Map<number, Date>([[1.5, dv]]);
      const copy: Map<number, Date> = new Map<number, Date>(src);
      expect(copy.get(1.5)).assertEqual(dv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_9300
     * @tc.name mapConstructorPart02Test093
     * @tc.desc Verify K=string, V=RegExp string RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rv: RegExp = new RegExp('test', 'i');
      const src: Map<string, RegExp> = new Map<string, RegExp>([['pattern', rv]]);
      const copy: Map<string, RegExp> = new Map<string, RegExp>(src);
      expect(copy.get('pattern')).assertEqual(rv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART02_TEST_9400
     * @tc.name mapConstructorPart02Test094
     * @tc.desc Verify K=byte, V=byte byte byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapConstructorPart02Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<byte, byte> = new Map<byte, byte>([[1 as byte, 100 as byte]]);
      const copy: Map<byte, byte> = new Map<byte, byte>(src);
      expect(copy.get(1 as byte)).assertEqual(100 as byte);
    });

  });
}
