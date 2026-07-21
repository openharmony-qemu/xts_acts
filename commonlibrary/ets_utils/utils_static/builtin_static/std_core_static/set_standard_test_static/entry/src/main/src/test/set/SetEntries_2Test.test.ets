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

export default function SetEntries_2Test(): void {
  describe('SetEntriesPart1Test', (): void => {
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
     * @tc.name testEntries001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0010
     * @tc.desc Verify Byte single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          expect(entry[0]).assertEqual(entry[1]);
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0020
     * @tc.desc Verify Byte multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([10, 20, 30]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0030
     * @tc.desc Verify empty byte set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0040
     * @tc.desc Verify byte zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0050
     * @tc.desc Verify byte hex literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0x2A]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0x2A);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0060
     * @tc.desc Verify byte octal literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0o52]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0o52);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0070
     * @tc.desc Verify byte binary literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0b101010]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0b101010);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0080
     * @tc.desc Verify byte deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42, 42, 42]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0090
     * @tc.desc Verify byte count and size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([1, 2, 3]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0100
     * @tc.desc Verify Short single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0x64]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0x64);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0110
     * @tc.desc Verify Short multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 200, 300]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
      expect(arr[2]).assertEqual(300);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0120
     * @tc.desc Verify empty short set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0130
     * @tc.desc Verify short zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0140
     * @tc.desc Verify short deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 100, 100]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0150
     * @tc.desc Verify short count and size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([1, 2, 3]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0160
     * @tc.desc Verify Int single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0170
     * @tc.desc Verify Int multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0180
     * @tc.desc Verify empty int set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0190
     * @tc.desc Verify entries Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE);
      expect(s.has(Int.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0200
     * @tc.desc Verify entries Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE);
      expect(s.has(Int.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0210
     * @tc.desc Verify int negative one
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0220
     * @tc.desc Verify 10 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 10; i++) {
        set.add(i);
      }
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(0);
      expect(arr[9]).assertEqual(9);
      expect(set.size).assertEqual(10);
    });

    /**
     * @tc.name testEntries023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0230
     * @tc.desc Verify Long single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0240
     * @tc.desc Verify Long multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0250
     * @tc.desc Verify empty long set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0260
     * @tc.desc Verify long below int min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-2147483649]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-2147483649);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0270
     * @tc.desc Verify long above int max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([2147483648]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2147483648);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0280
     * @tc.desc Verify large 10 billion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10000000000]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10000000000);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0290
     * @tc.desc Verify large negative 10 billion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-10000000000]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-10000000000);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0300
     * @tc.desc Verify long hex literal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([0xFF]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0310
     * @tc.desc Verify long zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0320
     * @tc.desc Verify long deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42, 42, 42]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0330
     * @tc.desc Verify entries() correctness with long Set (100 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      for (let i: int = 0; i < 100; i++) {
        set.add(i);
      }
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testEntries034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0340
     * @tc.desc Verify long after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(99);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testEntries035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0350
     * @tc.desc Verify add after entries iteration does not affect collected entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      set.add(4);
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testEntries036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0360
     * @tc.desc Verify long chained entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      let arr1: long[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: long = e[0];
        arr1.push(key);
      }
      let arr2: long[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: long = e[0];
        arr2.push(key);
      }
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.name testEntries037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0370
     * @tc.desc Verify long from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0380
     * @tc.desc Verify float negative zero equals positive zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-0.0, 0.0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0390
     * @tc.desc Verify float positive dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 1.0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0400
     * @tc.desc Verify float decimal values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(2.0);
      expect(arr[2]).assertEqual(3.0);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0410
     * @tc.desc Verify float insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.1, 2.2, 3.3]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1.1);
      expect(arr[1]).assertEqual(2.2);
      expect(arr[2]).assertEqual(3.3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0420
     * @tc.desc Verify Double single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.5);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0430
     * @tc.desc Verify empty double set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0440
     * @tc.desc Verify double min and max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([Number.MIN_VALUE, Number.MAX_VALUE]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(Number.MIN_VALUE);
      expect(arr[1]).assertEqual(Number.MAX_VALUE);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0450
     * @tc.desc Verify double zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([0.0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0.0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0460
     * @tc.desc Verify double negative dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-1.0, -1.0]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1.0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0470
     * @tc.desc Verify double large set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      for (let i: int = 0; i < 100; i++) {
        set.add(i);
      }
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testEntries048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0480
     * @tc.desc Verify double deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5, 1.5, 1.5]);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1.5);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0490
     * @tc.desc Verify double after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      set.add(99.0);
      const arr: number[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(2.0);
      expect(arr[2]).assertEqual(3.0);
      expect(arr[3]).assertEqual(99.0);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testEntries050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0500
     * @tc.desc Verify String single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
      */
    it('testEntries050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0510
     * @tc.desc Verify String multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('apple');
      expect(arr[1]).assertEqual('banana');
      expect(arr[2]).assertEqual('cherry');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0520
     * @tc.desc Verify empty string set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([]);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0530
     * @tc.desc Verify empty string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0540
     * @tc.desc Verify whitespace string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([' ']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(' ');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0550
     * @tc.desc Verify Chinese characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['中文']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('中文');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0560
     * @tc.desc Verify emoji string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['😀']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('😀');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0570
     * @tc.desc Verify long string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = '';
      for (let i: int = 0; i < 1000; i++) {
        longStr += 'a';
      }
      const set = new Set<string>([longStr]);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(longStr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0580
     * @tc.desc Verify numeric string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['123']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('123');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0590
     * @tc.desc Verify case sensitivity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['Hello', 'hello']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0600
     * @tc.desc Verify string deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello', 'hello', 'hello']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('hello');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0610
     * @tc.desc Verify escape characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['\n', '\t']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('\n');
      expect(arr[1]).assertEqual('\t');
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0620
     * @tc.desc Verify string concatenation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['ab', 'cd']);
      let result = '';
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: string = e[0];
        result += key;
      }
      expect(result.length).assertEqual(4);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0630
     * @tc.desc Verify filter entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['hello', 'world']);
      const arr: string[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key = e[0];
        arr.push(key);
      }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0640
     * @tc.desc Verify reduce on entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      let result = '';
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: string = e[0];
        result += key;
      }
      expect(result.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0650
     * @tc.desc Verify string after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.add('added');
      const arr: string[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key = e[0];
        arr.push(key);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('one');
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual('three');
      expect(arr[3]).assertEqual('added');
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testEntries066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0660
     * @tc.desc Verify string after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      set.clear();
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0670
     * @tc.desc Verify string add after iteration completes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      set.add('four');
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testEntries068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0680
     * @tc.desc Verify string delete before iterate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      const arr: string[] = [];
      let deleted = false;
        for (let entry of set.entries()) {
          let key = entry[0];
          if (!deleted) {
            set.delete('one');
            deleted = true;
          } else {
            arr.push(key);
          }
        }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('two');
      expect(arr[1]).assertEqual('three');
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0690
     * @tc.desc Verify string chained entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      let arr1: string[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: string = e[0];
        arr1.push(key);
      }
      let arr2: string[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: string = e[0];
        arr2.push(key);
      }
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.name testEntries070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0700
     * @tc.desc Verify string from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(['one', 'two', 'three']);
      const arr: string[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('one');
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual('three');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0710
     * @tc.desc Verify Object single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0].id).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0720
     * @tc.desc Verify Object multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0730
     * @tc.desc Verify empty obj set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0740
     * @tc.desc Verify same object reference dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj, obj]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0750
     * @tc.desc Verify different object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(1);
      const set = new Set<ObjTest>([obj1, obj2]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0760
     * @tc.desc Verify entries on empty ObjTest Set created via no-arg constructor returns no entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>();
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0770
     * @tc.desc Verify obj insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(arr[0].id).assertEqual(1);
      expect(arr[1].id).assertEqual(2);
      expect(arr[2].id).assertEqual(3);
    });

    /**
     * @tc.name testEntries078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0780
     * @tc.desc Verify obj after add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      set.add(new ObjTest(1));
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testEntries079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0790
     * @tc.desc Verify obj after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest(1);
      let obj2 = new ObjTest(2);
      let obj3 = new ObjTest(3);
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      set.delete(obj3);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0800
     * @tc.desc Verify modify object property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(1);
      const set = new Set<ObjTest>([obj]);
      obj.value = 10;
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0].value).assertEqual(10);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0810
     * @tc.desc Verify obj from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0820
     * @tc.desc Verify obj chained entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      let arr1: ObjTest[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: ObjTest = e[0];
        arr1.push(key);
      }
      let arr2: ObjTest[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: ObjTest = e[0];
        arr2.push(key);
      }
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.name testEntries083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0830
     * @tc.desc Verify ObjTest with negative value entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest(-1);
      const set = new Set<ObjTest>([obj]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(1);
      expect(arr[0].id).assertEqual(-1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0840
     * @tc.desc Verify single array element entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr]);
      const result: number[][] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        result.push(e[0]);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(arr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0850
     * @tc.desc Verify multiple array elements entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      let arr3: number[] = [5, 6];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      const result: number[][] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        result.push(e[0]);
      }
      expect(result.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0860
     * @tc.desc Verify empty array set entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number[]>([]);
      let count = 0;
      for (let e of set.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testEntries087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0870
     * @tc.desc Verify same array reference dedup entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr, arr, arr]);
      const result: number[][] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        result.push(e[0]);
      }
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(arr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testEntries088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0880
     * @tc.desc Verify different array references entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [1, 2, 3];
      let arr3: number[] = [1, 2, 3];
      const set = new Set<number[]>([arr1, arr2, arr3]);
      const result: number[][] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        result.push(e[0]);
      }
      expect(result.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testEntries089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0890
     * @tc.desc Verify entries iteration and key-value identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 3]);
      const arr: int[] = [];
      for (let e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        let key: int = e[0];
        arr.push(key);
      }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testEntries090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_ENTRIES_P1_0900
     * @tc.desc Verify empty Object set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testEntries090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([]);
      const arr: ObjTest[] = [];
        for (let entry of set.entries()) {
          let key = entry[0];

          arr.push(key);
        }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });
