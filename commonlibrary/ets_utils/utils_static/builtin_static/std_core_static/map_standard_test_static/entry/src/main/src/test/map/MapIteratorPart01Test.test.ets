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

interface ObjKey { id: int; name: string; }
class KeyClass { code: int = 0; }
interface ObjVal { score: int; label: string; }
class ValClass { tag: string = ''; }
interface EqKey { x: int; }

export default function mapIteratorPart01TestTest(): void {
  describe('MapIteratorPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0100
     * @tc.name mapIteratorPart01Test001
     * @tc.desc Verify Map $_iterator() 0 arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      expect(iter).not().assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0200
     * @tc.name mapIteratorPart01Test002
     * @tc.desc Verify Map $_iterator() 0 arity next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertFalse();
      expect(r.value![0]).assertEqual('a');
      expect(r.value![1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0300
     * @tc.name mapIteratorPart01Test003
     * @tc.desc Verify Map $_iterator() 0 arity next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r1: IteratorResult<[string, int]> = iter.next();
      expect(r1.done).assertFalse();
      let r2: IteratorResult<[string, int]> = iter.next();
      expect(r2.done).assertFalse();
      let r3: IteratorResult<[string, int]> = iter.next();
      expect(r3.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0400
     * @tc.name mapIteratorPart01Test004
     * @tc.desc Verify K=string $_iterator() string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('hello', 42);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0500
     * @tc.name mapIteratorPart01Test005
     * @tc.desc Verify K=int $_iterator() int key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(42, 'val');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0600
     * @tc.name mapIteratorPart01Test006
     * @tc.desc Verify K=number $_iterator() number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(3.14, 100);
      let iter: IterableIterator<[number, int]> = m.$_iterator();
      let r: IteratorResult<[number, int]> = iter.next();
      expect(r.value![0]).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0700
     * @tc.name mapIteratorPart01Test007
     * @tc.desc Verify K=boolean $_iterator() boolean key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 1);
      let iter: IterableIterator<[boolean, int]> = m.$_iterator();
      let r: IteratorResult<[boolean, int]> = iter.next();
      expect(r.value![0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0800
     * @tc.name mapIteratorPart01Test008
     * @tc.desc Verify K=long $_iterator() long key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(Int.toLong(1), 10);
      let iter: IterableIterator<[long, int]> = m.$_iterator();
      let r: IteratorResult<[long, int]> = iter.next();
      expect(r.value![0]).assertEqual(Int.toLong(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_0900
     * @tc.name mapIteratorPart01Test009
     * @tc.desc Verify K=double $_iterator() double key double number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<double, int> = new Map<double, int>();
      m.set(2.718 as double, 50);
      let iter: IterableIterator<[double, int]> = m.$_iterator();
      let r: IteratorResult<[double, int]> = iter.next();
      expect(r.value![0]).assertEqual(2.718 as double);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1000
     * @tc.name mapIteratorPart01Test010
     * @tc.desc Verify K=byte $_iterator() byte key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<byte, int> = new Map<byte, int>();
      m.set(64 as byte, 10);
      let iter: IterableIterator<[byte, int]> = m.$_iterator();
      let r: IteratorResult<[byte, int]> = iter.next();
      expect(r.value![0]).assertEqual(64 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1100
     * @tc.name mapIteratorPart01Test011
     * @tc.desc Verify K=short $_iterator() short key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<short, int> = new Map<short, int>();
      m.set(100 as short, 8);
      let iter: IterableIterator<[short, int]> = m.$_iterator();
      let r: IteratorResult<[short, int]> = iter.next();
      expect(r.value![0]).assertEqual(100 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1200
     * @tc.name mapIteratorPart01Test012
     * @tc.desc Verify K=float $_iterator() float key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<float, int> = new Map<float, int>();
      m.set(1.5 as float, 7);
      let iter: IterableIterator<[float, int]> = m.$_iterator();
      let r: IteratorResult<[float, int]> = iter.next();
      expect(r.value![0]).assertEqual(1.5 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1300
     * @tc.name mapIteratorPart01Test013
     * @tc.desc Verify K=char $_iterator() char key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<char, int> = new Map<char, int>();
      m.set(c'A', 99);
      let iter: IterableIterator<[char, int]> = m.$_iterator();
      let r: IteratorResult<[char, int]> = iter.next();
      expect(r.value![0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1400
     * @tc.name mapIteratorPart01Test014
     * @tc.desc Verify K=bigint $_iterator() bigint key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<bigint, int> = new Map<bigint, int>();
      m.set(9223372036854775807n, 5);
      let iter: IterableIterator<[bigint, int]> = m.$_iterator();
      let r: IteratorResult<[bigint, int]> = iter.next();
      expect(r.value![0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1500
     * @tc.name mapIteratorPart01Test015
     * @tc.desc Verify K=Date $_iterator() Date key key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1700000000000);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(d, 11);
      let iter: IterableIterator<[Date, int]> = m.$_iterator();
      let r: IteratorResult<[Date, int]> = iter.next();
      expect(r.value![0].getTime()).assertEqual(1700000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1600
     * @tc.name mapIteratorPart01Test016
     * @tc.desc Verify K=RegExp $_iterator() RegExp key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('test', 'g');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(re, 22);
      let iter: IterableIterator<[RegExp, int]> = m.$_iterator();
      let r: IteratorResult<[RegExp, int]> = iter.next();
      expect(r.value![0].source).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1700
     * @tc.name mapIteratorPart01Test017
     * @tc.desc Verify K=object/interface $_iterator() object key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: ObjKey = { id: 1, name: 'alpha' } as ObjKey;
      const m: Map<ObjKey, int> = new Map<ObjKey, int>();
      m.set(ok, 33);
      let iter: IterableIterator<[ObjKey, int]> = m.$_iterator();
      let r: IteratorResult<[ObjKey, int]> = iter.next();
      expect(r.value![0].id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1800
     * @tc.name mapIteratorPart01Test018
     * @tc.desc Verify K=class $_iterator() class key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let kc: KeyClass = new KeyClass();
      kc.code = 77;
      const m: Map<KeyClass, int> = new Map<KeyClass, int>();
      m.set(kc, 44);
      let iter: IterableIterator<[KeyClass, int]> = m.$_iterator();
      let r: IteratorResult<[KeyClass, int]> = iter.next();
      expect(r.value![0].code).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_1900
     * @tc.name mapIteratorPart01Test019
     * @tc.desc Verify K=Array $_iterator() Array key , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [10, 20, 30];
      const m: Map<int[], int> = new Map<int[], int>();
      m.set(arr, 55);
      let iter: IterableIterator<[int[], int]> = m.$_iterator();
      let r: IteratorResult<[int[], int]> = iter.next();
      expect(r.value![0].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2000
     * @tc.name mapIteratorPart01Test020
     * @tc.desc Verify K null $_iterator() null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | null, int> = new Map<string | null, int>();
      m.set(null, 66);
      let iter: IterableIterator<[string | null, int]> = m.$_iterator();
      let r: IteratorResult<[string | null, int]> = iter.next();
      expect(r.value![0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2100
     * @tc.name mapIteratorPart01Test021
     * @tc.desc Verify K undefined $_iterator() undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string | undefined, int> = new Map<string | undefined, int>();
      m.set(undefined, 77);
      let iter: IterableIterator<[string | undefined, int]> = m.$_iterator();
      let r: IteratorResult<[string | undefined, int]> = iter.next();
      expect(r.value![0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2200
     * @tc.name mapIteratorPart01Test022
     * @tc.desc Verify V=string $_iterator() string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, 'world');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![1]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2300
     * @tc.name mapIteratorPart01Test023
     * @tc.desc Verify V=int $_iterator() int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('x', 99);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![1]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2400
     * @tc.name mapIteratorPart01Test024
     * @tc.desc Verify V=number $_iterator() number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, number> = new Map<int, number>();
      m.set(1, 2.718);
      let iter: IterableIterator<[int, number]> = m.$_iterator();
      let r: IteratorResult<[int, number]> = iter.next();
      expect(r.value![1]).assertEqual(2.718);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2500
     * @tc.name mapIteratorPart01Test025
     * @tc.desc Verify V=boolean $_iterator() boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, boolean> = new Map<int, boolean>();
      m.set(1, false);
      let iter: IterableIterator<[int, boolean]> = m.$_iterator();
      let r: IteratorResult<[int, boolean]> = iter.next();
      expect(r.value![1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2600
     * @tc.name mapIteratorPart01Test026
     * @tc.desc Verify V=long $_iterator() long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, long> = new Map<int, long>();
      m.set(1, 999999999999);
      let iter: IterableIterator<[int, long]> = m.$_iterator();
      let r: IteratorResult<[int, long]> = iter.next();
      expect(r.value![1]).assertEqual(999999999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2700
     * @tc.name mapIteratorPart01Test027
     * @tc.desc Verify V=double $_iterator() double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, double> = new Map<int, double>();
      m.set(1, 1.414 as double);
      let iter: IterableIterator<[int, double]> = m.$_iterator();
      let r: IteratorResult<[int, double]> = iter.next();
      expect(r.value![1]).assertEqual(1.414 as double);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2800
     * @tc.name mapIteratorPart01Test028
     * @tc.desc Verify V=byte $_iterator() byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, byte> = new Map<int, byte>();
      m.set(1, 127 as byte);
      let iter: IterableIterator<[int, byte]> = m.$_iterator();
      let r: IteratorResult<[int, byte]> = iter.next();
      expect(r.value![1]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_2900
     * @tc.name mapIteratorPart01Test029
     * @tc.desc Verify V=short $_iterator() short value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, short> = new Map<int, short>();
      m.set(1, 5000 as short);
      let iter: IterableIterator<[int, short]> = m.$_iterator();
      let r: IteratorResult<[int, short]> = iter.next();
      expect(r.value![1]).assertEqual(5000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3000
     * @tc.name mapIteratorPart01Test030
     * @tc.desc Verify V=float $_iterator() float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, float> = new Map<int, float>();
      m.set(1, 0.125 as float);
      let iter: IterableIterator<[int, float]> = m.$_iterator();
      let r: IteratorResult<[int, float]> = iter.next();
      expect(r.value![1]).assertEqual(0.125 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3100
     * @tc.name mapIteratorPart01Test031
     * @tc.desc Verify V=char $_iterator() char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, char> = new Map<int, char>();
      m.set(1, c'Z');
      let iter: IterableIterator<[int, char]> = m.$_iterator();
      let r: IteratorResult<[int, char]> = iter.next();
      expect(r.value![1]).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3200
     * @tc.name mapIteratorPart01Test032
     * @tc.desc Verify V=bigint $_iterator() bigint value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, bigint> = new Map<int, bigint>();
      m.set(1, 9223372036854775807n);
      let iter: IterableIterator<[int, bigint]> = m.$_iterator();
      let r: IteratorResult<[int, bigint]> = iter.next();
      expect(r.value![1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3300
     * @tc.name mapIteratorPart01Test033
     * @tc.desc Verify V=Date $_iterator() Date value value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date(1800000000000);
      const m: Map<int, Date> = new Map<int, Date>();
      m.set(1, d);
      let iter: IterableIterator<[int, Date]> = m.$_iterator();
      let r: IteratorResult<[int, Date]> = iter.next();
      expect(r.value![1].getTime()).assertEqual(1800000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3400
     * @tc.name mapIteratorPart01Test034
     * @tc.desc Verify V=RegExp $_iterator() RegExp value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp('abc', 'i');
      const m: Map<int, RegExp> = new Map<int, RegExp>();
      m.set(1, re);
      let iter: IterableIterator<[int, RegExp]> = m.$_iterator();
      let r: IteratorResult<[int, RegExp]> = iter.next();
      expect(r.value![1].source).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3500
     * @tc.name mapIteratorPart01Test035
     * @tc.desc Verify V=object/interface $_iterator() object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ov: ObjVal = { score: 95, label: 'high' } as ObjVal;
      const m: Map<int, ObjVal> = new Map<int, ObjVal>();
      m.set(1, ov);
      let iter: IterableIterator<[int, ObjVal]> = m.$_iterator();
      let r: IteratorResult<[int, ObjVal]> = iter.next();
      expect(r.value![1].score).assertEqual(95);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3600
     * @tc.name mapIteratorPart01Test036
     * @tc.desc Verify V=class $_iterator() class value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vc: ValClass = new ValClass();
      vc.tag = 'important';
      const m: Map<int, ValClass> = new Map<int, ValClass>();
      m.set(1, vc);
      let iter: IterableIterator<[int, ValClass]> = m.$_iterator();
      let r: IteratorResult<[int, ValClass]> = iter.next();
      expect(r.value![1].tag).assertEqual('important');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3700
     * @tc.name mapIteratorPart01Test037
     * @tc.desc Verify V=Array $_iterator() Array value >]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ['x', 'y', 'z'];
      const m: Map<int, string[]> = new Map<int, string[]>();
      m.set(1, arr);
      let iter: IterableIterator<[int, string[]]> = m.$_iterator();
      let r: IteratorResult<[int, string[]]> = iter.next();
      expect(r.value![1].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3800
     * @tc.name mapIteratorPart01Test038
     * @tc.desc Verify V null $_iterator() null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string | null> = new Map<int, string | null>();
      m.set(1, null);
      let iter: IterableIterator<[int, string | null]> = m.$_iterator();
      let r: IteratorResult<[int, string | null]> = iter.next();
      expect(r.value![1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_3900
     * @tc.name mapIteratorPart01Test039
     * @tc.desc Verify V undefined $_iterator() undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string | undefined> = new Map<int, string | undefined>();
      m.set(1, undefined);
      let iter: IterableIterator<[int, string | undefined]> = m.$_iterator();
      let r: IteratorResult<[int, string | undefined]> = iter.next();
      expect(r.value![1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4000
     * @tc.name mapIteratorPart01Test040
     * @tc.desc Verify size=0 Map $_iterator() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4100
     * @tc.name mapIteratorPart01Test041
     * @tc.desc Verify size=1 Map $_iterator() next() done=true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('only', 999);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r1: IteratorResult<[string, int]> = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value![0]).assertEqual('only');
      let r2: IteratorResult<[string, int]> = iter.next();
      expect(r2.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4200
     * @tc.name mapIteratorPart01Test042
     * @tc.desc Verify key "" $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('', 100);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![0]).assertEqual('');
      expect(r.value![1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4300
     * @tc.name mapIteratorPart01Test043
     * @tc.desc Verify key $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('​', 200);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![0]).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4400
     * @tc.name mapIteratorPart01Test044
     * @tc.desc Verify key Unicode emoji $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('\u{1F600}', 300);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![0]).assertEqual('\u{1F600}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4500
     * @tc.name mapIteratorPart01Test045
     * @tc.desc Verify key XSS $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('<script>alert(1)</script>', 400);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![0]).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4600
     * @tc.name mapIteratorPart01Test046
     * @tc.desc Verify key 10000 $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k'.repeat(10000);
      const m: Map<string, int> = new Map<string, int>();
      m.set(longKey, 500);
      let iter: IterableIterator<[string, int]> = m.$_iterator();
      let r: IteratorResult<[string, int]> = iter.next();
      expect(r.value![0]).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4700
     * @tc.name mapIteratorPart01Test047
     * @tc.desc Verify key=2147483647 2147483647 $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(2147483647, 'max');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4800
     * @tc.name mapIteratorPart01Test048
     * @tc.desc Verify key=(-2147483647 - 1) -2147483648 $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-2147483648, 'min');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![0]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_4900
     * @tc.name mapIteratorPart01Test049
     * @tc.desc Verify key=0 $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(0, 'zero');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5000
     * @tc.name mapIteratorPart01Test050
     * @tc.desc Verify key=-1 $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(-1, 'neg_one');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5100
     * @tc.name mapIteratorPart01Test051
     * @tc.desc Verify key=1 $_iterator() key 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, 'pos_one');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5200
     * @tc.name mapIteratorPart01Test052
     * @tc.desc Verify key=NaN $_iterator() NaN key NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.NaN, 600);
      let iter: IterableIterator<[number, int]> = m.$_iterator();
      let r: IteratorResult<[number, int]> = iter.next();
      expect(isNaN(r.value![0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5300
     * @tc.name mapIteratorPart01Test053
     * @tc.desc Verify key=Number.POSITIVE_INFINITY $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.POSITIVE_INFINITY, 700);
      let iter: IterableIterator<[number, int]> = m.$_iterator();
      let r: IteratorResult<[number, int]> = iter.next();
      expect(r.value![0]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5400
     * @tc.name mapIteratorPart01Test054
     * @tc.desc Verify key=Number.NEGATIVE_INFINITY $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(Number.NEGATIVE_INFINITY, 800);
      let iter: IterableIterator<[number, int]> = m.$_iterator();
      let r: IteratorResult<[number, int]> = iter.next();
      expect(r.value![0]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5500
     * @tc.name mapIteratorPart01Test055
     * @tc.desc Verify key=-0.0 $_iterator() key +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<number, int> = new Map<number, int>();
      m.set(-0.0, 900);
      let iter: IterableIterator<[number, int]> = m.$_iterator();
      let r: IteratorResult<[number, int]> = iter.next();
      expect(1.0 / r.value![0]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5600
     * @tc.name mapIteratorPart01Test056
     * @tc.desc Verify key=true $_iterator() true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(true, 10);
      let iter: IterableIterator<[boolean, int]> = m.$_iterator();
      let r: IteratorResult<[boolean, int]> = iter.next();
      expect(r.value![0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5700
     * @tc.name mapIteratorPart01Test057
     * @tc.desc Verify key=false $_iterator() false key false undefined/key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<boolean, int> = new Map<boolean, int>();
      m.set(false, 20);
      let iter: IterableIterator<[boolean, int]> = m.$_iterator();
      let r: IteratorResult<[boolean, int]> = iter.next();
      expect(r.value![0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5800
     * @tc.name mapIteratorPart01Test058
     * @tc.desc Verify key=long.MAX $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set(9223372036854775807, 30);
      let iter: IterableIterator<[long, int]> = m.$_iterator();
      let r: IteratorResult<[long, int]> = iter.next();
      expect(r.value![0]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_5900
     * @tc.name mapIteratorPart01Test059
     * @tc.desc Verify key=long.MIN $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<long, int> = new Map<long, int>();
      m.set((-9223372036854775807 - 1), 40);
      let iter: IterableIterator<[long, int]> = m.$_iterator();
      let r: IteratorResult<[long, int]> = iter.next();
      expect(r.value![0]).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6000
     * @tc.name mapIteratorPart01Test060
     * @tc.desc Verify Date key $_iterator() Date key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date(1600000000000);
      let d2: Date = new Date(1600000000000);
      const m: Map<Date, int> = new Map<Date, int>();
      m.set(d1, 1);
      m.set(d2, 2);
      let iter: IterableIterator<[Date, int]> = m.$_iterator();
      let r1: IteratorResult<[Date, int]> = iter.next();
      let r2: IteratorResult<[Date, int]> = iter.next();
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6100
     * @tc.name mapIteratorPart01Test061
     * @tc.desc Verify RegExp pattern key $_iterator() key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re1: RegExp = new RegExp('same', 'g');
      let re2: RegExp = new RegExp('same', 'g');
      const m: Map<RegExp, int> = new Map<RegExp, int>();
      m.set(re1, 10);
      m.set(re2, 20);
      let iter: IterableIterator<[RegExp, int]> = m.$_iterator();
      let r1: IteratorResult<[RegExp, int]> = iter.next();
      let r2: IteratorResult<[RegExp, int]> = iter.next();
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6200
     * @tc.name mapIteratorPart01Test062
     * @tc.desc Verify object key $_iterator() structural equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: EqKey = { x: 5 } as EqKey;
      let o2: EqKey = { x: 5 } as EqKey;
      const m: Map<EqKey, int> = new Map<EqKey, int>();
      m.set(o1, 100);
      m.set(o2, 200);
      let iter: IterableIterator<[EqKey, int]> = m.$_iterator();
      let r1: IteratorResult<[EqKey, int]> = iter.next();
      let r2: IteratorResult<[EqKey, int]> = iter.next();
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6300
     * @tc.name mapIteratorPart01Test063
     * @tc.desc Verify value=2147483647 $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1, 2147483647);
      let iter: IterableIterator<[int, int]> = m.$_iterator();
      let r: IteratorResult<[int, int]> = iter.next();
      expect(r.value![1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6400
     * @tc.name mapIteratorPart01Test064
     * @tc.desc Verify value=(-2147483647 - 1) $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1, -2147483648);
      let iter: IterableIterator<[int, int]> = m.$_iterator();
      let r: IteratorResult<[int, int]> = iter.next();
      expect(r.value![1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6500
     * @tc.name mapIteratorPart01Test065
     * @tc.desc Verify value=NaN $_iterator() NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, number> = new Map<int, number>();
      m.set(1, Number.NaN);
      let iter: IterableIterator<[int, number]> = m.$_iterator();
      let r: IteratorResult<[int, number]> = iter.next();
      expect(isNaN(r.value![1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6600
     * @tc.name mapIteratorPart01Test066
     * @tc.desc Verify value=Number.POSITIVE_INFINITY $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, number> = new Map<int, number>();
      m.set(1, Number.POSITIVE_INFINITY);
      let iter: IterableIterator<[int, number]> = m.$_iterator();
      let r: IteratorResult<[int, number]> = iter.next();
      expect(r.value![1]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6700
     * @tc.name mapIteratorPart01Test067
     * @tc.desc Verify value=Number.NEGATIVE_INFINITY $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, number> = new Map<int, number>();
      m.set(1, Number.NEGATIVE_INFINITY);
      let iter: IterableIterator<[int, number]> = m.$_iterator();
      let r: IteratorResult<[int, number]> = iter.next();
      expect(r.value![1]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6800
     * @tc.name mapIteratorPart01Test068
     * @tc.desc Verify value=-0.0 $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, number> = new Map<int, number>();
      m.set(1, -0.0);
      let iter: IterableIterator<[int, number]> = m.$_iterator();
      let r: IteratorResult<[int, number]> = iter.next();
      expect(1.0 / r.value![1]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_6900
     * @tc.name mapIteratorPart01Test069
     * @tc.desc Verify value=0 $_iterator() 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, int> = new Map<int, int>();
      m.set(1, 0);
      let iter: IterableIterator<[int, int]> = m.$_iterator();
      let r: IteratorResult<[int, int]> = iter.next();
      expect(r.value![1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_7000
     * @tc.name mapIteratorPart01Test070
     * @tc.desc Verify value "" $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, '');
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_7100
     * @tc.name mapIteratorPart01Test071
     * @tc.desc Verify value 10000 $_iterator() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longVal: string = 'v'.repeat(10000);
      const m: Map<int, string> = new Map<int, string>();
      m.set(1, longVal);
      let iter: IterableIterator<[int, string]> = m.$_iterator();
      let r: IteratorResult<[int, string]> = iter.next();
      expect(r.value![1]).assertEqual(longVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_7200
     * @tc.name mapIteratorPart01Test072
     * @tc.desc Verify value Date value $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dv: Date = new Date(1500000000000);
      const m: Map<int, Date> = new Map<int, Date>();
      m.set(1, dv);
      let iter: IterableIterator<[int, Date]> = m.$_iterator();
      let r: IteratorResult<[int, Date]> = iter.next();
      expect(r.value![1]).assertEqual(dv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_7300
     * @tc.name mapIteratorPart01Test073
     * @tc.desc Verify value RegExp value $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rv: RegExp = new RegExp('boundary', 'g');
      const m: Map<int, RegExp> = new Map<int, RegExp>();
      m.set(1, rv);
      let iter: IterableIterator<[int, RegExp]> = m.$_iterator();
      let r: IteratorResult<[int, RegExp]> = iter.next();
      expect(r.value![1]).assertEqual(rv);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_ITERATOR_PART01_TEST_7400
     * @tc.name mapIteratorPart01Test074
     * @tc.desc Verify Map value int +string +number $_iterator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('mapIteratorPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<int, Object> = new Map<int, Object>();
      m.set(1, 2147483647 as Object);
      m.set(2, '' as Object);
      m.set(3, Number.NaN as Object);
      let iter: IterableIterator<[int, Object]> = m.$_iterator();
      let r1: IteratorResult<[int, Object]> = iter.next();
      expect(r1.value![0]).assertEqual(1);
      let r2: IteratorResult<[int, Object]> = iter.next();
      expect(r2.value![0]).assertEqual(2);
      let r3: IteratorResult<[int, Object]> = iter.next();
      expect(r3.value![0]).assertEqual(3);
      expect(r3.done).assertFalse();
    });

  });
}
