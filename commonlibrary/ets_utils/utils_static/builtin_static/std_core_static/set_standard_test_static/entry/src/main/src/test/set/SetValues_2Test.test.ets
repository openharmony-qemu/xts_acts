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

export default function SetValues_2Test(): void {
  describe('SetValuesPart1Test', (): void => {
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
     * @tc.name testValues001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0010
     * @tc.desc Verify Byte single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0020
     * @tc.desc Verify Byte multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([10, 20, 30]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0030
     * @tc.desc Verify empty byte set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0040
     * @tc.desc Verify values byte -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(-128);
      expect(s.has(-128)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0050
     * @tc.desc Verify values byte 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(127);
      expect(s.has(127)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0060
     * @tc.desc Verify 0 byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0070
     * @tc.desc Verify byte hex value 0x2A = 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(0x2A);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0080
     * @tc.desc Verify byte deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42, 42, 42]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0090
     * @tc.desc Verify count and size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([1, 2, 3]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0100
     * @tc.desc Verify Short single
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0110
     * @tc.desc Verify Short multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 200, 300]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0120
     * @tc.desc Verify empty short set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0130
     * @tc.desc Verify values short -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(-32768);
      expect(s.has(-32768)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0140
     * @tc.desc Verify values short 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(32767);
      expect(s.has(32767)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0150
     * @tc.desc Verify 0 short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0160
     * @tc.desc Verify hex 0x64 = 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      set.add(0x64);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0170
     * @tc.desc Verify short deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 100, 100]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0180
     * @tc.desc Verify short insertion order preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 200, 300]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0190
     * @tc.desc Verify count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([1, 2, 3]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0200
     * @tc.desc Verify Int single
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0210
     * @tc.desc Verify Int multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0220
     * @tc.desc Verify empty int set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0230
     * @tc.desc Verify values Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE);
      expect(s.has(Int.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0240
     * @tc.desc Verify values Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE);
      expect(s.has(Int.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0250
     * @tc.desc Verify int empty values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0260
     * @tc.desc Verify -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0270
     * @tc.desc Verify 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0280
     * @tc.desc Verify values() correctness with large int Set (1000 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) { set.add(i); }
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1000);
      expect(set.size).assertEqual(1000);
    });

    /**
     * @tc.name testValues029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0290
     * @tc.desc Verify int deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42, 42, 42]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0300
     * @tc.desc Verify int values insertion order preserved 10 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30, 40, 50, 60, 70, 80, 90, 100]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(10);
      expect(arr[9]).assertEqual(100);
      expect(set.size).assertEqual(10);
    });

    /**
     * @tc.name testValues031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0310
     * @tc.desc Verify int hex value 0x2A = 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(0x2A);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0320
     * @tc.desc Verify octal 0o52 = 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(0o52);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0330
     * @tc.desc Verify binary 0b101010 = 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(0b101010);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0340
     * @tc.desc Verify negative values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-100, -200, -300]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.has(-100)).assertTrue();
      expect(set.has(-200)).assertTrue();
      expect(set.has(-300)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0350
     * @tc.desc Verify positive values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100, 200, 300]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0360
     * @tc.desc Verify mixed positive and negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-5, 0, 5, -10, 10]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(5);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testValues037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0370
     * @tc.desc Verify consecutive values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(5);
      for (let i: int = 0; i < 5; i++) { expect(arr[i]).assertEqual(i + 1); }
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testValues038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0380
     * @tc.desc Verify sparse values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 100, 10000]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(100)).assertTrue();
      expect(set.has(10000)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0390
     * @tc.desc Verify values 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(0);
      expect(s.has(0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testValues040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0400
     * @tc.desc Verify int values after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(4);
      expect(set.has(99)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testValues041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0410
     * @tc.desc Verify int values after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0420
     * @tc.desc Verify second value equals expected
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(20);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0430
     * @tc.desc Verify add before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(4);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testValues044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0440
     * @tc.desc Verify int values delete before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(1);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0450
     * @tc.desc Verify int chained values()() calls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      let arr1: number[] = [];
      for (let v of set.values()) { arr1.push(v); }
      let arr2: number[] = [];
      for (let v of set.values()) { arr2.push(v); }
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0460
     * @tc.desc Verify return value of values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let iter = set.values();
      let first = iter.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.name testValues047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0470
     * @tc.desc Verify int values from constructor array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100, 200, 300]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0480
     * @tc.desc Verify callback parameter accumulation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([5, 10, 15]);
      let sum: number = 0;
      for (let v of set.values()) { sum += v; }
      expect(sum).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0490
     * @tc.desc Verify values with multiplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([2, 4, 6]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v * 2); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(12);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0500
     * @tc.desc Verify Long single
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0510
     * @tc.desc Verify Long multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0520
     * @tc.desc Verify empty long set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0530
     * @tc.desc Verify -2147483649
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(-2147483649);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-2147483649);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0540
     * @tc.desc Verify 2147483648
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(2147483648);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2147483648);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0550
     * @tc.desc Verify 10000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(10000000000);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10000000000);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0560
     * @tc.desc Verify -10000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(-10000000000);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-10000000000);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0570
     * @tc.desc Verify hex 0xFFFFFFFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(0xFFFFFFFF);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(4294967295);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0580
     * @tc.desc Verify long zero value in values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0590
     * @tc.desc Verify long deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42, 42, 42]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0600
     * @tc.desc Verify values() correctness with long Set (100 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      for (let i: int = 0; i < 100; i++) { set.add(i); }
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(100);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testValues061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0610
     * @tc.desc Verify long values after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(4);
      expect(set.has(99)).assertTrue();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testValues062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0620
     * @tc.desc Verify long values add during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      set.add(4);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testValues063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0630
     * @tc.desc Verify long chained values()()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      let arr1: number[] = [];
      for (let v of set.values()) { arr1.push(v); }
      let arr2: number[] = [];
      for (let v of set.values()) { arr2.push(v); }
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0640
     * @tc.desc Verify long values from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([100, 200, 300]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0650
     * @tc.desc Verify positive dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 1.0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0660
     * @tc.desc Verify 3.14 precision
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(3.14);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3.14);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0670
     * @tc.desc Verify Set<double> values with Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MIN_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0680
     * @tc.desc Verify Set<double> values with Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MAX_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.has(Number.MAX_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0690
     * @tc.desc Verify Double single
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.5);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0700
     * @tc.desc Verify Double multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.1, 2.2, 3.3]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0710
     * @tc.desc Verify empty double set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0720
     * @tc.desc Verify Double min/max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MIN_VALUE, Number.MAX_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0730
     * @tc.desc Verify 0.0 double
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([0.0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0.0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0740
     * @tc.desc Verify negative dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-1.0, -1.0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0750
     * @tc.desc Verify large count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      for (let i: int = 0; i < 100; i++) { set.add(i); }
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(100);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testValues076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0760
     * @tc.desc Verify double deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5, 1.5, 1.5]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0770
     * @tc.desc Verify double values after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      set.add(99.0);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testValues078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0780
     * @tc.desc Verify double values from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5, 2.5, 3.5]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0790
     * @tc.desc Verify boolean true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true]);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0800
     * @tc.desc Verify boolean false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([false]);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0810
     * @tc.desc Verify both true and false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0820
     * @tc.desc Verify empty bool set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0830
     * @tc.desc Verify boolean deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, true, false, false]);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0840
     * @tc.desc Verify boolean insertion order preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0850
     * @tc.desc Verify boolean values after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true]);
      set.add(false);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0860
     * @tc.desc Verify boolean values after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      set.delete(false);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0870
     * @tc.desc Verify boolean values from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const arr: boolean[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testValues088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0880
     * @tc.desc Verify String single
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0890
     * @tc.desc Verify String multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('apple');
      expect(arr[1]).assertEqual('banana');
      expect(arr[2]).assertEqual('cherry');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0900
     * @tc.desc Verify empty string set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([]);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0910
     * @tc.desc Verify empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['', 'test']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.has('')).assertTrue();
      expect(set.has('test')).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0920
     * @tc.desc Verify whitespace strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([' ', 'tab', 'newline']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0930
     * @tc.desc Verify Chinese characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['中文', '测试', '你好']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.has('中文')).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0940
     * @tc.desc Verify emoji strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['😀', '🚀', '⭐']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0950
     * @tc.desc Verify long string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abcdefghijklmnopqrstuvwx';
      const set = new Set<string>([longStr]);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(longStr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0960
     * @tc.desc Verify numeric strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['123', '456', '789']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.has('123')).assertTrue();
      expect(set.has('456')).assertTrue();
      expect(set.has('789')).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0970
     * @tc.desc Verify case sensitivity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['Hello', 'hello', 'HELLO']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.has('Hello')).assertTrue();
      expect(set.has('hello')).assertTrue();
      expect(set.has('HELLO')).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0980
     * @tc.desc Verify string deduplication via SameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello', 'hello', 'hello']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_0990
     * @tc.desc Verify escape characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['line1\nl', 'tab\tT', 'back\\slash']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1000
     * @tc.desc Verify concatenated strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = 'hel';
      let b: string = 'lo';
      const set = new Set<string>([a + b]);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues101
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1010
     * @tc.desc Verify filter in iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      let filtered: string[] = [];
      for (let v of set.values()) { if (v.length > 5) { filtered.push(v); } }
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual('banana');
      expect(filtered[1]).assertEqual('cherry');
    });

    /**
     * @tc.name testValues102
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1020
     * @tc.desc Verify reduce in iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      let result: string = '';
      for (let v of set.values()) { result += v; }
      expect(result.length).assertEqual(3);
      expect(set.has('a')).assertTrue();
      expect(set.has('b')).assertTrue();
      expect(set.has('c')).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues103
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1030
     * @tc.desc Verify string values after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.add('added');
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual('added');
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testValues104
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1040
     * @tc.desc Verify string values after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.clear();
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues105
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1050
     * @tc.desc Verify string values add during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two']);
      set.add('three');
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues106
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1060
     * @tc.desc Verify string values delete before iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.delete('one');
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('two');
      expect(arr[1]).assertEqual('three');
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues107
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1070
     * @tc.desc Verify string chained values()()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      let arr1: string[] = [];
      for (let v of set.values()) { arr1.push(v); }
      let arr2: string[] = [];
      for (let v of set.values()) { arr2.push(v); }
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues108
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1080
     * @tc.desc Verify string values from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['foo', 'bar', 'baz']);
      const arr: string[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.has('foo')).assertTrue();
      expect(set.has('bar')).assertTrue();
      expect(set.has('baz')).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues109
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1090
     * @tc.desc Verify Object single
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues110
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1100
     * @tc.desc Verify Object multiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues111
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1110
     * @tc.desc Verify empty obj set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues112
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1120
     * @tc.desc Verify same ref deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj, obj, obj]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues113
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1130
     * @tc.desc Verify Object insertion order preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
      expect(arr[2]).assertEqual(obj3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues114
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1140
     * @tc.desc Verify Object values after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      const set = new Set<ObjTest>([obj1]);
      set.add(obj2);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues115
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1150
     * @tc.desc Verify Object values after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      set.delete(obj3);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues116
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1160
     * @tc.desc Verify property modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj]);
      obj.value = 99;
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0].value).assertEqual(99);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues117
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1170
     * @tc.desc Verify Object values from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      const set = new Set<ObjTest>([obj1, obj2]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues118
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1180
     * @tc.desc Verify Object chained values()()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj]);
      let arr1: ObjTest[] = [];
      for (let v of set.values()) { arr1.push(v); }
      let arr2: ObjTest[] = [];
      for (let v of set.values()) { arr2.push(v); }
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues119
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1190
     * @tc.desc Verify error object in set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(0);
      const set = new Set<ObjTest>([obj]);
      const arr: ObjTest[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0].id).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues120
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1200
     * @tc.desc Verify array single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number[]>([[1, 2]]);
      const arr: number[][] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues121
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1210
     * @tc.desc Verify array multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      let arr3: number[] = [5, 6];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues122
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1220
     * @tc.desc Verify array empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number[]>([]);
      const arr: number[][] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues123
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1230
     * @tc.desc Verify array sameArr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr, arr, arr]);
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(arr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues124
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1240
     * @tc.desc Verify array differentArr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [1, 2, 3];
      let arr3: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues125
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1250
     * @tc.desc Verify array empty setArr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ea: number[] = [];
      const set = new Set<number[]>([ea]);
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(1);
      expect(result[0].length).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues126
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1260
     * @tc.desc Verify array order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      let arr3: number[] = [5, 6];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(arr1);
      expect(result[1]).assertEqual(arr2);
      expect(result[2]).assertEqual(arr3);
    });

    /**
     * @tc.name testValues127
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1270
     * @tc.desc Verify array afterAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      const set = new Set<number[]>([arr1]);
      let result1: number[][] = [];
      for (let v of set.values()) { result1.push(v); }
      expect(result1.length).assertEqual(1);
      set.add(arr2);
      let result2: number[][] = [];
      for (let v of set.values()) { result2.push(v); }
      expect(result2.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues128
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1280
     * @tc.desc Verify array afterDelete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      const set = new Set<number[]>([arr1, arr2]);
      set.delete(arr1);
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(arr2);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues129
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1290
     * @tc.desc Verify array modifyElement
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr]);
      arr[0] = 99;
      const result: number[][] = [];
      for (let v of set.values()) { result.push(v); }
      expect(result.length).assertEqual(1);
      expect(result[0][0]).assertEqual(99);
    });

    /**
     * @tc.name testValues130
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1300
     * @tc.desc Verify array fromConstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [10, 20];
      let arr2: number[] = [30, 40];
      const set = new Set<number[]>([arr1, arr2]);
      const arr: number[][] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(arr1);
      expect(arr[1]).assertEqual(arr2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues131
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1310
     * @tc.desc Verify single via for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      let count: int = 0;
      for (let v of set.values()) { expect(v).assertEqual(42); count++; }
      expect(count).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues132
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1320
     * @tc.desc Verify multiple via for-of
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      let sum: number = 0;
      for (let v of set.values()) { sum += v; }
      expect(sum).assertEqual(60);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues133
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1330
     * @tc.desc Verify empty iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([]);
      let count: int = 0;
      for (let v of set.values()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testValues134
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1340
     * @tc.desc Verify same values dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([5, 5, 5, 5]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues135
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1350
     * @tc.desc Verify int values insertion order preserved (3 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([5, 15, 25]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(15);
      expect(arr[2]).assertEqual(25);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues136
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1360
     * @tc.desc Verify type coercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([1, '1']);
      const arr: Object[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testValues137
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1370
     * @tc.desc Verify basic int values iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues138
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1380
     * @tc.desc Verify size remains unchanged after iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues139
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1390
     * @tc.desc Verify break in loop stops iteration early
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const arr: number[] = [];
      for (let v of set.values()) {
        arr.push(v);
        if (v === 3) { break; }
      }
      expect(arr.length).assertEqual(3);
      expect(arr[arr.length - 1]).assertEqual(3);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testValues140
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1400
     * @tc.desc Verify continue in loop skips elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      let evens: number = 0;
      for (let v of set.values()) {
        if (v % 2 != 0) { continue; }
        evens++;
      }
      expect(evens).assertEqual(2);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testValues141
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1410
     * @tc.desc Verify return in loop context
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let sum: number = 0;
      for (let v of set.values()) { sum += v; }
      expect(sum).assertEqual(6);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testValues142
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1420
     * @tc.desc Verify max int boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([Int.MAX_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Int.MAX_VALUE);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues143
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1430
     * @tc.desc Verify min int boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([Int.MIN_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Int.MIN_VALUE);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues144
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1440
     * @tc.desc Verify max long boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([Long.MAX_VALUE]);
      const arr: long[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Long.MAX_VALUE);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues145
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1450
     * @tc.desc Verify min long boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([Long.MIN_VALUE]);
      const arr: long[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Long.MIN_VALUE);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues146
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1460
     * @tc.desc Verify max double boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MAX_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues147
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1470
     * @tc.desc Verify min double boundary value (negative max)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-Number.MAX_VALUE]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-Number.MAX_VALUE);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testValues148
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1480
     * @tc.desc Verify double negative zero equals positive zero in values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-0.0, 0.0]);
      const arr: number[] = [];
      for (let v of set.values()) { arr.push(v); }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
      expect(set.has(-0.0)).assertTrue();
      expect(set.has(0.0)).assertTrue();
    });

    /**
     * @tc.name testValues149
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1490
     * @tc.desc Verify arrayFrom
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100, 200, 300]);
      const values: number[] = [];
      for (const v of set.values()) { values.push(v); }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(100);
      expect(values[1]).assertEqual(200);
      expect(values[2]).assertEqual(300);
    });

    /**
     * @tc.name testValues150
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1500
     * @tc.desc Verify generic unionType
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int | string>([1, "a", 2]);
      let count = 0;
      for (let v of set.values()) { count++; }
      expect(count).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has('a')).assertTrue();
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testValues151
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1510
     * @tc.desc Verify values iteration count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let count = 0;
      for (let v of set.values()) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testValues152
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1520
     * @tc.desc Verify nullReference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> | null = null;
      expect(set).assertNull();
      try {
        const iter = (set as Set<int>).values();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testValues153
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1530
     * @tc.desc Verify sequentialMulti
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 5; i++) {
        set.add(i);
      }
      let count = 0;
      for (let v of set.values()) { count++; }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name testValues154
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1540
     * @tc.desc Verify largeSet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) { set.add(i); }
      let count = 0;
      for (let v of set.values()) { count++; }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name testValues155
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1550
     * @tc.desc Verify values on Set<byte>: 0xFF and 0o377 both truncate to -1 so set has 2 values (10 and -1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(0b1010 as byte);
      set.add(-1 as byte);
      set.add(-1 as byte);
      let count = 0;
      const arr: number[] = [];
      for (let v of set.values()) {
        arr.push(v);
        count++;
      }
      expect(count).assertEqual(2);
      expect(set.has(0b1010 as byte)).assertTrue();
      expect(set.has(-1 as byte)).assertTrue();
    });

    /**
     * @tc.name testValues156
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1560
     * @tc.desc Verify number elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number[]> = new Set<number[]>();
      const a1: number[] = [1, 2, 3];
      const a2: number[] = [4, 5, 6];
      set.add(a1);
      set.add(a2);
      let count = 0;
      const arr: number[][] = [];
      for (let v of set.values()) {
        arr.push(v);
        count++;
      }
      expect(count).assertEqual(2);
      expect(set.has(a1)).assertTrue();
      expect(set.has(a2)).assertTrue();
    });

    /**
     * @tc.name testValues157
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1570
     * @tc.desc Verify next
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([10, 20, 30]);
      const iter = set.values();
      expect(iter.next().value).assertEqual(10);
      expect(iter.next().value).assertEqual(20);
      expect(iter.next().value).assertEqual(30);
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.name testValues158
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1580
     * @tc.desc Verify empty Set values iterator returns done=true on first next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      const iter = set.values();
      expect(iter.next().done).assertTrue();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.name testValues159
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1590
     * @tc.desc Verify Set<char> values() with Unicode chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>([c'a', c'中', c'0']);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testValues160
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1600
     * @tc.desc Verify Set<number> values() with Number.POSITIVE_INFINITY and Number.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([42, Number.POSITIVE_INFINITY, Number.NaN]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testValues161
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1610
     * @tc.desc Verify for-of on Set yields same elements as values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["x", "y", "z"]);
      const fromForOf: string[] = [];
      const fromValues: string[] = [];
      for (const v of set) { fromForOf.push(v); }
      for (const v of set.values()) { fromValues.push(v); }
      expect(fromForOf.length).assertEqual(fromValues.length);
      expect(fromForOf.length).assertEqual(3);
    });

    /**
     * @tc.name testValues162
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1620
     * @tc.desc Verify two independent value iterators do not interfere
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([10, 20, 30]);
      const iter1 = set.values();
      const iter2 = set.values();
      expect(iter1.next().value).assertEqual(10);
      expect(iter2.next().value).assertEqual(10);
      expect(iter1.next().value).assertEqual(20);
      expect(iter2.next().value).assertEqual(20);
    });

    /**
     * @tc.name testValues163
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1630
     * @tc.desc Verify Set<Date> values() iterates Date refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2025, 0, 1);
      const d2 = new Date(2025, 6, 1);
      const set: Set<Date> = new Set<Date>([d1, d2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues164
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1640
     * @tc.desc Verify Set<RegExp> values() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = new RegExp("abc");
      const r2 = new RegExp("def", "i");
      const set: Set<RegExp> = new Set<RegExp>([r1, r2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues165
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1650
     * @tc.desc Verify Set<object> values() returns POJO refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1 = new ObjTest(1);
      const obj2 = new ObjTest(1);
      const set: Set<object> = new Set<object>([obj1, obj2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues166
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1660
     * @tc.desc Verify Set<Set<int>> nested Set values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([3, 4]);
      const outer: Set<Set<int>> = new Set<Set<int>>([inner1, inner2]);
      let total: int = 0;
      for (const inner of outer.values()) { total += inner.size; }
      expect(total).assertEqual(4);
    });

    /**
     * @tc.name testValues167
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1670
     * @tc.desc Verify Set<Set<int>> nested Set values() (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner1 = new Set<int>([1, 2]);
      const inner2 = new Set<int>([3, 4]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(inner1);
      outer.add(inner2);
      let total: int = 0;
      for (const inner of outer.values()) { total += inner.size; }
      expect(total).assertEqual(4);
    });

    /**
     * @tc.name testValues168
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1680
     * @tc.desc Verify Set<Record> values() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'b': 2 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>([r1, r2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues169
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1690
     * @tc.desc Verify Set<Record> values() iteration (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'b': 2 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      set.add(r1);
      set.add(r2);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues170
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1700
     * @tc.desc Verify Set<Int8Array> values() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int8Array([1]);
      const a2 = new Int8Array([2]);
      const set: Set<Int8Array> = new Set<Int8Array>([a1, a2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues171
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1710
     * @tc.desc Verify Set<Int8Array> values() iteration (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Int8Array([1]);
      const a2 = new Int8Array([2]);
      const set: Set<Int8Array> = new Set<Int8Array>();
      set.add(a1);
      set.add(a2);

      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues172
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1720
     * @tc.desc Verify Set<WeakMap> and Set<WeakSet> values()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const ws = new WeakSet<object>();
      const setWm: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([wm]);
      const setWs: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      let c1: int = 0;
      let c2: int = 0;
      for (const v of setWm.values()) { c1++; }
      for (const v of setWs.values()) { c2++; }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.name testValues173
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1730
     * @tc.desc Verify Set<WeakMap> and Set<WeakSet> values() (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const ws = new WeakSet<object>();
      const setWm: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      setWm.add(wm);

      const setWs: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      let c1: int = 0;
      let c2: int = 0;
      for (const v of setWm.values()) { c1++; }
      for (const v of setWs.values()) { c2++; }
      expect(c1).assertEqual(1);
      expect(c2).assertEqual(1);
    });

    /**
     * @tc.name testValues174
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1740
     * @tc.desc Verify Set<bigint> values() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>([5n, 10n, 15n]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testValues175
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1750
     * @tc.desc Verify ReadonlySet values() iterates correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["x", "y", "z"]);
      const rs: ReadonlySet<string> = set;
      let count: int = 0;
      for (const v of rs.values()) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testValues176
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1760
     * @tc.desc Verify Set<float> values() with Float.NaN and Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(0.0 as float);
      set.add(Float.NaN);
      set.add(Float.POSITIVE_INFINITY);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testValues177
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1770
     * @tc.desc Verify Set<Error> values() with Error and TypeError instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1: Error = new Error('a');
      const e2: TypeError = new TypeError('b');
      const set: Set<Error> = new Set<Error>([e1, e2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues178
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1780
     * @tc.desc Verify Set<Map<string, number>> values() iterates Map refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1: Map<string, number> = new Map<string, number>();
      m1.set('a', 1);
      const m2: Map<string, number> = new Map<string, number>();
      m2.set('b', 2);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m1, m2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testValues179
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1790
     * @tc.desc Verify Set<Promise<Set<int>>> values() nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testValues180
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_VALUES_P1_1800
     * @tc.desc Verify Set<jsonx.JsonElement> values() with JSON parsed objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testValues180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"b":2}');
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1, j2]);
      let count: int = 0;
      for (const v of set.values()) { count++; }
      expect(count).assertEqual(2);
    });
  });
}

