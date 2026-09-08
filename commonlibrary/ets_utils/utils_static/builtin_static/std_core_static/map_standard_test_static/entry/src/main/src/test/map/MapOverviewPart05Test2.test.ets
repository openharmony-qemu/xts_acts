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
} from '../../../../hypium/index';
import Utils from '../Util.test';

enum Color {
  RED = 0,
  GREEN = 1,
  BLUE = 2,
}

export default function mapOverviewPart05TestTest(): void {
  describe('MapOverviewPart05TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0100
     * @tc.name mapOverviewPart05Test001
     * @tc.desc Verify V=null value set get null has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int | null>();
      map.set('nilKey', null);
      let nilValue: int | null | undefined = map.get('nilKey');
      expect(nilValue).assertNull();
      expect(map.has('nilKey')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0200
     * @tc.name mapOverviewPart05Test002
     * @tc.desc Verify V=null value delete get undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int | null>();
      map.set('temp', null);
      map.delete('temp');
      expect(map.get('temp')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0300
     * @tc.name mapOverviewPart05Test003
     * @tc.desc Verify set() undefined value entry keeps size 2 and get() undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int | undefined>();
      map.set('a', undefined);
      map.set('b', 2);
      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0400
     * @tc.name mapOverviewPart05Test004
     * @tc.desc Verify Record K=int $_set(Color enum int base) size 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<int, string>();
      record.$_set(Color.RED, 'red');
      record.$_set(Color.GREEN, 'green');
      record.$_set(Color.BLUE, 'blue');
      expect(record.size).assertEqual(3);
      expect(record.has(Color.RED)).assertTrue();
      expect(record.has(Color.GREEN)).assertTrue();
      expect(record.has(Color.BLUE)).assertTrue();
      expect(record.$_get(Color.RED)).assertEqual('red');
      expect(record.$_get(Color.GREEN)).assertEqual('green');
      expect(record.$_get(Color.BLUE)).assertEqual('blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0500
     * @tc.name mapOverviewPart05Test005
     * @tc.desc Verify Record K=long $_set $_get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<long, string>();
      record.$_set(Int.toLong(100), 'hundred');
      expect(record.$_get(Int.toLong(100))).assertEqual('hundred');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0600
     * @tc.name mapOverviewPart05Test006
     * @tc.desc Verify Record K=long MIN $_set Map.has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record = new Record<long, string>();
      const mapRef: Map<long, string> = record;
      const lmin: long = -9223372036854775807 - 1;
      record.$_set(lmin, 'lmin');
      expect(mapRef.has(lmin)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0700
     * @tc.name mapOverviewPart05Test007
     * @tc.desc Verify keys() next twice then done true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['only', 1]]);
      const iter = map.keys();
      iter.next();
      const firstNext = iter.next();
      expect(firstNext.done).assertTrue();
      const secondNext = iter.next();
      expect(secondNext.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0800
     * @tc.name mapOverviewPart05Test008
     * @tc.desc Verify keys() iterator after exhaustion value undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['k', 1]]);
      const iter = map.keys();
      iter.next();
      const exhausted = iter.next();
      expect(exhausted.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_0900
     * @tc.name mapOverviewPart05Test009
     * @tc.desc Verify forEach callback throw propagates and Map data unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      try {
        map.forEach((_v: int, _k: string) => {
          throw new Error('opaque');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1000
     * @tc.name mapOverviewPart05Test010
     * @tc.desc Verify values() iterator then clear() next done true value undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([
        ['x', 10],
        ['y', 20],
      ]);
      const iter = map.values();
      map.clear();
      const next = iter.next();
      expect(next.done).assertTrue();
      expect(next.value).assertUndefined();
      let actualSize: int = map.size;
      let expectedSize: int = 0;
      expect(actualSize).assertEqual(expectedSize);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1100
     * @tc.name mapOverviewPart05Test011
     * @tc.desc Verify K=boolean set boolean size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, string>();
      map.set(true, 'first');
      map.set(true, 'second');
      map.set(true, 'third');
      expect(map.size).assertEqual(1);
      expect(map.get(true)).assertEqual('third');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1200
     * @tc.name mapOverviewPart05Test012
     * @tc.desc Verify long key near int.MAX set() then has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long, string>();
      const nearIntMax: long = Int.toLong(2147483647);
      map.set(nearIntMax, 'nearMax');
      expect(map.has(nearIntMax)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1300
     * @tc.name mapOverviewPart05Test013
     * @tc.desc Verify set() long and int 100 keys collapse to one key last-write-wins
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<long | int, string>();
      map.set(100, 'intKey');
      map.set(Int.toLong(100), 'longKey');
      let actualSize: int = map.size;
      let expectedSize: int = 1;
      expect(actualSize).assertEqual(expectedSize);
      let intKeyValue: string | undefined = map.get(100);
      let expectedIntKey: string = 'longKey';
      expect(intKeyValue).assertEqual(expectedIntKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1400
     * @tc.name mapOverviewPart05Test014
     * @tc.desc Verify K=float -0.0 delete returns true, size=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<float, int>();
      map.set(Double.toFloat(-0.0), 1);
      expect(map.delete(Double.toFloat(-0.0))).assertTrue();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1500
     * @tc.name mapOverviewPart05Test015
     * @tc.desc Verify Map get() key=string V=int
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['k', 127]]);
      const v = m.get('k');
      let valueTypeName: string = typeof v;
      let expectedTypeName: string = 'int';
      expect(valueTypeName).assertEqual(expectedTypeName);
      let actualValue: int | undefined = v;
      let expectedValue: int = 127;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1600
     * @tc.name mapOverviewPart05Test016
     * @tc.desc Verify Map get() key=int V=string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>([[1, 'val']]);
      const v = m.get(1);
      expect(typeof v).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1700
     * @tc.name mapOverviewPart05Test017
     * @tc.desc Verify Map get() key=string V=boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, boolean>([['flag', true]]);
      const v = m.get('flag');
      expect(typeof v).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1800
     * @tc.name mapOverviewPart05Test018
     * @tc.desc Verify Map get() key=string V=Date instanceof Date
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2025, 6, 8);
      const m = new Map<string, Date>([['today', d]]);
      const v = m.get('today');
      expect(v instanceof Date).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_1900
     * @tc.name mapOverviewPart05Test019
     * @tc.desc Verify get(key, def) returns int when key exists
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['x', 127]]);
      const v = m.get('x', 0);
      let valueTypeName: string = typeof v;
      let expectedTypeName: string = 'int';
      expect(valueTypeName).assertEqual(expectedTypeName);
      let actualValue: int = v;
      let expectedValue: int = 127;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2000
     * @tc.name mapOverviewPart05Test020
     * @tc.desc Verify get(key, def) key def string="default"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, string>();
      const v = m.get('missing', 'default');
      expect(v).assertEqual('default');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2100
     * @tc.name mapOverviewPart05Test021
     * @tc.desc Verify has() missing key returns false for non-empty and empty map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const r = m.has('absent');
      expect(r).assertFalse();
      const empty = new Map<string, int>();
      const emptyHasResult = empty.has('nothing');
      expect(emptyHasResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2200
     * @tc.name mapOverviewPart05Test022
     * @tc.desc Verify size equals 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const actualSize: int = m.size;
      expect(actualSize).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2300
     * @tc.name mapOverviewPart05Test023
     * @tc.desc Verify constructor duplicate keys dedupe size equals 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['dup', 1],
        ['dup', 2],
      ]);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2400
     * @tc.name mapOverviewPart05Test024
     * @tc.desc Verify keys() next() done boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['k', 1]]);
      const iter = m.keys();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2500
     * @tc.name mapOverviewPart05Test025
     * @tc.desc Verify values() next() done true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['x', 1]]);
      const iter = m.values();
      iter.next();
      const r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2600
     * @tc.name mapOverviewPart05Test026
     * @tc.desc Verify toString() on single entry returns x,127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['x', 127]]);
      const s = m.toString();
      expect(s).assertEqual('x,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2700
     * @tc.name mapOverviewPart05Test027
     * @tc.desc Verify forEach() return value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const ret = m.forEach((value: int, key: string): void => {
      });
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2800
     * @tc.name mapOverviewPart05Test028
     * @tc.desc Verify new Map(map) copies entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Map<string, int>([['x', 10]]);
      const m = new Map<string, int>(src);
      let actualSize: int = m.size;
      let expectedSize: int = 1;
      expect(actualSize).assertEqual(expectedSize);
      let actualXValue: int | undefined = m.get('x');
      let expectedXValue: int = 10;
      expect(actualXValue).assertEqual(expectedXValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_2900
     * @tc.name mapOverviewPart05Test029
     * @tc.desc Verify constructor entries duplicate key dedupe size equals 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['dup', 1],
        ['dup', 99],
        ['uniq', 2],
      ]);
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3000
     * @tc.name mapOverviewPart05Test030
     * @tc.desc Verify forEach visits both entries in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      let visitedCount: int = 0;
      let firstVisitedKey: string = '';
      let secondVisitedKey: string = '';
      m.forEach((value: int, key: string): void => {
        if (visitedCount === 0) {
          firstVisitedKey = key;
        }
        if (visitedCount === 1) {
          secondVisitedKey = key;
        }
        visitedCount = visitedCount + 1;
      });
      expect(visitedCount).assertEqual(2);
      expect(firstVisitedKey).assertEqual('a');
      expect(secondVisitedKey).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3100
     * @tc.name mapOverviewPart05Test031
     * @tc.desc Verify Record $_set return value is undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      const ret = rec.$_set('k', 1);
      expect(ret).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3200
     * @tc.name mapOverviewPart05Test032
     * @tc.desc Verify Record.size returns entry count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec = new Record<string, int>();
      rec.$_set('a', 1);
      expect(rec.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3300
     * @tc.name mapOverviewPart05Test033
     * @tc.desc Verify Map get() duplicate key last-wins returns 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['dup', 1],
        ['dup', 127],
      ]);
      expect(m.get('dup')).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3400
     * @tc.name mapOverviewPart05Test034
     * @tc.desc Verify set() returns this and supports chaining
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<int, string>();
      const ret = m.set(127, 'byteMaxVal');
      expect(ret).assertEqual(m);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3500
     * @tc.name mapOverviewPart05Test035
     * @tc.desc Verify set() -0.0 value then toString() renders as 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, double>();
      m.set('nz', -0.0);
      const s = m.toString();
      expect(s).assertEqual('nz,0');
      const nzVal: double | undefined = m.get('nz');
      expect(1.0 / nzVal!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3600
     * @tc.name mapOverviewPart05Test036
     * @tc.desc Verify delete() existing key returns true and size decrements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const before = m.size;
      const r = m.delete('b');
      expect(r).assertTrue();
      expect(m.size).assertEqual(before - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3700
     * @tc.name mapOverviewPart05Test037
     * @tc.desc Verify iterator next() before exhaustion done false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      const iter = m.keys();
      iter.next();
      const r = iter.next();
      expect(r.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3800
     * @tc.name mapOverviewPart05Test038
     * @tc.desc Verify two entries() iterators independent done states
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([
        ['m', 1],
        ['n', 2],
      ]);
      const iter1 = m.entries();
      const iter2 = m.entries();
      iter1.next();
      iter1.next();
      const firstIterResult = iter1.next();
      const secondIterResult = iter2.next();
      expect(firstIterResult.done).assertTrue();
      expect(secondIterResult.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_3900
     * @tc.name mapOverviewPart05Test039
     * @tc.desc Verify K=double V=string values()next() string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<double, string>([[3.14, 'pi']]);
      const iter = m.values();
      const r = iter.next();
      const rv = r.value;
      let rvDefined: boolean = rv !== undefined;
      expect(rvDefined).assertTrue();
      let valueResult: string = rv!;
      expect(valueResult).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4000
     * @tc.name mapOverviewPart05Test040
     * @tc.desc Verify K=long V=double get() double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<long, double>();
      m.set(Int.toLong(1), 2.5);
      expect(m.get(Int.toLong(1))).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4100
     * @tc.name mapOverviewPart05Test041
     * @tc.desc Verify K=boolean V=int keys()next() boolean key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<boolean, int>([
        [true, 1],
        [false, 0],
      ]);
      const iter = m.keys();
      const r = iter.next();
      const rv = r.value;
      let rvDefined: boolean = rv !== undefined;
      expect(rvDefined).assertTrue();
      let keyResult: boolean = rv!;
      expect(keyResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4200
     * @tc.name mapOverviewPart05Test042
     * @tc.desc Verify get(key, def) missing key returns def and keeps size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const def: int = 42;
      const v: int = m.get('absent', def);
      expect(v).assertEqual(def);
      let szAfter: int = m.size;
      expect(szAfter).assertEqual(0);
      let hasAbsent: boolean = m.has('absent');
      expect(hasAbsent).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4300
     * @tc.name mapOverviewPart05Test043
     * @tc.desc Verify get(key, def) existing key returns stored value not def
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string> = new Map<string, string>();
      m.set('k', 'stored');
      const def: string = 'fallback';
      const v: string = m.get('k', def);
      expect(v).assertEqual('stored');
      let szAfter: int = m.size;
      expect(szAfter).assertEqual(1);
      let hasKey: boolean = m.has('k');
      expect(hasKey).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4400
     * @tc.name mapOverviewPart05Test044
     * @tc.desc Verify new Map(null) constructor yields size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullArg: Iterable<[string, int]> | null = null;
      const m: Map<string, int> = new Map<string, int>(nullArg);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4500
     * @tc.name mapOverviewPart05Test045
     * @tc.desc Verify entries null key value null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>([['a', null]]);
      expect(m.has('a')).assertTrue();
      expect(m.get('a')).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4600
     * @tc.name mapOverviewPart05Test046
     * @tc.desc Verify entries() iteration yields key value pairs in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([
        ['a', 1],
        ['b', 2],
        ['a', 3],
      ]);
      expect(m.size).assertEqual(2);
      const iter: IterableIterator<[string, int]> = m.entries();
      const first: IteratorResult<[string, int]> = iter.next();
      const fv = first.value;
      let fvDefined: boolean = fv !== undefined;
      expect(fvDefined).assertTrue();
      expect(fv![0]).assertEqual('a');
      expect(fv![1]).assertEqual(3);
      const second: IteratorResult<[string, int]> = iter.next();
      const sv = second.value;
      let svDefined: boolean = sv !== undefined;
      expect(svDefined).assertTrue();
      expect(sv![0]).assertEqual('b');
      expect(sv![1]).assertEqual(2);
      const third: IteratorResult<[string, int]> = iter.next();
      expect(third.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4700
     * @tc.name mapOverviewPart05Test047
     * @tc.desc Verify new Map with bucketsCount 1000 empty then usable after set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>(1000);
      expect(m.size).assertEqual(0);
      m.set('b', 2);
      expect(m.get('b')).assertEqual(2);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4800
     * @tc.name mapOverviewPart05Test048
     * @tc.desc Verify new Map from empty entries() yields size 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Map<string, int> = new Map<string, int>();
      const m: Map<string, int> = new Map<string, int>(src.entries());
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_4900
     * @tc.name mapOverviewPart05Test049
     * @tc.desc Verify get(key, def) def=null returns null for missing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, string | null> = new Map<string, string | null>();
      expect(m.get('a', null)).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5000
     * @tc.name mapOverviewPart05Test050
     * @tc.desc Verify has key int Map string key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>([[1, 'one']]);
      expect(m.has(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5100
     * @tc.name mapOverviewPart05Test051
     * @tc.desc Verify Map set empty-string '' key get('') returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('', 42);
      expect(m.get('')).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5200
     * @tc.name mapOverviewPart05Test052
     * @tc.desc Verify forEach throw propagates and aborts before processing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([
        ['a', 1],
        ['b', 2],
        ['c', 3],
      ]);
      let processedCount: int = 0;
      let processedB: boolean = false;
      try {
        m.forEach((value: int, key: string): void => {
          if (key === 'a') {
            throw new Error('abort on first');
          }
          processedCount = processedCount + 1;
          if (key === 'b') {
            processedB = true;
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(processedCount).assertEqual(0);
      expect(processedB).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5300
     * @tc.name mapOverviewPart05Test053
     * @tc.desc Verify forEach callback receives key value and map reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      let receivedKey: string = '';
      let receivedValue: int = 0;
      let receivedMapIsSame: boolean = false;
      m.forEach((value: int, key: string, map: Map<string, int>): void => {
        receivedKey = key;
        receivedValue = value;
        receivedMapIsSame = map === m;
      });
      expect(receivedKey).assertEqual('a');
      expect(receivedValue).assertEqual(1);
      expect(receivedMapIsSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5400
     * @tc.name mapOverviewPart05Test054
     * @tc.desc Verify forEach iterates in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('c', 3);
      m.set('a', 1);
      m.set('b', 2);
      const keys: string[] = [];
      m.forEach((value: int, key: string): void => {
        keys.push(key);
      });
      expect(keys[0]).assertEqual('c');
      expect(keys[1]).assertEqual('a');
      expect(keys[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5500
     * @tc.name mapOverviewPart05Test055
     * @tc.desc Verify Map keys() next() done:true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const iter: IterableIterator<string> = m.keys();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5600
     * @tc.name mapOverviewPart05Test056
     * @tc.desc Verify Map values() next() done:true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const iter: IterableIterator<int> = m.values();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5700
     * @tc.name mapOverviewPart05Test057
     * @tc.desc Verify Map entries() next() done:true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      const iter: IterableIterator<[string, int]> = m.entries();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5800
     * @tc.name mapOverviewPart05Test058
     * @tc.desc Verify Map delete preserves key iteration order a,c
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.delete('b');
      const iter: IterableIterator<string> = m.keys();
      expect(iter.next().value).assertEqual('a');
      expect(iter.next().value).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_5900
     * @tc.name mapOverviewPart05Test059
     * @tc.desc Verify clear then set new keys iteration order x y
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.clear();
      m.set('x', 10);
      m.set('y', 20);
      const iter: IterableIterator<string> = m.keys();
      expect(iter.next().value).assertEqual('x');
      expect(iter.next().value).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6000
     * @tc.name mapOverviewPart05Test060
     * @tc.desc Verify Record keys() next() done:true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      const iter: IterableIterator<string> = r.keys();
      iter.next();
      const result: IteratorResult<string> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6100
     * @tc.name mapOverviewPart05Test061
     * @tc.desc Verify Record values() next() done:true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      const iter: IterableIterator<int> = r.values();
      iter.next();
      const result: IteratorResult<int> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6200
     * @tc.name mapOverviewPart05Test062
     * @tc.desc Verify Record entries() next() done:true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = new Record<string, int>();
      r.$_set('a', 1);
      const iter: IterableIterator<[string, int]> = r.entries();
      iter.next();
      const result: IteratorResult<[string, int]> = iter.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6300
     * @tc.name mapOverviewPart05Test063
     * @tc.desc Verify K=string empty key set has true get 7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('', 7);
      expect(m.has('')).assertTrue();
      expect(m.get('')).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6400
     * @tc.name mapOverviewPart05Test064
     * @tc.desc Verify K=string emoji key set has
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('😀', 1);
      expect(m.has('😀')).assertTrue();
      expect(m.get('😀')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6500
     * @tc.name mapOverviewPart05Test065
     * @tc.desc Verify K=string space key set has true get 7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set(' ', 7);
      expect(m.has(' ')).assertTrue();
      expect(m.get(' ')).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6600
     * @tc.name mapOverviewPart05Test066
     * @tc.desc Verify set(0x7fffffffffffffff long key) then has() and get() return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, string> = new Map<long, string>();
      const lKey: long = 0x7fffffffffffffff;
      m.set(lKey, 'lmax');
      const expectedKey: long = 0x7fffffffffffffff;
      expect(m.has(expectedKey)).assertTrue();
      expect(m.get(expectedKey)).assertEqual('lmax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6700
     * @tc.name mapOverviewPart05Test067
     * @tc.desc Verify Map Date keys distinct by reference size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const keyDate: Date = new Date(1700000000000);
      const otherDate: Date = new Date(1700000000000);
      const m: Map<Date, string> = new Map<Date, string>();
      m.set(keyDate, 'first');
      m.set(otherDate, 'second');
      let actualSize: int = m.size;
      let expectedSize: int = 2;
      expect(actualSize).assertEqual(expectedSize);
      let firstDateValue: string | undefined = m.get(keyDate);
      let expectedFirstDateValue: string = 'first';
      expect(firstDateValue).assertEqual(expectedFirstDateValue);
      let otherDateValue: string | undefined = m.get(otherDate);
      let expectedOtherDateValue: string = 'second';
      expect(otherDateValue).assertEqual(expectedOtherDateValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6800
     * @tc.name mapOverviewPart05Test068
     * @tc.desc Verify set() duplicate key overwrite then entries() reflects latest value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('b', 20);
      const iter: IterableIterator<[string, int]> = m.entries();
      const first: IteratorResult<[string, int]> = iter.next();
      const fv = first.value;
      let fvDefined: boolean = fv !== undefined;
      expect(fvDefined).assertTrue();
      expect(fv![1]).assertEqual(1);
      const second: IteratorResult<[string, int]> = iter.next();
      const sv = second.value;
      let svDefined: boolean = sv !== undefined;
      expect(svDefined).assertTrue();
      expect(sv![1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_6900
     * @tc.name mapOverviewPart05Test069
     * @tc.desc Verify Map keys() $_iterator() returns valid iterator yielding 'a'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>([['a', 1]]);
      const iter = m.keys();
      const selfIter = iter.$_iterator();
      expect(selfIter.next().value).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_7000
     * @tc.name mapOverviewPart05Test070
     * @tc.desc Verify clear() then set() new key size equals 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      m.clear();
      m.set('c', 3);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_7100
     * @tc.name mapOverviewPart05Test071
     * @tc.desc Verify for...of Map keys() collects all keys in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([
        ['a', 1],
        ['b', 2],
      ]);
      let collected: string[] = [];
      for (const key of m.keys()) {
        collected.push(key);
      }
      expect(collected.length).assertEqual(2);
      expect(collected[0]).assertEqual('a');
      expect(collected[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_7200
     * @tc.name mapOverviewPart05Test072
     * @tc.desc Verify get(key, def) returns def 42 for missing key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      expect(m.get('a', 42)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_7300
     * @tc.name mapOverviewPart05Test073
     * @tc.desc Verify delete() nonexistent key keeps size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>([['a', 1]]);
      const szBefore: int = m.size;
      m.delete('nonexistent');
      expect(m.size).assertEqual(szBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_OVERVIEW_PART05_TEST_7400
     * @tc.name mapOverviewPart05Test074
     * @tc.desc Verify V=Array value set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapOverviewPart05Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int[]> = new Map<string, int[]>();
      const arr: int[] = [1, 2, 3];
      m.set('a', arr);
      expect(m.get('a')).assertEqual(arr);
    });
  });
}
