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

interface PojoVal {
  id: int;
  name: string;
}
class ValueClass {
  value: int = 0;
}
interface JsonVal {
  name: string;
  age: int;
  active: boolean;
}
interface RefObj {
  x: int;
}
interface KeyObj {
  id: int;
}
class KeyClass {
  id: int = 0;
}

export default function readonlyMapValuesPart01TestTest(): void {
  describe('ReadonlyMapValuesPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0100
     * @tc.name readonlyMapValuesPart01Test001
     * @tc.desc Verify V string, values IterableIterator\<string\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['k', 'hello']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0200
     * @tc.name readonlyMapValuesPart01Test002
     * @tc.desc Verify V int, values IterableIterator\<int\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k', 42]]);
      let it: IterableIterator<int> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0300
     * @tc.name readonlyMapValuesPart01Test003
     * @tc.desc Verify V number, values IterableIterator\<number\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['k', 3.14]]);
      let it: IterableIterator<number> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0400
     * @tc.name readonlyMapValuesPart01Test004
     * @tc.desc Verify V boolean, values IterableIterator\<boolean\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, boolean> = new Map<string, boolean>([['k', true]]);
      let it: IterableIterator<boolean> = m.values();
      let result = it.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0500
     * @tc.name readonlyMapValuesPart01Test005
     * @tc.desc Verify V long, values IterableIterator\<long\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>([['k', 9223372036854775807]]);
      let it: IterableIterator<long> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0600
     * @tc.name readonlyMapValuesPart01Test006
     * @tc.desc Verify V double, values IterableIterator\<double\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>([['k', 3.141592653589793]]);
      let it: IterableIterator<double> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(3.141592653589793);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0700
     * @tc.name readonlyMapValuesPart01Test007
     * @tc.desc Verify V byte, values IterableIterator\<byte\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, byte> = new Map<string, byte>([['k', 127 as byte]]);
      let it: IterableIterator<byte> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0800
     * @tc.name readonlyMapValuesPart01Test008
     * @tc.desc Verify V short, values IterableIterator\<short\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, short> = new Map<string, short>([['k', 32767 as short]]);
      let it: IterableIterator<short> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_0900
     * @tc.name readonlyMapValuesPart01Test009
     * @tc.desc Verify V float, values IterableIterator\<float\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>([['k', 3.14 as float]]);
      let it: IterableIterator<float> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(3.14 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1000
     * @tc.name readonlyMapValuesPart01Test010
     * @tc.desc Verify V char, values IterableIterator\<char\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, char> = new Map<string, char>([['k', c'A']]);
      let it: IterableIterator<char> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1100
     * @tc.name readonlyMapValuesPart01Test011
     * @tc.desc Verify V long, values IterableIterator\<long\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>([['k', 9007199254740991]]);
      let it: IterableIterator<long> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1200
     * @tc.name readonlyMapValuesPart01Test012
     * @tc.desc Verify V Date, values IterableIterator\<Date\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, Date> = new Map<string, Date>([['k', new Date(1700000000000)]]);
      let it: IterableIterator<Date> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1300
     * @tc.name readonlyMapValuesPart01Test013
     * @tc.desc Verify V RegExp, values IterableIterator\<RegExp\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['k', new RegExp('abc', 'g')]]);
      let it: IterableIterator<RegExp> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1400
     * @tc.name readonlyMapValuesPart01Test014
     * @tc.desc Verify V Error, values IterableIterator\<Error\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, Error> = new Map<string, Error>([['k', new Error('test error')]]);
      let it: IterableIterator<Error> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1500
     * @tc.name readonlyMapValuesPart01Test015
     * @tc.desc Verify V object(POJO), values IterableIterator\< \>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: PojoVal = { id: 1, name: 'test' };
      const m: ReadonlyMap<string, PojoVal> = new Map<string, PojoVal>([['k', obj]]);
      let it: IterableIterator<PojoVal> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1600
     * @tc.name readonlyMapValuesPart01Test016
     * @tc.desc Verify V class, values IterableIterator\< \>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, ValueClass> = new Map<string, ValueClass>([['k', new ValueClass()]]);
      let it: IterableIterator<ValueClass> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1700
     * @tc.name readonlyMapValuesPart01Test017
     * @tc.desc Verify V Array, values IterableIterator\<Array\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const m: ReadonlyMap<string, int[]> = new Map<string, int[]>([['k', arr]]);
      let it: IterableIterator<int[]> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1800
     * @tc.name readonlyMapValuesPart01Test018
     * @tc.desc Verify V Map, values IterableIterator\<Map\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<int, string> = new Map<int, string>();
      inner.set(1, 'one');
      const m: ReadonlyMap<string, Map<int, string>> = new Map<string, Map<int, string>>([['k', inner]]);
      const it: IterableIterator<Map<int, string>> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_1900
     * @tc.name readonlyMapValuesPart01Test019
     * @tc.desc Verify V Set, values IterableIterator\<Set\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>();
      s.add(1);
      const m: ReadonlyMap<string, Set<int>> = new Map<string, Set<int>>([['k', s]]);
      let it: IterableIterator<Set<int>> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2000
     * @tc.name readonlyMapValuesPart01Test020
     * @tc.desc Verify V TypedArray, values IterableIterator\<Int8Array\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta: Int8Array = new Int8Array([1, 2, 3]);
      const m: ReadonlyMap<string, Int8Array> = new Map<string, Int8Array>([['k', ta]]);
      let it: IterableIterator<Int8Array> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(ta);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2100
     * @tc.name readonlyMapValuesPart01Test021
     * @tc.desc Verify V Record, values IterableIterator\<Record\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, int> = new Record<string, int>();
      rec.set('x', 10);
      const m: ReadonlyMap<string, Record<string, int>> = new Map<string, Record<string, int>>([['k', rec]]);
      const it: IterableIterator<Record<string, int>> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2200
     * @tc.name readonlyMapValuesPart01Test022
     * @tc.desc Verify V Promise, values IterableIterator\<Promise\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Promise<int> = new Promise<int>((resolve, reject) => { resolve(1); });
      const m: ReadonlyMap<string, Promise<int>> = new Map<string, Promise<int>>([['k', p]]);
      let it: IterableIterator<Promise<int>> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2300
     * @tc.name readonlyMapValuesPart01Test023
     * @tc.desc Verify V WeakMap, values IterableIterator\<WeakMap\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm: WeakMap<object, int> = new WeakMap<object, int>();
      let keyObj: object = {};
      wm.set(keyObj, 100);
      const m: ReadonlyMap<string, WeakMap<object, int>> = new Map<string, WeakMap<object, int>>([['k', wm]]);
      const it: IterableIterator<WeakMap<object, int>> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2400
     * @tc.name readonlyMapValuesPart01Test024
     * @tc.desc Verify V WeakSet, values IterableIterator\<WeakSet\>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ws: WeakSet<object> = new WeakSet<object>();
      let wsObj: object = {};
      ws.add(wsObj);
      const m: ReadonlyMap<string, WeakSet<object>> = new Map<string, WeakSet<object>>([['k', ws]]);
      let it: IterableIterator<WeakSet<object>> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2500
     * @tc.name readonlyMapValuesPart01Test025
     * @tc.desc Verify V JSON, values IterableIterator\<JSON \>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jv: JsonVal = { name: 'alice', age: 30, active: true };
      const m: ReadonlyMap<string, JsonVal> = new Map<string, JsonVal>([['k', jv]]);
      let it: IterableIterator<JsonVal> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(jv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2600
     * @tc.name readonlyMapValuesPart01Test026
     * @tc.desc Verify V undefined, Map value undefined values undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string | undefined> = new Map<string, string | undefined>([['k', undefined]]);
      let it: IterableIterator<string | undefined> = m.values();
      let r = it.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2700
     * @tc.name readonlyMapValuesPart01Test027
     * @tc.desc Verify Date V, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1700000000000);
      let d2: Date = new Date(1700000000000);
      const m: ReadonlyMap<string, Date> = new Map<string, Date>([['a', d1], ['b', d2]]);
      let it: IterableIterator<Date> = m.values();
      let r1: IteratorResult<Date> = it.next();
      let r2: IteratorResult<Date> = it.next();
      expect(r1.value!).not().assertNull();
      expect(r2.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2800
     * @tc.name readonlyMapValuesPart01Test028
     * @tc.desc Verify RegExp pattern V, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('abc', 'g');
      let re2: RegExp = new RegExp('abc', 'g');
      const m: ReadonlyMap<string, RegExp> = new Map<string, RegExp>([['a', re1], ['b', re2]]);
      let it: IterableIterator<RegExp> = m.values();
      let r1: IteratorResult<RegExp> = it.next();
      let r2: IteratorResult<RegExp> = it.next();
      expect(r1.value!).not().assertNull();
      expect(r2.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_2900
     * @tc.name readonlyMapValuesPart01Test029
     * @tc.desc Verify object V, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: RefObj = { x: 1 };
      let o2: RefObj = { x: 1 };
      const m: ReadonlyMap<string, RefObj> = new Map<string, RefObj>([['a', o1], ['b', o2]]);
      let it: IterableIterator<RefObj> = m.values();
      let r1: IteratorResult<RefObj> = it.next();
      let r2: IteratorResult<RefObj> = it.next();
      expect(r1.value!).not().assertNull();
      expect(r2.value!).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3000
     * @tc.name readonlyMapValuesPart01Test030
     * @tc.desc Verify K string, values string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['alpha', 1], ['beta', 2]]);
      let it: IterableIterator<int> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3100
     * @tc.name readonlyMapValuesPart01Test031
     * @tc.desc Verify K int, values int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, string> = new Map<int, string>([[1, 'one'], [2, 'two']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('one');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3200
     * @tc.name readonlyMapValuesPart01Test032
     * @tc.desc Verify K number, values number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, string> = new Map<number, string>([[1.5, 'a'], [2.5, 'b']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3300
     * @tc.name readonlyMapValuesPart01Test033
     * @tc.desc Verify K boolean, values boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, string> = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3400
     * @tc.name readonlyMapValuesPart01Test034
     * @tc.desc Verify K long, values long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, string> = new Map<long, string>([[9223372036854775807, 'max'], [Int.toLong(1), 'one']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3500
     * @tc.name readonlyMapValuesPart01Test035
     * @tc.desc Verify K double, values double key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, string> = new Map<double, string>([[3.141592653589793, 'pi']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3600
     * @tc.name readonlyMapValuesPart01Test036
     * @tc.desc Verify K byte, values byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, string> = new Map<byte, string>([[127 as byte, 'max'], [0 as byte, 'zero']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3700
     * @tc.name readonlyMapValuesPart01Test037
     * @tc.desc Verify K short, values short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, string> = new Map<short, string>([[32767 as short, 'max']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('max');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3800
     * @tc.name readonlyMapValuesPart01Test038
     * @tc.desc Verify K float, values float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<float, string> = new Map<float, string>([[3.14 as float, 'pi']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_3900
     * @tc.name readonlyMapValuesPart01Test039
     * @tc.desc Verify K char, values char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<char, string> = new Map<char, string>([[c'A', 'letterA']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('letterA');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4000
     * @tc.name readonlyMapValuesPart01Test040
     * @tc.desc Verify K bigint, values bigint key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<bigint, string> = new Map<bigint, string>([[9007199254740991n, 'large']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('large');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4100
     * @tc.name readonlyMapValuesPart01Test041
     * @tc.desc Verify K Date, values Date key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<Date, string> = new Map<Date, string>([[new Date(1700000000000), 'event']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('event');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4200
     * @tc.name readonlyMapValuesPart01Test042
     * @tc.desc Verify K RegExp, values RegExp key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<RegExp, string> = new Map<RegExp, string>([[new RegExp('abc', 'g'), 'pattern']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('pattern');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4300
     * @tc.name readonlyMapValuesPart01Test043
     * @tc.desc Verify K Error, values Error key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<Error, string> = new Map<Error, string>([[new Error('keyErr'), 'errorKey']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('errorKey');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4400
     * @tc.name readonlyMapValuesPart01Test044
     * @tc.desc Verify K object, values object key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ko: KeyObj = { id: 100 };
      const m: ReadonlyMap<KeyObj, string> = new Map<KeyObj, string>([[ko, 'objVal']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('objVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4500
     * @tc.name readonlyMapValuesPart01Test045
     * @tc.desc Verify K class, values class key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<KeyClass, string> = new Map<KeyClass, string>([[new KeyClass(), 'clsVal']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('clsVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4600
     * @tc.name readonlyMapValuesPart01Test046
     * @tc.desc Verify K Array, values Array key Map , string>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: int[] = [1, 2];
      const m: ReadonlyMap<int[], string> = new Map<int[], string>([[arr1, 'arrVal']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('arrVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4700
     * @tc.name readonlyMapValuesPart01Test047
     * @tc.desc Verify K Map, values Map key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerKey: Map<int, string> = new Map<int, string>();
      innerKey.set(1, 'one');
      const m: ReadonlyMap<Map<int, string>, string> = new Map<Map<int, string>, string>([[innerKey, 'outerVal']]);
      let it: IterableIterator<string> = m.values();
      expect(m.size).assertEqual(1);
      expect(it.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4800
     * @tc.name readonlyMapValuesPart01Test048
     * @tc.desc Verify K Set, values Set key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sk: Set<int> = new Set<int>();
      sk.add(42);
      const m: ReadonlyMap<Set<int>, string> = new Map<Set<int>, string>([[sk, 'setVal']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('setVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_4900
     * @tc.name readonlyMapValuesPart01Test049
     * @tc.desc Verify K null, values null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string | null, string> = new Map<string | null, string>([[null, 'nullKeyVal'], ['normal', 'normalVal']]);
      let it: IterableIterator<string> = m.values();
      let result = it.next();
      expect(result.value!).assertEqual('nullKeyVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5000
     * @tc.name readonlyMapValuesPart01Test050
     * @tc.desc Verify Map(size=0) values, next() {done:true}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>();
      let it: IterableIterator<int> = m.values();
      expect(m.size).assertEqual(0);
      expect(it.next().done).assertTrue();
      let r: IteratorResult<int> = it.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5100
     * @tc.name readonlyMapValuesPart01Test051
     * @tc.desc Verify Map(size=1) values, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['only', 99]]);
      let it: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.value!).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5200
     * @tc.name readonlyMapValuesPart01Test052
     * @tc.desc Verify Map(size>1) values, value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let it: IterableIterator<int> = m.values();
      let r1: IteratorResult<int> = it.next();
      expect(r1.value!).assertEqual(1);
      let r2: IteratorResult<int> = it.next();
      expect(r2.value!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5300
     * @tc.name readonlyMapValuesPart01Test053
     * @tc.desc Verify V=int value 2147483647, values 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['max', 2147483647]]);
      let it: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.value!).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5400
     * @tc.name readonlyMapValuesPart01Test054
     * @tc.desc Verify V=int value (-2147483647 - 1), values (-2147483647 - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['min', -2147483648]]);
      let it: IterableIterator<int> = m.values();
      let r: IteratorResult<int> = it.next();
      expect(r.value!).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5500
     * @tc.name readonlyMapValuesPart01Test055
     * @tc.desc Verify V=long value long.MAX, values long.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>([['max', 9223372036854775807]]);
      let it: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = it.next();
      expect(r.value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5600
     * @tc.name readonlyMapValuesPart01Test056
     * @tc.desc Verify V=long value long.MIN, values long.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, long> = new Map<string, long>([['min', (-9223372036854775807 - 1)]]);
      let it: IterableIterator<long> = m.values();
      let r: IteratorResult<long> = it.next();
      expect(r.value!).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5700
     * @tc.name readonlyMapValuesPart01Test057
     * @tc.desc Verify V=byte value byte.MAX, values byte.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, byte> = new Map<string, byte>([['max', 127 as byte]]);
      let it: IterableIterator<byte> = m.values();
      let r: IteratorResult<byte> = it.next();
      expect(r.value!).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5800
     * @tc.name readonlyMapValuesPart01Test058
     * @tc.desc Verify V=byte value byte.MIN, values byte.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, byte> = new Map<string, byte>([['min', -128 as byte]]);
      let it: IterableIterator<byte> = m.values();
      let r: IteratorResult<byte> = it.next();
      expect(r.value!).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_5900
     * @tc.name readonlyMapValuesPart01Test059
     * @tc.desc Verify V=short value short.MAX, values short.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, short> = new Map<string, short>([['max', 32767 as short]]);
      let it: IterableIterator<short> = m.values();
      let r: IteratorResult<short> = it.next();
      expect(r.value!).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6000
     * @tc.name readonlyMapValuesPart01Test060
     * @tc.desc Verify V=short value short.MIN, values short.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, short> = new Map<string, short>([['min', -32768 as short]]);
      let it: IterableIterator<short> = m.values();
      let r: IteratorResult<short> = it.next();
      expect(r.value!).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6100
     * @tc.name readonlyMapValuesPart01Test061
     * @tc.desc Verify V=float value NaN, values NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>([['nan', Float.NaN]]);
      let it: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = it.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6200
     * @tc.name readonlyMapValuesPart01Test062
     * @tc.desc Verify V=float value Infinity, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>([['inf', Float.POSITIVE_INFINITY]]);
      let it: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = it.next();
      expect(r.value!).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6300
     * @tc.name readonlyMapValuesPart01Test063
     * @tc.desc Verify V=float value -Infinity, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>([['ninf', -Float.POSITIVE_INFINITY]]);
      let it: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = it.next();
      expect(r.value!).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6400
     * @tc.name readonlyMapValuesPart01Test064
     * @tc.desc Verify V=float value -0.0, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, float> = new Map<string, float>([['negzero', -0.0 as float]]);
      let it: IterableIterator<float> = m.values();
      let r: IteratorResult<float> = it.next();
      expect(r.value!).assertEqual(-0.0 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6500
     * @tc.name readonlyMapValuesPart01Test065
     * @tc.desc Verify V=double value NaN, values double NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>([['nan', Number.NaN]]);
      let it: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = it.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6600
     * @tc.name readonlyMapValuesPart01Test066
     * @tc.desc Verify V=double value Infinity, values double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>([['inf', Number.POSITIVE_INFINITY]]);
      let it: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = it.next();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6700
     * @tc.name readonlyMapValuesPart01Test067
     * @tc.desc Verify V=double value -Infinity, values double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, double> = new Map<string, double>([['ninf', -Number.POSITIVE_INFINITY]]);
      let it: IterableIterator<double> = m.values();
      let r: IteratorResult<double> = it.next();
      expect(r.value!).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6800
     * @tc.name readonlyMapValuesPart01Test068
     * @tc.desc Verify V=number value NaN, values number NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['nan', Number.NaN]]);
      let it: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = it.next();
      expect(isNaN(r.value!)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_6900
     * @tc.name readonlyMapValuesPart01Test069
     * @tc.desc Verify V=number value Number.POSITIVE_INFINITY, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['inf', Number.POSITIVE_INFINITY]]);
      let it: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = it.next();
      expect(r.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_7000
     * @tc.name readonlyMapValuesPart01Test070
     * @tc.desc Verify V=number value Number.NEGATIVE_INFINITY, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, number> = new Map<string, number>([['ninf', Number.NEGATIVE_INFINITY]]);
      let it: IterableIterator<number> = m.values();
      let r: IteratorResult<number> = it.next();
      expect(r.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_7100
     * @tc.name readonlyMapValuesPart01Test071
     * @tc.desc Verify V=string value, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['empty', '']]);
      let it: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_7200
     * @tc.name readonlyMapValuesPart01Test072
     * @tc.desc Verify V=string value Unicode emoji, values emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['emoji', '😀']]);
      let it: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.value!).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_7300
     * @tc.name readonlyMapValuesPart01Test073
     * @tc.desc Verify V=string value XSS, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, string> = new Map<string, string>([['xss', '<script>alert(1)</script>']]);
      let it: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.value!).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_VALUES_PART01_TEST_7400
     * @tc.name readonlyMapValuesPart01Test074
     * @tc.desc Verify V=string value, values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapValuesPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = '';
      let baseUnit: string = '0123456789';
      for (let i: int = 0; i < 1000; i++) {
        longStr = longStr + baseUnit;
      }
      const m: ReadonlyMap<string, string> = new Map<string, string>([['long', longStr]]);
      let it: IterableIterator<string> = m.values();
      let r: IteratorResult<string> = it.next();
      expect(r.value!).assertEqual(longStr);
    });

  });
}
