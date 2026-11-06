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
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

interface ObjKey {
  id: int;
}

export default function mapSetPart04TestTest(): void {
  describe('MapSetPart04TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0100
     * @tc.name mapSetPart04Test001
     * @tc.desc Verify set with long.MAX key -- arity=2 works with boundary long key type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const lkey: long = 9223372036854775807;
      map.set(lkey, 42);
      expect(map.get(lkey)!).assertEqual(42);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0200
     * @tc.name mapSetPart04Test002
     * @tc.desc Verify Map set key=long.MIN(-9223372036854775808) has returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const minLongKey: long = -9223372036854775807 - 1;
      map.set(minLongKey, 200);
      expect(map.has(minLongKey)).assertTrue();
      let minLongValue: int | undefined = map.get(minLongKey);
      expect(minLongValue).assertEqual(200);
      let sizeVal: int = map.size;
      expect(sizeVal).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0300
     * @tc.name mapSetPart04Test003
     * @tc.desc Verify set int key 0 twice then get returns last value and size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(0, 77);
      map.set(0, 88);
      expect(map.get(0)!).assertEqual(88);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0400
     * @tc.name mapSetPart04Test004
     * @tc.desc Verify set key=-1 (int negative boundary), verify has returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(-1, 88);
      expect(map.has(-1)).assertTrue();
      expect(map.get(-1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0500
     * @tc.name mapSetPart04Test005
     * @tc.desc Verify set key=empty string, verify get returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 999);
      expect(map.size).assertEqual(1);
      expect(map.has('')).assertTrue();
      expect(map.get('')!).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0600
     * @tc.name mapSetPart04Test006
     * @tc.desc Verify set key=int.MAX (2147483647), verify get returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(2147483647, 10);
      expect(map.size).assertEqual(1);
      expect(map.has(2147483647)).assertTrue();
      expect(map.get(2147483647)!).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0700
     * @tc.name mapSetPart04Test007
     * @tc.desc Verify set value=long.MAX as value, verify get returns exact long value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      const lmax: long = 9223372036854775807;
      map.set('k', lmax);
      expect(map.get('k')!).assertEqual(lmax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0800
     * @tc.name mapSetPart04Test008
     * @tc.desc Verify set value=Number.NEGATIVE_INFINITY, verify get returns that exact value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      map.set('infKey', Number.NEGATIVE_INFINITY);
      expect(map.get('infKey')!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_0900
     * @tc.name mapSetPart04Test009
     * @tc.desc Verify set value=NaN (double), verify get returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      map.set('nanKey', Number.NaN);
      expect(map.has('nanKey')).assertTrue();
      expect(isNaN(map.get('nanKey')!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1000
     * @tc.name mapSetPart04Test010
     * @tc.desc Verify set value=empty string, verify get returns empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('emptyVal', '');
      expect(map.get('emptyVal')!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1100
     * @tc.name mapSetPart04Test011
     * @tc.desc Verify set with K=string V=int instantiation, verify set/get roundtrip
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('hello', 42);
      expect(map.has('hello')).assertTrue();
      expect(map.get('hello')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1200
     * @tc.name mapSetPart04Test012
     * @tc.desc Verify set with K=double V=boolean instantiation, verify set/get roundtrip
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, boolean> = new Map<double, boolean>();
      map.set(2.5, true);
      expect(map.has(2.5)).assertTrue();
      expect(map.get(2.5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1300
     * @tc.name mapSetPart04Test013
     * @tc.desc Verify chain set with Number.NEGATIVE_INFINITY value returns this
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      const result: Map<string, double> = map.set('negInf', Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(map);
      expect(map.get('negInf')!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1400
     * @tc.name mapSetPart04Test014
     * @tc.desc Verify set with long.MAX key twice, second overwrites
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      const lmax: long = 9223372036854775807;
      map.set(lmax, 5);
      map.set(lmax, 15);
      expect(map.get(lmax)!).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1500
     * @tc.name mapSetPart04Test015
     * @tc.desc Verify set with int.MIN key, verify value roundtrip through get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(-2147483648, 888);
      expect(map.get(-2147483648)!).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1600
     * @tc.name mapSetPart04Test016
     * @tc.desc Verify Map set duplicate key (b) overwrite size unchanged=3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      map.set('b', 200);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1700
     * @tc.name mapSetPart04Test017
     * @tc.desc Verify forEach() callback set() overwrites key inside iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('x', 10);
      map.set('y', 20);
      map.forEach((value: int, key: string): void => {
        if (key === 'x') {
          map.set('x', 999);
        }
      });
      expect(map.get('x')!).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1800
     * @tc.name mapSetPart04Test018
     * @tc.desc Verify delete() one key keeps other key has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('keep', 50);
      map.set('remove', 60);
      expect(map.get('keep')!).assertEqual(50);
      map.delete('remove');
      expect(map.has('keep')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_1900
     * @tc.name mapSetPart04Test019
     * @tc.desc Verify set() emoji key value overwrite last-wins size 1 get() 84
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('😀', 42);
      map.set('😀', 84);
      expect(map.has('😀')).assertTrue();
      expect(map.size).assertEqual(1);
      expect(map.get('😀')).assertEqual(84);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2000
     * @tc.name mapSetPart04Test020
     * @tc.desc Verify set() XSS key overwrite keeps first iteration position size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      const xssKey: string = '<script>alert(1)</script>';
      map.set(xssKey, 100);
      map.set('normal', 300);
      map.set(xssKey, 200);
      const iter = map.keys();
      expect(iter.next().value).assertEqual(xssKey);
      expect(iter.next().value).assertEqual('normal');
      expect(map.get(xssKey)).assertEqual(200);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2100
     * @tc.name mapSetPart04Test021
     * @tc.desc Verify set() int.MAX key has() true and int.MIN key absent size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>();
      map.set(2147483647, 'maxKey');
      expect(map.has(2147483647)).assertTrue();
      expect(map.has(-2147483648)).assertFalse();
      expect(map.get(2147483647)).assertEqual('maxKey');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2200
     * @tc.name mapSetPart04Test022
     * @tc.desc Verify set() int0 key inserted first keeps first iteration position size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>();
      map.set(0, 'zeroKey');
      map.set(1, 'oneKey');
      const iter = map.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(map.get(0)).assertEqual('zeroKey');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2300
     * @tc.name mapSetPart04Test023
     * @tc.desc Verify key=long.MIN set(long.MIN, v1) set(long.MIN, v2) size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>();
      const minKey: long = -9223372036854775807 - 1;
      map.set(minKey, 'oldLongVal');
      map.set(minKey, 'newLongVal');
      expect(map.size).assertEqual(1);
      expect(map.get(minKey)).assertEqual('newLongVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2400
     * @tc.name mapSetPart04Test024
     * @tc.desc Verify set() Date key overwrite last-wins size 1 get() 200
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Date, int>();
      const keyDate: Date = new Date(1700000000000);
      map.set(keyDate, 100);
      map.set(keyDate, 200);
      expect(map.size).assertEqual(1);
      expect(map.get(keyDate)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2500
     * @tc.name mapSetPart04Test025
     * @tc.desc Verify set() Date key reference identity: has(sameTimeDate) false size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Date, int>();
      const keyDate: Date = new Date(1700000000000);
      const otherDate: Date = new Date(1700000000000);
      map.set(keyDate, 1);
      map.set(otherDate, 2);
      expect(map.size).assertEqual(2);
      expect(map.has(otherDate)).assertTrue();
      const sameTimeDate: Date = new Date(1700000000000);
      expect(map.has(sameTimeDate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2600
     * @tc.name mapSetPart04Test026
     * @tc.desc Verify set() RegExp reference keys distinct: different instances size 2 get() each
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const firstRegex: RegExp = new RegExp('abc', 'g');
      const secondRegex: RegExp = new RegExp('abc', 'g');
      expect(firstRegex).not().assertEqual(secondRegex);
      map.set(firstRegex, 1);
      map.set(secondRegex, 2);
      expect(map.size).assertEqual(2);
      expect(map.get(firstRegex)).assertEqual(1);
      expect(map.get(secondRegex)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2700
     * @tc.name mapSetPart04Test027
     * @tc.desc Verify RegExp key delete then re-set last-wins value 25 size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const keyRe: RegExp = new RegExp('pattern', 'g');
      map.set(keyRe, 5);
      map.set(keyRe, 15);
      map.delete(keyRe);
      expect(map.has(keyRe)).assertFalse();
      map.set(keyRe, 25);
      expect(map.size).assertEqual(1);
      expect(map.get(keyRe)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2800
     * @tc.name mapSetPart04Test028
     * @tc.desc Verify object key delete then re-set last-wins value 30 size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<ObjKey, int>();
      const obj: ObjKey = { id: 1 };
      map.set(obj, 10);
      map.set(obj, 20);
      map.delete(obj);
      expect(map.has(obj)).assertFalse();
      map.set(obj, 30);
      expect(map.get(obj)).assertEqual(30);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_2900
     * @tc.name mapSetPart04Test029
     * @tc.desc Verify object key reference identity: mutate obj.id after set, has true size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<ObjKey, int>();
      const objA: ObjKey = { id: 1 };
      map.set(objA, 10);
      objA.id = 99;
      expect(map.has(objA)).assertTrue();
      expect(map.get(objA)).assertEqual(10);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3000
     * @tc.name mapSetPart04Test030
     * @tc.desc Verify Map set 4 distinct keys size increments 1,2,3,4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      expect(map.size).assertEqual(1);
      expect(map.get('a')).assertEqual(1);
      map.set('b', 2);
      expect(map.size).assertEqual(2);
      expect(map.get('b')).assertEqual(2);
      map.set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('c')).assertEqual(3);
      map.set('d', 4);
      expect(map.size).assertEqual(4);
      expect(map.get('d')).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3100
     * @tc.name mapSetPart04Test031
     * @tc.desc Verify forEach() key iteration order preserved after set() value overwrite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let keysBefore: string[] = [];
      map.forEach((_value: int, key: string): void => {
        keysBefore.push(key);
      });
      map.set('b', 200);
      let keysAfter: string[] = [];
      map.forEach((_value: int, key: string): void => {
        keysAfter.push(key);
      });
      expect(keysBefore.length).assertEqual(keysAfter.length);
      for (let i = 0; i < keysBefore.length; i++) {
        expect(keysBefore[i]).assertEqual(keysAfter[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3200
     * @tc.name mapSetPart04Test032
     * @tc.desc Verify long key 2147483648 (int.MAX+1) set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>();
      const overflowKey: long = 2147483648;
      map.set(overflowKey, 'overflow');
      expect(map.has(overflowKey)).assertTrue();
      expect(map.get(overflowKey)).assertEqual('overflow');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3300
     * @tc.name mapSetPart04Test033
     * @tc.desc Verify Map<int, long> K=int V=long set/get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, long>();
      const lmax: long = 9223372036854775807;
      map.set(1, Int.toLong(100));
      map.set(2, lmax);
      expect(map.get(1)).assertEqual(Int.toLong(100));
      expect(map.get(2)).assertEqual(lmax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3400
     * @tc.name mapSetPart04Test034
     * @tc.desc Verify Map<long, boolean> set() long key then get() boolean value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, boolean>();
      map.set(Int.toLong(1), true);
      map.set(Int.toLong(2), false);
      expect(map.get(Int.toLong(1))).assertTrue();
      expect(map.get(Int.toLong(2))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3500
     * @tc.name mapSetPart04Test035
     * @tc.desc Verify Map<boolean, double> set() boolean key then get() double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, double>();
      map.set(true, 3.14);
      map.set(false, -2.718);
      const resultTrue = map.get(true);
      const resultFalse = map.get(false);
      expect(resultTrue).assertEqual(3.14);
      expect(resultFalse).assertEqual(-2.718);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3600
     * @tc.name mapSetPart04Test036
     * @tc.desc Verify Map<Date, double> set() Date key then get() double value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Date, double>();
      const d: Date = new Date(1700000000000);
      map.set(d, 1.5);
      const result = map.get(d);
      expect(result).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3700
     * @tc.name mapSetPart04Test037
     * @tc.desc Verify Map<RegExp, short> set() RegExp key then get() short value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, short>();
      const re: RegExp = new RegExp('test', 'i');
      map.set(re, Int.toShort(100));
      expect(map.get(re)).assertEqual(Int.toShort(100));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3800
     * @tc.name mapSetPart04Test038
     * @tc.desc Verify Map<string, float> K=string V=float float set/get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, float>();
      map.set('pi', Double.toFloat(3.14));
      const result = map.get('pi');
      expect(result).assertEqual(Double.toFloat(3.14));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_3900
     * @tc.name mapSetPart04Test039
     * @tc.desc Verify Map<string, string | null> union V null value set/get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string | null>();
      map.set('a', 'valid');
      map.set('b', null);
      expect(map.get('a')).assertEqual('valid');
      expect(map.get('b')).assertNull();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4000
     * @tc.name mapSetPart04Test040
     * @tc.desc Verify Map<int, string | undefined> union V undefined value set/get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string | undefined>();
      map.set(1, 'defined');
      map.set(2, undefined);
      expect(map.get(1)).assertEqual('defined');
      expect(map.get(2)).assertUndefined();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4100
     * @tc.name mapSetPart04Test041
     * @tc.desc Verify Map<int, string> set returns this and keys() order 1 then 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>();
      map.set(1, 'one');
      const ret = map.set(2, 'two');
      expect(ret).assertEqual(map);
      const iter = ret.keys();
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().value).assertEqual(2);
      expect(map.get(2)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4200
     * @tc.name mapSetPart04Test042
     * @tc.desc Verify Map<double, int> set returns this and get 20 size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>();
      map.set(1.5, 10);
      const ret = map.set(2.5, 20);
      expect(ret).assertEqual(map);
      expect(map.get(2.5)).assertEqual(20);
      let szAfter: int = map.size;
      expect(szAfter).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4300
     * @tc.name mapSetPart04Test043
     * @tc.desc Verify Map<long, string> set returns this and get(2) b size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>();
      map.set(Int.toLong(1), 'a');
      const ret = map.set(Int.toLong(2), 'b');
      expect(ret).assertEqual(map);
      expect(map.get(Int.toLong(2))).assertEqual('b');
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4400
     * @tc.name mapSetPart04Test044
     * @tc.desc Verify Map<byte, int> set byte.MAX returns this and get 255 size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, int>();
      const byteMax: byte = Int.toByte(127);
      const ret = map.set(byteMax, 255);
      expect(ret).assertEqual(map);
      expect(map.get(byteMax)).assertEqual(255);
      let szAfter: int = map.size;
      expect(szAfter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4500
     * @tc.name mapSetPart04Test045
     * @tc.desc Verify Map<RegExp, int> set returns this and get 100 size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const re: RegExp = new RegExp('abc', 'g');
      const ret = map.set(re, 100);
      expect(ret).assertEqual(map);
      expect(map.get(re)).assertEqual(100);
      let szAfter: int = map.size;
      expect(szAfter).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4600
     * @tc.name mapSetPart04Test046
     * @tc.desc Verify set() returns the same Map and stores value 20 for NaN key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>();
      map.set(1.0, 10);
      const ret = map.set(Number.NaN, 20);
      expect(ret).assertEqual(map);
      expect(map.get(Number.NaN)!).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4700
     * @tc.name mapSetPart04Test047
     * @tc.desc Verify Map set overwrite duplicate key size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      const sizeBefore: int = map.size;
      map.set('a', 2);
      expect(map.size).assertEqual(sizeBefore);
      expect(map.get('a')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4800
     * @tc.name mapSetPart04Test048
     * @tc.desc Verify Map<double, int> NaN key set size 1 NaN key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>();
      map.set(Number.NaN, 1);
      map.set(Number.NaN, 2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_4900
     * @tc.name mapSetPart04Test049
     * @tc.desc Verify set() duplicate key overwrite dedupes size to 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('a', 10).set('b', 2).set('b', 20).set('c', 3);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5000
     * @tc.name mapSetPart04Test050
     * @tc.desc Verify chained set of five keys then get first middle last values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('k1', 1)
        .set('k2', 2)
        .set('k3', 3)
        .set('k4', 4)
        .set('k5', 5);
      expect(map.get('k1')).assertEqual(1);
      expect(map.get('k3')).assertEqual(3);
      expect(map.get('k5')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5100
     * @tc.name mapSetPart04Test051
     * @tc.desc Verify Map<boolean, int> set(true).set(false) key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, int>();
      map.set(true, 10).set(false, 20);
      expect(map.get(true)).assertEqual(10);
      expect(map.get(false)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5200
     * @tc.name mapSetPart04Test052
     * @tc.desc Verify chained byte set return map get size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, int>();
      const ret = map.set(Int.toByte(10), 100).set(Int.toByte(20), 200);
      expect(ret).assertEqual(map);
      expect(ret.size).assertEqual(2);
      expect(ret.get(Int.toByte(10))).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5300
     * @tc.name mapSetPart04Test053
     * @tc.desc Verify Map<RegExp,int> set() two RegExp keys then get() each returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const abcRegExp: RegExp = new RegExp('abc', 'g');
      const defRegExp: RegExp = new RegExp('def', 'i');
      const ret = map.set(abcRegExp, 1).set(defRegExp, 2);
      expect(ret.size).assertEqual(2);
      expect(ret.get(abcRegExp)).assertEqual(1);
      expect(ret.get(defRegExp)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5400
     * @tc.name mapSetPart04Test054
     * @tc.desc Verify chained set returns same Map reference and get on chain
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      const chained: Map<string, int> = map.set('b', 2).set('c', 3);
      expect(chained).assertEqual(map);
      expect(chained.get('c')).assertEqual(3);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5500
     * @tc.name mapSetPart04Test055
     * @tc.desc Verify Map<RegExp, int> set has pattern key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const re: RegExp = new RegExp('test', 'g');
      map.set(re, 42);
      const sameRe: RegExp = new RegExp('test', 'g');
      let hasOriginal: boolean = map.has(re);
      expect(hasOriginal).assertTrue();
      let hasSameValueRe: boolean = map.has(sameRe);
      expect(hasSameValueRe).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5600
     * @tc.name mapSetPart04Test056
     * @tc.desc Verify set() Date key entries() first entry key is same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<Date, int>();
      const d: Date = new Date(2026, 6, 8);
      map.set(d, 100);
      expect(map.has(d)).assertTrue();
      const eit: IterableIterator<[Date, int]> = map.entries();
      const entry: [Date, int] = eit.next().value!;
      expect(entry[0]).assertEqual(d);
      expect(entry[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5700
     * @tc.name mapSetPart04Test057
     * @tc.desc Verify entries() live iterator sees set() key added during iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('k1', 1);
      map.set('k2', 2);
      let iter = map.entries();
      map.set('k3', 3);
      expect(map.has('k3')).assertTrue();
      let sawNew: boolean = false;
      let rest = iter.next();
      while (!rest.done) {
        const nv = rest.value;
        if (nv !== undefined && nv[0] === 'k3') {
          sawNew = true;
        }
        rest = iter.next();
      }
      expect(sawNew).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5800
     * @tc.name mapSetPart04Test058
     * @tc.desc Verify set entryKey then entries() iteration finds it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('entryKey', 65);
      let foundEntry: boolean = false;
      let iter = map.entries();
      let next = iter.next();
      while (!next.done) {
        const nv = next.value;
        if (nv !== undefined && nv[0] === 'entryKey') {
          foundEntry = true;
        }
        next = iter.next();
      }
      expect(foundEntry).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_5900
     * @tc.name mapSetPart04Test059
     * @tc.desc Verify Map set overwrite updateMe with value 500 reflects updated value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('updateMe', 5);
      map.set('updateMe', 500);
      let iter = map.entries();
      let next = iter.next();
      let entryValue: int = 0;
      while (!next.done) {
        const nv = next.value;
        if (nv !== undefined && nv[0] === 'updateMe') {
          entryValue = nv[1];
        }
        next = iter.next();
      }
      expect(entryValue).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_6000
     * @tc.name mapSetPart04Test060
     * @tc.desc Verify set returns this and keys() order preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      const ret = map.set('d', 4);
      expect(ret).assertEqual(map);
      const iter = ret.keys();
      let firstKey: string | undefined = iter.next().value;
      let secondKey: string | undefined = iter.next().value;
      let thirdKey: string | undefined = iter.next().value;
      let fourthKey: string | undefined = iter.next().value;
      expect(firstKey).assertEqual('a');
      expect(secondKey).assertEqual('b');
      expect(thirdKey).assertEqual('c');
      expect(fourthKey).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_6100
     * @tc.name mapSetPart04Test061
     * @tc.desc Verify set long key 0 then get retrieves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, int> = new Map<long, int>();
      map.set(Int.toLong(0), 3);
      expect(map.get(Int.toLong(0))!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART04_TEST_6200
     * @tc.name mapSetPart04Test062
     * @tc.desc Verify val=Date overwrite set Date(1000) set Date(2000) get returns Date(2000)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Date>();
      const firstDate: Date = new Date(1000);
      const secondDate: Date = new Date(2000);
      map.set('k', firstDate);
      map.set('k', secondDate);
      let gotValue: Date = map.get('k')!;
      expect(gotValue.getTime()).assertEqual(2000);
    });
  });
}
