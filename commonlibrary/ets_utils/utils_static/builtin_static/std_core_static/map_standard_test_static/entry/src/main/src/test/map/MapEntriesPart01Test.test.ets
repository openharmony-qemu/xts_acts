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

class MyKeyClass {
  id: number = 0;
}
interface ObjKey {
  name: string;
  value: number;
}
class MyValClass {
  value: number = 0;
}
interface ObjVal {
  tag: string;
  count: number;
}
interface Payload {
  code: number;
  msg: string;
}

export default function mapEntriesPart01TestTest(): void {
  describe('MapEntriesPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0100
     * @tc.name mapEntriesPart01Test001
     * @tc.desc Verify entries() 0 arity IterableIterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('a');
      expect(e[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0200
     * @tc.name mapEntriesPart01Test002
     * @tc.desc Verify K=string entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('hello', 'world');
      let it: IterableIterator<[string, string]> = map.entries();
      let r: IteratorResult<[string, string]> = it.next();
      let e: [string, string] = r.value!;
      expect(e[0]).assertEqual('hello');
      expect(e[1]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0300
     * @tc.name mapEntriesPart01Test003
     * @tc.desc Verify K=int entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(42, 'val');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(42);
      expect(e[1]).assertEqual('val');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0400
     * @tc.name mapEntriesPart01Test004
     * @tc.desc Verify K=number entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(3.14, 'pi');
      let it: IterableIterator<[number, string]> = map.entries();
      let r: IteratorResult<[number, string]> = it.next();
      let e: [number, string] = r.value!;
      expect(e[0]).assertEqual(3.14);
      expect(e[1]).assertEqual('pi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0500
     * @tc.name mapEntriesPart01Test005
     * @tc.desc Verify K=boolean entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(true, 'yes');
      let it: IterableIterator<[boolean, string]> = map.entries();
      let r: IteratorResult<[boolean, string]> = it.next();
      let e: [boolean, string] = r.value!;
      expect(e[0]).assertTrue();
      expect(e[1]).assertEqual('yes');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0600
     * @tc.name mapEntriesPart01Test006
     * @tc.desc Verify K=long entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(100), 'longVal');
      let it: IterableIterator<[long, string]> = map.entries();
      let r: IteratorResult<[long, string]> = it.next();
      let e: [long, string] = r.value!;
      expect(e[0]).assertEqual(Int.toLong(100));
      expect(e[1]).assertEqual('longVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0700
     * @tc.name mapEntriesPart01Test007
     * @tc.desc Verify K=double entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<double, string> = new Map<double, string>();
      map.set(2.71828, 'euler');
      let it: IterableIterator<[double, string]> = map.entries();
      let r: IteratorResult<[double, string]> = it.next();
      let e: [double, string] = r.value!;
      expect(e[0]).assertEqual(2.71828);
      expect(e[1]).assertEqual('euler');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0800
     * @tc.name mapEntriesPart01Test008
     * @tc.desc Verify K=byte entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(64 as byte, 'byteVal');
      let it: IterableIterator<[byte, string]> = map.entries();
      let r: IteratorResult<[byte, string]> = it.next();
      let e: [byte, string] = r.value!;
      expect(e[0]).assertEqual(64 as byte);
      expect(e[1]).assertEqual('byteVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_0900
     * @tc.name mapEntriesPart01Test009
     * @tc.desc Verify K=short entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(1000 as short, 'shortVal');
      let it: IterableIterator<[short, string]> = map.entries();
      let r: IteratorResult<[short, string]> = it.next();
      let e: [short, string] = r.value!;
      expect(e[0]).assertEqual(1000 as short);
      expect(e[1]).assertEqual('shortVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1000
     * @tc.name mapEntriesPart01Test010
     * @tc.desc Verify K=float entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      map.set(1.5 as float, 'floatVal');
      let it: IterableIterator<[float, string]> = map.entries();
      let r: IteratorResult<[float, string]> = it.next();
      let e: [float, string] = r.value!;
      expect(e[0]).assertEqual(1.5 as float);
      expect(e[1]).assertEqual('floatVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1100
     * @tc.name mapEntriesPart01Test011
     * @tc.desc Verify K=char entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<char, string> = new Map<char, string>();
      let c: char = c'A';
      map.set(c, 'charVal');
      let it: IterableIterator<[char, string]> = map.entries();
      let r: IteratorResult<[char, string]> = it.next();
      let e: [char, string] = r.value!;
      expect(e[0]).assertEqual(c);
      expect(e[1]).assertEqual('charVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1200
     * @tc.name mapEntriesPart01Test012
     * @tc.desc Verify K=bigint entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<bigint, string> = new Map<bigint, string>();
      map.set(999n, 'bigVal');
      let it: IterableIterator<[bigint, string]> = map.entries();
      let r: IteratorResult<[bigint, string]> = it.next();
      let e: [bigint, string] = r.value!;
      expect(e[0]).assertEqual(999n);
      expect(e[1]).assertEqual('bigVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1300
     * @tc.name mapEntriesPart01Test013
     * @tc.desc Verify K=Date entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Date, string> = new Map<Date, string>();
      let d: Date = new Date(0);
      map.set(d, 'epoch');
      let it: IterableIterator<[Date, string]> = map.entries();
      let r: IteratorResult<[Date, string]> = it.next();
      let e: [Date, string] = r.value!;
      expect(e[0].getTime()).assertEqual(0);
      expect(e[1]).assertEqual('epoch');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1400
     * @tc.name mapEntriesPart01Test014
     * @tc.desc Verify K=RegExp entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<RegExp, string> = new Map<RegExp, string>();
      let re: RegExp = new RegExp('abc', 'g');
      map.set(re, 'regexVal');
      let it: IterableIterator<[RegExp, string]> = map.entries();
      let r: IteratorResult<[RegExp, string]> = it.next();
      let e: [RegExp, string] = r.value!;
      expect(e[0].source).assertEqual('abc');
      expect(e[1]).assertEqual('regexVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1500
     * @tc.name mapEntriesPart01Test015
     * @tc.desc Verify K=Error entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Error, string> = new Map<Error, string>();
      let err: Error = new Error('test');
      map.set(err, 'errVal');
      let it: IterableIterator<[Error, string]> = map.entries();
      let r: IteratorResult<[Error, string]> = it.next();
      let e: [Error, string] = r.value!;
      expect(e[0].message).assertEqual('test');
      expect(e[1]).assertEqual('errVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1600
     * @tc.name mapEntriesPart01Test016
     * @tc.desc Verify K=class entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<MyKeyClass, string> = new Map<MyKeyClass, string>();
      let k: MyKeyClass = new MyKeyClass();
      k.id = 10;
      map.set(k, 'classVal');
      let it: IterableIterator<[MyKeyClass, string]> = map.entries();
      let r: IteratorResult<[MyKeyClass, string]> = it.next();
      let e: [MyKeyClass, string] = r.value!;
      expect(e[0].id).assertEqual(10);
      expect(e[1]).assertEqual('classVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1700
     * @tc.name mapEntriesPart01Test017
     * @tc.desc Verify K=object(interface) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<ObjKey, string> = new Map<ObjKey, string>();
      let k: ObjKey = { name: 'item', value: 5 };
      map.set(k, 'objVal');
      let it: IterableIterator<[ObjKey, string]> = map.entries();
      let r: IteratorResult<[ObjKey, string]> = it.next();
      let e: [ObjKey, string] = r.value!;
      expect(e[0].name).assertEqual('item');
      expect(e[1]).assertEqual('objVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1800
     * @tc.name mapEntriesPart01Test018
     * @tc.desc Verify K=Array<int> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Array<int>, string> = new Map<Array<int>, string>();
      let arr: Array<int> = [1, 2, 3];
      map.set(arr, 'arrVal');
      let it: IterableIterator<[Array<int>, string]> = map.entries();
      let r: IteratorResult<[Array<int>, string]> = it.next();
      let e: [Array<int>, string] = r.value!;
      expect(e[0].length).assertEqual(3);
      expect(e[1]).assertEqual('arrVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_1900
     * @tc.name mapEntriesPart01Test019
     * @tc.desc Verify K=Map<string,int> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<Map<string, int>, string> = new Map<Map<string, int>, string>();
      const inner: Map<string, int> = new Map<string, int>();
      inner.set('x', 1);
      map.set(inner, 'nestedVal');
      const it: IterableIterator<[Map<string, int>, string]> = map.entries();
      const r: IteratorResult<[Map<string, int>, string]> = it.next();
      const e: [Map<string, int>, string] = r.value!;
      expect(e[0].get('x')).assertEqual(1);
      expect(e[1]).assertEqual('nestedVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2000
     * @tc.name mapEntriesPart01Test020
     * @tc.desc Verify V=int entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('count', 99);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('count');
      expect(e[1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2100
     * @tc.name mapEntriesPart01Test021
     * @tc.desc Verify V=number entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('ratio', 0.618);
      let it: IterableIterator<[string, number]> = map.entries();
      let r: IteratorResult<[string, number]> = it.next();
      let e: [string, number] = r.value!;
      expect(e[0]).assertEqual('ratio');
      expect(e[1]).assertEqual(0.618);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2200
     * @tc.name mapEntriesPart01Test022
     * @tc.desc Verify V=boolean entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, boolean> = new Map<string, boolean>();
      map.set('flag', false);
      let it: IterableIterator<[string, boolean]> = map.entries();
      let r: IteratorResult<[string, boolean]> = it.next();
      let e: [string, boolean] = r.value!;
      expect(e[0]).assertEqual('flag');
      expect(e[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2300
     * @tc.name mapEntriesPart01Test023
     * @tc.desc Verify V=long entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('big', Int.toLong(500));
      let it: IterableIterator<[string, long]> = map.entries();
      let r: IteratorResult<[string, long]> = it.next();
      let e: [string, long] = r.value!;
      expect(e[0]).assertEqual('big');
      expect(e[1]).assertEqual(Int.toLong(500));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2400
     * @tc.name mapEntriesPart01Test024
     * @tc.desc Verify V=double entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, double> = new Map<string, double>();
      map.set('precise', 3.14159265);
      let it: IterableIterator<[string, double]> = map.entries();
      let r: IteratorResult<[string, double]> = it.next();
      let e: [string, double] = r.value!;
      expect(e[0]).assertEqual('precise');
      expect(e[1]).assertEqual(3.14159265);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2500
     * @tc.name mapEntriesPart01Test025
     * @tc.desc Verify V=byte entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>();
      map.set('small', 100 as byte);
      let it: IterableIterator<[string, byte]> = map.entries();
      let r: IteratorResult<[string, byte]> = it.next();
      let e: [string, byte] = r.value!;
      expect(e[0]).assertEqual('small');
      expect(e[1]).assertEqual(100 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2600
     * @tc.name mapEntriesPart01Test026
     * @tc.desc Verify V=short entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, short> = new Map<string, short>();
      map.set('medium', 2000 as short);
      let it: IterableIterator<[string, short]> = map.entries();
      let r: IteratorResult<[string, short]> = it.next();
      let e: [string, short] = r.value!;
      expect(e[0]).assertEqual('medium');
      expect(e[1]).assertEqual(2000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2700
     * @tc.name mapEntriesPart01Test027
     * @tc.desc Verify V=float entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, float> = new Map<string, float>();
      map.set('approx', 2.718 as float);
      let it: IterableIterator<[string, float]> = map.entries();
      let r: IteratorResult<[string, float]> = it.next();
      let e: [string, float] = r.value!;
      expect(e[0]).assertEqual('approx');
      expect(e[1]).assertEqual(2.718 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2800
     * @tc.name mapEntriesPart01Test028
     * @tc.desc Verify V=char entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, char> = new Map<string, char>();
      let v: char = c'Z';
      map.set('letter', v);
      let it: IterableIterator<[string, char]> = map.entries();
      let r: IteratorResult<[string, char]> = it.next();
      let e: [string, char] = r.value!;
      expect(e[0]).assertEqual('letter');
      expect(e[1]).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_2900
     * @tc.name mapEntriesPart01Test029
     * @tc.desc Verify V=bigint entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, bigint> = new Map<string, bigint>();
      map.set('huge', 888n);
      let it: IterableIterator<[string, bigint]> = map.entries();
      let r: IteratorResult<[string, bigint]> = it.next();
      let e: [string, bigint] = r.value!;
      expect(e[0]).assertEqual('huge');
      expect(e[1]).assertEqual(888n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3000
     * @tc.name mapEntriesPart01Test030
     * @tc.desc Verify V=Date entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Date> = new Map<string, Date>();
      let v: Date = new Date(1000);
      map.set('ts', v);
      let it: IterableIterator<[string, Date]> = map.entries();
      let r: IteratorResult<[string, Date]> = it.next();
      let e: [string, Date] = r.value!;
      expect(e[0]).assertEqual('ts');
      expect(e[1].getTime()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3100
     * @tc.name mapEntriesPart01Test031
     * @tc.desc Verify V=RegExp entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, RegExp> = new Map<string, RegExp>();
      let v: RegExp = new RegExp('xyz', 'i');
      map.set('pattern', v);
      let it: IterableIterator<[string, RegExp]> = map.entries();
      let r: IteratorResult<[string, RegExp]> = it.next();
      let e: [string, RegExp] = r.value!;
      expect(e[0]).assertEqual('pattern');
      expect(e[1].source).assertEqual('xyz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3200
     * @tc.name mapEntriesPart01Test032
     * @tc.desc Verify V=Error entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Error> = new Map<string, Error>();
      let v: Error = new Error('fail');
      map.set('err', v);
      let it: IterableIterator<[string, Error]> = map.entries();
      let r: IteratorResult<[string, Error]> = it.next();
      let e: [string, Error] = r.value!;
      expect(e[0]).assertEqual('err');
      expect(e[1].message).assertEqual('fail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3300
     * @tc.name mapEntriesPart01Test033
     * @tc.desc Verify V=class entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, MyValClass> = new Map<string, MyValClass>();
      let v: MyValClass = new MyValClass();
      v.value = 77;
      map.set('obj', v);
      let it: IterableIterator<[string, MyValClass]> = map.entries();
      let r: IteratorResult<[string, MyValClass]> = it.next();
      let e: [string, MyValClass] = r.value!;
      expect(e[0]).assertEqual('obj');
      expect(e[1].value).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3400
     * @tc.name mapEntriesPart01Test034
     * @tc.desc Verify V=object(interface) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, ObjVal> = new Map<string, ObjVal>();
      let v: ObjVal = { tag: 'alpha', count: 3 };
      map.set('rec', v);
      let it: IterableIterator<[string, ObjVal]> = map.entries();
      let r: IteratorResult<[string, ObjVal]> = it.next();
      let e: [string, ObjVal] = r.value!;
      expect(e[0]).assertEqual('rec');
      expect(e[1].tag).assertEqual('alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3500
     * @tc.name mapEntriesPart01Test035
     * @tc.desc Verify V=Array<int> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Array<int>> = new Map<string, Array<int>>();
      let v: Array<int> = [10, 20, 30];
      map.set('list', v);
      let it: IterableIterator<[string, Array<int>]> = map.entries();
      let r: IteratorResult<[string, Array<int>]> = it.next();
      let e: [string, Array<int>] = r.value!;
      expect(e[0]).assertEqual('list');
      expect(e[1].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3600
     * @tc.name mapEntriesPart01Test036
     * @tc.desc Verify V=Map<string,int> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Map<string, int>> = new Map<string, Map<string, int>>();
      const v: Map<string, int> = new Map<string, int>();
      v.set('inner', 5);
      map.set('outer', v);
      const it: IterableIterator<[string, Map<string, int>]> = map.entries();
      const r: IteratorResult<[string, Map<string, int>]> = it.next();
      const e: [string, Map<string, int>] = r.value!;
      expect(e[0]).assertEqual('outer');
      expect(e[1].get('inner')).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3700
     * @tc.name mapEntriesPart01Test037
     * @tc.desc Verify V=Set<int> entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, Set<int>> = new Map<string, Set<int>>();
      let v: Set<int> = new Set<int>();
      v.add(42);
      map.set('setVal', v);
      let it: IterableIterator<[string, Set<int>]> = map.entries();
      let r: IteratorResult<[string, Set<int>]> = it.next();
      let e: [string, Set<int>] = r.value!;
      expect(e[0]).assertEqual('setVal');
      expect(e[1].has(42)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3800
     * @tc.name mapEntriesPart01Test038
     * @tc.desc Verify int key = 2147483647 (2147483647) entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(2147483647, 'maxInt');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(2147483647);
      expect(e[1]).assertEqual('maxInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_3900
     * @tc.name mapEntriesPart01Test039
     * @tc.desc Verify int key = (-2147483647 - 1) (-2147483648) entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-2147483648, 'minInt');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(-2147483648);
      expect(e[1]).assertEqual('minInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4000
     * @tc.name mapEntriesPart01Test040
     * @tc.desc Verify int key = 0 entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(0, 'zero');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(0);
      expect(e[1]).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4100
     * @tc.name mapEntriesPart01Test041
     * @tc.desc Verify int key = -1 entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(-1, 'negOne');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(-1);
      expect(e[1]).assertEqual('negOne');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4200
     * @tc.name mapEntriesPart01Test042
     * @tc.desc Verify int key = 1 entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, 'posOne');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(1);
      expect(e[1]).assertEqual('posOne');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4300
     * @tc.name mapEntriesPart01Test043
     * @tc.desc Verify number key = NaN entries() NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NaN, 'nanVal');
      let it: IterableIterator<[number, string]> = map.entries();
      let r: IteratorResult<[number, string]> = it.next();
      let e: [number, string] = r.value!;
      expect(isNaN(e[0])).assertTrue();
      expect(e[1]).assertEqual('nanVal');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4400
     * @tc.name mapEntriesPart01Test044
     * @tc.desc Verify number key = Number.POSITIVE_INFINITY entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.POSITIVE_INFINITY, 'posInf');
      let it: IterableIterator<[number, string]> = map.entries();
      let r: IteratorResult<[number, string]> = it.next();
      let e: [number, string] = r.value!;
      expect(e[0]).assertEqual(Number.POSITIVE_INFINITY);
      expect(e[1]).assertEqual('posInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4500
     * @tc.name mapEntriesPart01Test045
     * @tc.desc Verify number key = Number.NEGATIVE_INFINITY entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.NEGATIVE_INFINITY, 'negInf');
      let it: IterableIterator<[number, string]> = map.entries();
      let r: IteratorResult<[number, string]> = it.next();
      let e: [number, string] = r.value!;
      expect(e[0]).assertEqual(Number.NEGATIVE_INFINITY);
      expect(e[1]).assertEqual('negInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4600
     * @tc.name mapEntriesPart01Test046
     * @tc.desc Verify number key = -0.0 entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(-0.0, 'negZero');
      let it: IterableIterator<[number, string]> = map.entries();
      let r: IteratorResult<[number, string]> = it.next();
      let e: [number, string] = r.value!;
      expect((e[0] === -0.0)).assertTrue();
      expect(e[1]).assertEqual('negZero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4700
     * @tc.name mapEntriesPart01Test047
     * @tc.desc Verify number key = Number.EPSILON entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(Number.EPSILON, 'epsilon');
      let it: IterableIterator<[number, string]> = map.entries();
      let r: IteratorResult<[number, string]> = it.next();
      let e: [number, string] = r.value!;
      expect(e[0]).assertEqual(Number.EPSILON);
      expect(e[1]).assertEqual('epsilon');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4800
     * @tc.name mapEntriesPart01Test048
     * @tc.desc Verify string key = "" entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('', 0);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('');
      expect(e[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_4900
     * @tc.name mapEntriesPart01Test049
     * @tc.desc Verify string key = " " entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('​', 1);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('​');
      expect(e[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5000
     * @tc.name mapEntriesPart01Test050
     * @tc.desc Verify string key = Unicode emoji " " entries() emoji key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('😀', 2);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('😀');
      expect(e[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5100
     * @tc.name mapEntriesPart01Test051
     * @tc.desc Verify string key = XSS entries() XSS key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('<script>alert(1)</script>', 3);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('<script>alert(1)</script>');
      expect(e[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5200
     * @tc.name mapEntriesPart01Test052
     * @tc.desc Verify long key = long.MAX (9223372036854775807n) entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(9223372036854775807, 'maxLong');
      let it: IterableIterator<[long, string]> = map.entries();
      let r: IteratorResult<[long, string]> = it.next();
      let e: [long, string] = r.value!;
      expect(e[0]).assertEqual(9223372036854775807);
      expect(e[1]).assertEqual('maxLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5300
     * @tc.name mapEntriesPart01Test053
     * @tc.desc Verify long key = long.MIN (-9223372036854775808n) entries() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set((-9223372036854775807 - 1), 'minLong');
      let it: IterableIterator<[long, string]> = map.entries();
      let r: IteratorResult<[long, string]> = it.next();
      let e: [long, string] = r.value!;
      expect(e[0]).assertEqual((-9223372036854775807 - 1));
      expect(e[1]).assertEqual('minLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5400
     * @tc.name mapEntriesPart01Test054
     * @tc.desc Verify long key = 0n entries() long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<long, string> = new Map<long, string>();
      map.set(Int.toLong(0), 'zeroLong');
      let it: IterableIterator<[long, string]> = map.entries();
      let r: IteratorResult<[long, string]> = it.next();
      let e: [long, string] = r.value!;
      expect(e[0]).assertEqual(Int.toLong(0));
      expect(e[1]).assertEqual('zeroLong');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5500
     * @tc.name mapEntriesPart01Test055
     * @tc.desc Verify boolean key = false entries() false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<boolean, string> = new Map<boolean, string>();
      map.set(false, 'f');
      let it: IterableIterator<[boolean, string]> = map.entries();
      let r: IteratorResult<[boolean, string]> = it.next();
      let e: [boolean, string] = r.value!;
      expect(e[0]).assertFalse();
      expect(e[1]).assertEqual('f');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5600
     * @tc.name mapEntriesPart01Test056
     * @tc.desc Verify byte key = 127 (MAX) entries() byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(127 as byte, 'byteMax');
      let it: IterableIterator<[byte, string]> = map.entries();
      let r: IteratorResult<[byte, string]> = it.next();
      let e: [byte, string] = r.value!;
      expect(e[0]).assertEqual(127 as byte);
      expect(e[1]).assertEqual('byteMax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5700
     * @tc.name mapEntriesPart01Test057
     * @tc.desc Verify byte key = -128 (MIN) entries() byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<byte, string> = new Map<byte, string>();
      map.set(-128 as byte, 'byteMin');
      let it: IterableIterator<[byte, string]> = map.entries();
      let r: IteratorResult<[byte, string]> = it.next();
      let e: [byte, string] = r.value!;
      expect(e[0]).assertEqual(-128 as byte);
      expect(e[1]).assertEqual('byteMin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5800
     * @tc.name mapEntriesPart01Test058
     * @tc.desc Verify short key = 32767 (MAX) entries() short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(32767 as short, 'shortMax');
      let it: IterableIterator<[short, string]> = map.entries();
      let r: IteratorResult<[short, string]> = it.next();
      let e: [short, string] = r.value!;
      expect(e[0]).assertEqual(32767 as short);
      expect(e[1]).assertEqual('shortMax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_5900
     * @tc.name mapEntriesPart01Test059
     * @tc.desc Verify short key = -32768 (MIN) entries() short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<short, string> = new Map<short, string>();
      map.set(-32768 as short, 'shortMin');
      let it: IterableIterator<[short, string]> = map.entries();
      let r: IteratorResult<[short, string]> = it.next();
      let e: [short, string] = r.value!;
      expect(e[0]).assertEqual(-32768 as short);
      expect(e[1]).assertEqual('shortMin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6000
     * @tc.name mapEntriesPart01Test060
     * @tc.desc Verify float key = NaN entries() float NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      let fk: float = Float.NaN;
      map.set(fk, 'floatNaN');
      let it: IterableIterator<[float, string]> = map.entries();
      let r: IteratorResult<[float, string]> = it.next();
      let e: [float, string] = r.value!;
      expect(e[0]).not().assertEqual(e[0]);
      expect(e[1]).assertEqual('floatNaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6100
     * @tc.name mapEntriesPart01Test061
     * @tc.desc Verify float key = Infinity entries() float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      let fk: float = Float.POSITIVE_INFINITY;
      map.set(fk, 'floatInf');
      let it: IterableIterator<[float, string]> = map.entries();
      let r: IteratorResult<[float, string]> = it.next();
      let e: [float, string] = r.value!;
      expect(e[0]).assertEqual(fk);
      expect(e[1]).assertEqual('floatInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6200
     * @tc.name mapEntriesPart01Test062
     * @tc.desc Verify float key = -Infinity entries() float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<float, string> = new Map<float, string>();
      let fk: float = -Float.POSITIVE_INFINITY;
      map.set(fk, 'floatNegInf');
      let it: IterableIterator<[float, string]> = map.entries();
      let r: IteratorResult<[float, string]> = it.next();
      let e: [float, string] = r.value!;
      expect(e[0]).assertEqual(fk);
      expect(e[1]).assertEqual('floatNegInf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6300
     * @tc.name mapEntriesPart01Test063
     * @tc.desc Verify value = 2147483647 entries() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('k', 2147483647);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6400
     * @tc.name mapEntriesPart01Test064
     * @tc.desc Verify value = (-2147483647 - 1) entries() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('k', -2147483648);
      let it: IterableIterator<[string, int]> = map.entries();
      let r: IteratorResult<[string, int]> = it.next();
      let e: [string, int] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6500
     * @tc.name mapEntriesPart01Test065
     * @tc.desc Verify value = number.NaN entries() NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('k', Number.NaN);
      let it: IterableIterator<[string, number]> = map.entries();
      let r: IteratorResult<[string, number]> = it.next();
      let e: [string, number] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(isNaN(e[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6600
     * @tc.name mapEntriesPart01Test066
     * @tc.desc Verify value = Number.POSITIVE_INFINITY entries() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('k', Number.POSITIVE_INFINITY);
      let it: IterableIterator<[string, number]> = map.entries();
      let r: IteratorResult<[string, number]> = it.next();
      let e: [string, number] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6700
     * @tc.name mapEntriesPart01Test067
     * @tc.desc Verify value = Number.NEGATIVE_INFINITY entries() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      map.set('k', Number.NEGATIVE_INFINITY);
      let it: IterableIterator<[string, number]> = map.entries();
      let r: IteratorResult<[string, number]> = it.next();
      let e: [string, number] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6800
     * @tc.name mapEntriesPart01Test068
     * @tc.desc Verify value = "" entries() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      map.set(1, '');
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(1);
      expect(e[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_6900
     * @tc.name mapEntriesPart01Test069
     * @tc.desc Verify value = 10000 entries() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, string> = new Map<int, string>();
      let longStr: string = '';
      for (let i = 0; i < 5000; i++) {
        longStr += 'ab';
      }
      map.set(1, longStr);
      let it: IterableIterator<[int, string]> = map.entries();
      let r: IteratorResult<[int, string]> = it.next();
      let e: [int, string] = r.value!;
      expect(e[0]).assertEqual(1);
      expect(e[1].length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7000
     * @tc.name mapEntriesPart01Test070
     * @tc.desc Verify value = Date entries() Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, Date> = new Map<int, Date>();
      let v: Date = new Date(5000);
      map.set(1, v);
      let it: IterableIterator<[int, Date]> = map.entries();
      let r: IteratorResult<[int, Date]> = it.next();
      let e: [int, Date] = r.value!;
      expect(e[0]).assertEqual(1);
      expect(e[1].getTime()).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7100
     * @tc.name mapEntriesPart01Test071
     * @tc.desc Verify value = RegExp pattern entries() RegExp value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, RegExp> = new Map<int, RegExp>();
      let v: RegExp = new RegExp('test', 'g');
      map.set(1, v);
      let it: IterableIterator<[int, RegExp]> = map.entries();
      let r: IteratorResult<[int, RegExp]> = it.next();
      let e: [int, RegExp] = r.value!;
      expect(e[0]).assertEqual(1);
      expect(e[1].source).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7200
     * @tc.name mapEntriesPart01Test072
     * @tc.desc Verify value = object(interface) entries() object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, Payload> = new Map<int, Payload>();
      let v: Payload = { code: 200, msg: 'ok' };
      map.set(1, v);
      let it: IterableIterator<[int, Payload]> = map.entries();
      let r: IteratorResult<[int, Payload]> = it.next();
      let e: [int, Payload] = r.value!;
      expect(e[0]).assertEqual(1);
      expect(e[1].code).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7300
     * @tc.name mapEntriesPart01Test073
     * @tc.desc Verify value = long.MAX entries() long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('k', 9223372036854775807);
      let it: IterableIterator<[string, long]> = map.entries();
      let r: IteratorResult<[string, long]> = it.next();
      let e: [string, long] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7400
     * @tc.name mapEntriesPart01Test074
     * @tc.desc Verify value = long.MIN entries() long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, long> = new Map<string, long>();
      map.set('k', (-9223372036854775807 - 1));
      let it: IterableIterator<[string, long]> = map.entries();
      let r: IteratorResult<[string, long]> = it.next();
      let e: [string, long] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7500
     * @tc.name mapEntriesPart01Test075
     * @tc.desc Verify value = boolean false entries() false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, boolean> = new Map<int, boolean>();
      map.set(5, false);
      let it: IterableIterator<[int, boolean]> = map.entries();
      let r: IteratorResult<[int, boolean]> = it.next();
      let e: [int, boolean] = r.value!;
      expect(e[0]).assertEqual(5);
      expect(e[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7600
     * @tc.name mapEntriesPart01Test076
     * @tc.desc Verify value = byte.MAX entries() byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>();
      map.set('k', 127 as byte);
      let it: IterableIterator<[string, byte]> = map.entries();
      let r: IteratorResult<[string, byte]> = it.next();
      let e: [string, byte] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ENTRIES_PART01_7700
     * @tc.name mapEntriesPart01Test077
     * @tc.desc Verify value = byte.MIN entries() byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapEntriesPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, byte> = new Map<string, byte>();
      map.set('k', -128 as byte);
      let it: IterableIterator<[string, byte]> = map.entries();
      let r: IteratorResult<[string, byte]> = it.next();
      let e: [string, byte] = r.value!;
      expect(e[0]).assertEqual('k');
      expect(e[1]).assertEqual(-128 as byte);
    });

  });
}
