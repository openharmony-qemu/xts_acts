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
interface ObjKey { id: int; }
interface NestedKeyInner { tag: string; }
interface NestedKey { inner: NestedKeyInner; }
class NumBox {
  value: int = 0;
}
class Tag {
  label: string = '';
}

export default function MapConstructorPart04Test(): void {
  describe('MapConstructorPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0100
     * @tc.name mapConstructorPart04Test001
     * @tc.desc Verify Map constructor with empty array argument yields a behaviorally empty Map (size 0, has false, get undefined, iterator done)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyMap: Map<string, int> = new Map<string, int>([] as Array<[string, int]>);
      expect(emptyMap.size).assertEqual(0);
      expect(emptyMap.has('k')).assertFalse();
      expect(emptyMap.get('k')).assertUndefined();
      expect(emptyMap.entries().next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0200
     * @tc.name mapConstructorPart04Test002
     * @tc.desc Verify Map constructor from an Array of ten entries keeps all entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> =
        [['k0', 0], ['k1', 1], ['k2', 2], ['k3', 3], ['k4', 4], ['k5', 5], ['k6', 6], ['k7', 7], ['k8', 8],
          ['k9', 9]] as Array<[string, int]>;
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.size).assertEqual(10);
      expect(map.get('k5')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0300
     * @tc.name mapConstructorPart04Test003
     * @tc.desc Verify Map constructor keeps nested object key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: NestedKey = { inner: { tag: 'x' } } as NestedKey;
      const fa: Array<[NestedKey, string]> = [[key, 'nested']] as Array<[NestedKey, string]>;
      const map: Map<NestedKey, string> = new Map<NestedKey, string>(fa);
      expect(map.has(key)).assertTrue();
      expect(map.get(key)).assertEqual('nested');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0400
     * @tc.name mapConstructorPart04Test004
     * @tc.desc Verify Map constructor keeps double key 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[double, string]> = [[3.14 as double, 'pi']] as Array<[double, string]>;
      const map: Map<double, string> = new Map<double, string>(fa);
      expect(map.has(3.14 as double)).assertTrue();
      expect(map.get(3.14 as double)).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0500
     * @tc.name mapConstructorPart04Test005
     * @tc.desc Verify Map constructor keeps NaN double key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: double = Number.NaN;
      const fa: Array<[double, string]> = [[key, 'dbl_nan']] as Array<[double, string]>;
      const map: Map<double, string> = new Map<double, string>(fa);
      expect(map.has(key)).assertTrue();
      expect(map.get(key)).assertEqual('dbl_nan');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0600
     * @tc.name mapConstructorPart04Test006
     * @tc.desc Verify Map constructor keeps null value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, string | null]> = [['nullable', null]] as Array<[string, string | null]>;
      const map: Map<string, string | null> = new Map<string, string | null>(fa);
      expect(map.has('nullable')).assertTrue();
      expect(map.get('nullable')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0700
     * @tc.name mapConstructorPart04Test007
     * @tc.desc Verify Map constructor keeps Error value by reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err: Error = new Error('test error');
      const fa: Array<[string, Error]> = [['e', err]] as Array<[string, Error]>;
      const map: Map<string, Error> = new Map<string, Error>(fa);
      expect(map.get('e')).assertEqual(err);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0800
     * @tc.name mapConstructorPart04Test008
     * @tc.desc Verify Map constructor deduplicates duplicate keys keeping last value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['dup', 1], ['dup', 2]] as Array<[string, int]>;
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.size).assertEqual(1);
      expect(map.get('dup')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_0900
     * @tc.name mapConstructorPart04Test009
     * @tc.desc Verify Map constructor with three duplicate entries keeps last value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['dup', 1], ['dup', 2], ['dup', 3]] as Array<[string, int]>;
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.size).assertEqual(1);
      expect(map.get('dup')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1000
     * @tc.name mapConstructorPart04Test010
     * @tc.desc Verify Map constructed from an Array preserves key-value insertion order in entries()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['c', 3], ['a', 1], ['b', 2]] as Array<[string, int]>;
      const map: Map<string, int> = new Map<string, int>(fa);
      const iter: Iterator<[string, int]> = map.entries();
      const first: IteratorResult<[string, int]> = iter.next();
      expect(first.value![0]).assertEqual('c');
      expect(first.value![1]).assertEqual(3);
      const second: IteratorResult<[string, int]> = iter.next();
      expect(second.value![0]).assertEqual('a');
      expect(second.value![1]).assertEqual(1);
      const third: IteratorResult<[string, int]> = iter.next();
      expect(third.value![0]).assertEqual('b');
      expect(third.value![1]).assertEqual(2);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1100
     * @tc.name mapConstructorPart04Test011
     * @tc.desc Verify set on Map constructed from an Array adds new key and updates existing one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['a', 1]] as Array<[string, int]>;
      const map: Map<string, int> = new Map<string, int>(fa);
      map.set('b', 2);
      map.set('a', 99);
      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(99);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1200
     * @tc.name mapConstructorPart04Test012
     * @tc.desc Verify Map constructor from single Error-keyed entry has size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Error, string> = new Map<Error, string>([[new Error('e1'), 'val']]);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1300
     * @tc.name mapConstructorPart04Test013
     * @tc.desc Verify Map.get() returns the stored value for an Error key after constructing the Map from an Error-keyed entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err: Error = new Error('msg');
      const map: Map<Error, string> = new Map<Error, string>([[err, 'error_val']]);
      expect(map.get(err)).assertEqual('error_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1400
     * @tc.name mapConstructorPart04Test014
     * @tc.desc Verify Map constructor treats Error instances by reference as distinct keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error('same');
      const e2: Error = new Error('same');
      const map: Map<Error, string> = new Map<Error, string>([[e1, 'first'], [e2, 'second']]);
      expect(map.size).assertEqual(2);
      expect(map.get(e1)).assertEqual('first');
      expect(map.get(e2)).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1500
     * @tc.name mapConstructorPart04Test015
     * @tc.desc Verify Map constructor supports union key type Error|string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err: Error = new Error('e');
      const map: Map<Error | string, int> = new Map<Error | string, int>([[err, 1], ['s', 2]]);
      expect(map.get(err)).assertEqual(1);
      expect(map.get('s')).assertEqual(2);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1600
     * @tc.name mapConstructorPart04Test016
     * @tc.desc Verify Map.get() returns the stored value 42 for a Set<string> key after constructing the Map from a Set-keyed entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<string> = new Set<string>(['a', 'b']);
      const map: Map<Set<string>, int> = new Map<Set<string>, int>([[s, 42]]);
      expect(map.get(s)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1700
     * @tc.name mapConstructorPart04Test017
     * @tc.desc Verify Map constructor treats distinct Set objects as separate keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1: Set<string> = new Set<string>(['x']);
      const s2: Set<string> = new Set<string>(['x']);
      const map: Map<Set<string>, int> = new Map<Set<string>, int>([[s1, 1], [s2, 2]]);
      expect(map.size).assertEqual(2);
      expect(map.get(s1)).assertEqual(1);
      expect(map.get(s2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1800
     * @tc.name mapConstructorPart04Test018
     * @tc.desc Verify Map constructor with same Set key twice keeps last value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>([10, 20]);
      const map: Map<Set<int>, string> = new Map<Set<int>, string>([[s, 'old'], [s, 'new']]);
      expect(map.size).assertEqual(1);
      expect(map.get(s)).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_1900
     * @tc.name mapConstructorPart04Test019
     * @tc.desc Verify Map.get() returns the stored value "rec_val" for a Record<string,int> key after constructing the Map from a Record-keyed entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('key', 10);
      const map: Map<Record<string, int>, string> = new Map<Record<string, int>, string>([[r, 'rec_val']]);
      expect(map.get(r)).assertEqual('rec_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2000
     * @tc.name mapConstructorPart04Test020
     * @tc.desc Verify Map constructor treats distinct Record objects as separate keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = new Record<string, int>();
      r1.$_set('a', 1);
      const r2: Record<string, int> = new Record<string, int>();
      r2.$_set('a', 1);
      const map: Map<Record<string, int>, int> = new Map<Record<string, int>, int>([[r1, 100], [r2, 200]]);
      expect(map.size).assertEqual(2);
      expect(map.get(r1)).assertEqual(100);
      expect(map.get(r2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2100
     * @tc.name mapConstructorPart04Test021
     * @tc.desc Verify Map constructor with same Record key twice keeps last value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('x', 5);
      const map: Map<Record<string, int>, string> = new Map<Record<string, int>, string>([[r, 'a'], [r, 'b']]);
      expect(map.size).assertEqual(1);
      expect(map.get(r)).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2200
     * @tc.name mapConstructorPart04Test022
     * @tc.desc Verify Map constructor keeps inner Map as key and get returns its value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>([['n', 1]]);
      const outer: Map<Map<string, int>, string> = new Map<Map<string, int>, string>([[inner, 'nested']]);
      expect(outer.get(inner)).assertEqual('nested');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2300
     * @tc.name mapConstructorPart04Test023
     * @tc.desc Verify Map constructor treats distinct Map objects as separate keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1: Map<string, int> = new Map<string, int>([['a', 1]]);
      const m2: Map<string, int> = new Map<string, int>([['a', 1]]);
      const outer: Map<Map<string, int>, int> = new Map<Map<string, int>, int>([[m1, 10], [m2, 20]]);
      expect(outer.size).assertEqual(2);
      expect(outer.get(m1)).assertEqual(10);
      expect(outer.get(m2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2400
     * @tc.name mapConstructorPart04Test024
     * @tc.desc Verify Map.get() returns the stored value "box_val" for a class instance key after constructing the Map from a class-keyed entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: NumBox = new NumBox();
      box.value = 10;
      const map: Map<NumBox, string> = new Map<NumBox, string>([[box, 'box_val']]);
      expect(map.get(box)).assertEqual('box_val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2500
     * @tc.name mapConstructorPart04Test025
     * @tc.desc Verify Map constructor treats distinct class instances as separate keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: NumBox = new NumBox();
      b1.value = 7;
      const b2: NumBox = new NumBox();
      b2.value = 7;
      const map: Map<NumBox, int> = new Map<NumBox, int>([[b1, 100], [b2, 200]]);
      expect(map.size).assertEqual(2);
      expect(map.get(b1)).assertEqual(100);
      expect(map.get(b2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2600
     * @tc.name mapConstructorPart04Test026
     * @tc.desc Verify Map constructor supports union key type class instance|int
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const box: NumBox = new NumBox();
      box.value = 5;
      const map: Map<NumBox | int, string> = new Map<NumBox | int, string>([[box, 'cls'], [10, 'num']]);
      expect(map.get(box)).assertEqual('cls');
      expect(map.get(10)).assertEqual('num');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2700
     * @tc.name mapConstructorPart04Test027
     * @tc.desc Verify Map.get() returns the Set<int> object stored as the value under the string key "set"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>([1, 2, 3]);
      const map: Map<string, Set<int>> = new Map<string, Set<int>>([['set', s]]);
      expect(map.get('set')).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2800
     * @tc.name mapConstructorPart04Test028
     * @tc.desc Verify Map.get() returns the Record<string,int> object stored as the value under the string key "rec"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('cnt', 5);
      const map: Map<string, Record<string, int>> = new Map<string, Record<string, int>>([['rec', r]]);
      expect(map.get('rec')).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_2900
     * @tc.name mapConstructorPart04Test029
     * @tc.desc Verify Map.get() returns the class instance stored as the value under the string key "t"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tag: Tag = new Tag();
      tag.label = 'test';
      const map: Map<string, Tag> = new Map<string, Tag>([['t', tag]]);
      expect(map.get('t')).assertEqual(tag);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3000
     * @tc.name mapConstructorPart04Test030
     * @tc.desc Verify Map constructor keeps long max value 9223372036854775807
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>([['max', 9223372036854775807]]);
      expect(map.get('max')).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3100
     * @tc.name mapConstructorPart04Test031
     * @tc.desc Verify Map.get() returns the double value 3.141592653589793 stored under the key "d"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>([['d', 3.141592653589793]]);
      expect(map.get('d')).assertEqual(3.141592653589793);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3200
     * @tc.name mapConstructorPart04Test032
     * @tc.desc Verify Map.get() returns the char value 'A' stored under the key "ch"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, char> = new Map<string, char>([['ch', c'A']]);
      expect(map.get('ch')).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3300
     * @tc.name mapConstructorPart04Test033
     * @tc.desc Verify Map.get() returns the bigint value BigInt(123456789) stored under the key "bi"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, bigint> = new Map<string, bigint>([['bi', BigInt(123456789)]]);
      expect(map.get('bi')).assertEqual(BigInt(123456789));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3400
     * @tc.name mapConstructorPart04Test034
     * @tc.desc Verify Map constructor skips null entries in entries array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const err: Error = new Error('e');
      const entries: ([Error, string] | null)[] = [[err, 'ok'], null];
      const map: Map<Error, string> = new Map<Error, string>(entries);
      expect(map.size).assertEqual(1);
      expect(map.get(err)).assertEqual('ok');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3500
     * @tc.name mapConstructorPart04Test035
     * @tc.desc Verify Map constructor skips undefined entries in entries array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      const entries: ([Record<string, int>, string] | undefined)[] = [[r, 'rec'], undefined];
      const map: Map<Record<string, int>, string> = new Map<Record<string, int>, string>(entries);
      expect(map.size).assertEqual(1);
      expect(map.get(r)).assertEqual('rec');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3600
     * @tc.name mapConstructorPart04Test036
     * @tc.desc Verify Map constructor with empty entries array has size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const entries: Array<[Record<string, int>, string]> = [];
      const map: Map<Record<string, int>, string> = new Map<Record<string, int>, string>(entries);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3700
     * @tc.name mapConstructorPart04Test037
     * @tc.desc Verify Map constructor accepts null argument and set still works
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Error, string> = new Map<Error, string>(null);
      const err: Error = new Error('later');
      map.set(err, 'added');
      expect(map.size).assertEqual(1);
      expect(map.get(err)).assertEqual('added');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3800
     * @tc.name mapConstructorPart04Test038
     * @tc.desc Verify a Map built from source.entries() has size 1 and get() returns the original value 55
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e: Error = new Error('src');
      const source: Map<Error, int> = new Map<Error, int>([[e, 55]]);
      const map: Map<Error, int> = new Map<Error, int>(source.entries());
      expect(map.size).assertEqual(1);
      expect(map.get(e)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_3900
     * @tc.name mapConstructorPart04Test039
     * @tc.desc Verify a Map constructed with bucketsCount=0 supports set and get, and get("key") returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(0);
      map.set('key', 42);
      expect(map.get('key')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4000
     * @tc.name mapConstructorPart04Test040
     * @tc.desc Verify a Map constructed with bucketsCount=1<<20 stores 10 keys with size 10 and forEach visits all 10 entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(1 << 20);
      for (let i: int = 0; i < 10; i++) {
        map.set('item' + i.toString(), i);
      }
      expect(map.size).assertEqual(10);
      let count: int = 0;
      map.forEach((value: int, key: string) => {
        count++;
      });
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4100
     * @tc.name mapConstructorPart04Test041
     * @tc.desc Verify bucketsCount=32 map stores 100 keys and retrieves the first, middle and last values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>(32);
      for (let i: int = 0; i < 100; i++) {
        map.set('big' + i.toString(), i);
      }
      expect(map.size).assertEqual(100);
      expect(map.get('big0')).assertEqual(0);
      expect(map.get('big50')).assertEqual(50);
      expect(map.get('big99')).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4200
     * @tc.name mapConstructorPart04Test042
     * @tc.desc Verify Map constructor keeps string key of 10000 characters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longKey: string = 'x'.repeat(10000);
      const map: Map<string, int> = new Map<string, int>([[longKey, 1]]);
      expect(map.has(longKey)).assertTrue();
      expect(map.get(longKey)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4300
     * @tc.name mapConstructorPart04Test043
     * @tc.desc Verify a Map built from an Array of string-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['x', 10], ['y', 20]];
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.get('x')).assertEqual(10);
      expect(map.get('y')).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4400
     * @tc.name mapConstructorPart04Test044
     * @tc.desc Verify a Map built from an Array of double-string pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[double, string]> = [[1.5, 'a'], [2.5, 'b']];
      const map: Map<double, string> = new Map<double, string>(fa);
      expect(map.get(1.5)).assertEqual('a');
      expect(map.get(2.5)).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4500
     * @tc.name mapConstructorPart04Test045
     * @tc.desc Verify a Map built from an Array of long-string pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[long, string]> = [[100, 'a'], [200, 'b']];
      const map: Map<long, string> = new Map<long, string>(fa);
      expect(map.get(100)).assertEqual('a');
      expect(map.get(200)).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4600
     * @tc.name mapConstructorPart04Test046
     * @tc.desc Verify a Map built from an Array of bigint-string pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const fa: Array<[bigint, string]> = [[BigInt(100), 'a'], [BigInt(200), 'b']];
        const map: Map<bigint, string> = new Map<bigint, string>(fa);
        expect(map.get(BigInt(100))).assertEqual('a');
        expect(map.get(BigInt(200))).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4700
     * @tc.name mapConstructorPart04Test047
     * @tc.desc Verify a Map built from an Array of short-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[short, int]> = [[100 as short, 1], [200 as short, 2]];
      const map: Map<short, int> = new Map<short, int>(fa);
      expect(map.get(100 as short)).assertEqual(1);
      expect(map.get(200 as short)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4800
     * @tc.name mapConstructorPart04Test048
     * @tc.desc Verify a Map built from an Array of float-string pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[float, string]> = [[1.5, 'a'], [2.5, 'b']];
      const map: Map<float, string> = new Map<float, string>(fa);
      expect(map.get(1.5)).assertEqual('a');
      expect(map.get(2.5)).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_4900
     * @tc.name mapConstructorPart04Test049
     * @tc.desc Verify a Map built from an Array of Date-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1: Date = new Date(1000, 0, 1);
      const d2: Date = new Date(2000, 0, 1);
      const fa: Array<[Date, int]> = [[d1, 1], [d2, 2]];
      const map: Map<Date, int> = new Map<Date, int>(fa);
      expect(map.get(d1)).assertEqual(1);
      expect(map.get(d2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_5000
     * @tc.name mapConstructorPart04Test050
     * @tc.desc Verify a Map built from an Array of RegExp-int pairs returns the paired values via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: RegExp = new RegExp('abc', 'g');
      const r2: RegExp = new RegExp('def', 'i');
      const fa: Array<[RegExp, int]> = [[r1, 1], [r2, 2]];
      const map: Map<RegExp, int> = new Map<RegExp, int>(fa);
      expect(map.get(r1)).assertEqual(1);
      expect(map.get(r2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_CONSTRUCTOR_PART04_TEST_5100
     * @tc.name mapConstructorPart04Test051
     * @tc.desc Verify a Map built from an Array stores an empty string key and retrieves its value via get()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapConstructorPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: Array<[string, int]> = [['', 0], ['b', 1]];
      const map: Map<string, int> = new Map<string, int>(fa);
      expect(map.get('')).assertEqual(0);
      expect(map.has('')).assertTrue();
    });

  });
}
