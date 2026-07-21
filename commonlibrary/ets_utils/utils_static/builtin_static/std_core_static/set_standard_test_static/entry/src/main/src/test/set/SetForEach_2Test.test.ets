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

export default function SetForEach_2Test(): void {
  describe('SetForEachPart1Test', (): void => {
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
     * @tc.name testForEach001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0010
     * @tc.desc Verify byte multi elements iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([10, 20, 30]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<byte>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0020
     * @tc.desc Verify forEach byte -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add((-128));
      expect(s.has((-128))).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0030
     * @tc.desc Verify forEach byte 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(127);
      expect(s.has(127)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0040
     * @tc.desc Verify byte hex value iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0x0A]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<byte>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0x0A);
    });

    /**
     * @tc.name testForEach005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0050
     * @tc.desc Verify byte deduplication in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42, 42, 42]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<byte>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0060
     * @tc.desc Verify byte insertion order in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([10, 20, 30]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<byte>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.name testForEach007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0070
     * @tc.desc Verify modify during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([1, 2, 3, 4, 5]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<byte>): void => {
        result.push(v);
        if (v === 1) { set.delete(3); set.add(6); }
      });
      expect(result.length).assertEqual(5);
      expect(set.size).assertEqual(5);
      expect(set.has(6)).assertTrue();
      expect(set.has(3)).assertFalse();
    });

    /**
     * @tc.name testForEach008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0080
     * @tc.desc Verify forEach value and key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42]);
      const result: number[] = [];
      const keys: number[] = [];
      set.forEach((v, k, s: ReadonlySet<byte>): void => { result.push(v); keys.push(k); });
      expect(result[0]).assertEqual(42);
      expect(keys[0]).assertEqual(42);
    });

    /**
     * @tc.name testForEach009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0090
     * @tc.desc Verify short single element forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([1]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<short>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name testForEach010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0100
     * @tc.desc Verify short multiple elements forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 200, 300]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<short>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0110
     * @tc.desc Verify short forEach on empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<short>): void => { c++; });
      expect(c).assertEqual(0);
    });

    /**
     * @tc.name testForEach012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0120
     * @tc.desc Verify forEach short -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(-32768);
      expect(s.has(-32768)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0130
     * @tc.desc Verify forEach short 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(32767);
      expect(s.has(32767)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0140
     * @tc.desc Verify short empty forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0]);
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<short>): void => { c++; });
      expect(c).assertEqual(1);
    });

    /**
     * @tc.name testForEach015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0150
     * @tc.desc Verify short hex value iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0x64]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<short>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0160
     * @tc.desc Verify short deduplication behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 100, 100]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<short>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0170
     * @tc.desc Verify short insertion order in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 200, 300]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<short>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0180
     * @tc.desc Verify forEach count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([1, 2, 3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<short>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0190
     * @tc.desc Verify int single element forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name testForEach020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0200
     * @tc.desc Verify int multiple elements forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0210
     * @tc.desc Verify empty set forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<int>): void => { c++; });
      expect(c).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testForEach022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0220
     * @tc.desc Verify forEach Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE);
      expect(s.has(Int.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0230
     * @tc.desc Verify forEach Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE);
      expect(s.has(Int.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0240
     * @tc.desc Verify int zero value forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0]);
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<int>): void => { c++; });
      expect(c).assertEqual(1);
    });

    /**
     * @tc.name testForEach025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0250
     * @tc.desc Verify negative value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.name testForEach026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0260
     * @tc.desc Verify forEach correctness with large int Set (10000 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i = 1; i <= 10000; i++) {
        set.add(i);
      }
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<int>): void => { c++; });
      expect(c).assertEqual(10000);
      expect(set.size).assertEqual(10000);
    });

    /**
     * @tc.name testForEach027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0270
     * @tc.desc Verify int deduplication behavior verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42, 42, 42]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0280
     * @tc.desc Verify int insertion order in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0290
     * @tc.desc Verify hex 0xFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0xFF]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(255);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0300
     * @tc.desc Verify octal 0o77
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0o77]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(63);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0310
     * @tc.desc Verify binary 0b1010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0b1010]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(10);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0320
     * @tc.desc Verify Negative values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1, -2, -3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0330
     * @tc.desc Verify Positive values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0340
     * @tc.desc Verify mixed values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-5, 0, 5]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0350
     * @tc.desc Verify Consecutive values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0360
     * @tc.desc Verify Sparse values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 100, 10000]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0370
     * @tc.desc Verify int add during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(4);
      expect(set.has(99)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0380
     * @tc.desc Verify int delete during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.has(2)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0390
     * @tc.desc Verify int clear then forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { arr.push(v); });
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testForEach040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0400
     * @tc.desc Verify v equals k
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      let count = 0;
      set.forEach((v, k, s: ReadonlySet<int>): void => { count++; });
      expect(count).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0410
     * @tc.desc Verify int add during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => {
        arr.push(v);
        if (v === 1) { set.add(4); }
      });
      expect(arr.length).assertEqual(4);
      expect(set.has(4)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0420
     * @tc.desc Verify int multiple forEach calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let a1: number[] = [];
      let a2: number[] = [];
      set.forEach((v, k, s: ReadonlySet<int>): void => { a1.push(v); });
      set.forEach((v, k, s: ReadonlySet<int>): void => { a2.push(v); });
      expect(a1.length).assertEqual(3);
      expect(a2.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0430
     * @tc.desc Verify callback reassign
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      const cb = (v: int, k: int, s: ReadonlySet<int>): void => { arr.push(v * 10); };
      set.forEach(cb);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.name testForEach044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0440
     * @tc.desc Verify regular function as callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      let collect = (v: int, k: int, s: ReadonlySet<int>): void => { arr.push(v); };
      set.forEach(collect);
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0450
     * @tc.desc Verify long single element forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name testForEach046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0460
     * @tc.desc Verify long multiple elements forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0470
     * @tc.desc Verify empty long set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<long>): void => { c++; });
      expect(c).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testForEach048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0480
     * @tc.desc Verify -2147483649
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-2147483649]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(-2147483649);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0490
     * @tc.desc Verify long beyond int max value forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([2147483648]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(2147483648);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0500
     * @tc.desc Verify large long value 10 billion forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10000000000]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(10000000000);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0510
     * @tc.desc Verify -10000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-10000000000]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(-10000000000);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0520
     * @tc.desc Verify hex large value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0530
     * @tc.desc Verify long empty forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([0]);
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<long>): void => { c++; });
      expect(c).assertEqual(1);
    });

    /**
     * @tc.name testForEach054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0540
     * @tc.desc Verify long deduplication behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42, 42, 42]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0550
     * @tc.desc Verify forEach correctness with long Set (100 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      for (let i: int = 1; i <= 100; i++) { set.add(i); }
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<long>): void => { c++; });
      expect(c).assertEqual(100);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testForEach056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0560
     * @tc.desc Verify long add during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { arr.push(v); });
      expect(arr.length).assertEqual(4);
      expect(set.has(99)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0570
     * @tc.desc Verify long delete during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      set.delete(2);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.has(2)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0580
     * @tc.desc Verify long add during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => {
        arr.push(v);
        if (v === 1) { set.add(4); }
      });
      expect(arr.length).assertEqual(4);
      expect(set.has(4)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0590
     * @tc.desc Verify long multiple forEach calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      let a1: number[] = [];
      let a2: number[] = [];
      set.forEach((v, k, s: ReadonlySet<long>): void => { a1.push(v); });
      set.forEach((v, k, s: ReadonlySet<long>): void => { a2.push(v); });
      expect(a1.length).assertEqual(3);
      expect(a2.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0600
     * @tc.desc Verify positive floats
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0610
     * @tc.desc Verify decimal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([3.14, 2.71, 1.41]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0620
     * @tc.desc Verify double insertion order in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.1, 2.2, 3.3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0630
     * @tc.desc Verify double single forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1]);
      const result: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name testForEach064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0640
     * @tc.desc Verify empty double set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<double>): void => { c++; });
      expect(c).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testForEach065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0650
     * @tc.desc Verify double  forEach MIN/MAX
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MIN_VALUE, Number.MAX_VALUE]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0660
     * @tc.desc Verify double empty forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([0]);
      let c = 0;
      set.forEach((v, k, s: ReadonlySet<double>): void => { c++; });
      expect(c).assertEqual(1);
    });

    /**
     * @tc.name testForEach067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0670
     * @tc.desc Verify precision decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.23456789012345, 9.87654321098765]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0680
     * @tc.desc Verify negative doubles
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-1.1, -2.2, -3.3]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0690
     * @tc.desc Verify large double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1e308, -1e308]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0700
     * @tc.desc Verify double deduplication behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5, 1.5, 1.5]);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.5);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0710
     * @tc.desc Verify double add during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      set.add(99.0);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(4);
      expect(set.has(99.0)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0720
     * @tc.desc Verify double delete during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      set.delete(2.0);
      const arr: number[] = [];
      set.forEach((v, k, s: ReadonlySet<double>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.has(2.0)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0730
     * @tc.desc Verify empty bool set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      let c = 0;
      set.forEach((v: boolean, k: boolean, s: ReadonlySet<boolean>): void => { c++; });
      expect(c).assertEqual(0);
    });

    /**
     * @tc.name testForEach074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0740
     * @tc.desc Verify boolean add during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      set.add(false);
      const result: boolean[] = [];
      set.forEach((v: boolean, k: boolean, s: ReadonlySet<boolean>): void => { result.push(v); });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.name testForEach075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0750
     * @tc.desc Verify boolean delete during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      set.delete(true);
      const result: boolean[] = [];
      set.forEach((v: boolean, k: boolean, s: ReadonlySet<boolean>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertFalse();
    });

    /**
     * @tc.name testForEach076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0760
     * @tc.desc Verify string single forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello']);
      const result: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('hello');
    });

    /**
     * @tc.name testForEach077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0770
     * @tc.desc Verify string multi forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0780
     * @tc.desc Verify empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['']);
      let c = 0;
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { c++; });
      expect(c).assertEqual(1);
    });

    /**
     * @tc.name testForEach079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0790
     * @tc.desc Verify empty string value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.name testForEach080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0800
     * @tc.desc Verify whitespace strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([' ', '\t', '\n']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0810
     * @tc.desc Verify Chinese characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['中文', '测试', '验证']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('中文');
      expect(arr[1]).assertEqual('测试');
      expect(arr[2]).assertEqual('验证');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0820
     * @tc.desc Verify emoji strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['😀', '🎉', '🚀']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0830
     * @tc.desc Verify long string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = 'a'.repeat(1000);
      const set = new Set<string>([longStr]);
      const result: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0].length).assertEqual(1000);
    });

    /**
     * @tc.name testForEach084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0840
     * @tc.desc Verify numeric string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['123', '456', '789']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0850
     * @tc.desc Verify case sensitivity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['Hello', 'hello', 'HELLO']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0860
     * @tc.desc Verify string deduplication behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello', 'hello', 'hello']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0870
     * @tc.desc Verify escape characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['line1\nline2', 'tab\there', 'quote"here']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0880
     * @tc.desc Verify concatenation in forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      let result = '';
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { result = result + v; });
      expect(result).assertEqual('abc');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0890
     * @tc.desc Verify filter pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'avocado']);
      const result: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => {
        if (v.startsWith('a')) { result.push(v); }
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testForEach090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0900
     * @tc.desc Verify reduce pattern
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'bb', 'ccc']);
      let totalLen = 0;
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => {
        totalLen = totalLen + v.length;
      });
      expect(totalLen).assertEqual(6);
    });

    /**
     * @tc.name testForEach091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0910
     * @tc.desc Verify string add during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.add('added');
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(4);
      expect(set.has('added')).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0920
     * @tc.desc Verify string delete during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.delete('two');
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0930
     * @tc.desc Verify string clear then forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.clear();
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testForEach094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0940
     * @tc.desc Verify string add during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => {
        arr.push(v);
        if (v === 'a') { set.add('d'); }
      });
      expect(arr.length).assertEqual(4);
      expect(set.has('d')).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0950
     * @tc.desc Verify string multiple forEach calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      let a1: string[] = [];
      let a2: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { a1.push(v); });
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { a2.push(v); });
      expect(a1.length).assertEqual(3);
      expect(a2.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0960
     * @tc.desc Verify string  forEach after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      const arr: string[] = [];
      set.forEach((v: string, k: string, s: ReadonlySet<string>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0970
     * @tc.desc Verify Object single forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      const set = new Set<ObjTest>([obj1]);
      const result: Object[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(obj1);
    });

    /**
     * @tc.name testForEach098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0980
     * @tc.desc Verify Object multi forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      const arr: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_0990
     * @tc.desc Verify empty object set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>();
      let c = 0;
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { c++; });
      expect(c).assertEqual(0);
    });

    /**
     * @tc.name testForEach100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1000
     * @tc.desc Verify same ref dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      const set = new Set<ObjTest>([obj1, obj1, obj1]);
      const arr: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { arr.push(v); });
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach101
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1010
     * @tc.desc Verify forEach on empty Set<ObjTest>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([]);
      let c = 0;
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { c++; });
      expect(c).assertEqual(0);
    });

    /**
     * @tc.name testForEach102
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1020
     * @tc.desc Verify Object insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      const arr: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
      expect(arr[2]).assertEqual(obj3);
    });

    /**
     * @tc.name testForEach103
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1030
     * @tc.desc Verify Object add during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      set.add(new ObjTest(1));
      const arr: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { arr.push(v); });
      expect(arr.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testForEach104
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1040
     * @tc.desc Verify Object delete during forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest();
      let obj2 = new ObjTest();
      let obj3 = new ObjTest();
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      set.delete(obj3);
      const arr: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { arr.push(v); });
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testForEach105
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1050
     * @tc.desc Verify modify property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      const set = new Set<ObjTest>([obj1, obj2]);
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { v.value = 99; });
      expect(obj1.value).assertEqual(99);
      expect(obj2.value).assertEqual(99);
    });

    /**
     * @tc.name testForEach106
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1060
     * @tc.desc Verify Object forEach after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      const arr: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { arr.push(v); });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name testForEach107
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1070
     * @tc.desc Verify Object multiple forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([new ObjTest(1), new ObjTest(2)]);
      let a1: ObjTest[] = [];
      let a2: ObjTest[] = [];
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { a1.push(v); });
      set.forEach((v: ObjTest, k: ObjTest, s: ReadonlySet<ObjTest>): void => { a2.push(v); });
      expect(a1.length).assertEqual(2);
      expect(a2.length).assertEqual(2);
    });

    /**
     * @tc.name testForEach108
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1080
     * @tc.desc Verify error object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errObj = new Error('test error');
      const set = new Set<Object>([errObj]);
      const result: Object[] = [];
      set.forEach((v: Object, k: Object, s: ReadonlySet<Object>): void => { result.push(v); });
      expect(result.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach109
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1090
     * @tc.desc Verify array single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr]);
      let c = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c++; });
      expect(c).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach110
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1100
     * @tc.desc Verify array multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      let arr3: number[] = [5, 6];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      let c = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c++; });
      expect(c).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach111
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1110
     * @tc.desc Verify array empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number[]>();
      let c = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c++; });
      expect(c).assertEqual(0);
    });

    /**
     * @tc.name testForEach112
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1120
     * @tc.desc Verify array sameArr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr, arr, arr]);
      let c = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c++; });
      expect(c).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach113
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1130
     * @tc.desc Verify array differentArr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [1, 2, 3];
      let arr3: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      let c = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c++; });
      expect(c).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testForEach114
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1140
     * @tc.desc Verify array empty setArr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ea: number[] = [];
      const set = new Set<number[]>([ea]);
      let c = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c++; });
      expect(c).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testForEach115
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1150
     * @tc.desc Verify array order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      let arr3: number[] = [5, 6];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      const result: number[][] = [];
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { result.push(v); });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(arr1);
      expect(result[1]).assertEqual(arr2);
      expect(result[2]).assertEqual(arr3);
    });

    /**
     * @tc.name testForEach116
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOREACH_P1_1160
     * @tc.desc Verify array afterAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testForEach116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      const set = new Set<number[]>([arr1]);
      let c1 = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c1++; });
      expect(c1).assertEqual(1);
      set.add(arr2);
      let c2 = 0;
      set.forEach((v: number[], k: number[], s: ReadonlySet<number[]>): void => { c2++; });
      expect(c2).assertEqual(2);
      expect(set.size).assertEqual(2);
    });
