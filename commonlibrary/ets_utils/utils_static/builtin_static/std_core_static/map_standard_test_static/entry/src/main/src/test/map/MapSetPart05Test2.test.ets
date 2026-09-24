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

interface ObjLike {
  a: int;
  b: string;
}

enum SizeCode {
  SMALL = 0,
  MEDIUM = 1,
}

export default function mapSetPart05TestTest(): void {
  describe('MapSetPart05TestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0100
     * @tc.name mapSetPart05Test001
     * @tc.desc Verify set() RegExp key overwrite then entries() readback size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<RegExp, int>();
      const re: RegExp = new RegExp('pattern', 'g');
      map.set(re, 42);
      map.set(re, 84);
      expect(map.size).assertEqual(1);
      const eit: IterableIterator<[RegExp, int]> = map.entries();
      const entry: [RegExp, int] = eit.next().value!;
      expect(entry[0]).assertEqual(re);
      expect(entry[1]).assertEqual(84);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0200
     * @tc.name mapSetPart05Test002
     * @tc.desc Verify set() emoji key survives delete and re-insert into fresh map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('\u{1F600}', 1);
      let emojiKey: string = '\u{1F600}';
      m.delete(emojiKey);
      expect(m.has(emojiKey)).assertFalse();
      expect(m.size).assertEqual(0);
      m.set(emojiKey, 7);
      expect(m.has(emojiKey)).assertTrue();
      expect(m.get(emojiKey)).assertEqual(7);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0300
     * @tc.name mapSetPart05Test003
     * @tc.desc Verify set() 50000-char key overwrite update then has()/get()/size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = 'x'.repeat(50000);
      let m: Map<string, int> = new Map<string, int>();
      m.set(longKey, 1);
      m.set(longKey, 3);
      expect(m.size).assertEqual(1);
      expect(m.has(longKey)).assertTrue();
      expect(m.get(longKey)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0400
     * @tc.name mapSetPart05Test004
     * @tc.desc Verify set() 20000-char key distinct from 10000-char key size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKeyA: string = 'a'.repeat(10000);
      let longKeyB: string = 'b'.repeat(20000);
      let m: Map<string, int> = new Map<string, int>();
      m.set(longKeyA, 5);
      m.set(longKeyB, 6);
      expect(m.size).assertEqual(2);
      expect(m.has(longKeyA)).assertTrue();
      expect(m.get(longKeyA)).assertEqual(5);
      expect(m.has(longKeyB)).assertTrue();
      expect(m.get(longKeyB)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0500
     * @tc.name mapSetPart05Test005
     * @tc.desc Verify int.MAX key set and missing key get default overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 1);
      expect(m.size).assertEqual(1);
      expect(m.get(2147483647)).assertEqual(1);
      expect(m.get(999, -1)).assertEqual(-1);
      expect(m.has(999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0600
     * @tc.name mapSetPart05Test006
     * @tc.desc Verify set() int.MAX key overwrite last-wins has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 42);
      m.set(2147483647, 777);
      expect(m.has(2147483647)).assertTrue();
      expect(m.get(2147483647)).assertEqual(777);
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0700
     * @tc.name mapSetPart05Test007
     * @tc.desc Verify set() int.MIN key has() true and missing key delete() false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(-2147483648, 77);
      expect(m.get(-2147483648)!).assertEqual(77);
      expect(m.has(-2147483648)).assertTrue();
      expect(m.delete(-2147483648)).assertTrue();
      expect(m.has(-2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0800
     * @tc.name mapSetPart05Test008
     * @tc.desc Verify set() int key 0 overwrite then delete() then has() false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(0, 100);
      m.set(0, 500);
      expect(m.has(0)).assertTrue();
      expect(m.get(0)).assertEqual(500);
      expect(m.size).assertEqual(1);
      m.delete(0);
      expect(m.has(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_0900
     * @tc.name mapSetPart05Test009
     * @tc.desc Verify bigint.MAX key set() then get() returns value size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<bigint, int> = new Map<bigint, int>();
      m.set(9223372036854775807n, 1);
      expect(m.size).assertEqual(1);
      expect(m.get(9223372036854775807n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1000
     * @tc.name mapSetPart05Test010
     * @tc.desc Verify set() NaN value has() true and missing key default overload unaffected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, double> = new Map<string, double>();
      m.set('a', Number.NaN);
      let v: double = m.get('a')!;
      expect(isNaN(v)).assertTrue();
      expect(m.size).assertEqual(1);
      expect(m.has('a')).assertTrue();
      expect(m.get('missing', -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1100
     * @tc.name mapSetPart05Test011
     * @tc.desc Verify set() bigint.MAX value get() bigint.MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, bigint> = new Map<string, bigint>();
      m.set('a', 9223372036854775807n);
      expect(m.get('a')!).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1200
     * @tc.name mapSetPart05Test012
     * @tc.desc Verify set() short.MAX value get() short.MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, short> = new Map<string, short>();
      m.set('a', Int.toShort(32767));
      expect(m.get('a')!).assertEqual(Int.toShort(32767));
      expect(m.has('a')).assertTrue();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1300
     * @tc.name mapSetPart05Test013
     * @tc.desc Verify Number.EPSILON value set() then get() returns EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, double> = new Map<string, double>();
      m.set('a', Number.EPSILON);
      let v: double = m.get('a')!;
      expect(v).assertEqual(Number.EPSILON);
      expect(m.has('a')).assertTrue();
      expect(m.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1400
     * @tc.name mapSetPart05Test014
     * @tc.desc Verify set() Date key identity: same instance hit, same timestamp miss, overwrite size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Date, int> = new Map<Date, int>();
      let keyDate: Date = new Date(1000);
      let otherDate: Date = new Date(1000);
      m.set(keyDate, 1);
      m.set(otherDate, 2);
      m.set(keyDate, 9);
      expect(m.size).assertEqual(2);
      expect(m.get(keyDate)).assertEqual(9);
      expect(m.get(otherDate)).assertEqual(2);
      expect(m.has(keyDate)).assertTrue();
      expect(m.has(otherDate)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1500
     * @tc.name mapSetPart05Test015
     * @tc.desc Verify set() Date key delete then re-insert same instance and value mutation visible
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Date, int> = new Map<Date, int>();
      let d: Date = new Date(5000);
      m.set(d, 1);
      m.delete(d);
      expect(m.has(d)).assertFalse();
      expect(m.size).assertEqual(0);
      m.set(d, 2);
      expect(m.size).assertEqual(1);
      expect(m.get(d)).assertEqual(2);
      d.setTime(9999);
      expect(m.has(d)).assertTrue();
      expect(m.get(d)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1600
     * @tc.name mapSetPart05Test016
     * @tc.desc Verify set() object key overwrite then field mutation keeps identity hit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<ObjLike, int> = new Map<ObjLike, int>();
      let o: ObjLike = { a: 1, b: 'x' };
      m.set(o, 5);
      m.set(o, 95);
      expect(m.size).assertEqual(1);
      expect(m.get(o)).assertEqual(95);
      o.a = 2;
      expect(m.get(o)).assertEqual(95);
      expect(m.has(o)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1700
     * @tc.name mapSetPart05Test017
     * @tc.desc Verify Map set overwrite existing key size unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      let szBefore: int = m.size;
      m.set('b', 999);
      expect(m.size).assertEqual(szBefore);
      expect(m.get('b')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1800
     * @tc.name mapSetPart05Test018
     * @tc.desc Verify set() overwrite b then keys() iteration order a b c
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1);
      m.set('b', 2);
      m.set('c', 3);
      m.set('b', 999);
      let keys: string[] = [];
      let it: IterableIterator<string> = m.keys();
      let nextRes: IteratorResult<string> = it.next();
      while (!nextRes.done) {
        keys.push(nextRes.value!);
        nextRes = it.next();
      }
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_1900
     * @tc.name mapSetPart05Test019
     * @tc.desc Verify set 100 int keys get each value size 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      for (let i: int = 0; i < 100; i++) {
        m.set(i, i * 10);
      }
      for (let i: int = 0; i < 100; i++) {
        expect(m.get(i)!).assertEqual(i * 10);
      }
      expect(m.size).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2000
     * @tc.name mapSetPart05Test020
     * @tc.desc Verify get values of three set entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 1).set('b', 2).set('c', 3);
      expect(m.get('a')!).assertEqual(1);
      expect(m.get('b')!).assertEqual(2);
      expect(m.get('c')!).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2100
     * @tc.name mapSetPart05Test021
     * @tc.desc Verify set() int.MAX value then values() yields 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, int> = new Map<string, int>();
      m.set('a', 2147483647);
      let vit: IterableIterator<int> = m.values();
      let v: int = 0;
      const nv = vit.next().value;
      if (nv !== undefined) {
        v = nv;
      }
      expect(v).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2200
     * @tc.name mapSetPart05Test022
     * @tc.desc Verify set() bigint.MAX value then entries() yields bigint.MAX
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, bigint> = new Map<string, bigint>();
      m.set('a', 9223372036854775807n);
      let eit: IterableIterator<[string, bigint]> = m.entries();
      let entry: [string, bigint] = eit.next().value!;
      let entryValue: bigint = entry[1];
      expect(entryValue).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2300
     * @tc.name mapSetPart05Test023
     * @tc.desc Verify set() byte.MAX value then forEach() callback receives 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, byte> = new Map<string, byte>();
      m.set('a', Int.toByte(127));
      let captured: byte = Int.toByte(0);
      m.forEach((value: byte, key: string): void => {
        captured = value;
      });
      expect(captured).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2400
     * @tc.name mapSetPart05Test024
     * @tc.desc Verify short.MAX value set values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, short> = new Map<string, short>();
      m.set('a', Int.toShort(32767));
      m.set('b', Int.toShort(32767));
      let vit: IterableIterator<short> = m.values();
      let firstVal: short = vit.next().value!;
      let secondVal: short = vit.next().value!;
      expect(firstVal).assertEqual(Int.toShort(32767));
      expect(secondVal).assertEqual(Int.toShort(32767));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2500
     * @tc.name mapSetPart05Test025
     * @tc.desc Verify set() Number.EPSILON value then entries() yields EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, double> = new Map<string, double>();
      m.set('a', Number.EPSILON);
      let eit: IterableIterator<[string, double]> = m.entries();
      let entry: [string, double] = eit.next().value!;
      expect(entry[1]).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2600
     * @tc.name mapSetPart05Test026
     * @tc.desc Verify set() boundary int values then values() iteration order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(0, 2147483647);
      m.set(1, -2147483648);
      m.set(2, 0);
      let vit: IterableIterator<int> = m.values();
      expect(vit.next().value!).assertEqual(2147483647);
      expect(vit.next().value!).assertEqual(-2147483648);
      expect(vit.next().value!).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2700
     * @tc.name mapSetPart05Test027
     * @tc.desc Verify Map<string,bigint> set() bigint.MAX value then values()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, bigint> = new Map<string, bigint>();
      m.set('max', 9223372036854775807n);
      m.set('min', -9223372036854775808n);
      let vit: IterableIterator<bigint> = m.values();
      let r1: bigint | undefined = vit.next().value;
      expect(r1).assertEqual(9223372036854775807n);
      let r2: bigint | undefined = vit.next().value;
      expect(r2).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2800
     * @tc.name mapSetPart05Test028
     * @tc.desc Verify set() int.MAX and int.MIN keys coexist distinct size 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int, int> = new Map<int, int>();
      m.set(2147483647, 1);
      m.set(-2147483648, 2);
      expect(m.size).assertEqual(2);
      expect(m.get(2147483647)).assertEqual(1);
      expect(m.get(-2147483648)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_2900
     * @tc.name mapSetPart05Test029
     * @tc.desc Verify set() boolean false key overwrite size 1 and true key distinct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<boolean, int> = new Map<boolean, int>();
      m.set(false, 0);
      m.set(false, 1);
      m.set(true, 5);
      expect(m.size).assertEqual(2);
      expect(m.get(false)!).assertEqual(1);
      expect(m.get(true)!).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3000
     * @tc.name mapSetPart05Test030
     * @tc.desc Verify set int enum key then get returns stored value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<SizeCode, string> = new Map<SizeCode, string>();
      m.set(SizeCode.SMALL, 'small');
      m.set(SizeCode.MEDIUM, 'medium');
      expect(m.size).assertEqual(2);
      expect(m.has(SizeCode.SMALL)).assertTrue();
      expect(m.get(SizeCode.SMALL)!).assertEqual('small');
      expect(m.get(SizeCode.MEDIUM)!).assertEqual('medium');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3100
     * @tc.name mapSetPart05Test031
     * @tc.desc Verify Map set new key keeps existing entries size+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let preSize: int = map.size;
      let preA: int | undefined = map.get('a');
      let preB: int | undefined = map.get('b');
      map.set('c', 3);
      expect(map.size).assertEqual(preSize + 1);
      expect(map.get('a')).assertEqual(preA);
      expect(map.get('b')).assertEqual(preB);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3200
     * @tc.name mapSetPart05Test032
     * @tc.desc Verify set int key 0 then has false before true after and get roundtrip
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<int, string> = new Map<int, string>();
      expect(map.has(0)).assertFalse();
      map.set(0, 'zero');
      expect(map.has(0)).assertTrue();
      expect(map.get(0)).assertEqual('zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3300
     * @tc.name mapSetPart05Test033
     * @tc.desc Verify Map.toString() returns 'copy,5' after set key value pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('copy', 5);
      expect(map.get('copy')).assertEqual(5);
      let strResult: string = map.toString();
      expect(strResult).assertEqual('copy,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3400
     * @tc.name mapSetPart05Test034
     * @tc.desc Verify forEach() callback observes map.size during iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      let sizesObserved: int[] = [];
      map.forEach((_value: int, key: string): void => {
        sizesObserved.push(map.size);
        if (key === 'a') {
          map.set('b', 2);
        }
      });
      expect(sizesObserved[0]).assertEqual(1);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3500
     * @tc.name mapSetPart05Test035
     * @tc.desc Verify values() live iterator sees set() updated value during iteration
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('v1', 100);
      map.set('v2', 200);
      let valList: int[] = [];
      let vIter: IterableIterator<int> = map.values();
      for (let v of vIter) {
        valList.push(v);
        if (valList.length === 1) {
          map.set('v2', 999);
        }
      }
      expect(map.get('v2')).assertEqual(999);
      expect(valList[1]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3600
     * @tc.name mapSetPart05Test036
     * @tc.desc Verify two keys() iterators maintain independent cursors
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<string, int> = new Map<string, int>();
      map.set('s1', 1);
      map.set('s2', 2);
      map.set('s3', 3);
      let iterA: IterableIterator<string> = map.keys();
      let iterB: IterableIterator<string> = map.keys();
      let firstA: IteratorResult<string> = iterA.next();
      expect(firstA.done).assertFalse();
      expect(firstA.value).assertEqual('s1');
      let firstB: IteratorResult<string> = iterB.next();
      expect(firstB.done).assertFalse();
      expect(firstB.value).assertEqual('s1');
      let secondA: IteratorResult<string> = iterA.next();
      expect(secondA.value).assertEqual('s2');
      let secondB: IteratorResult<string> = iterB.next();
      expect(secondB.value).assertEqual('s2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3700
     * @tc.name mapSetPart05Test037
     * @tc.desc Verify Map alias reference set propagates (shared object)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let ref: Map<string, int> = map;
      map.set('dup', 1);
      ref.set('dup', 999);
      expect(map.size).assertEqual(ref.size);
      expect(map.size).assertEqual(1);
      expect(map.get('dup')).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3800
     * @tc.name mapSetPart05Test038
     * @tc.desc Verify set via alias then entries() lists all three keys
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primary: Map<string, int> = new Map<string, int>();
      let secondary: Map<string, int> = primary;
      secondary.set('s1', 1).set('s2', 2).set('s3', 3);
      let allEntries: string[] = [];
      let pIter: IterableIterator<[string, int]> = primary.entries();
      for (let entry of pIter) {
        allEntries.push(entry[0]);
      }
      expect(allEntries.length).assertEqual(3);
      expect(allEntries.includes('s1')).assertTrue();
      expect(allEntries.includes('s2')).assertTrue();
      expect(allEntries.includes('s3')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_3900
     * @tc.name mapSetPart05Test039
     * @tc.desc Verify Map.toString() lists three set entries alpha beta gamma
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('alpha', 1);
      map.set('beta', 2);
      map.set('gamma', 3);
      let str: string = map.toString();
      expect(str).assertEqual('alpha,1,beta,2,gamma,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4000
     * @tc.name mapSetPart05Test040
     * @tc.desc Verify Map set overwrite B then toString() contains A,C
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('A', 1);
      map.set('B', 2);
      map.set('C', 3);
      map.set('B', 222);
      let str: string = map.toString();
      expect(str).assertEqual('A,1,B,222,C,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4100
     * @tc.name mapSetPart05Test041
     * @tc.desc Verify set four keys with overwrite a then size equals 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      map.set('a', 11);
      map.set('c', 3);
      map.set('d', 4);
      expect(map.size).assertEqual(4);
      expect(map.get('a')).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4200
     * @tc.name mapSetPart05Test042
     * @tc.desc Verify set() int key 0 overwrite last-wins and missing key default overload
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map: Map<int, int> = new Map<int, int>();
      map.set(0, 0);
      map.set(0, 10);
      expect(map.size).assertEqual(1);
      expect(map.get(0)).assertEqual(10);
      expect(map.has(0)).assertTrue();
      expect(map.get(99, -1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4300
     * @tc.name mapSetPart05Test043
     * @tc.desc Verify K=byte MAX=127 set key V=int get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<byte, int> = new Map<byte, int>();
      map.set(Int.toByte(127), 100);
      expect(map.has(Int.toByte(127))).assertTrue();
      expect(map.get(Int.toByte(127))).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4400
     * @tc.name mapSetPart05Test044
     * @tc.desc Verify K=byte set set(127,v1) set(127,v2) size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<byte, int> = new Map<byte, int>();
      map.set(Int.toByte(127), 10);
      map.set(Int.toByte(127), 99);
      expect(map.size).assertEqual(1);
      expect(map.get(Int.toByte(127))).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4500
     * @tc.name mapSetPart05Test045
     * @tc.desc Verify K=char Unicode 'A' set key V=int get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<char, int> = new Map<char, int>();
      map.set(c'\u0041', 65);
      expect(map.has(c'\u0041')).assertTrue();
      expect(map.get(c'\u0041')).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4600
     * @tc.name mapSetPart05Test046
     * @tc.desc Verify set() char keys A and B then size 2 and get() each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<char, int> = new Map<char, int>();
      map.set(c'\u0041', 1);
      map.set(c'\u0042', 2);
      expect(map.size).assertEqual(2);
      expect(map.get(c'\u0041')).assertEqual(1);
      expect(map.get(c'\u0042')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4700
     * @tc.name mapSetPart05Test047
     * @tc.desc Verify K=char Unicode (0xFFFF) set size has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<char, string> = new Map<char, string>();
      map.set(c'\uFFFF', 'boundary');
      expect(map.has(c'\uFFFF')).assertTrue();
      expect(map.get(c'\uFFFF')).assertEqual('boundary');
      map.set(c'\uFFFF', 'updated');
      expect(map.size).assertEqual(1);
      expect(map.get(c'\uFFFF')).assertEqual('updated');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4800
     * @tc.name mapSetPart05Test048
     * @tc.desc Verify K=bigint set key V=int get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<bigint, int> = new Map<bigint, int>();
      let bigKey: bigint = 9007199254740991n;
      map.set(bigKey, 100);
      expect(map.has(bigKey)).assertTrue();
      expect(map.get(bigKey)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_4900
     * @tc.name mapSetPart05Test049
     * @tc.desc Verify set() bigint keys 1n and 2n then size 2 and get() each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<bigint, string> = new Map<bigint, string>();
      let k1: bigint = 1n;
      let k2: bigint = 2n;
      map.set(k1, 'one');
      map.set(k2, 'two');
      expect(map.size).assertEqual(2);
      expect(map.get(k1)).assertEqual('one');
      expect(map.get(k2)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5000
     * @tc.name mapSetPart05Test050
     * @tc.desc Verify K=bigint set key V=string bigint key has true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<bigint, string> = new Map<bigint, string>();
      let negKey: bigint = -9007199254740991n;
      map.set(negKey, 'negative');
      expect(map.has(negKey)).assertTrue();
      expect(map.get(negKey)).assertEqual('negative');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5100
     * @tc.name mapSetPart05Test051
     * @tc.desc Verify set() bigint keys 0n and maxSafe distinct size 2 get() each
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<bigint, string> = new Map<bigint, string>();
      map.set(0n, 'zero');
      map.set(9007199254740991n, 'maxSafe');
      expect(map.size).assertEqual(2);
      expect(map.get(0n)).assertEqual('zero');
      expect(map.get(9007199254740991n)).assertEqual('maxSafe');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5200
     * @tc.name mapSetPart05Test052
     * @tc.desc Verify V=Number.MAX_SAFE_INTEGER set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, double> = new Map<string, double>();
      map.set('safeMax', Number.MAX_SAFE_INTEGER);
      expect(map.get('safeMax')).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5300
     * @tc.name mapSetPart05Test053
     * @tc.desc Verify set() double +0.0 and -0.0 same key and +Infinity key distinct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, string> = new Map<double, string>();
      map.set(+0.0, 'first');
      map.set(-0.0, 'second');
      map.set(+0.0, 'third');
      map.set(Number.POSITIVE_INFINITY, 'inf');
      expect(map.size).assertEqual(2);
      expect(map.get(+0.0)).assertEqual('third');
      expect(map.get(-0.0)).assertEqual('third');
      expect(map.get(Number.POSITIVE_INFINITY)).assertEqual('inf');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5400
     * @tc.name mapSetPart05Test054
     * @tc.desc Verify V=short MIN(-32768) set get has size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, short> = new Map<string, short>();
      map.set('sMin', Int.toShort(-32768));
      expect(map.get('sMin')).assertEqual(Int.toShort(-32768));
      expect(map.has('sMin')).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5500
     * @tc.name mapSetPart05Test055
     * @tc.desc Verify Map set conditional value (empty map => 999) get=999 size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      let flag: boolean = map.size === 0;
      map.set('cond', flag ? 999 : 0);
      expect(map.get('cond')).assertEqual(999);
      expect(map.has('cond')).assertTrue();
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5600
     * @tc.name mapSetPart05Test056
     * @tc.desc Verify Map<byte, string> K=byte V=string set this
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<byte, string> = new Map<byte, string>();
      let result: Map<byte, string> = map.set(Int.toByte(127), 'byteMax');
      expect(result).assertEqual(map);
      expect(map.get(Int.toByte(127))).assertEqual('byteMax');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5700
     * @tc.name mapSetPart05Test057
     * @tc.desc Verify Map<char, boolean> set() char key then get() boolean value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<char, boolean> = new Map<char, boolean>();
      map.set(c'\u0041', true);
      map.set(c'\u0042', false);
      expect(map.size).assertEqual(2);
      let firstValue: boolean = map.get(c'A')!;
      expect(firstValue).assertTrue();
      let secondValue: boolean = map.get(c'B')!;
      expect(secondValue).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5800
     * @tc.name mapSetPart05Test058
     * @tc.desc Verify Map<bigint, Date> set() bigint key then get() Date value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<bigint, Date> = new Map<bigint, Date>();
      let d: Date = new Date(5000);
      let bigKey: bigint = 123456789n;
      map.set(bigKey, d);
      expect(map.get(bigKey)).assertEqual(d);
      expect(map.get(bigKey)!.getTime()).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_5900
     * @tc.name mapSetPart05Test059
     * @tc.desc Verify Map<double, string> K=double V=string set key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<double, string> = new Map<double, string>();
      map.set(42, 'intKey');
      map.set(3.14, 'floatKey');
      expect(map.size).assertEqual(2);
      expect(map.get(42)).assertEqual('intKey');
      expect(map.get(3.14)).assertEqual('floatKey');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6000
     * @tc.name mapSetPart05Test060
     * @tc.desc Verify set -0.0 double value get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, double>();
      const negZero: double = -0.0;
      map.set('negzero', negZero);
      const result: double = map.get('negzero')!;
      expect(1.0 / result).assertEqual(Number.NEGATIVE_INFINITY);
      expect(map.has('negzero')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6100
     * @tc.name mapSetPart05Test061
     * @tc.desc Verify set new key increments map size from 0 to 1 and get returns value 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>();
      const sizeBefore: int = map.size;
      map.set('a', 10);
      expect(map.size).assertEqual(sizeBefore + 1);
      expect(map.has('a')).assertTrue();
      expect(map.get('a')).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6200
     * @tc.name mapSetPart05Test062
     * @tc.desc Verify Array key Array set size=2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<int[], int> = new Map<int[], int>();
      let a1: int[] = [1, 2, 3];
      let a2: int[] = [1, 2, 3];
      m.set(a1, 10);
      m.set(a2, 20);
      expect(m.size).assertEqual(2);
      expect(m.get(a1)).assertEqual(10);
      expect(m.get(a2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6300
     * @tc.name mapSetPart05Test063
     * @tc.desc Verify set() Date value then get() returns Date
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<string, Date> = new Map<string, Date>();
      let d: Date = new Date(1000);
      m.set('a', d);
      let v: Date = m.get('a')!;
      expect(v.getTime()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6400
     * @tc.name mapSetPart05Test064
     * @tc.desc Verify byte.MIN key set() then get() returns value size 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<byte, int> = new Map<byte, int>();
      m.set(Int.toByte(-128), 1);
      expect(m.size).assertEqual(1);
      expect(m.get(Int.toByte(-128))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6500
     * @tc.name mapSetPart05Test065
     * @tc.desc Verify Array<int> key set() then has() true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int[], int>();
      const arr: int[] = [1, 2, 3];
      map.set(arr, 100);
      expect(map.get(arr)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6600
     * @tc.name mapSetPart05Test066
     * @tc.desc Verify set() duplicate key overwrite then entries() retains first key and updated value 200
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('keep', 10);
      map.set('update', 20);
      map.set('update', 200);
      let foundKeep: boolean = false;
      let foundUpdate: boolean = false;
      let updateVal: int = -1;
      let iter: IterableIterator<[string, int]> = map.entries();
      for (let entry of iter) {
        if (entry[0] === 'keep') {
          foundKeep = true;
        }
        if (entry[0] === 'update') {
          foundUpdate = true;
          updateVal = entry[1];
        }
      }
      expect(foundKeep).assertTrue();
      expect(foundUpdate).assertTrue();
      expect(updateVal).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6700
     * @tc.name mapSetPart05Test067
     * @tc.desc Verify set() shared Array value then mutation visible across maps
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedArr: int[] = [1, 2, 3];
      let m1: Map<string, int[]> = new Map<string, int[]>();
      let m2: Map<string, int[]> = new Map<string, int[]>();
      m1.set('arr', sharedArr);
      m2.set('arr', sharedArr);
      m1.get('arr')![0] = 999;
      expect(m2.get('arr')![0]).assertEqual(999);
      expect(m2.get('arr')).assertEqual(m1.get('arr'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6800
     * @tc.name mapSetPart05Test068
     * @tc.desc Verify set keys() N set key N+1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('p', 1);
      map.set('q', 2);
      let preIter: IterableIterator<string> = map.keys();
      let preCount: int = 0;
      let preNext: IteratorResult<string> = preIter.next();
      while (!preNext.done) {
        preCount = preCount + 1;
        preNext = preIter.next();
      }
      map.set('r', 3);
      let postIter: IterableIterator<string> = map.keys();
      let postCount: int = 0;
      let postNext: IteratorResult<string> = postIter.next();
      while (!postNext.done) {
        postCount = postCount + 1;
        postNext = postIter.next();
      }
      expect(postCount).assertEqual(preCount + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_6900
     * @tc.name mapSetPart05Test069
     * @tc.desc Verify set values() N set values() N size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('u', 100);
      map.set('v', 200);
      let preVCount: int = 0;
      let preIter: IterableIterator<int> = map.values();
      let preNxt: IteratorResult<int> = preIter.next();
      while (!preNxt.done) {
        preVCount = preVCount + 1;
        preNxt = preIter.next();
      }
      map.set('u', 111);
      let postIter: IterableIterator<int> = map.values();
      let postVCount: int = 0;
      let postNxt: IteratorResult<int> = postIter.next();
      while (!postNxt.done) {
        postVCount = postVCount + 1;
        postNxt = postIter.next();
      }
      expect(postVCount).assertEqual(preVCount);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_7000
     * @tc.name mapSetPart05Test070
     * @tc.desc Verify forEach() callback set('c',3) during iteration: has() size() get() reflect new key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, int> = new Map<string, int>();
      map.set('a', 1);
      map.set('b', 2);
      let keysSeen: string[] = [];
      let callbackCount: int = 0;
      map.forEach((_value: int, key: string): void => {
        keysSeen.push(key);
        callbackCount = callbackCount + 1;
        if (key === 'a') {
          map.set('c', 3);
        }
      });
      let observedCount: int = callbackCount;
      expect(observedCount).assertEqual(3);
      let firstObserved: string = keysSeen[0];
      expect(firstObserved).assertEqual('a');
      let secondObserved: string = keysSeen[1];
      expect(secondObserved).assertEqual('b');
      let thirdObserved: string = keysSeen[2];
      expect(thirdObserved).assertEqual('c');
      let hasC: boolean = map.has('c');
      expect(hasC).assertTrue();
      let sizeAfterIteration: int = map.size;
      expect(sizeAfterIteration).assertEqual(3);
      let newValue: int | undefined = map.get('c');
      expect(newValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_7100
     * @tc.name mapSetPart05Test071
     * @tc.desc Verify K=short MIN set(-32768,v1) set(-32768,v2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<short, string> = new Map<short, string>();
      map.set(Int.toShort(-32768), 'v1');
      map.set(Int.toShort(-32768), 'v2');
      expect(map.size).assertEqual(1);
      expect(map.get(Int.toShort(-32768))).assertEqual('v2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_MAP_SET_PART05_TEST_7200
     * @tc.name mapSetPart05Test072
     * @tc.desc Verify Map<byte, byte> set() byte key then get() byte value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('mapSetPart05Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<byte, byte> = new Map<byte, byte>();
      map.set(Int.toByte(127), Int.toByte(-128));
      expect(map.get(Int.toByte(127))).assertEqual(Int.toByte(-128));
    });

  });
}
