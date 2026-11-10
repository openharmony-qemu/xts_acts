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

interface ObjKey2 {
  x: int;
  y: int;
}

class ValClass {
  data: int = 0;
}

enum IntEnum {
  A = 1,
  B = 2,
  C = 3,
  X = 10,
  Y = 20,
}

enum StrEnum {
  HELLO = 'hello',
  WORLD = 'world',
  FOO = 'foo',
  BAR = 'bar',
}

export default function mapOverviewPart04TestTest(): void {
  describe('MapOverviewPart04TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0100
     * @tc.name mapOverviewPart04Test001
     * @tc.desc Verify set() overwrite existing key keeps size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.set('a', 2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0200
     * @tc.name mapOverviewPart04Test002
     * @tc.desc Verify set existing key keeps insertion order keys a b c
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
        ['c', 3],
      ]);
      map.set('b', 200);
      const iter = map.keys();
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().value).assertEqual('b');
      expect(iter.next().value).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0300
     * @tc.name mapOverviewPart04Test003
     * @tc.desc Verify set() existing key then has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.set('a', 2);
      expect(map.has('a')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0400
     * @tc.name mapOverviewPart04Test004
     * @tc.desc Verify delete() existing key then has() false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.delete('a');
      expect(map.has('a')).assertFalse();
      expect(map.get('a')).assertUndefined();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0500
     * @tc.name mapOverviewPart04Test005
     * @tc.desc Verify delete() nonexistent key returns false and size stays 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      expect(map.delete('b')).assertFalse();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0600
     * @tc.name mapOverviewPart04Test006
     * @tc.desc Verify get missing key on empty Map returns undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      const result = map.get('a');
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0700
     * @tc.name mapOverviewPart04Test007
     * @tc.desc Verify get returns array reference passed as value to set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, Array<int>>([['a', [100]]]);
      const dst = new Map<string, Array<int>>();
      const v: Array<int> = src.get('a')!;
      dst.set('b', v);
      let gotVal: Array<int> = dst.get('b')!;
      expect(gotVal).assertEqual(v);
      expect(gotVal[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0800
     * @tc.name mapOverviewPart04Test008
     * @tc.desc Verify new Map from entries() then get a b values 1 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const copy = new Map<string, int>(original.entries());
      expect(copy.get('a')).assertEqual(1);
      expect(copy.get('b')).assertEqual(2);
      expect(copy.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_0900
     * @tc.name mapOverviewPart04Test009
     * @tc.desc Verify clear then reuse Map old key invisible and new key only entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.clear();
      map.set('b', 2);
      expect(map.size).assertEqual(1);
      expect(map.has('a')).assertFalse();
      expect(map.has('b')).assertTrue();
      let keyIter: IterableIterator<string> = map.keys();
      let firstKey: string | undefined = keyIter.next().value;
      expect(firstKey).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1000
     * @tc.name mapOverviewPart04Test010
     * @tc.desc Verify clear empties Map size 0 has false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.clear();
      expect(map.size).assertEqual(0);
      expect(map.has('a')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1100
     * @tc.name mapOverviewPart04Test011
     * @tc.desc Verify two independent entries() iterators both start at first entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const outer = map.entries();
      const inner = map.entries();
      const outerFirst = outer.next().value;
      const innerFirst = inner.next().value;
      expect(outerFirst![0]).assertEqual('a');
      expect(innerFirst![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1200
     * @tc.name mapOverviewPart04Test012
     * @tc.desc Verify nested forEach same Map runs 1 inner call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      let nestedCount: int = 0;
      map.forEach((_outerValue: int, _outerKey: string) => {
        map.forEach((_innerValue: int, _innerKey: string) => {
          nestedCount = nestedCount + 1;
        });
      });
      expect(nestedCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1300
     * @tc.name mapOverviewPart04Test013
     * @tc.desc Verify toString Map Record custom flatten format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('b', 2);
      map.set('a', 1);
      const result = map.toString();
      expect(result).assertEqual('b,2,a,1');
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1400
     * @tc.name mapOverviewPart04Test014
     * @tc.desc Verify toString empty Map returns [object Map]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      expect(map.toString()).assertEqual('[object Map]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1500
     * @tc.name mapOverviewPart04Test015
     * @tc.desc Verify forEach copies entries to new Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const dst = new Map<string, int>();
      src.forEach((value: int, key: string) => {
        dst.set(key, value);
      });
      expect(dst.get('a')).assertEqual(1);
      expect(dst.get('b')).assertEqual(2);
      expect(dst.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1600
     * @tc.name mapOverviewPart04Test016
     * @tc.desc Verify set(0x7fffffffffffffff long value) get same value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, long>();
      const lMax: long = 0x7fffffffffffffff;
      map.set('a', lMax);
      let storedValue: long | undefined = map.get('a');
      let expectedValue: long = 0x7fffffffffffffff;
      expect(storedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1700
     * @tc.name mapOverviewPart04Test017
     * @tc.desc Verify set(Infinity float value) get Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, float>();
      map.set('a', Double.toFloat(Number.POSITIVE_INFINITY));
      const result: float | undefined = map.get('a');
      expect(result).assertEqual(Double.toFloat(Number.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1800
     * @tc.name mapOverviewPart04Test018
     * @tc.desc Verify set(-Infinity float value) get -Infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, float>();
      map.set('a', -Double.toFloat(Number.POSITIVE_INFINITY));
      const result: float | undefined = map.get('a');
      expect(result).assertEqual(-Double.toFloat(Number.POSITIVE_INFINITY));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_1900
     * @tc.name mapOverviewPart04Test019
     * @tc.desc Verify set(undefined value) get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string | undefined>();
      map.set('a', undefined);
      expect(map.get('a')).assertUndefined();
      expect(map.has('a')).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2000
     * @tc.name mapOverviewPart04Test020
     * @tc.desc Verify set() then entries().next() yields [key,value] pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('first', 1);
      const entry = map.entries().next().value;
      expect(entry![0]).assertEqual('first');
      expect(entry![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2100
     * @tc.name mapOverviewPart04Test021
     * @tc.desc Verify keys() iterator then set() new key keeps first key size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      const iter = map.keys();
      map.set('b', 2);
      const firstKey = iter.next().value;
      expect(map.size).assertEqual(2);
      expect(firstKey).assertEqual('a');
      expect(iter.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2200
     * @tc.name mapOverviewPart04Test022
     * @tc.desc Verify entries() iterator then delete() removes entry from iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const iter = map.entries();
      map.delete('b');
      const first = iter.next().value;
      expect(first![0]).assertEqual('a');
      expect(map.size).assertEqual(1);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2300
     * @tc.name mapOverviewPart04Test023
     * @tc.desc Verify values() live iterator observes new value after set() overwrite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 10],
        ['b', 20],
      ]);
      const iter = map.values();
      map.set('a', 999);
      const firstVal = iter.next().value;
      expect(firstVal).assertEqual(999);
      let actualSize: int = map.size;
      let expectedSize: int = 2;
      expect(actualSize).assertEqual(expectedSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2400
     * @tc.name mapOverviewPart04Test024
     * @tc.desc Verify forEach delete all keys then size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      map.forEach((_value: int, key: string) => {
        map.delete(key);
      });
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2500
     * @tc.name mapOverviewPart04Test025
     * @tc.desc Verify keys() iterator done true after clear and size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const iter = map.keys();
      map.clear();
      const first = iter.next();
      expect(first.done).assertTrue();
      expect(first.value).assertUndefined();
      let actualSize: int = map.size;
      let expectedSize: int = 0;
      expect(actualSize).assertEqual(expectedSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2600
     * @tc.name mapOverviewPart04Test026
     * @tc.desc Verify values next value undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      const iter = map.values();
      iter.next();
      const exhausted = iter.next();
      expect(exhausted.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2700
     * @tc.name mapOverviewPart04Test027
     * @tc.desc Verify entries next done true value undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      const iter = map.entries();
      iter.next();
      const exhausted = iter.next();
      expect(exhausted.done).assertTrue();
      expect(exhausted.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2800
     * @tc.name mapOverviewPart04Test028
     * @tc.desc Verify for...of keys() iterates all stored keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const iter = map.keys();
      let keySeq: string = '';
      for (const key of iter) {
        keySeq = keySeq + key;
      }
      expect(keySeq).assertEqual('ab');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_2900
     * @tc.name mapOverviewPart04Test029
     * @tc.desc Verify set() long.MIN value then get() returns long.MIN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, long>();
      const lmin: long = -9223372036854775807 - 1;
      map.set('min', lmin);
      expect(map.get('min')).assertEqual(lmin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3000
     * @tc.name mapOverviewPart04Test030
     * @tc.desc Verify set() float NaN value then get() returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, float>();
      map.set('nan', Double.toFloat(Number.NaN));
      const result: float | undefined = map.get('nan');
      let hasNanKey: boolean = map.has('nan');
      expect(hasNanKey).assertTrue();
      const isNanResult: boolean = isNaN(result!);
      expect(isNanResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3100
     * @tc.name mapOverviewPart04Test031
     * @tc.desc Verify set() boolean true false keys yields size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, int>();
      map.set(true, 1);
      map.set(false, 0);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3200
     * @tc.name mapOverviewPart04Test032
     * @tc.desc Verify Record $_set then Map reference get returns 50
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      record.$_set('shared', 50);
      const mapRef: Map<string, int> = record;
      expect(mapRef.get('shared')).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3300
     * @tc.name mapOverviewPart04Test033
     * @tc.desc Verify Record.$_set then Map.has() true (Record as Map)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      record.$_set('key', 1);
      const mapRef: Map<string, int> = record;
      expect(mapRef.has('key')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3400
     * @tc.name mapOverviewPart04Test034
     * @tc.desc Verify Map.set via reference then Record $_get returns 77
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      const mapRef: Map<string, int> = record;
      mapRef.set('viaMap', 77);
      expect(record.$_get('viaMap')).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3500
     * @tc.name mapOverviewPart04Test035
     * @tc.desc Verify Map.delete Record.$_get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      record.$_set('delKey', 1);
      const mapRef: Map<string, int> = record;
      mapRef.delete('delKey');
      expect(record.$_get('delKey')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3600
     * @tc.name mapOverviewPart04Test036
     * @tc.desc Verify Record $_set keys() iterator next() value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      record.$_set('x', 1);
      record.$_set('y', 2);
      const iter = record.keys();
      expect(iter.next().value).assertEqual('x');
      expect(iter.next().value).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3700
     * @tc.name mapOverviewPart04Test037
     * @tc.desc Verify Record $_set and Map.set share same size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      record.$_set('a', 1);
      const mapRef: Map<string, int> = record;
      mapRef.set('b', 2);
      expect(record.size).assertEqual(2);
      expect(mapRef.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3800
     * @tc.name mapOverviewPart04Test038
     * @tc.desc Verify Record $_set entries() iterator next() value size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, int>();
      record.$_set('a', 1);
      record.$_set('b', 2);
      const iter1 = record.entries();
      record.$_set('a', 100);
      const firstEntry = iter1.next().value;
      let entryKey: string = firstEntry![0];
      let expectedKey: string = 'a';
      expect(entryKey).assertEqual(expectedKey);
      let entryValue: int = firstEntry![1];
      let expectedEntryValue: int = 100;
      expect(entryValue).assertEqual(expectedEntryValue);
      let actualSize: int = record.size;
      let expectedSize: int = 2;
      expect(actualSize).assertEqual(expectedSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_3900
     * @tc.name mapOverviewPart04Test039
     * @tc.desc Verify Map with string|int union key stores both, get() each
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string | int, int>();
      map.set('strKey', 1);
      map.set(42, 2);
      expect(map.get('strKey')).assertEqual(1);
      expect(map.get(42)).assertEqual(2);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4000
     * @tc.name mapOverviewPart04Test040
     * @tc.desc Verify clear after delete and set churn empties Map size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.delete('a');
      map.set('c', 3);
      map.delete('b');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4100
     * @tc.name mapOverviewPart04Test041
     * @tc.desc Verify set two keys then values() iteration returns 10 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('first', 10);
      map.set('second', 20);
      const iter = map.values();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4200
     * @tc.name mapOverviewPart04Test042
     * @tc.desc Verify forEach count equals size and keys a b c
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('c', 3);
      let count: int = 0;
      let keySeq: string = '';
      map.forEach((_v: int, key: string) => {
        count = count + 1;
        keySeq = keySeq + key;
      });
      expect(count).assertEqual(map.size);
      expect(keySeq).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4300
     * @tc.name mapOverviewPart04Test043
     * @tc.desc Verify set+toString Map custom flatten format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('x', 1);
      map.set('y', 2);
      map.delete('x');
      map.set('x', 10);
      const str: string = map.toString();
      expect(str).assertEqual('y,2,x,10');
      expect(map.get('x')).assertEqual(10);
      expect(map.get('y')).assertEqual(2);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4400
     * @tc.name mapOverviewPart04Test044
     * @tc.desc Verify Map forEach callbackfn count=3 sum=6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
        ['c', 3],
      ]);
      let count: int = 0;
      let sum: int = 0;
      map.forEach((_v: int, _k: string) => {
        count = count + 1;
        sum = sum + _v;
      });
      expect(count).assertEqual(3);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4500
     * @tc.name mapOverviewPart04Test045
     * @tc.desc Verify K=float NaN key set has NaN true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, string>();
      const nanKey: float = Double.toFloat(Number.NaN);
      map.set(nanKey, 'nanVal');
      expect(map.has(nanKey)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4600
     * @tc.name mapOverviewPart04Test046
     * @tc.desc Verify K=float NaN key set get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, string>();
      const nanKey: float = Double.toFloat(Number.NaN);
      map.set(nanKey, 'nanVal');
      expect(map.get(nanKey)).assertEqual('nanVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4700
     * @tc.name mapOverviewPart04Test047
     * @tc.desc Verify K=float +Infinity key has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      map.set(Double.toFloat(Number.POSITIVE_INFINITY), 1);
      expect(map.has(Double.toFloat(Number.POSITIVE_INFINITY))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4800
     * @tc.name mapOverviewPart04Test048
     * @tc.desc Verify K=float +Infinity key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      map.set(Double.toFloat(Number.POSITIVE_INFINITY), 999);
      expect(map.get(Double.toFloat(Number.POSITIVE_INFINITY))).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_4900
     * @tc.name mapOverviewPart04Test049
     * @tc.desc Verify K=float -Infinity key has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      map.set(-Double.toFloat(Number.POSITIVE_INFINITY), -1);
      expect(map.has(-Double.toFloat(Number.POSITIVE_INFINITY))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5000
     * @tc.name mapOverviewPart04Test050
     * @tc.desc Verify K=float -Infinity key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      map.set(-Double.toFloat(Number.POSITIVE_INFINITY), -999);
      expect(map.get(-Double.toFloat(Number.POSITIVE_INFINITY))).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5100
     * @tc.name mapOverviewPart04Test051
     * @tc.desc Verify K=float -0.0 key has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, string>();
      map.set(Double.toFloat(-0.0), 'negZero');
      expect(map.has(Double.toFloat(-0.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5200
     * @tc.name mapOverviewPart04Test052
     * @tc.desc Verify set() float +0.0 and -0.0 keys collapse to one entry
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, string>();
      map.set(Double.toFloat(0.0), 'posZero');
      map.set(Double.toFloat(-0.0), 'negZero');
      let actualSize: int = map.size;
      let expectedSize: int = 1;
      expect(actualSize).assertEqual(expectedSize);
      let zeroKeyResult: string | undefined = map.get(Double.toFloat(0.0));
      let expectedZeroKey: string = 'negZero';
      expect(zeroKeyResult).assertEqual(expectedZeroKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5300
     * @tc.name mapOverviewPart04Test053
     * @tc.desc Verify K=float MAX_VALUE(3.4028235e38) key set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      const maxVal: float = Double.toFloat(3.4028235e38);
      map.set(maxVal, 1);
      expect(map.get(maxVal)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5400
     * @tc.name mapOverviewPart04Test054
     * @tc.desc Verify K=float MIN_VALUE(1.4e-45) key set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      const minVal: float = Double.toFloat(1.4e-45);
      map.set(minVal, 2);
      expect(map.has(minVal)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5500
     * @tc.name mapOverviewPart04Test055
     * @tc.desc Verify K=double NaN key set has NaN true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, string>();
      map.set(Number.NaN, 'nan');
      expect(map.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5600
     * @tc.name mapOverviewPart04Test056
     * @tc.desc Verify K=double NaN key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>();
      map.set(Number.NaN, 42);
      expect(map.get(Number.NaN)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5700
     * @tc.name mapOverviewPart04Test057
     * @tc.desc Verify K=double +Infinity key has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, string>();
      map.set(Number.POSITIVE_INFINITY, 'posInf');
      expect(map.has(Number.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5800
     * @tc.name mapOverviewPart04Test058
     * @tc.desc Verify K=double -Infinity key get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>();
      map.set(Number.NEGATIVE_INFINITY, -1);
      expect(map.get(Number.NEGATIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_5900
     * @tc.name mapOverviewPart04Test059
     * @tc.desc Verify K=double Number.EPSILON key set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, string>();
      map.set(Number.EPSILON, 'epsilon');
      expect(map.has(Number.EPSILON)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6000
     * @tc.name mapOverviewPart04Test060
     * @tc.desc Verify K=double MAX_VALUE key set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<double, int>();
      map.set(Number.MAX_VALUE, 100);
      expect(map.get(Number.MAX_VALUE)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6100
     * @tc.name mapOverviewPart04Test061
     * @tc.desc Verify K=RegExp pattern set get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const keyRegExp: RegExp = new RegExp('abc', 'g');
      const otherRegExp: RegExp = new RegExp('abc', 'g');
      map.set(keyRegExp, 100);
      let re1Value: int | undefined = map.get(keyRegExp);
      let expectedRe1: int = 100;
      expect(re1Value).assertEqual(expectedRe1);
      expect(map.get(otherRegExp)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6200
     * @tc.name mapOverviewPart04Test062
     * @tc.desc Verify K=RegExp pattern has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, string>();
      const keyRegExp: RegExp = new RegExp('test', 'i');
      const otherRegExp: RegExp = new RegExp('test', 'i');
      map.set(keyRegExp, 'matched');
      expect(map.has(keyRegExp)).assertTrue();
      expect(map.has(otherRegExp)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6300
     * @tc.name mapOverviewPart04Test063
     * @tc.desc Verify Map K=RegExp delete diff instance returns false, get still 55, delete same ref returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const keyRegExp: RegExp = new RegExp('x', 'g');
      const otherRegExp: RegExp = new RegExp('x', 'g');
      map.set(keyRegExp, 55);
      expect(map.delete(otherRegExp)).assertFalse();
      let re1Value: int | undefined = map.get(keyRegExp);
      let expectedRe1: int = 55;
      expect(re1Value).assertEqual(expectedRe1);
      expect(map.delete(keyRegExp)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6400
     * @tc.name mapOverviewPart04Test064
     * @tc.desc Verify set() RegExp pattern keys yields size 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      map.set(new RegExp('a', 'g'), 1);
      map.set(new RegExp('b', 'g'), 2);
      map.set(new RegExp('c', 'g'), 3);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6500
     * @tc.name mapOverviewPart04Test065
     * @tc.desc Verify K=object has true get value and distinct object has false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<ObjKey, int>();
      const keyObj: ObjKey = { id: 1 };
      map.set(keyObj, 10);
      expect(map.has(keyObj)).assertTrue();
      expect(map.get(keyObj)).assertEqual(10);
      expect(map.has({ id: 2 })).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6600
     * @tc.name mapOverviewPart04Test066
     * @tc.desc Verify set() distinct object references as keys yields size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<ObjKey2, int>();
      const keyObj: ObjKey2 = { x: 1, y: 2 };
      const otherObj: ObjKey2 = { x: 1, y: 2 };
      map.set(keyObj, 10);
      map.set(otherObj, 20);
      let actualSize: int = map.size;
      let expectedSize: int = 2;
      expect(actualSize).assertEqual(expectedSize);
      let o1Value: int | undefined = map.get(keyObj);
      let expectedO1: int = 10;
      expect(o1Value).assertEqual(expectedO1);
      let o2Value: int | undefined = map.get(otherObj);
      let expectedO2: int = 20;
      expect(o2Value).assertEqual(expectedO2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6700
     * @tc.name mapOverviewPart04Test067
     * @tc.desc Verify K=byte MAX(127) key set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, string>();
      map.set(Int.toByte(127), 'maxByte');
      expect(map.has(Int.toByte(127))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6800
     * @tc.name mapOverviewPart04Test068
     * @tc.desc Verify K=byte MIN(-128) key set get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<byte, int>();
      map.set(Int.toByte(-128), -1);
      expect(map.get(Int.toByte(-128))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_6900
     * @tc.name mapOverviewPart04Test069
     * @tc.desc Verify char key set() then has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<char, string>();
      map.set(c'A', 'letterA');
      expect(map.has(c'A')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7000
     * @tc.name mapOverviewPart04Test070
     * @tc.desc Verify K=bigint key 999 set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<bigint, string>();
      const key: bigint = BigInt(999);
      map.set(key, 'bigIntVal');
      expect(map.has(key)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7100
     * @tc.name mapOverviewPart04Test071
     * @tc.desc Verify K=bigint key set get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<bigint, int>();
      const key: bigint = BigInt(100);
      map.set(key, 42);
      expect(map.get(key)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7200
     * @tc.name mapOverviewPart04Test072
     * @tc.desc Verify K=bigint large key 99999999999999999999 set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<bigint, string>();
      const largeKey: bigint = BigInt('99999999999999999999');
      map.set(largeKey, 'largeBigInt');
      expect(map.has(largeKey)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7300
     * @tc.name mapOverviewPart04Test073
     * @tc.desc Verify Unicode string key set() then get() returns value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      let longStr: string = 'a'.repeat(5000);
      longStr = longStr + '😀' + 'end';
      map.set(longStr, 999);
      expect(map.get(longStr)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7400
     * @tc.name mapOverviewPart04Test074
     * @tc.desc Verify V=Array<int> value set get array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<int>>();
      const arr: Array<int> = [1, 2, 3];
      map.set('arr', arr);
      expect(map.get('arr')).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7500
     * @tc.name mapOverviewPart04Test075
     * @tc.desc Verify V=Array<string> value set get array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Array<string>>();
      const arr: Array<string> = ['x', 'y', 'z'];
      map.set('strArr', arr);
      const result: Array<string> | undefined = map.get('strArr');
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7600
     * @tc.name mapOverviewPart04Test076
     * @tc.desc Verify V=Set<int> set has key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Set<int>>();
      const s: Set<int> = new Set<int>([10, 20]);
      map.set('setVal', s);
      expect(map.has('setVal')).assertTrue();
      let got: Set<int> | undefined = map.get('setVal');
      expect(got).assertEqual(s);
      let gotSize: int = got!.size;
      expect(gotSize).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7700
     * @tc.name mapOverviewPart04Test077
     * @tc.desc Verify V=Set<int> value set get Set size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Set<int>>();
      const s: Set<int> = new Set<int>([1, 2, 3]);
      map.set('s', s);
      const result: Set<int> | undefined = map.get('s');
      expect(result).assertEqual(s);
      expect(result!.size).assertEqual(3);
      expect(result!.has(1)).assertTrue();
      expect(result!.has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7800
     * @tc.name mapOverviewPart04Test078
     * @tc.desc Verify V=Error value set get Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      const err: Error = new Error('test error');
      map.set('err', err);
      expect(map.get('err')).assertEqual(err);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_7900
     * @tc.name mapOverviewPart04Test079
     * @tc.desc Verify V=Error value set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, Error>();
      map.set('e', new Error('msg'));
      expect(map.has('e')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8000
     * @tc.name mapOverviewPart04Test080
     * @tc.desc Verify Map V=class object mutation propagates via get (reference semantics)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, ValClass>();
      const instance: ValClass = new ValClass();
      instance.data = 1;
      map.set('mut', instance);
      instance.data = 999;
      const result: ValClass | undefined = map.get('mut');
      expect(result!.data).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8100
     * @tc.name mapOverviewPart04Test081
     * @tc.desc Verify V=RegExp value set has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, RegExp>();
      map.set('r', new RegExp('\\d+', 'g'));
      expect(map.has('r')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8200
     * @tc.name mapOverviewPart04Test082
     * @tc.desc Verify entries() first entry key a value 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      const iter = map.entries();
      const first: IteratorResult<[string, int]> = iter.next();
      expect(first.value![0]).assertEqual('a');
      expect(first.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8300
     * @tc.name mapOverviewPart04Test083
     * @tc.desc Verify boolean key set() delete() set() lifecycle size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, int>();
      for (let i = 0; i < 5; i++) {
        map.set(true, i);
        map.delete(true);
      }
      map.set(true, 999);
      expect(map.has(true)).assertTrue();
      expect(map.get(true)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8400
     * @tc.name mapOverviewPart04Test084
     * @tc.desc Verify entries() next() done false and [K,V] tuple key value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('key', 42);
      const iter = m.entries();
      const r = iter.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('key');
      expect(r.value![1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8500
     * @tc.name mapOverviewPart04Test085
     * @tc.desc Verify entries() iteration yields ordered key-value pairs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>();
      m.set('first', 1);
      m.set('second', 2);
      const iter = m.entries();
      const r1 = iter.next();
      const r2 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value![0]).assertEqual('first');
      expect(r1.value![1]).assertEqual(1);
      expect(r2.done).assertFalse();
      expect(r2.value![0]).assertEqual('second');
      expect(r2.value![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8600
     * @tc.name mapOverviewPart04Test086
     * @tc.desc Verify delete() removes first key and keeps second key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['first', 1],
        ['second', 2],
      ]);
      map.delete('first');
      map.set('first', 111);
      const keysOrder: string[] = ['second', 'first'];
      const iter = map.keys();
      for (let i = 0; i < 2; i++) {
        expect(iter.next().value).assertEqual(keysOrder[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8700
     * @tc.name mapOverviewPart04Test087
     * @tc.desc Verify two keys() iterators both start at a then b
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const iter1 = map.keys();
      const iter2 = map.keys();
      expect(iter1.next().value).assertEqual('a');
      expect(iter2.next().value).assertEqual('a');
      expect(iter2.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8800
     * @tc.name mapOverviewPart04Test088
     * @tc.desc Verify for...of values() yields all stored values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('a', 10);
      map.set('b', 20);
      map.set('c', 30);
      let sum: int = 0;
      const iter = map.values();
      for (const v of iter) {
        sum = sum + v;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_8900
     * @tc.name mapOverviewPart04Test089
     * @tc.desc Verify two values() iterators both start at 1 then 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const iter1 = map.values();
      const iter2 = map.values();
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9000
     * @tc.name mapOverviewPart04Test090
     * @tc.desc Verify entries() for-of concatenates keys firstsecond
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      map.set('first', 1);
      map.set('second', 2);
      let keysConcat: string = '';
      const iter = map.entries();
      for (const entry of iter) {
        keysConcat = keysConcat + entry[0];
      }
      expect(keysConcat).assertEqual('firstsecond');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9100
     * @tc.name mapOverviewPart04Test091
     * @tc.desc Verify two entries() iterators independent first key a
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const i1 = map.entries();
      const i2 = map.entries();
      i1.next();
      const secondEntry = i2.next().value;
      expect(secondEntry![0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9200
     * @tc.name mapOverviewPart04Test092
     * @tc.desc Verify delete() nonexistent key keeps existing keys has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      map.delete('c');
      expect(map.has('a')).assertTrue();
      expect(map.has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9300
     * @tc.name mapOverviewPart04Test093
     * @tc.desc Verify undefined key set() then has() true get() 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string | undefined, int>();
      map.set(undefined, 42);
      expect(map.has(undefined)).assertTrue();
      let undefinedKeyValue: int | undefined = map.get(undefined);
      expect(undefinedKeyValue).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9400
     * @tc.name mapOverviewPart04Test094
     * @tc.desc Verify set() returns this (chainable) size stays 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['x', 1]]);
      const ret = m.set('x', 127);
      expect(ret).assertEqual(m);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9500
     * @tc.name mapOverviewPart04Test095
     * @tc.desc Verify clear() then set() new key get() returns 200
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.clear();
      map.set('b', 200);
      expect(map.get('b')).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9600
     * @tc.name mapOverviewPart04Test096
     * @tc.desc Verify forEach() callback set() new key visible after iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1]]);
      map.forEach((_value: int, _key: string) => {
        map.set('new_key', 100);
      });
      expect(map.has('new_key')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9700
     * @tc.name mapOverviewPart04Test097
     * @tc.desc Verify Record K=int $_set(IntEnum.X) Map.get returns 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<int, int>();
      const mapRef: Map<int, int> = record;
      record.$_set(IntEnum.X, 100);
      expect(mapRef.get(IntEnum.X)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9800
     * @tc.name mapOverviewPart04Test098
     * @tc.desc Verify Record K=string $_set(StrEnum.FOO) Map.has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<string, string>();
      const mapRef: Map<string, string> = record;
      record.$_set(StrEnum.FOO, 'val');
      expect(mapRef.has(StrEnum.FOO)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART04_TEST_9900
     * @tc.name mapOverviewPart04Test099
     * @tc.desc Verify has() null key true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart04Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string | null, int>();
      m.set(null, 42);
      const r = m.has(null);
      expect(r).assertTrue();
    });
  });
}
