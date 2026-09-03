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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from "../Util.test";
const FLOAT_POS_INF: float = Double.toFloat(Number.POSITIVE_INFINITY);
const FLOAT_NEG_INF: float = Double.toFloat(Number.NEGATIVE_INFINITY);
const FLOAT_NEG_ZERO: float = -0.0 as float;
interface Person {
  name: string;
  age: double;
}
interface Item {
  id: double;
  label: string;
}
interface Item2 {
  id: double;
}
interface BoxVal {
  width: double;
  height: double;
}
interface Point {
  x: double;
  y: double;
}
interface Coord {
  lat: double;
  lng: double;
}
class Tag {
  name: string;
  constructor(n: string) {
    this.name = n;
  }
}
interface IdTag {
  id: double;
}
interface LabeledItem {
  id: double;
  label: string;
}
interface Data2 {
  x: double;
  y: double;
}

export default function MapGetPart03Test(): void {
  describe('MapGetPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0010
     * @tc.name mapGetPart03Test001
     * @tc.desc Verify get returns the stored value for an existing key even when a default value is passed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let storedPerson: Person = { name: 'Alice', age: 30 } as Person;
      let defaultPerson: Person = { name: 'Bob', age: 25 } as Person;
      let m: Map<string, Person> = new Map<string, Person>();
      m.set('a', storedPerson);
      let result: Person = m.get('a', defaultPerson);
      expect(result.name).assertEqual('Alice');
      expect(result.age).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0020
     * @tc.name mapGetPart03Test002
     * @tc.desc Verify get returns the default value when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let storedPerson: Person = { name: 'Alice', age: 30 } as Person;
      let defaultPerson: Person = { name: 'Bob', age: 25 } as Person;
      let m: Map<string, Person> = new Map<string, Person>();
      m.set('a', storedPerson);
      let result: Person = m.get('nonexistent', defaultPerson);
      expect(result.name).assertEqual('Bob');
      expect(result.age).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0030
     * @tc.name mapGetPart03Test003
     * @tc.desc Verify get returns the stored int value when the key exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 42);
      let result: int = m.get('a', 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0040
     * @tc.name mapGetPart03Test004
     * @tc.desc Verify get returns the int default -5 when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let result: int = m.get('b', -5);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0050
     * @tc.name mapGetPart03Test005
     * @tc.desc Verify get returns null as the default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, Item | null> = new Map<string, Item | null>();
      m.set('a', { id: 1, label: 'A' } as Item);
      let result: Item | null = m.get('b', null);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0060
     * @tc.name mapGetPart03Test006
     * @tc.desc Verify get returns the default for an absent Unicode emoji string key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let result: int = m.get('😀🎉', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0070
     * @tc.name mapGetPart03Test007
     * @tc.desc Verify get returns the stored value for a string key containing a zero-width space
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, double> = new Map<string, double>();
      m.set('a​b', 3.14);
      let result: double = m.get('a​b', 0.0);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0080
     * @tc.name mapGetPart03Test008
     * @tc.desc Verify get treats a string key containing a zero-width space as distinct and returns the default
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, double> = new Map<string, double>();
      m.set('ab', 2.71);
      let result: double = m.get('a​b', 0.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0090
     * @tc.name mapGetPart03Test009
     * @tc.desc Verify get returns the stored value for a 10000-character string key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'a'.repeat(10000);
      let m: Map<string, int> = new Map<string, int>();
      m.set(longKey, 888);
      let result: int = m.get(longKey, 0);
      expect(result).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0100
     * @tc.name mapGetPart03Test010
     * @tc.desc Verify get distinguishes keys with leading whitespace and returns the default for the key without it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('  abc', 20);
      let result: int = m.get('abc', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0110
     * @tc.name mapGetPart03Test011
     * @tc.desc Verify get returns the default when the int key 0 is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, string> = new Map<int, string>();
      m.set(1, 'one');
      let result: string = m.get(0, 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0120
     * @tc.name mapGetPart03Test012
     * @tc.desc Verify get returns the default when the large int key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(5, 50);
      let result: int = m.get(9999, -100);
      expect(result).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0130
     * @tc.name mapGetPart03Test013
     * @tc.desc Verify get returns the stored value for the double key 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, string> = new Map<double, string>();
      m.set(0.5, 'half');
      let result: string = m.get(0.5, 'none');
      expect(result).assertEqual('half');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0140
     * @tc.name mapGetPart03Test014
     * @tc.desc Verify get returns the stored value for the boolean key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<boolean, string> = new Map<boolean, string>();
      m.set(true, 'yes');
      let result: string = m.get(true, 'no');
      expect(result).assertEqual('yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0150
     * @tc.name mapGetPart03Test015
     * @tc.desc Verify get returns the default for the absent boolean key false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      let result: int = m.get(false, -999);
      expect(result).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0160
     * @tc.name mapGetPart03Test016
     * @tc.desc Verify get returns the stored value for the bigint key 0n
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<bigint, string> = new Map<bigint, string>();
      m.set(0n, 'zero');
      let result: string = m.get(0n, 'default');
      expect(result).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0170
     * @tc.name mapGetPart03Test017
     * @tc.desc Verify get returns the default for an absent bigint key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<bigint, int> = new Map<bigint, int>();
      m.set(100n, 10);
      let result: int = m.get(200n, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0180
     * @tc.name mapGetPart03Test018
     * @tc.desc Verify get returns the stored value for the double key 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, int> = new Map<double, int>();
      m.set(0.0, 50);
      let result: int = m.get(0.0, -1);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0190
     * @tc.name mapGetPart03Test019
     * @tc.desc Verify get returns the stored value for the Number.EPSILON double key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, int> = new Map<double, int>();
      m.set(Number.EPSILON, 1);
      let result: int = m.get(Number.EPSILON, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0200
     * @tc.name mapGetPart03Test020
     * @tc.desc Verify get returns the stored value for the -0.0 double key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<double, int> = new Map<double, int>();
      m.set(-0.0, 30);
      let result: int = m.get(-0.0, -1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0210
     * @tc.name mapGetPart03Test021
     * @tc.desc Verify get returns the stored value for the byte key 127 (byte max)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<byte, string> = new Map<byte, string>();
      m.set(127 as byte, 'maxByte');
      let result: string = m.get(127 as byte, 'default');
      expect(result).assertEqual('maxByte');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0220
     * @tc.name mapGetPart03Test022
     * @tc.desc Verify get returns the stored value for the short key 32767 (short max)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<short, string> = new Map<short, string>();
      m.set(32767 as short, 'maxShort');
      let result: string = m.get(32767 as short, 'default');
      expect(result).assertEqual('maxShort');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0230
     * @tc.name mapGetPart03Test023
     * @tc.desc Verify get returns the int.MAX default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      let result: int = m.get('nonexistent', 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0240
     * @tc.name mapGetPart03Test024
     * @tc.desc Verify get returns the int.MIN default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      let result: int = m.get('nonexistent', -2147483647 - 1);
      expect(result).assertEqual(-2147483647 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0250
     * @tc.name mapGetPart03Test025
     * @tc.desc Verify get returns the string default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, string> = new Map<string, string>();
      m.set('a', 'valueA');
      let result: string = m.get('b', 'defaultValue');
      expect(result).assertEqual('defaultValue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0260
     * @tc.name mapGetPart03Test026
     * @tc.desc Verify get returns the boolean default false when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, boolean> = new Map<string, boolean>();
      m.set('a', true);
      let result: boolean = m.get('b', false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0270
     * @tc.name mapGetPart03Test027
     * @tc.desc Verify get returns the stored boolean false even when the default is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, boolean> = new Map<string, boolean>();
      m.set('a', false);
      let result: boolean = m.get('a', true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0280
     * @tc.name mapGetPart03Test028
     * @tc.desc Verify get returns the stored value for an existing key rather than the null default
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: BoxVal = { width: 10, height: 20 } as BoxVal;
      let m: Map<string, BoxVal | null> = new Map<string, BoxVal | null>();
      m.set('box1', b);
      let result: BoxVal | null = m.get('box1', null);
      expect(result).not().assertNull();
      expect(result!.width).assertEqual(10);
      expect(result!.height).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0290
     * @tc.name mapGetPart03Test029
     * @tc.desc Verify get returns the double default 0.0 when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, double> = new Map<string, double>();
      let result: double = m.get('nonexistent', 0.0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0300
     * @tc.name mapGetPart03Test030
     * @tc.desc Verify get returns the Date default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(2026, 0, 1);
      let result: Date = m.get('nonexistent', d);
      expect(result.getFullYear()).assertEqual(2026);
      expect(result.getMonth()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0310
     * @tc.name mapGetPart03Test031
     * @tc.desc Verify get returns the stored Date value instead of the default when the key exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, Date> = new Map<string, Date>();
      let stored: Date = new Date(2025, 5, 15);
      let defDate: Date = new Date(2026, 0, 1);
      m.set('d', stored);
      let result: Date = m.get('d', defDate);
      expect(result.getFullYear()).assertEqual(2025);
      expect(result.getMonth()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0320
     * @tc.name mapGetPart03Test032
     * @tc.desc Verify get returns the Point default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, Point> = new Map<string, Point>();
      let defPt: Point = { x: -1, y: -1 } as Point;
      let result: Point = m.get('nonexistent', defPt);
      expect(result.x).assertEqual(-1);
      expect(result.y).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0330
     * @tc.name mapGetPart03Test033
     * @tc.desc Verify get returns the stored Point value instead of the default when the key exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stored: Point = { x: 100, y: 200 } as Point;
      let defPt: Point = { x: 0, y: 0 } as Point;
      let m: Map<string, Point> = new Map<string, Point>();
      m.set('origin', stored);
      let result: Point = m.get('origin', defPt);
      expect(result.x).assertEqual(100);
      expect(result.y).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0340
     * @tc.name mapGetPart03Test034
     * @tc.desc Verify get returns the int array default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int[]> = new Map<string, int[]>();
      let defArr: int[] = [1, 2, 3];
      let result: int[] = m.get('nonexistent', defArr);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0350
     * @tc.name mapGetPart03Test035
     * @tc.desc Verify get returns the stored int array instead of the default when the key exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int[]> = new Map<string, int[]>();
      let storedArr: int[] = [9, 8, 7];
      let defArr: int[] = [1, 2, 3];
      m.set('nums', storedArr);
      let result: int[] = m.get('nums', defArr);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0360
     * @tc.name mapGetPart03Test036
     * @tc.desc Verify get returns the stored value for the same Date key instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(2026, 6, 8);
      let m: Map<Date, string> = new Map<Date, string>();
      m.set(d, 'today');
      let result: string = m.get(d, 'unknown');
      expect(result).assertEqual('today');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0370
     * @tc.name mapGetPart03Test037
     * @tc.desc Verify get returns the default for a different Date instance with the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Date, string> = new Map<Date, string>();
      m.set(new Date(2026, 6, 8), 'date1');
      let lookup: Date = new Date(2026, 6, 8);
      let result: string = m.get(lookup, 'notfound');
      expect(result).assertEqual('notfound');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0380
     * @tc.name mapGetPart03Test038
     * @tc.desc Verify get returns the default for a Date key different from the stored one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Date, int> = new Map<Date, int>();
      m.set(new Date(2025, 0, 1), 100);
      let other: Date = new Date(2026, 0, 1);
      let result: int = m.get(other, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0390
     * @tc.name mapGetPart03Test039
     * @tc.desc Verify get returns the stored value for the same object key reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Coord = { lat: 40.0, lng: 116.0 } as Coord;
      let m: Map<Coord, string> = new Map<Coord, string>();
      m.set(c, 'Beijing');
      let result: string = m.get(c, 'unknown');
      expect(result).assertEqual('Beijing');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0400
     * @tc.name mapGetPart03Test040
     * @tc.desc Verify get returns the default for an object key distinct from the stored one with equal fields
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Coord, string> = new Map<Coord, string>();
      m.set({ lat: 40.0, lng: 116.0 } as Coord, 'Beijing');
      let lookup: Coord = { lat: 40.0, lng: 116.0 } as Coord;
      let result: string = m.get(lookup, 'notfound');
      expect(result).assertEqual('notfound');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0410
     * @tc.name mapGetPart03Test041
     * @tc.desc Verify get returns the default for an object key that was never stored
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Coord, int> = new Map<Coord, int>();
      m.set({ lat: 30.0, lng: 120.0 } as Coord, 1);
      let other: Coord = { lat: 50.0, lng: 10.0 } as Coord;
      let result: int = m.get(other, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0420
     * @tc.name mapGetPart03Test042
     * @tc.desc Verify get returns the stored value for the same class instance key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Tag = new Tag('vip');
      let m: Map<Tag, int> = new Map<Tag, int>();
      m.set(t, 5);
      let result: int = m.get(t, 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0430
     * @tc.name mapGetPart03Test043
     * @tc.desc Verify get returns the default for a class instance key different from the stored one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Tag, int> = new Map<Tag, int>();
      m.set(new Tag('vip'), 5);
      let lookup: Tag = new Tag('vip');
      let result: int = m.get(lookup, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0440
     * @tc.name mapGetPart03Test044
     * @tc.desc Verify get returns the stored value for the same array reference key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      let m: Map<int[], string> = new Map<int[], string>();
      m.set(arr, 'found');
      let result: string = m.get(arr, 'default');
      expect(result).assertEqual('found');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0450
     * @tc.name mapGetPart03Test045
     * @tc.desc Verify get returns the default for an array key different from the stored instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int[], string> = new Map<int[], string>();
      m.set([1, 2, 3], 'found');
      let lookup: int[] = [1, 2, 3];
      let result: string = m.get(lookup, 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0460
     * @tc.name mapGetPart03Test046
     * @tc.desc Verify get returns the stored Item2 value instead of the default for an existing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stored: Item2 = { id: 99 } as Item2;
      let defItem: Item2 = { id: -1 } as Item2;
      let m: Map<string, Item2> = new Map<string, Item2>();
      m.set('key', stored);
      let result: Item2 = m.get('key', defItem);
      expect(result.id).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0470
     * @tc.name mapGetPart03Test047
     * @tc.desc Verify get returns the stored value and leaves the map size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let result: int = m.get('a', -1);
      expect(result).assertEqual(1);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0480
     * @tc.name mapGetPart03Test048
     * @tc.desc Verify get returns the newly set value after set instead of the previous default
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      let beforeSet: int = m.get('newKey', 999);
      expect(beforeSet).assertEqual(999);
      m.set('newKey', 111);
      let afterSet: int = m.get('newKey', 999);
      expect(afterSet).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0490
     * @tc.name mapGetPart03Test049
     * @tc.desc Verify get returns the stored Date value with year, month and day intact
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(2026, 6, 8);
      m.set('today', d);
      let fallbackDate: Date = new Date(2000, 0, 1);
      let result: Date = m.get('today', fallbackDate);
      expect(result.getFullYear()).assertEqual(2026);
      expect(result.getMonth()).assertEqual(6);
      expect(result.getDate()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0500
     * @tc.name mapGetPart03Test050
     * @tc.desc Verify get returns the default when the stored value for the key is null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, string | null> = new Map<string, string | null>();
      m.set('nullable', null);
      let result: string | null = m.get('nullable', 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0510
     * @tc.name mapGetPart03Test051
     * @tc.desc Verify get returns the default when the stored value for the key is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, string | undefined> = new Map<string, string | undefined>();
      m.set('undef', undefined);
      let result: string | undefined = m.get('undef', 'default');
      expect(result).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0520
     * @tc.name mapGetPart03Test052
     * @tc.desc Verify get returns the default after the map is cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      let result: int = m.get('a', -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0530
     * @tc.name mapGetPart03Test053
     * @tc.desc Verify get returns the default for an absent key while stored keys still return their values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      let result: int = m.get('c', -1);
      expect(result).assertEqual(-1);
      expect(m.get('a', 0)).assertEqual(1);
      expect(m.get('b', 0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0540
     * @tc.name mapGetPart03Test054
     * @tc.desc Verify get returns the value of the latest set for a key set multiple times
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('key', 10);
      m.set('key', 20);
      let result: int = m.get('key', 999);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0550
     * @tc.name mapGetPart03Test055
     * @tc.desc Verify get returns the stored value for an existing key and the default for a missing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, string> = new Map<string, string>();
      m.set('only', 'alone');
      let found: string = m.get('only', 'missing');
      let missing: string = m.get('other', 'missing');
      expect(found).assertEqual('alone');
      expect(missing).assertEqual('missing');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0560
     * @tc.name mapGetPart03Test056
     * @tc.desc Verify get returns the stored string value for the int key 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(42, 'answer');
      let result: string = map.get(42, 'default');
      expect(result).assertEqual('answer');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0570
     * @tc.name mapGetPart03Test057
     * @tc.desc Verify get returns the stored value for the boolean key false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<boolean, int> = new Map<boolean, int>();
      map.set(false, 0);
      let result: int = map.get(false, 999);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0580
     * @tc.name mapGetPart03Test058
     * @tc.desc Verify get returns the stored int value for the float key 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, int> = new Map<float, int>();
      map.set(3.14 as float, 314);
      let result: int = map.get(3.14 as float, 0);
      expect(result).assertEqual(314);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0590
     * @tc.name mapGetPart03Test059
     * @tc.desc Verify get returns the stored string value for the int.MAX key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'maxInt');
      let result: string = map.get(2147483647, 'fallback');
      expect(result).assertEqual('maxInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0600
     * @tc.name mapGetPart03Test060
     * @tc.desc Verify get returns the stored string value for a float NaN key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, string> = new Map<float, string>();
      map.set(Double.toFloat(Number.NaN), 'nanFloat');
      let result: string = map.get(Double.toFloat(Number.NaN), 'default');
      expect(result).assertEqual('nanFloat');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0610
     * @tc.name mapGetPart03Test061
     * @tc.desc Verify get matches only the exact Date instance and returns the default for a different instance with the same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<Date, int> = new Map<Date, int>();
      let dA: Date = new Date(5000, 0, 1);
      map.set(dA, 500);
      let dB: Date = new Date(5000, 0, 1);
      expect(dB.getTime()).assertEqual(dA.getTime());
      let result: int = map.get(dB, -1);
      expect(result).assertEqual(-1);
      expect(map.get(dA, -1)).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0620
     * @tc.name mapGetPart03Test062
     * @tc.desc Verify get returns the stored Date with consistent getTime and kept reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, Date> = new Map<int, Date>();
      let dA: Date = new Date(3000, 0, 1);
      let dB: Date = new Date(5000, 0, 1);
      map.set(1, dA);
      map.set(2, dB);
      let gotA: Date | undefined = map.get(1);
      let gotB: Date | undefined = map.get(2);
      expect(gotA).assertEqual(dA);
      expect(gotB).assertEqual(dB);
      expect(gotA!.getTime()).assertEqual(dA.getTime());
      expect(gotB!.getTime()).assertEqual(dB.getTime());
      let timesEqual: boolean = gotA!.getTime() === gotB!.getTime();
      expect(timesEqual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0630
     * @tc.name mapGetPart03Test063
     * @tc.desc Verify get returns the stored string value for the same object key reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<IdTag, string> = new Map<IdTag, string>();
      let obj: IdTag = { id: 1 } as IdTag;
      map.set(obj, 'found');
      let result: string = map.get(obj, 'notFound');
      expect(result).assertEqual('found');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0640
     * @tc.name mapGetPart03Test064
     * @tc.desc Verify get returns the stored int value for the same RegExp instance key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<RegExp, int> = new Map<RegExp, int>();
      let r: RegExp = new RegExp('^test', 'g');
      map.set(r, 123);
      let result: int = map.get(r, 0);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0650
     * @tc.name mapGetPart03Test065
     * @tc.desc Verify get returns the default for a different RegExp instance with the same pattern
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<RegExp, int> = new Map<RegExp, int>();
      let rA: RegExp = new RegExp('abc', 'i');
      map.set(rA, 456);
      let rB: RegExp = new RegExp('abc', 'i');
      let result: int = map.get(rB, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0660
     * @tc.name mapGetPart03Test066
     * @tc.desc Verify get returns the long default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, long> = new Map<string, long>();
      map.set('a', 1);
      let result: long = map.get('b', 999);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0670
     * @tc.name mapGetPart03Test067
     * @tc.desc Verify get returns the double default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, double> = new Map<string, double>();
      map.set('pi', 3.14159);
      let result: double = map.get('e', 2.71828);
      expect(result).assertEqual(2.71828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0680
     * @tc.name mapGetPart03Test068
     * @tc.desc Verify get returns the float default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, float> = new Map<string, float>();
      map.set('x', 1.0 as float);
      let result: float = map.get('y', 2.5 as float);
      expect(result).assertEqual(2.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0690
     * @tc.name mapGetPart03Test069
     * @tc.desc Verify get returns the bigint default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, bigint> = new Map<string, bigint>();
      map.set('present', BigInt(123));
      let result: bigint = map.get('absent', BigInt(456));
      expect(result).assertEqual(BigInt(456));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0700
     * @tc.name mapGetPart03Test070
     * @tc.desc Verify get returns the null default for an absent key in a Map<string, int | null>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int | null> = new Map<string, int | null>();
      map.set('x', 42);
      let result: int | null = map.get('y', null);
      expect(result).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0710
     * @tc.name mapGetPart03Test071
     * @tc.desc Verify get returns the undefined default for an absent key in a Map<string, string | undefined>
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string | undefined> = new Map<string, string | undefined>();
      map.set('a', 'defined');
      let result: string | undefined = map.get('b', undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0720
     * @tc.name mapGetPart03Test072
     * @tc.desc Verify get returns the RegExp default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, RegExp> = new Map<string, RegExp>();
      let fallback: RegExp = new RegExp('pattern', 'g');
      let result: RegExp = map.get('none', fallback);
      expect(result).assertEqual(fallback);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0730
     * @tc.name mapGetPart03Test073
     * @tc.desc Verify get returns the Error default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Error> = new Map<string, Error>();
      let fallback: Error = new Error('default error');
      let result: Error = map.get('none', fallback);
      expect(result).assertEqual(fallback);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0740
     * @tc.name mapGetPart03Test074
     * @tc.desc Verify get returns the stored Date value whose getTime matches the stored instance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Date> = new Map<string, Date>();
      let dt: Date = new Date(2000, 0, 1);
      map.set('timestamp', dt);
      let fallbackDate: Date = new Date(1970, 0, 1);
      let result: Date = map.get('timestamp', fallbackDate);
      expect(result.getTime()).assertEqual(dt.getTime());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0750
     * @tc.name mapGetPart03Test075
     * @tc.desc Verify get returns the default after the key is deleted and the map size is 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('only', 1);
      map.delete('only');
      let result: int = map.get('only', -1);
      expect(result).assertEqual(-1);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0760
     * @tc.name mapGetPart03Test076
     * @tc.desc Verify get returns the latest stored value after a key is overwritten and the map size stays unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('key', 100);
      let szBefore: int = map.size;
      map.set('key', 200);
      let szAfter: int = map.size;
      let result: int = map.get('key', -1);
      expect(szAfter).assertEqual(szBefore);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0770
     * @tc.name mapGetPart03Test077
     * @tc.desc Verify get(key) on missing key returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>([['a', 1]]);
      expect(map.get('missing')).assertUndefined();
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0780
     * @tc.name mapGetPart03Test078
     * @tc.desc Verify get(key,def) folds null value to def while get(key) returns null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int | null> = new Map<string, int | null>();
      map.set('k', null);
      expect(map.get('k', 99)).assertEqual(99);
      expect(map.get('k')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0790
     * @tc.name mapGetPart03Test079
     * @tc.desc Verify get with and without a default returns the stored value for an existing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 42);
      let r1: int | undefined = map.get('a');
      let r2: int = map.get('a', 100);
      expect(r1).assertEqual(42);
      expect(r2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0800
     * @tc.name mapGetPart03Test080
     * @tc.desc Verify get without a default returns undefined and with a default returns the default for a missing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 42);
      let r1: int | undefined = map.get('b');
      let r2: int = map.get('b', 77);
      expect(r1).assertUndefined();
      expect(r2).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0810
     * @tc.name mapGetPart03Test081
     * @tc.desc Verify get returns the stored LabeledItem value for an existing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, LabeledItem> = new Map<string, LabeledItem>();
      map.set('a', { id: 1, label: 'A' } as LabeledItem);
      let result: LabeledItem | undefined = map.get('a');
      expect(result!.id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0820
     * @tc.name mapGetPart03Test082
     * @tc.desc Verify get returns stored values for existing int keys and the given default for missing int keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      map.set(1, 'one');
      let a: string | undefined = map.get(1);
      let b: string = map.get(2, 'two');
      let d: string = map.get(2, 'TWO');
      expect(a).assertEqual('one');
      expect(b).assertEqual('two');
      expect(d).assertEqual('TWO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0830
     * @tc.name mapGetPart03Test083
     * @tc.desc Verify get returns the stored value for the double key 3.14 and the default for a missing double key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, int> = new Map<double, int>();
      map.set(3.14, 314);
      let r1: int | undefined = map.get(3.14);
      let r2: int = map.get(3.14, 0);
      let r3: int | undefined = map.get(2.71);
      let r4: int = map.get(2.71, -1);
      expect(r1).assertEqual(314);
      expect(r2).assertEqual(314);
      expect(r3).assertUndefined();
      expect(r4).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0840
     * @tc.name mapGetPart03Test084
     * @tc.desc Verify get returns the stored values for the boolean keys true and false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'T');
      map.set(false, 'F');
      let r1: string | undefined = map.get(true);
      let r2: string = map.get(true, 'X');
      let r3: string | undefined = map.get(false);
      let r4: string = map.get(false, 'X');
      expect(r1).assertEqual('T');
      expect(r2).assertEqual('T');
      expect(r3).assertEqual('F');
      expect(r4).assertEqual('F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0850
     * @tc.name mapGetPart03Test085
     * @tc.desc Verify get returns the stored value for the bigint key 100n and the default for a missing bigint key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<bigint, int> = new Map<bigint, int>();
      map.set(100n, 1);
      let r1: int | undefined = map.get(100n);
      let r2: int = map.get(100n, 0);
      let r3: int | undefined = map.get(200n);
      let r4: int = map.get(200n, -1);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(1);
      expect(r3).assertUndefined();
      expect(r4).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0860
     * @tc.name mapGetPart03Test086
     * @tc.desc Verify get returns the stored value for the short key 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<short, int> = new Map<short, int>();
      map.set(1 as short, 10);
      let r1: int | undefined = map.get(1 as short);
      let r2: int = map.get(1 as short, 0);
      expect(r1).assertEqual(10);
      expect(r2).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0870
     * @tc.name mapGetPart03Test087
     * @tc.desc Verify get returns undefined without a default and the empty string default with one for a missing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, string> = new Map<string, string>();
      map.set('a', 'value');
      let r1: string | undefined = map.get('b');
      let r2: string = map.get('b', '');
      expect(r1).assertUndefined();
      expect(r2).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0880
     * @tc.name mapGetPart03Test088
     * @tc.desc Verify get returns undefined without a default and the null default with one for a missing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Data2 | null> = new Map<string, Data2 | null>();
      map.set('a', { x: 1, y: 2 } as Data2);
      let r1: Data2 | null | undefined = map.get('b');
      let r2: Data2 | null = map.get('b', null);
      expect(r1).assertUndefined();
      expect(r2).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0890
     * @tc.name mapGetPart03Test089
     * @tc.desc Verify get returns undefined or the defaults for keys after the map is cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('c', 3);
      map.clear();
      let r1a: int | undefined = map.get('a');
      let r1b: int | undefined = map.get('b');
      let r2a: int = map.get('a', 10);
      let r2b: int = map.get('b', 20);
      expect(r1a).assertUndefined();
      expect(r1b).assertUndefined();
      expect(r2a).assertEqual(10);
      expect(r2b).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0900
     * @tc.name mapGetPart03Test090
     * @tc.desc Verify get returns the value of the last duplicate entry passed to the constructor
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>([['dup', 1], ['dup', 2]]);
      let r1: int | undefined = map.get('dup');
      let r2: int = map.get('dup', 0);
      expect(r1).assertEqual(2);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0910
     * @tc.name mapGetPart03Test091
     * @tc.desc Verify get on a missing key returns undefined without a default, the default with one, and leaves the map unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      expect(map.get('b')).assertUndefined();
      expect(map.get('b', 0)).assertEqual(0);
      expect(map.has('b')).assertFalse();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0920
     * @tc.name mapGetPart03Test092
     * @tc.desc Verify get calls with and without defaults leave the map size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('c', 3);
      let sizeBefore: int = map.size;
      map.get('a');
      map.get('d');
      map.get('b', 0);
      map.get('e', -1);
      expect(map.size).assertEqual(sizeBefore);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0930
     * @tc.name mapGetPart03Test093
     * @tc.desc Verify get calls leave has results for existing and missing keys unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('k', 1);
      let hasBefore: boolean = map.has('k');
      let hasMissingBefore: boolean = map.has('missing');
      map.get('k');
      map.get('missing');
      map.get('k', 0);
      map.get('missing', 0);
      expect(hasBefore).assertTrue();
      expect(map.has('missing')).assertEqual(hasMissingBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0940
     * @tc.name mapGetPart03Test094
     * @tc.desc Verify get calls do not change the key iteration order of the map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('first', 1).set('second', 2).set('third', 3);
      map.get('second');
      map.get('nonexistent');
      map.get('second', 0);
      let keys: string[] = [];
      map.forEach((value: int, key: string) => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('first');
      expect(keys[1]).assertEqual('second');
      expect(keys[2]).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0950
     * @tc.name mapGetPart03Test095
     * @tc.desc Verify get on an empty map does not throw, returns undefined or the default, and leaves the size at 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.get('a');
      map.get('a', 0);
      expect(map.size).assertEqual(0);
      expect(map.get('a')).assertUndefined();
      expect(map.get('a', 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0960
     * @tc.name mapGetPart03Test096
     * @tc.desc Verify get does not throw for keys with control characters, emoji and a zero-width space
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('\x00\x01\x02', 1);
      map.set('😀🎉', 2);
      map.set('​', 3);
      expect(map.get('\x00\x01\x02')).assertEqual(1);
      expect(map.get('😀🎉', -1)).assertEqual(2);
      expect(map.get('​')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0970
     * @tc.name mapGetPart03Test097
     * @tc.desc Verify get returns the stored value, then undefined and the default after the key is deleted
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1).set('b', 2).set('c', 3);
      let beforeDeleteVal: int | undefined = map.get('b');
      expect(beforeDeleteVal).assertEqual(2);
      expect(map.delete('b')).assertTrue();
      let afterDeleteNoDefault: int | undefined = map.get('b');
      expect(afterDeleteNoDefault).assertUndefined();
      let afterDeleteWithDefault: int = map.get('b', 99);
      expect(afterDeleteWithDefault).assertEqual(99);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0980
     * @tc.name mapGetPart03Test098
     * @tc.desc Verify get returns the stored boolean for the int key -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, boolean> = new Map<int, boolean>();
      map.set(-1, true);
      let result: boolean = map.get(-1, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_0990
     * @tc.name mapGetPart03Test099
     * @tc.desc Verify get returns the stored int value for a float Infinity key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, int> = new Map<float, int>();
      map.set(FLOAT_POS_INF, 999);
      let result: int = map.get(FLOAT_POS_INF, 0);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_1000
     * @tc.name mapGetPart03Test100
     * @tc.desc Verify get returns the stored boolean for a float -Infinity key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, boolean> = new Map<float, boolean>();
      map.set(FLOAT_NEG_INF, true);
      let result: boolean = map.get(FLOAT_NEG_INF, false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_1010
     * @tc.name mapGetPart03Test101
     * @tc.desc Verify get returns the stored string value for the float -0.0 key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<float, string> = new Map<float, string>();
      map.set(FLOAT_NEG_ZERO, 'negZeroFloat');
      let result: string = map.get(FLOAT_NEG_ZERO, 'default');
      expect(result).assertEqual('negZeroFloat');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_1020
     * @tc.name mapGetPart03Test102
     * @tc.desc Verify get returns the boolean default true when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, boolean> = new Map<string, boolean>();
      map.set('flag', false);
      let result: boolean = map.get('nokey', true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_GET_PART03_TEST_1030
     * @tc.name mapGetPart03Test103
     * @tc.desc Verify get returns the short default when the key is absent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapGetPart03Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, short> = new Map<string, short>();
      map.set('has', 10 as short);
      let result: short = map.get('not', 99 as short);
      expect(result).assertEqual(99 as short);
    });

  });
}
