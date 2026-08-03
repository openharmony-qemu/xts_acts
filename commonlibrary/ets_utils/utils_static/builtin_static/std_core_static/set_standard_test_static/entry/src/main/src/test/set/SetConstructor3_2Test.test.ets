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

class ObjTest {
  value: number = 0;
  id: number = 0;
  constructor(value: number = 0) {
    this.value = value;
    this.id = value;
  }
}

export default function SetConstructor3_2Test(): void {
  describe('SetConstructor3Part1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testConstructor3_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0100
     * @tc.desc Verify copy constructing Set<byte> from single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<byte> = new Set<byte>([1 as byte]);
      const copy: Set<byte> = new Set<byte>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(1 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0200
     * @tc.desc Verify copy constructing Set<byte> from Set with deduplicated values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<byte> = new Set<byte>([1 as byte, 1 as byte, 1 as byte]);
      const copy: Set<byte> = new Set<byte>(source);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0300
     * @tc.desc Verify copy constructing Set<short> from Set with duplicate values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<short> = new Set<short>([1 as short, 1 as short, 1 as short]);
      const copy: Set<short> = new Set<short>(source);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0400
     * @tc.desc Verify copy constructing Set<short> from single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<short> = new Set<short>([100 as short]);
      const copy: Set<short> = new Set<short>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(100 as short)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0500
     * @tc.desc Verify copy constructing Set<int> from single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>([1]);
      const copy: Set<int> = new Set<int>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0600
     * @tc.desc Verify copy constructing Set<int> from Set with duplicate values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>([1, 1, 1]);
      const copy: Set<int> = new Set<int>(source);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0700
     * @tc.desc Verify copy constructing Set<long> from single-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<long> = new Set<long>([1 as long]);
      const copy: Set<long> = new Set<long>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(1 as long)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0800
     * @tc.desc Verify copy constructing Set<long> from Set with duplicate values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<long> = new Set<long>([1 as long, 1 as long, 1 as long]);
      const copy: Set<long> = new Set<long>(source);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_0900
     * @tc.desc Verify copy constructing Set<boolean> from Set containing true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<boolean> = new Set<boolean>([true]);
      const copy: Set<boolean> = new Set<boolean>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(true)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1000
     * @tc.desc Verify copy constructing Set<boolean> from Set containing false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<boolean> = new Set<boolean>([false]);
      const copy: Set<boolean> = new Set<boolean>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(false)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1100
     * @tc.desc Verify copy constructing Set<string> from single-char Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<string> = new Set<string>(["a"]);
      const copy: Set<string> = new Set<string>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has("a")).assertTrue();
    });

    /**
     * @tc.name testConstructor3_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1200
     * @tc.desc Verify copy constructing Set<string> from Set with duplicate strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<string> = new Set<string>(["a", "a", "a"]);
      const copy: Set<string> = new Set<string>(source);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1300
     * @tc.desc Verify copy constructing empty Set then adding elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>();
      const copy: Set<int> = new Set<int>(source);
      copy.add(1);
      expect(copy.size).assertEqual(1);
      expect(copy.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1400
     * @tc.desc Verify copy constructing non-empty Set then clearing
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>([1, 2, 3]);
      const copy: Set<int> = new Set<int>(source);
      expect(copy.size).assertEqual(3);
      copy.clear();
      expect(copy.size).assertEqual(0);
      expect(source.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor3_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1500
     * @tc.desc Verify copy constructing single-element Set then adding more
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>([1]);
      const copy: Set<int> = new Set<int>(source);
      expect(copy.size).assertEqual(1);
      copy.add(2);
      copy.add(3);
      expect(copy.size).assertEqual(3);
      expect(source.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1600
     * @tc.desc Verify copy constructing multi-element Set then deleting down to one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int> = new Set<int>([1, 2, 3]);
      const copy: Set<int> = new Set<int>(source);
      expect(copy.size).assertEqual(3);
      copy.delete(2);
      copy.delete(3);
      expect(copy.size).assertEqual(1);
      expect(copy.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1700
     * @tc.desc Verify copy constructing Set<number[]> uses shallow copy for reference-type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<number[]> = new Set<number[]>();
      source.add([1, 2, 3]);
      const copy: Set<number[]> = new Set<number[]>(source);
      expect(copy.size).assertEqual(1);
      const copyNext: number[] | undefined = copy.values().next().value;
      if (copyNext !== undefined) {
        copyNext[0] = 99;
      }
      const sourceNext: number[] | undefined = source.values().next().value;
      if (sourceNext !== undefined) {
        expect(sourceNext[0]).assertEqual(99);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.name testConstructor3_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1800
     * @tc.desc Verify copy constructing Set<double> from single-element Set (1.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<double> = new Set<double>([1.5]);
      const copy: Set<double> = new Set<double>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has(1.5)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_1900
     * @tc.desc Verify copy constructing Set<double> from Set with duplicate values (2.5)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<double> = new Set<double>([2.5, 2.5, 2.5]);
      const copy: Set<double> = new Set<double>(source);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2000
     * @tc.desc Verify constructor3 with manual iteration copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<int>([1, 2]);
      const copy = new Set<int>();
      for (const v of source) { copy.add(v); }
      copy.add(3);
      expect(copy.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor3_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2100
     * @tc.desc Verify constructor3 with union type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<int | string> = new Set<int | string>([1, "a"]);
      const copy = new Set<int | string>(source);
      expect(copy.size).assertEqual(2);
      expect(copy.has(1)).assertTrue();
      expect(copy.has("a")).assertTrue();
    });

    /**
     * @tc.name testConstructor3_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2200
     * @tc.desc Verify copy constructing Set<int> from multi-element Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<int>([1, 2]);
      const copy = new Set<int>(source);
      expect(copy.size).assertEqual(2);
      expect(copy.has(1)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2300
     * @tc.desc Verify constructor3 with large Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<int>();
      for (let i: int = 0; i < 8000; i++) { source.add(i); }
      const copy = new Set<int>(source);
      expect(copy.size).assertEqual(8000);
    });

    /**
     * @tc.name testConstructor3_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2400
     * @tc.desc Verify copy constructor creates independent Set with same elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Set<string> = new Set<string>(["a"]);
      const copy: Set<string> = new Set<string>(source);
      expect(copy.size).assertEqual(1);
      expect(copy.has("a")).assertTrue();
      source.add("b");
      expect(copy.size).assertEqual(1);
      expect(copy.has("b")).assertFalse();
      expect(source.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor3_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2500
     * @tc.desc Verify Set<char> copy constructor with Unicode chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<char> = new Set<char>([c'a', c'中', c'0']);
      const copy: Set<char> = new Set<char>(src);
      expect(copy.size).assertEqual(3);
      expect(copy.has(c'中')).assertTrue();
    });

    /**
     * @tc.name testConstructor3_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2600
     * @tc.desc Verify Set<number> copy constructor preserves mixed types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<number> = new Set<number>([0, 1.5, Number.NaN]);
      const copy: Set<number> = new Set<number>(src);
      expect(copy.size).assertEqual(3);
      expect(copy.has(Number.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2700
     * @tc.desc Verify Set<Date> copy constructor with Date refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2025, 0, 1);
      const src: Set<Date> = new Set<Date>([d]);
      const copy: Set<Date> = new Set<Date>(src);
      expect(copy.size).assertEqual(1);
      expect(copy.has(d)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2800
     * @tc.desc Verify Set<RegExp> copy constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RegExp("abc");
      const src: Set<RegExp> = new Set<RegExp>([r]);
      const copy: Set<RegExp> = new Set<RegExp>(src);
      expect(copy.has(r)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_2900
     * @tc.desc Verify Set<Map> copy constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('k', 1);
      const src: Set<Map<string, number>> = new Set<Map<string, number>>([m]);
      const copy: Set<Map<string, number>> = new Set<Map<string, number>>(src);
      expect(copy.has(m)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3000
     * @tc.desc Verify Set<Map> copy constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('k', 1);
      const src: Set<Map<string, number>> = new Set<Map<string, number>>();
      src.add(m);

      const copy: Set<Map<string, number>> = new Set<Map<string, number>>(src);
      expect(copy.has(m)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3100
     * @tc.desc Verify Set<Set<int>> copy constructor nested
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Set<int>([10, 20]);
      const src: Set<Set<int>> = new Set<Set<int>>([inner]);
      const copy: Set<Set<int>> = new Set<Set<int>>(src);
      expect(copy.size).assertEqual(1);
      expect(copy.has(inner)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3200
     * @tc.desc Verify Set<Set<int>> copy constructor nested (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Set<int>([10, 20]);
      const src: Set<Set<int>> = new Set<Set<int>>();
      src.add(inner);

      const copy: Set<Set<int>> = new Set<Set<int>>(src);
      expect(copy.size).assertEqual(1);
      expect(copy.has(inner)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3300
     * @tc.desc Verify Set<Record> copy constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = { 'x': 10 };
      const src: Set<Record<string, int>> = new Set<Record<string, int>>([r]);
      const copy: Set<Record<string, int>> = new Set<Record<string, int>>(src);
      expect(copy.has(r)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3400
     * @tc.desc Verify Set<Record> copy constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = { 'x': 10 };
      const src: Set<Record<string, int>> = new Set<Record<string, int>>();
      src.add(r);

      const copy: Set<Record<string, int>> = new Set<Record<string, int>>(src);
      expect(copy.has(r)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3500
     * @tc.desc Verify Set<Error> copy constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('copy test');
      const src: Set<Error> = new Set<Error>([e]);
      const copy: Set<Error> = new Set<Error>(src);
      expect(copy.has(e)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3600
     * @tc.desc Verify Set<WeakMap> and Set<WeakSet> copy constructors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const ws = new WeakSet<object>();
      const srcWm: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([wm]);
      const copyWm: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>(srcWm);
      const srcWs: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      const copyWs: Set<WeakSet<object>> = new Set<WeakSet<object>>(srcWs);
      expect(copyWm.has(wm)).assertTrue();
      expect(copyWs.has(ws)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3700
     * @tc.desc Verify Set<WeakMap> and Set<WeakSet> copy constructors (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const ws = new WeakSet<object>();
      const srcWm: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      srcWm.add(wm);

      const copyWm: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>(srcWm);
      const srcWs: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      const copyWs: Set<WeakSet<object>> = new Set<WeakSet<object>>(srcWs);
      expect(copyWm.has(wm)).assertTrue();
      expect(copyWs.has(ws)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3800
     * @tc.desc Verify Set<Int8Array> copy constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const src: Set<Int8Array> = new Set<Int8Array>([arr]);
      const copy: Set<Int8Array> = new Set<Int8Array>(src);
      expect(copy.has(arr)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_3900
     * @tc.desc Verify Set<Int8Array> copy constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2, 3]);
      const src: Set<Int8Array> = new Set<Int8Array>();
      src.add(arr);

      const copy: Set<Int8Array> = new Set<Int8Array>(src);
      expect(copy.has(arr)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_4000
     * @tc.desc Verify Set<bigint> copy constructor preserves all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<bigint> = new Set<bigint>([0n, 1n, -1n, 100n]);
      const copy: Set<bigint> = new Set<bigint>(src);
      expect(copy.size).assertEqual(4);
      expect(copy.has(100n)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_4100
     * @tc.desc Verify Set<ObjTest> copy constructor with class instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o = new ObjTest(10);
      const src: Set<ObjTest> = new Set<ObjTest>([o]);
      const copy: Set<ObjTest> = new Set<ObjTest>(src);
      expect(copy.has(o)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_4200
     * @tc.desc Verify Set<float> copy constructor with Float.NaN and Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Set<float> = new Set<float>();
      src.add(1.0 as float);
      src.add(Float.NaN);
      src.add(Float.POSITIVE_INFINITY);
      const copy: Set<float> = new Set<float>(src);
      expect(copy.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor3_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_4300
     * @tc.desc Verify Set<object> copy constructor with POJO refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: object = new ObjTest(1);
      const obj2: object = new ObjTest(2);
      const src: Set<object> = new Set<object>([obj1, obj2]);
      const copy: Set<object> = new Set<object>(src);
      expect(copy.size).assertEqual(2);
      expect(copy.has(obj1)).assertTrue();
    });

    /**
     * @tc.name testConstructor3_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_4400
     * @tc.desc Verify Set<Promise<Set<int>>> copy constructor nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      const src: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p]);
      const copy: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>(src);
      expect(copy.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor3_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR3_P1_4500
     * @tc.desc Verify Set<jsonx.JsonElement> copy constructor with JSON parsed objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"b":2}');
      const src: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1, j2]);
      const copy: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>(src);
      expect(copy.size).assertEqual(2);
      expect(copy.has(j1)).assertTrue();
    });
  });
}

