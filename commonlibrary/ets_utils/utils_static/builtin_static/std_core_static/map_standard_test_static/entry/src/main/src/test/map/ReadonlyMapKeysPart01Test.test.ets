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

interface ObjKey { id: number; label: string; }
class KeyCls { tag: string = ''; }
interface PKey { x: number; y: number; }
class CKey { uid: number = 0; }
interface EqKey { a: number; b: number; }

export default function readonlyMapKeysPart01TestTest(): void {
  describe('ReadonlyMapKeysPart01TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0100
     * @tc.name readonlyMapKeysPart01Test001
     * @tc.desc Verify keys() 0 arity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['a', 1]]);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0200
     * @tc.name readonlyMapKeysPart01Test002
     * @tc.desc Verify K=string Map<string,int> keys() string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['hello', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0300
     * @tc.name readonlyMapKeysPart01Test003
     * @tc.desc Verify K=int Map<int,int> keys() int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[42 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(42 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0400
     * @tc.name readonlyMapKeysPart01Test004
     * @tc.desc Verify K=number Map<number,int> keys() number( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[3.14, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0500
     * @tc.name readonlyMapKeysPart01Test005
     * @tc.desc Verify K=boolean Map<boolean,int> keys() boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1]]);
      let iter: IterableIterator<boolean> = m.keys();
      let result = iter.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0600
     * @tc.name readonlyMapKeysPart01Test006
     * @tc.desc Verify K=long Map<long,int> keys() long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, int> = new Map<long, int>([[Int.toLong(100), 1]]);
      let iter: IterableIterator<long> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0700
     * @tc.name readonlyMapKeysPart01Test007
     * @tc.desc Verify K=double Map<double,int> keys() double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, int> = new Map<double, int>([[1.5e0 as double, 1]]);
      let iter: IterableIterator<double> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(1.5e0 as double);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0800
     * @tc.name readonlyMapKeysPart01Test008
     * @tc.desc Verify K=byte Map<byte,int> keys() byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, int> = new Map<byte, int>([[64 as byte, 1]]);
      let iter: IterableIterator<byte> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(64 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_0900
     * @tc.name readonlyMapKeysPart01Test009
     * @tc.desc Verify K=short Map<short,int> keys() short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, int> = new Map<short, int>([[1000 as short, 1]]);
      let iter: IterableIterator<short> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(1000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1000
     * @tc.name readonlyMapKeysPart01Test010
     * @tc.desc Verify K=float Map<float,int> keys() float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<float, int> = new Map<float, int>([[2.5e0 as float, 1]]);
      let iter: IterableIterator<float> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(2.5e0 as float);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1100
     * @tc.name readonlyMapKeysPart01Test011
     * @tc.desc Verify K=char Map<char,int> keys() char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<char, int> = new Map<char, int>([[c'A', 1]]);
      let iter: IterableIterator<char> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1200
     * @tc.name readonlyMapKeysPart01Test012
     * @tc.desc Verify K=bigint Map<bigint,int> keys() bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<bigint, int> = new Map<bigint, int>([[9999999999999n, 1]]);
      let iter: IterableIterator<bigint> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(9999999999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1300
     * @tc.name readonlyMapKeysPart01Test013
     * @tc.desc Verify K=Date Map<Date,int> keys() Date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: Date = new Date();
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[d, 1]]);
      let iter: IterableIterator<Date> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(d);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1400
     * @tc.name readonlyMapKeysPart01Test014
     * @tc.desc Verify K=RegExp Map<RegExp,int> keys() RegExp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: RegExp = new RegExp('test', 'g');
      const m: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[r, 1]]);
      let iter: IterableIterator<RegExp> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1500
     * @tc.name readonlyMapKeysPart01Test015
     * @tc.desc Verify K=Error Map<Error,int> keys() Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error('errMsg');
      const m: ReadonlyMap<Error, int> = new Map<Error, int>([[e, 1]]);
      let iter: IterableIterator<Error> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(e);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1600
     * @tc.name readonlyMapKeysPart01Test016
     * @tc.desc Verify K=object(interface) Map<ObjKey,int> keys() object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ObjKey = { id: 1, label: 'alpha' };
      const m: ReadonlyMap<ObjKey, int> = new Map<ObjKey, int>([[obj, 1]]);
      let iter: IterableIterator<ObjKey> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1700
     * @tc.name readonlyMapKeysPart01Test017
     * @tc.desc Verify K=class Map<KeyCls,int> keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inst: KeyCls = new KeyCls();
      inst.tag = 'k1';
      const m: ReadonlyMap<KeyCls, int> = new Map<KeyCls, int>([[inst, 1]]);
      let iter: IterableIterator<KeyCls> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(inst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1800
     * @tc.name readonlyMapKeysPart01Test018
     * @tc.desc Verify K=Array<int> Map<int ,int> keys() Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: int[] = [1, 2, 3];
      const m: ReadonlyMap<int[], int> = new Map<int[], int>([[arr, 1]]);
      let iter: IterableIterator<int[]> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_1900
     * @tc.name readonlyMapKeysPart01Test019
     * @tc.desc Verify K=Map<string,int> Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Map<string, int> = new Map<string, int>([['x', 1]]);
      const m: ReadonlyMap<Map<string, int>, int> = new Map<Map<string, int>, int>([[inner, 1]]);
      const iter: IterableIterator<Map<string, int>> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2000
     * @tc.name readonlyMapKeysPart01Test020
     * @tc.desc Verify K=Set<int> Set keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<int> = new Set<int>([10 as int, 20 as int]);
      const m: ReadonlyMap<Set<int>, int> = new Map<Set<int>, int>([[s, 1]]);
      let iter: IterableIterator<Set<int>> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2100
     * @tc.name readonlyMapKeysPart01Test021
     * @tc.desc Verify Map "" key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2200
     * @tc.name readonlyMapKeysPart01Test022
     * @tc.desc Verify Map key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['​', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2300
     * @tc.name readonlyMapKeysPart01Test023
     * @tc.desc Verify Map Unicode emoji key emoji keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['😀', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2400
     * @tc.name readonlyMapKeysPart01Test024
     * @tc.desc Verify Map XSS <script>alert(1)</script> key XSS keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['<script>alert(1)</script>', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('<script>alert(1)</script>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2500
     * @tc.name readonlyMapKeysPart01Test025
     * @tc.desc Verify Map (10000 ) key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'k'.repeat(10000);
      const m: ReadonlyMap<string, int> = new Map<string, int>([[longKey, 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(longKey);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2600
     * @tc.name readonlyMapKeysPart01Test026
     * @tc.desc Verify Map key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['     ', 1]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('     ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2700
     * @tc.name readonlyMapKeysPart01Test027
     * @tc.desc Verify Map 2147483647(2147483647) key int keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[2147483647 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(2147483647 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2800
     * @tc.name readonlyMapKeysPart01Test028
     * @tc.desc Verify Map (-2147483647 - 1)(-2147483648) key int keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[-2147483648 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(-2147483648 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_2900
     * @tc.name readonlyMapKeysPart01Test029
     * @tc.desc Verify Map 0 int key int keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[0 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(0 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3000
     * @tc.name readonlyMapKeysPart01Test030
     * @tc.desc Verify Map -1 int key int keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[-1 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(-1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3100
     * @tc.name readonlyMapKeysPart01Test031
     * @tc.desc Verify Map 1 int key int keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[1 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(1 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3200
     * @tc.name readonlyMapKeysPart01Test032
     * @tc.desc Verify Map NaN number key NaN keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.NaN, 1]]);
      let iter: IterableIterator<number> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3300
     * @tc.name readonlyMapKeysPart01Test033
     * @tc.desc Verify Map Number.POSITIVE_INFINITY number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.POSITIVE_INFINITY, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3400
     * @tc.name readonlyMapKeysPart01Test034
     * @tc.desc Verify Map Number.NEGATIVE_INFINITY number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.NEGATIVE_INFINITY, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3500
     * @tc.name readonlyMapKeysPart01Test035
     * @tc.desc Verify Map -0.0 number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[-0.0, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(-0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3600
     * @tc.name readonlyMapKeysPart01Test036
     * @tc.desc Verify Map Number.EPSILON number key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[Number.EPSILON, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3700
     * @tc.name readonlyMapKeysPart01Test037
     * @tc.desc Verify Map false boolean key false keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[false, 1]]);
      let iter: IterableIterator<boolean> = m.keys();
      let result = iter.next();
      expect(result.value!).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3800
     * @tc.name readonlyMapKeysPart01Test038
     * @tc.desc Verify Map long.MAX(9223372036854775807n) key long keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, int> = new Map<long, int>([[9223372036854775807, 1]]);
      let iter: IterableIterator<long> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_3900
     * @tc.name readonlyMapKeysPart01Test039
     * @tc.desc Verify Map long.MIN(-9223372036854775808n) key long keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<long, int> = new Map<long, int>([[(-9223372036854775807 - 1), 1]]);
      let iter: IterableIterator<long> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual((-9223372036854775807 - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4000
     * @tc.name readonlyMapKeysPart01Test040
     * @tc.desc Verify Map double NaN key NaN keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, int> = new Map<double, int>([[Number.NaN as double, 1]]);
      let iter: IterableIterator<double> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4100
     * @tc.name readonlyMapKeysPart01Test041
     * @tc.desc Verify Map double Infinity key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, int> = new Map<double, int>([[(1.0e0 / 0.0e0) as double, 1]]);
      let iter: IterableIterator<double> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual((1.0e0 / 0.0e0) as double);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4200
     * @tc.name readonlyMapKeysPart01Test042
     * @tc.desc Verify Map double EPSILON key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<double, int> = new Map<double, int>([[Number.EPSILON as double, 1]]);
      let iter: IterableIterator<double> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Number.EPSILON as double);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4300
     * @tc.name readonlyMapKeysPart01Test043
     * @tc.desc Verify Map byte.MAX(127) key byte keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, int> = new Map<byte, int>([[127 as byte, 1]]);
      let iter: IterableIterator<byte> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4400
     * @tc.name readonlyMapKeysPart01Test044
     * @tc.desc Verify Map byte.MIN(-128) key byte keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<byte, int> = new Map<byte, int>([[-128 as byte, 1]]);
      let iter: IterableIterator<byte> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(-128 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4500
     * @tc.name readonlyMapKeysPart01Test045
     * @tc.desc Verify Map short.MAX(32767) key short keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, int> = new Map<short, int>([[32767 as short, 1]]);
      let iter: IterableIterator<short> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4600
     * @tc.name readonlyMapKeysPart01Test046
     * @tc.desc Verify Map short.MIN(-32768) key short keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<short, int> = new Map<short, int>([[-32768 as short, 1]]);
      let iter: IterableIterator<short> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4700
     * @tc.name readonlyMapKeysPart01Test047
     * @tc.desc Verify Map float NaN key NaN keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<float, int> = new Map<float, int>([[Float.NaN, 1]]);
      let iter: IterableIterator<float> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4800
     * @tc.name readonlyMapKeysPart01Test048
     * @tc.desc Verify Map float Infinity key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<float, int> = new Map<float, int>([[Double.toFloat(1.0e0 / 0.0e0), 1]]);
      let iter: IterableIterator<float> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(Double.toFloat(1.0e0 / 0.0e0));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_4900
     * @tc.name readonlyMapKeysPart01Test049
     * @tc.desc Verify Map null key null keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string | null, int> = new Map<string | null, int>([[null, 1]]);
      let iter: IterableIterator<string | null> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5000
     * @tc.name readonlyMapKeysPart01Test050
     * @tc.desc Verify Map undefined key undefined keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string | undefined, int> = new Map<string | undefined, int>([[undefined, 1]]);
      let iter: IterableIterator<string | undefined> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5100
     * @tc.name readonlyMapKeysPart01Test051
     * @tc.desc Verify Map object(POJO interface) key object keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pk: PKey = { x: 10, y: 20 };
      const m: ReadonlyMap<PKey, int> = new Map<PKey, int>([[pk, 100]]);
      let iter: IterableIterator<PKey> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(pk);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5200
     * @tc.name readonlyMapKeysPart01Test052
     * @tc.desc Verify Map class key keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ck: CKey = new CKey();
      ck.uid = 999;
      const m: ReadonlyMap<CKey, int> = new Map<CKey, int>([[ck, 100]]);
      let iter: IterableIterator<CKey> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(ck);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5300
     * @tc.name readonlyMapKeysPart01Test053
     * @tc.desc Verify empty ReadonlyMap int key iterator is available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: ReadonlyMap<int, int> = new Map<int, int>();
      const iterator: IterableIterator<int> = map.keys();
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5400
     * @tc.name readonlyMapKeysPart01Test054
     * @tc.desc Verify size=1 Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['onlyKey', 1]]);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5500
     * @tc.name readonlyMapKeysPart01Test055
     * @tc.desc Verify size=3 Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['first', 1], ['second', 2], ['third', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('first');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5600
     * @tc.name readonlyMapKeysPart01Test056
     * @tc.desc Verify Map key size=1 key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['dup', 1], ['dup', 2], ['dup', 3]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('dup');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5700
     * @tc.name readonlyMapKeysPart01Test057
     * @tc.desc Verify Map Date equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: Date = new Date();
      let d2: Date = new Date();
      const m: ReadonlyMap<Date, int> = new Map<Date, int>([[d1, 1], [d2, 2]]);
      let iter: IterableIterator<Date> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(d1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5800
     * @tc.name readonlyMapKeysPart01Test058
     * @tc.desc Verify Map pattern RegExp equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: RegExp = new RegExp('abc', 'g');
      let r2: RegExp = new RegExp('abc', 'g');
      const m: ReadonlyMap<RegExp, int> = new Map<RegExp, int>([[r1, 1], [r2, 2]]);
      let iter: IterableIterator<RegExp> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_5900
     * @tc.name readonlyMapKeysPart01Test059
     * @tc.desc Verify Map object equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1: EqKey = { a: 1, b: 2 };
      let o2: EqKey = { a: 1, b: 2 };
      const m: ReadonlyMap<EqKey, int> = new Map<EqKey, int>([[o1, 10], [o2, 20]]);
      let iter: IterableIterator<EqKey> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(o1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6000
     * @tc.name readonlyMapKeysPart01Test060
     * @tc.desc Verify Map Array equals , int>]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: int[] = [1, 2, 3];
      let a2: int[] = [1, 2, 3];
      const m: ReadonlyMap<int[], int> = new Map<int[], int>([[a1, 10], [a2, 20]]);
      let iter: IterableIterator<int[]> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(a1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6100
     * @tc.name readonlyMapKeysPart01Test061
     * @tc.desc Verify 0x int Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[0xFF as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(0xFF as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6200
     * @tc.name readonlyMapKeysPart01Test062
     * @tc.desc Verify 0o int Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[0o77 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(0o77 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6300
     * @tc.name readonlyMapKeysPart01Test063
     * @tc.desc Verify 0b int Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[0b1010 as int, 1]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(0b1010 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6400
     * @tc.name readonlyMapKeysPart01Test064
     * @tc.desc Verify number Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<number, int> = new Map<number, int>([[1.5e2, 1]]);
      let iter: IterableIterator<number> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(1.5e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6500
     * @tc.name readonlyMapKeysPart01Test065
     * @tc.desc Verify Map keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<int, int> = new Map<int, int>([[-5 as int, 1], [0 as int, 2], [5 as int, 3]]);
      let iter: IterableIterator<int> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual(-5 as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6600
     * @tc.name readonlyMapKeysPart01Test066
     * @tc.desc Verify Map entries keys() entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['e1', 1], ['e2', 2], ['e3', 3]]);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(3);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6700
     * @tc.name readonlyMapKeysPart01Test067
     * @tc.desc Verify Map entries keys() entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entries: [string, int][] = [];
      const m: ReadonlyMap<string, int> = new Map<string, int>(entries);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6800
     * @tc.name readonlyMapKeysPart01Test068
     * @tc.desc Verify Map null entries keys() null entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>(null);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(0);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_6900
     * @tc.name readonlyMapKeysPart01Test069
     * @tc.desc Verify Map entries key entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['dupK', 1], ['dupK', 2]]);
      let iter: IterableIterator<string> = m.keys();
      expect(m.size).assertEqual(1);
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_7000
     * @tc.name readonlyMapKeysPart01Test070
     * @tc.desc Verify Map boolean true false keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<boolean, int> = new Map<boolean, int>([[true, 1], [false, 2]]);
      let iter: IterableIterator<boolean> = m.keys();
      let result = iter.next();
      expect(result.value!).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYMAP_KEYS_PART01_TEST_7100
     * @tc.name readonlyMapKeysPart01Test071
     * @tc.desc Verify Map set keys()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('readonlyMapKeysPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: ReadonlyMap<string, int> = new Map<string, int>([['k1', 1], ['k2', 2], ['k3', 3], ['k4', 4], ['k5', 5]]);
      let iter: IterableIterator<string> = m.keys();
      let result = iter.next();
      expect(result.value!).assertEqual('k1');
    });

  });
}
