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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ObjWithX {
  x: int;
}

interface Lvl2Val {
  val: int;
}

interface Lvl1Obj {
  lvl2: Lvl2Val;
}

interface ObjLVL {
  lvl1: Lvl1Obj;
}

interface SimpleObj {
  val: int;
}

export default function ArrayFill1_2Test(): void {
  describe('ArrayFill1_2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0010
     * @tc.name testArrayFillOne001
     * @tc.desc Verify logical OR expression as fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string | null | undefined>(null, undefined, 0);
      const x: int | string | null = null;
      arr.fill(x || 'fallback', 0, 3);
      expect(arr[0]).assertEqual('fallback');
      expect(arr[2]).assertEqual('fallback');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0020
     * @tc.name testArrayFillOne002
     * @tc.desc Verify bitwise OR expression as fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 0, 0);
      arr.fill(0xFF | 0x100, 0, 3);
      expect(arr[0]).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0030
     * @tc.name testArrayFillOne003
     * @tc.desc Verify nullish coalescing expression as end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.fill(8, 0, 3);
      expect(arr[0]).assertEqual(8);
      expect(arr[2]).assertEqual(8);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0040
     * @tc.name testArrayFillOne004
     * @tc.desc Verify fill nested object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjWithX>({ x: 0 }, { x: 0 });
      arr.fill({ x: 10 }, 0, 2);
      expect(arr[0].x).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0050
     * @tc.name testArrayFillOne005
     * @tc.desc Verify fill nested array with new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2);
      const b = new Array<int>(3, 4);
      const arr = new Array<Array<int>>(a, b);
      arr.fill(new Array<int>(0, 0), 0, 2);
      expect(arr[0][0]).assertEqual(0);
      expect(arr[1][0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0060
     * @tc.name testArrayFillOne006
     * @tc.desc Verify deep nested fill with independent objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ObjLVL>({ lvl1: { lvl2: { val: 1 } } }, { lvl1: { lvl2: { val: 1 } } });
      arr.fill({ lvl1: { lvl2: { val: 2 } } }, 0, 2);
      expect(arr[0].lvl1.lvl2.val).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0070
     * @tc.name testArrayFillOne007
     * @tc.desc Verify fill with Map element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = Array.create<Map<string, int>>(1, m);
      arr.fill(new Map<string, int>(new Array<[string, int]>(['k', 2])), 0, 1);
      expect(arr[0].get('k')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0080
     * @tc.name testArrayFillOne008
     * @tc.desc Verify fill with Date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2020, 0, 1);
      const arr = new Array<Date>(d, d);
      arr.fill(new Date(2025, 11, 25), 0, 2);
      expect(arr[0].getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0090
     * @tc.name testArrayFillOne009
     * @tc.desc Verify fill push fill chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(9, 0, 3);
      a.push(4);
      a.fill(8, 3, 4);
      expect(a[0]).assertEqual(9);
      expect(a[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0100
     * @tc.name testArrayFillOne010
     * @tc.desc Verify fill sort fill chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 1, 2);
      arr.fill(9, 0, 3);
      arr.sort();
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0110
     * @tc.name testArrayFillOne011
     * @tc.desc Verify fill reverse fill chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4, 5);
      a.fill(0, 0, 5);
      a.reverse();
      a.fill(9, 1, 3);
      expect(a[0]).assertEqual(0);
      expect(a[1]).assertEqual(9);
      expect(a[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0120
     * @tc.name testArrayFillOne012
     * @tc.desc Verify fill splice fill chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.fill(9, 0, 4);
      a.splice(1, 1);
      a.fill(7, 0, 3);
      expect(a[0]).assertEqual(7);
      expect(a[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0130
     * @tc.name testArrayFillOne013
     * @tc.desc Verify fill shift fill chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.fill(5, 0, 4);
      a.shift();
      a.fill(9, 0, 2);
      expect(a[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0140
     * @tc.name testArrayFillOne014
     * @tc.desc Verify start=MAX_SAFE_INTEGER no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Number.MAX_SAFE_INTEGER), 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0150
     * @tc.name testArrayFillOne015
     * @tc.desc Verify end=MIN_SAFE_INTEGER no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 0, Double.toInt(Number.MIN_SAFE_INTEGER));
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0160
     * @tc.name testArrayFillOne016
     * @tc.desc Verify start=MAX_VALUE no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Number.MAX_VALUE), 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0170
     * @tc.name testArrayFillOne017
     * @tc.desc Verify end=MIN_VALUE no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 0, Double.toInt(Number.MIN_VALUE));
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0180
     * @tc.name testArrayFillOne018
     * @tc.desc Verify start=NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Double.NaN), 3);
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0190
     * @tc.name testArrayFillOne019
     * @tc.desc Verify end=NaN no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 1, Double.toInt(Double.NaN));
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0200
     * @tc.name testArrayFillOne020
     * @tc.desc Verify start=end=Infinity no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Double.POSITIVE_INFINITY), Double.toInt(Double.POSITIVE_INFINITY));
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0210
     * @tc.name testArrayFillOne021
     * @tc.desc Verify literal vs new Array(0,0,0) fill consistency with range 0-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Array<int>(0, 0, 0);
      a1.fill(5, 0, 3);
      const a2: Array<int> = [0, 0, 0];
      a2.fill(5, 0, 3);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[2]).assertEqual(a2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0220
     * @tc.name testArrayFillOne022
     * @tc.desc Verify Array.of fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(1, 2, 3, 4);
      arr.fill(0, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0230
     * @tc.name testArrayFillOne023
     * @tc.desc Verify Array.from fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from('abc');
      arr.fill('z', 0, 3);
      expect(arr[0]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0240
     * @tc.name testArrayFillOne024
     * @tc.desc Verify Set to Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from(new Set<int>(new Array<int>(1, 2, 3)));
      arr.fill(9, 0, 3);
      expect(arr[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0250
     * @tc.name testArrayFillOne025
     * @tc.desc Verify array-like to Array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      arr.fill('x', 1, 3);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0260
     * @tc.name testArrayFillOne026
     * @tc.desc Verify fill then at() read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(8, 0, 3);
      expect(a.at(-1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0270
     * @tc.name testArrayFillOne027
     * @tc.desc Verify fill then for...in traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(7, 0, 3);
      const keys: Array<string> = [];
      for (let i = 0; i < a.length; i++) {
        keys.push(i.toString());
      }
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0280
     * @tc.name testArrayFillOne028
     * @tc.desc Verify fill then Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(9, 1, 3);
      const k = Object.keys(a);
      expect(k.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0290
     * @tc.name testArrayFillOne029
     * @tc.desc Verify fill then values() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(5, 0, 3);
      const it = a.values();
      expect(it.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0300
     * @tc.name testArrayFillOne030
     * @tc.desc Verify large BigInt fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      arr.push(1n);
      arr.push(2n);
      arr.push(3n);
      arr.fill(9007199254740993n, 0, 3);
      expect(arr[0]).assertEqual(9007199254740993n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0310
     * @tc.name testArrayFillOne031
     * @tc.desc Verify small negative BigInt fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      arr.push(1n);
      arr.fill(-999999999999999999n, 0, 1);
      expect(arr[0]).assertEqual(-999999999999999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0320
     * @tc.name testArrayFillOne032
     * @tc.desc Verify BigInt partial range fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      arr.push(1n);
      arr.push(2n);
      arr.push(3n);
      arr.push(4n);
      arr.push(5n);
      arr.fill(777n, 1, 4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(777n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0330
     * @tc.name testArrayFillOne033
     * @tc.desc Verify Symbol value fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: SimpleObj = { val: 1 };
      const arr = new Array<SimpleObj>(obj, obj, obj);
      arr.fill(obj, 0, 2);
      expect(arr[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0340
     * @tc.name testArrayFillOne034
     * @tc.desc Verify Symbol.for fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: SimpleObj = { val: 1 };
      const arr = new Array<SimpleObj>(obj, obj, obj);
      arr.fill(obj, 1, 3);
      expect(arr[1]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0350
     * @tc.name testArrayFillOne035
     * @tc.desc Verify char min fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = c'\u0000';
      const arr = new Array<char>(c'a', c'b', c'c');
      arr.fill(c, 0, 3);
      expect(arr[0]).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0360
     * @tc.name testArrayFillOne036
     * @tc.desc Verify char max fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = c'\uFFFF';
      const arr = new Array<char>(c'a', c'b');
      arr.fill(c, 0, 2);
      expect(arr[0]).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0370
     * @tc.name testArrayFillOne037
     * @tc.desc Verify char Chinese fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = c'\u4e2d';
      const arr = new Array<char>(c'x', c'y', c'z');
      arr.fill(c, 1, 3);
      expect(arr[1]).assertEqual(c'\u4e2d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0380
     * @tc.name testArrayFillOne038
     * @tc.desc Verify char ASCII symbol fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = c'@';
      const arr = new Array<char>(c'a', c'b', c'c', c'd');
      arr.fill(c, 0, 4);
      expect(arr[0]).assertEqual(c'@');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0390
     * @tc.name testArrayFillOne039
     * @tc.desc Verify char newline fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: char = c'\n';
      const arr = new Array<char>(c'a', c'b', c'c');
      arr.fill(c, 0, 3);
      expect(arr[0]).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0400
     * @tc.name testArrayFillOne040
     * @tc.desc Verify sort descending then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, 1, 2);
      a.sort((x, y) => y - x);
      a.fill(0, 1, 3);
      expect(a[0]).assertEqual(3);
      expect(a[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0410
     * @tc.name testArrayFillOne041
     * @tc.desc Verify double reverse then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.reverse();
      arr.reverse();
      arr.fill(9, 0, 2);
      expect(arr[0]).assertEqual(9);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0420
     * @tc.name testArrayFillOne042
     * @tc.desc Verify splice insert then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 5);
      a.splice(2, 0, 3, 4);
      a.fill(0, 0, 2);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0430
     * @tc.name testArrayFillOne043
     * @tc.desc Verify splice replace then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.splice(1, 1, 9);
      a.fill(7, 2, 3);
      expect(a[0]).assertEqual(1);
      expect(a[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0440
     * @tc.name testArrayFillOne044
     * @tc.desc Verify concat then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2).concat(new Array<int>(3, 4));
      a.fill(0, 1, 3);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(0);
      expect(a[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0450
     * @tc.name testArrayFillOne045
     * @tc.desc Verify slice copy fill does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      const b = a.slice();
      b.fill(9, 0, 3);
      expect(a[0]).assertEqual(1);
      expect(b[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0460
     * @tc.name testArrayFillOne046
     * @tc.desc Verify same range same fill twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(5, 0, 3);
      a.fill(5, 0, 3);
      expect(a[0]).assertEqual(5);
      expect(a[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0470
     * @tc.name testArrayFillOne047
     * @tc.desc Verify negative then positive overlapping fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(10, 10, 10, 10);
      a.fill(5, -4, 4);
      a.fill(0, 0, 2);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0480
     * @tc.name testArrayFillOne048
     * @tc.desc Verify number|boolean partial fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | boolean>(true, 10, false);
      a.fill(0, 0, 2);
      expect(a[0]).assertEqual(0);
      expect(a[2]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0490
     * @tc.name testArrayFillOne049
     * @tc.desc Verify fill with null prototype object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ObjWithX = { x: 1 };
      const arr = new Array<ObjWithX>({ x: 1 }, { x: 2 }, { x: 3 });
      arr.fill(o, 0, 3);
      expect(arr[0].x).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0500
     * @tc.name testArrayFillOne050
     * @tc.desc Verify fill with function object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = (): int => 42;
      const arr = new Array<() => int>(f, f, f);
      arr.fill(f, 1, 3);
      expect(arr[1]).assertEqual(f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0510
     * @tc.name testArrayFillOne051
     * @tc.desc Verify fill with object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: ObjWithX = { x: 99 };
      const arr = new Array<ObjWithX>({ x: 1 }, { x: 2 }, { x: 3 });
      arr.fill(o, 1, 3);
      expect(arr[1].x).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0520
     * @tc.name testArrayFillOne052
     * @tc.desc Verify set hole to undefined then fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int | undefined>(1, 2, 3);
      a[1] = undefined;
      a.fill(9, 0, 3);
      expect(a[0]).assertEqual(9);
      expect(a[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0530
     * @tc.name testArrayFillOne053
     * @tc.desc Verify new Array(5, init) fill partial with assert on arr[0] and arr[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, (): int => 0);
      arr.fill(7, 1, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0540
     * @tc.name testArrayFillOne054
     * @tc.desc Verify sparse extended to 6 then fill all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(3, (): int => 0);
      a.extendTo(6, 0);
      a[5] = 1;
      a.fill(9, 0, 6);
      expect(a[0]).assertEqual(9);
      expect(a[5]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0550
     * @tc.name testArrayFillOne055
     * @tc.desc Verify sparse hole filled becomes own property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(4, (): int => 0);
      a.fill(1, 0, 4);
      expect(a.hasOwnProperty(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0560
     * @tc.name testArrayFillOne056
     * @tc.desc Verify negative zero fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(-0, 0, 3);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0570
     * @tc.name testArrayFillOne057
     * @tc.desc Verify positive zero fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(0, 0, 3);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0580
     * @tc.name testArrayFillOne058
     * @tc.desc Verify MIN_VALUE fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.fill(Number.MIN_VALUE, 0, 2);
      expect(arr[0]).assertEqual(5e-324);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0590
     * @tc.name testArrayFillOne059
     * @tc.desc Verify MAX_VALUE fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.fill(Number.MAX_VALUE, 0, 2);
      expect(arr[0]).assertEqual(1.7976931348623157e+308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0600
     * @tc.name testArrayFillOne060
     * @tc.desc Verify different base literals fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hex = 0xFF;
      const oct = 0o77;
      const bin = 0b11;
      const arr = new Array<int>(0, 0, 0);
      arr.fill(hex, 0, 1).fill(oct, 1, 2).fill(bin, 2, 3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(63);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0610
     * @tc.name testArrayFillOne061
     * @tc.desc Verify fill then some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4);
      a.fill(0, 1, 3);
      expect(a.some((v) => v === 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0620
     * @tc.name testArrayFillOne062
     * @tc.desc Verify fill then includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(99, 1, 3);
      expect(a.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0630
     * @tc.name testArrayFillOne063
     * @tc.desc Verify fill then reduce sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3, 4, 5);
      a.fill(10, 0, 5);
      const sum = a.reduce((acc, v) => acc + v, 0);
      expect(sum).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0640
     * @tc.name testArrayFillOne064
     * @tc.desc Verify fill then reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2, 3);
      a.fill(7, 1, 3);
      const r = a.reduceRight((acc, v) => acc + v, 0);
      expect(r).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0650
     * @tc.name testArrayFillOne065
     * @tc.desc Verify fill then reduce string concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<string>('a', 'b', 'c');
      a.fill('x', 0, 3);
      const s = a.reduce((acc, v) => acc + v, '');
      expect(s).assertEqual('xxx');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0660
     * @tc.name testArrayFillOne066
     * @tc.desc Verify byte array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(1, 2, 3);
      arr.fill(0, 0, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0670
     * @tc.name testArrayFillOne067
     * @tc.desc Verify long array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(100, 200, 300);
      arr.fill(999, 0, 2);
      expect(arr[0]).assertEqual(999);
      expect(arr[1]).assertEqual(999);
      expect(arr[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0680
     * @tc.name testArrayFillOne068
     * @tc.desc Verify float array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.0f, 2.0f, 3.0f);
      arr.fill(0.0f, 1, 3);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(0.0);
      expect(arr[2]).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0690
     * @tc.name testArrayFillOne069
     * @tc.desc Verify double array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.0, 2.0, 3.0);
      arr.fill(9.9, 0, 2);
      expect(arr[0]).assertEqual(9.9);
      expect(arr[1]).assertEqual(9.9);
      expect(arr[2]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0700
     * @tc.name testArrayFillOne070
     * @tc.desc Verify boolean array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      arr.fill(false, 1, 2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0710
     * @tc.name testArrayFillOne071
     * @tc.desc Verify Unicode string array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u4e2d', '\u6587', 'test');
      arr.fill('\u0061', 0, 2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0720
     * @tc.name testArrayFillOne072
     * @tc.desc Verify empty string and special character string array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('', 0, 1);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0730
     * @tc.name testArrayFillOne073
     * @tc.desc Verify fill(value) with int fills all elements (1 arg, default start/end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0740
     * @tc.name testArrayFillOne074
     * @tc.desc Verify fill(value) with string fills all elements (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('x');
      expect(arr[0]).assertEqual('x');
      expect(arr[1]).assertEqual('x');
      expect(arr[2]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0750
     * @tc.name testArrayFillOne075
     * @tc.desc Verify fill(value) with boolean fills all elements (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      arr.fill(false);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0760
     * @tc.name testArrayFillOne076
     * @tc.desc Verify fill(value) with char fills all elements (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c');
      arr.fill(c'z');
      expect(arr[0]).assertEqual(c'z');
      expect(arr[2]).assertEqual(c'z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0770
     * @tc.name testArrayFillOne077
     * @tc.desc Verify fill(value) with object fills all elements (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: SimpleObj = { val: 99 };
      const arr = new Array<SimpleObj>({ val: 1 }, { val: 2 }, { val: 3 });
      arr.fill(o);
      expect(arr[0].val).assertEqual(99);
      expect(arr[2].val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0780
     * @tc.name testArrayFillOne078
     * @tc.desc Verify fill(value, start) with start=0 fills from beginning (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(9, 0);
      expect(arr[0]).assertEqual(9);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0790
     * @tc.name testArrayFillOne079
     * @tc.desc Verify fill(value, start) with start in middle (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      arr.fill(0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0800
     * @tc.name testArrayFillOne080
     * @tc.desc Verify fill(value, start) with negative start (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      arr.fill(9, -2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0810
     * @tc.name testArrayFillOne081
     * @tc.desc Verify fill(value, start) with start=length no-op (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, arr.length);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0820
     * @tc.name testArrayFillOne082
     * @tc.desc Verify fill(value, start) with start beyond length no-op (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 999);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0830
     * @tc.name testArrayFillOne083
     * @tc.desc Verify Number.MAX_VALUE as start (Number type without Double.toInt conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Number.MAX_VALUE), 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0840
     * @tc.name testArrayFillOne084
     * @tc.desc Verify Number.MIN_VALUE as end (Number type without Double.toInt conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 0, Double.toInt(Number.MIN_VALUE));
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0850
     * @tc.name testArrayFillOne085
     * @tc.desc Verify Double.NaN as start (Number type, no Double.toInt conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Double.NaN), 3);
      expect(arr[0]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0860
     * @tc.name testArrayFillOne086
     * @tc.desc Verify Double.NaN as end (Number type, no Double.toInt conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, 1, Double.toInt(Double.NaN));
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0870
     * @tc.name testArrayFillOne087
     * @tc.desc Verify Double.POSITIVE_INFINITY as start (Number type, no Double.toInt conversion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      arr.fill(99, Double.toInt(Double.POSITIVE_INFINITY), Double.toInt(Double.POSITIVE_INFINITY));
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0880
     * @tc.name testArrayFillOne088
     * @tc.desc Verify fill("") with empty string fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('');
      expect(arr[0]).assertEqual('');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0890
     * @tc.name testArrayFillOne089
     * @tc.desc Verify fill with space string fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      arr.fill('  ');
      expect(arr[0]).assertEqual('  ');
      expect(arr[1]).assertEqual('  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0900
     * @tc.name testArrayFillOne090
     * @tc.desc Verify fill with Unicode Chinese string fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      arr.fill('\u4e2d\u6587');
      expect(arr[0]).assertEqual('\u4e2d\u6587');
      expect(arr[1]).assertEqual('\u4e2d\u6587');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0910
     * @tc.name testArrayFillOne091
     * @tc.desc Verify fill with undefined on nullable array (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2, 3);
      arr.fill(undefined);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[2]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0920
     * @tc.name testArrayFillOne092
     * @tc.desc Verify fill(byte) fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<byte>(1, 2, 3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0930
     * @tc.name testArrayFillOne093
     * @tc.desc Verify fill(long) fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<long>(100, 200, 300);
      arr.fill(999);
      expect(arr[0]).assertEqual(999);
      expect(arr[2]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0940
     * @tc.name testArrayFillOne094
     * @tc.desc Verify fill(float) fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<float>(1.0f, 2.0f, 3.0f);
      arr.fill(0.0f);
      expect(arr[0]).assertEqual(0.0);
      expect(arr[2]).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0950
     * @tc.name testArrayFillOne095
     * @tc.desc Verify fill(double) fills all (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<double>(1.0, 2.0, 3.0);
      arr.fill(9.9);
      expect(arr[0]).assertEqual(9.9);
      expect(arr[2]).assertEqual(9.9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0960
     * @tc.name testArrayFillOne096
     * @tc.desc Verify fill with nested Array<Array<int>> (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Array<int>(1, 2);
      const b = new Array<int>(3, 4);
      const arr = new Array<Array<int>>(a, b);
      arr.fill(new Array<int>(0, 0));
      expect(arr[0][0]).assertEqual(0);
      expect(arr[1][0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0970
     * @tc.name testArrayFillOne097
     * @tc.desc Verify fill with Map element (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, int>(new Array<[string, int]>(['k', 1]));
      const arr = Array.create<Map<string, int>>(1, m);
      arr.fill(new Map<string, int>(new Array<[string, int]>(['k', 2])));
      expect(arr[0].get('k')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0980
     * @tc.name testArrayFillOne098
     * @tc.desc Verify fill with Date object (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2020, 0, 1);
      const arr = new Array<Date>(d, d);
      arr.fill(new Date(2025, 11, 25));
      expect(arr[0].getFullYear()).assertEqual(2025);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0990
     * @tc.name testArrayFillOne099
     * @tc.desc Verify fill with Set element (1 arg)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<int>(new Array<int>(1, 2));
      const arr = Array.create<Set<int>>(1, s);
      arr.fill(new Set<int>(new Array<int>(9, 9)));
      expect(arr[0].has(9)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1000
     * @tc.name testArrayFillOne100
     * @tc.desc Verify fill(string, start) with string value and start index (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      arr.fill('x', 2);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('x');
      expect(arr[3]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1010
     * @tc.name testArrayFillOne101
     * @tc.desc Verify fill(boolean, start) with boolean value and start index (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, true);
      arr.fill(false, 1);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1020
     * @tc.name testArrayFillOne102
     * @tc.desc Verify fill(char, start) with char value and start index (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('z', 1);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('z');
      expect(arr[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1030
     * @tc.name testArrayFillOne103
     * @tc.desc Verify fill(object, start) with object reference and start index (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o: SimpleObj = { val: 99 };
      const arr = new Array<SimpleObj>({ val: 1 }, { val: 2 }, { val: 3 });
      arr.fill(o, 1);
      expect(arr[0].val).assertEqual(1);
      expect(arr[1].val).assertEqual(99);
      expect(arr[2].val).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1040
     * @tc.name testArrayFillOne104
     * @tc.desc Verify fill(undefined, start) with nullable array and start index (2 args)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2, 3, 4);
      arr.fill(undefined, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(undefined);
      expect(arr[3]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1050
     * @tc.name testArrayFillOne105
     * @tc.desc Verify fill(null) with no start/end fills entire array with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, 2, 3);
      arr.fill(null);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertNull();
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1060
     * @tc.name testArrayFillOne106
     * @tc.desc Verify fill(undefined) with no start/end fills entire array with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | undefined> = new Array<int | undefined>(10, 20, 30);
      arr.fill(undefined);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1070
     * @tc.name testArrayFillOne107
     * @tc.desc Verify fill with nested ObjLVL object, no start/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Lvl2Val = { val: 42 };
      const outer: ObjLVL = { lvl1: { lvl2: inner } };
      const arr = new Array<ObjLVL>(2, (i: int): ObjLVL => ({ lvl1: { lvl2: { val: i } } }));
      arr.fill(outer);
      expect(arr[0].lvl1.lvl2.val).assertEqual(42);
      expect(arr[1].lvl1.lvl2.val).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1080
     * @tc.name testArrayFillOne108
     * @tc.desc Verify fill(null, Number start=1.5) truncates start to int index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it('testArrayFillOne108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<int | null> = new Array<int | null>(1, 2, 3, 4, 5);
      arr.fill(null, Double.toInt(1.5));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertNull();
      expect(arr[3]).assertNull();
      expect(arr[4]).assertNull();
    });


  });
}
