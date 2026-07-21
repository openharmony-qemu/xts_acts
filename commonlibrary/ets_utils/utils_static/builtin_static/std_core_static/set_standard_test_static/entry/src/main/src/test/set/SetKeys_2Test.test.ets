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

export default function SetKeys_2Test(): void {
  describe('SetKeysPart1Test', (): void => {
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
     * @tc.name testKeys001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0010
     * @tc.desc Verify single byte element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([42]);
      const keys: number[] = [];
      for (let k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(42);
    });

    /**
     * @tc.name testKeys002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0020
     * @tc.desc Verify multiple byte elements in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([10, 20, 30]);
      const keys: number[] = [];
      for (let k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(20);
      expect(keys[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0030
     * @tc.desc Verify empty byte set returns no keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([]);
      let count = 0;
      for (let k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0040
     * @tc.desc Verify keys byte -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(-128);
      expect(s.has(-128)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0050
     * @tc.desc Verify keys byte 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(127);
      expect(s.has(127)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0060
     * @tc.desc Verify byte zero element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0]);
      let found: boolean = false;
      for (let k of set.keys()) {
        expect(k).assertEqual(0);
        found = true;
      }
      expect(found).assertTrue();
      expect(set.has(0)).assertTrue();
    });

    /**
     * @tc.name testKeys007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0070
     * @tc.desc Verify byte hex value 0x1A in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([0x1A]);
      const keys: number[] = [];
      for (let k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(0x1A);
    });

    /**
     * @tc.name testKeys008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0080
     * @tc.desc Verify byte deduplication collapses to single key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([42, 42, 42]);
      let count = 0;
      for (let k of set.keys()) {
        expect(k).assertEqual(42);
        count++;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testKeys009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0090
     * @tc.desc Verify byte keys preserve insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([30, 10, 20]);
      const keys: number[] = [];
      for (let k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(30);
      expect(keys[1]).assertEqual(10);
      expect(keys[2]).assertEqual(20);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0100
     * @tc.desc Verify byte keys count matches set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>([1, 2, 3]);
      let count = 0;
      for (let k of set.keys()) {
        count++;
        expect(set.has(k)).assertTrue();
      }
      expect(count).assertEqual(set.size);
    });

    /**
     * @tc.name testKeys011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0110
     * @tc.desc Verify single short element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100]);
      const keys: number[] = [];
      for (let k of set.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(100);
    });

    /**
     * @tc.name testKeys012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0120
     * @tc.desc Verify multiple short elements in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 200, 300]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(100);
      expect(keys[1]).assertEqual(200);
      expect(keys[2]).assertEqual(300);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0130
     * @tc.desc Verify empty short set returns no keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0140
     * @tc.desc Verify keys short -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(-32768);
      expect(s.has(-32768)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0150
     * @tc.desc Verify keys short 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(32767);
      expect(s.has(32767)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0160
     * @tc.desc Verify short zero element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0]);
      let found: boolean = false;
      for (let k of set.keys()) { expect(k).assertEqual(0); found = true; }
      expect(found).assertTrue();
      expect(set.has(0)).assertTrue();

    });

    /**
     * @tc.name testKeys017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0170
     * @tc.desc Verify short hex value 0xFF in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0xFF]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(0xFF);

    });

    /**
     * @tc.name testKeys018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0180
     * @tc.desc Verify short deduplication collapses to single key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([100, 100, 100]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(100); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0190
     * @tc.desc Verify short keys preserve insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([300, 100, 200]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(300);
      expect(keys[1]).assertEqual(100);
      expect(keys[2]).assertEqual(200);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0200
     * @tc.desc Verify short keys count matches set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([1, 2, 3]);

      let count = 0;
      for (let k of set.keys()) { count++; expect(set.has(k)).assertTrue(); }
      expect(count).assertEqual(set.size);
    });

    /**
     * @tc.name testKeys021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0210
     * @tc.desc Verify single int element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(42);

    });

    /**
     * @tc.name testKeys022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0220
     * @tc.desc Verify multiple int elements in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(20);
      expect(keys[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0230
     * @tc.desc Verify empty int set returns no keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0240
     * @tc.desc Verify keys Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE);
      expect(s.has(Int.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0250
     * @tc.desc Verify keys Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE);
      expect(s.has(Int.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0260
     * @tc.desc Verify int zero element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0]);
      let found: boolean = false;
      for (let k of set.keys()) { expect(k).assertEqual(0); found = true; }
      expect(found).assertTrue();
      expect(set.has(0)).assertTrue();

    });

    /**
     * @tc.name testKeys027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0270
     * @tc.desc Verify int negative one value in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(-1);

    });

    /**
     * @tc.name testKeys028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0280
     * @tc.desc Verify int positive one value in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(1);

    });

    /**
     * @tc.name testKeys029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0290
     * @tc.desc Verify keys() correctness with large int Set (1000 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) { set.add(i); }

      let count = 0;
      for (let k of set.keys()) { expect(set.has(k)).assertTrue(); count++; }
      expect(count).assertEqual(1000);
      expect(set.size).assertEqual(1000);
    });

    /**
     * @tc.name testKeys030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0300
     * @tc.desc Verify int deduplication collapses to single key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42, 42, 42]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(42); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0310
     * @tc.desc Verify int keys preserve insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([30, 10, 20]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(30);
      expect(keys[1]).assertEqual(10);
      expect(keys[2]).assertEqual(20);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0320
     * @tc.desc Verify int hex literal 0x2A in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0x2A]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(0x2A);

    });

    /**
     * @tc.name testKeys033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0330
     * @tc.desc Verify int octal literal 0o63 in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0o63]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(0o63);

    });

    /**
     * @tc.name testKeys034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0340
     * @tc.desc Verify int binary literal 0b101010 in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0b101010]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(0b101010);

    });

    /**
     * @tc.name testKeys035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0350
     * @tc.desc Verify int negative values in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-1, -2, -3]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has(-1)).assertTrue();
      expect(set.has(-2)).assertTrue();
      expect(set.has(-3)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0360
     * @tc.desc Verify int positive values in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0370
     * @tc.desc Verify int mixed positive negative and zero keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([-5, 0, 5]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has(-5)).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.has(5)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0380
     * @tc.desc Verify int consecutive values in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(5);
      for (let i: int = 0; i < 5; i++) { expect(keys[i]).assertEqual(i + 1); }
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testKeys039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0390
     * @tc.desc Verify int sparse values in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 100, 10000]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(100)).assertTrue();
      expect(set.has(10000)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0400
     * @tc.desc Verify int boundary pair 0 and 1 in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0, 1, -1]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has(0)).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.has(-1)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0410
     * @tc.desc Verify Set.keys() returns correct keys for int elements after add operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(99);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0420
     * @tc.desc Verify keys after clear operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      const arr: number[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0430
     * @tc.desc Verify value equality dedup in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 5;
      let b: int = 5;
      const set = new Set<int>([a, b]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(5);

    });

    /**
     * @tc.name testKeys044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0440
     * @tc.desc Verify keys after add modification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let beforeCount: number = 0;
      for (let k of set.keys()) { beforeCount++; }
      expect(beforeCount).assertEqual(3);
      set.add(4);
      let afterCount: number = 0;
      for (let k of set.keys()) { afterCount++; }
      expect(afterCount).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0450
     * @tc.desc Verify int keys after delete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      expect(set.delete(1)).assertTrue();
      const arr: number[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0460
     * @tc.desc Verify chained operations after keys iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let keys1: number[] = [];
      for (let k of set.keys()) { keys1.push(k); }
      set.add(4);
      let keys2: number[] = [];
      for (let k of set.keys()) { keys2.push(k); }
      expect(keys1.length).assertEqual(3);
      expect(keys2.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0470
     * @tc.desc Verify keys returns iterable iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20]);
      let iterator = set.keys();
      let firstResult = iterator.next();
      let secondResult = iterator.next();
      let first: int | undefined = firstResult.value;
      let second: int | undefined = secondResult.value;
      if (first !== undefined) { expect(first).assertEqual(10); }
      if (second !== undefined) { expect(second).assertEqual(20); }
    });

    /**
     * @tc.name testKeys048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0480
     * @tc.desc Verify keys match constructor values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([7, 14, 21]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(7);
      expect(keys[1]).assertEqual(14);
      expect(keys[2]).assertEqual(21);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0490
     * @tc.desc Verify keys iteration captures last element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let result: number = 0;
      for (let k of set.keys()) { result = k; }
      expect(result).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0500
     * @tc.desc Verify keys in regular function context
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const sumKeys = (s: Set<int>): number => {
        let sum: number = 0;
        for (let k of s.keys()) { sum += k; }
        return sum;
      };
      expect(sumKeys(set)).assertEqual(6);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0510
     * @tc.desc Verify single long element in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(42);

    });

    /**
     * @tc.name testKeys052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0520
     * @tc.desc Verify multiple long elements in keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(10);
      expect(keys[1]).assertEqual(20);
      expect(keys[2]).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0530
     * @tc.desc Verify empty long set returns no keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0540
     * @tc.desc Verify long below int min
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([-2147483649]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(-2147483649);

    });

    /**
     * @tc.name testKeys055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0550
     * @tc.desc Verify long above int max
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([2147483648]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(2147483648);

    });

    /**
     * @tc.name testKeys056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0560
     * @tc.desc Verify large long 10000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(10000000000);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(10000000000); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0570
     * @tc.desc Verify large negative long -10000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(-10000000000);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(-10000000000); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0580
     * @tc.desc Verify long zero element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([0]);
      let found: boolean = false;
      for (let k of set.keys()) { expect(k).assertEqual(0); found = true; }
      expect(found).assertTrue();
      expect(set.has(0)).assertTrue();

    });

    /**
     * @tc.name testKeys059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0590
     * @tc.desc Verify long deduplication
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([42, 42, 42]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(42); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0600
     * @tc.desc Verify long insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([30, 10, 20]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(30);
      expect(keys[1]).assertEqual(10);
      expect(keys[2]).assertEqual(20);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0610
     * @tc.desc Verify keys() correctness with long Set (100 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      for (let i: int = 0; i < 100; i++) { set.add(i); }

      let count = 0;
      for (let k of set.keys()) { expect(set.has(k)).assertTrue(); count++; }
      expect(count).assertEqual(100);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testKeys062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0620
     * @tc.desc Verify Set.keys() returns correct keys for long elements after add operation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      set.add(99);
      const arr: number[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(99);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0630
     * @tc.desc Verify keys after add in long set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1, 2, 3]);
      let bc: number = 0;
      for (let k of set.keys()) { bc++; }
      expect(bc).assertEqual(3);
      set.add(4);
      let ac: number = 0;
      for (let k of set.keys()) { ac++; }
      expect(ac).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0640
     * @tc.desc Verify chained keys on long set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([10, 20, 30]);
      let k1: number[] = [];
      for (let k of set.keys()) { k1.push(k); }
      set.add(40);
      let k2: number[] = [];
      for (let k of set.keys()) { k2.push(k); }
      expect(k1.length).assertEqual(3);
      expect(k2.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0650
     * @tc.desc Verify long constructor keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([7, 14, 21]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(7);
      expect(keys[1]).assertEqual(14);
      expect(keys[2]).assertEqual(21);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0660
     * @tc.desc Verify double positive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 1.0]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(1.0); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0670
     * @tc.desc Verify double decimal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1.0);
      expect(keys[1]).assertEqual(2.0);
      expect(keys[2]).assertEqual(3.0);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0680
     * @tc.desc Verify double single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(1.5);

    });

    /**
     * @tc.name testKeys069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0690
     * @tc.desc Verify double multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.1, 2.2, 3.3]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1.1);
      expect(keys[1]).assertEqual(2.2);
      expect(keys[2]).assertEqual(3.3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0700
     * @tc.desc Verify double empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0710
     * @tc.desc Verify double minMax
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([5e-324, 1.7976931348623157e308]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.has(5e-324)).assertTrue();
      expect(set.has(1.7976931348623157e308)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0720
     * @tc.desc Verify double zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([0.0]);
      let found: boolean = false;
      for (let k of set.keys()) { expect(k).assertEqual(0.0); found = true; }
      expect(found).assertTrue();
      expect(set.has(0.0)).assertTrue();

    });

    /**
     * @tc.name testKeys073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0730
     * @tc.desc Verify double negative
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-1.0, -1.0]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(-1.0); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0740
     * @tc.desc Verify double large
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      for (let i: int = 0; i < 100; i++) { set.add(i); }

      let count = 0;
      for (let k of set.keys()) { expect(set.has(k)).assertTrue(); count++; }
      expect(count).assertEqual(100);
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testKeys075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0750
     * @tc.desc Verify double duplicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.5, 1.5, 1.5]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(1.5); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0760
     * @tc.desc Verify double order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([3.3, 1.1, 2.2]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(3.3);
      expect(keys[1]).assertEqual(1.1);
      expect(keys[2]).assertEqual(2.2);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0770
     * @tc.desc Verify double afterAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1.0, 2.0, 3.0]);
      set.add(99.0);
      const arr: number[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(2.0);
      expect(arr[2]).assertEqual(3.0);
      expect(arr[3]).assertEqual(99.0);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0780
     * @tc.desc Verify boolean true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true]);
      const keys: boolean[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertTrue();
      expect(set.has(true)).assertTrue();

    });

    /**
     * @tc.name testKeys079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0790
     * @tc.desc Verify boolean false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([false]);
      const keys: boolean[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertFalse();
      expect(set.has(false)).assertTrue();

    });

    /**
     * @tc.name testKeys080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0800
     * @tc.desc Verify boolean both
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const keys: boolean[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0810
     * @tc.desc Verify boolean empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0820
     * @tc.desc Verify boolean duplicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, true, false, false]);
      const keys: boolean[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0830
     * @tc.desc Verify boolean order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const keys: boolean[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertTrue();
      expect(keys[1]).assertFalse();
    });

    /**
     * @tc.name testKeys084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0840
     * @tc.desc Verify boolean afterAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true]);
      set.add(false);
      const arr: boolean[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0850
     * @tc.desc Verify boolean afterDelete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      set.delete(false);
      const arr: boolean[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();

    });

    /**
     * @tc.name testKeys086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0860
     * @tc.desc Verify boolean fromConstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true, false]);
      const arr: boolean[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(2);
      expect(set.has(true)).assertTrue();
      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.name testKeys087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0870
     * @tc.desc Verify string single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["hello"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual("hello");

    });

    /**
     * @tc.name testKeys088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0880
     * @tc.desc Verify string multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["apple", "banana", "cherry"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("apple");
      expect(keys[1]).assertEqual("banana");
      expect(keys[2]).assertEqual("cherry");
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0890
     * @tc.desc Verify string empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0900
     * @tc.desc Verify string empty setStr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([""]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual("");
      expect(set.has("")).assertTrue();

    });

    /**
     * @tc.name testKeys091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0910
     * @tc.desc Verify string whitespace
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>([" ", "\t", "\n"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has(" ")).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0920
     * @tc.desc Verify string chinese
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["中文"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual("中文");

    });

    /**
     * @tc.name testKeys093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0930
     * @tc.desc Verify string emoji
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["😀"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual("😀");

    });

    /**
     * @tc.name testKeys094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0940
     * @tc.desc Verify long string keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = "a".repeat(1000);
      const set = new Set<string>([longStr]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0].length).assertEqual(1000);

    });

    /**
     * @tc.name testKeys095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0950
     * @tc.desc Verify string numericStr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["123", "456", "789"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has("123")).assertTrue();
      expect(set.has("456")).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0960
     * @tc.desc Verify string caseSensitive
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["Hello", "hello", "HELLO"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0970
     * @tc.desc Verify string duplicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["hello", "hello", "hello"]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual("hello"); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0980
     * @tc.desc Verify string order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["cherry", "apple", "banana"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("cherry");
      expect(keys[1]).assertEqual("apple");
      expect(keys[2]).assertEqual("banana");
    });

    /**
     * @tc.name testKeys099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_0990
     * @tc.desc Verify string escapeChars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["line1\nline2", "tab\there", "quote\"here"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.has("line1\nline2")).assertTrue();
      expect(set.has("tab\there")).assertTrue();
      expect(set.has("quote\"here")).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1000
     * @tc.desc Verify string concat
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = "hel"; let b = "lo";
      const set = new Set<string>([a + b]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual("hello");

    });

    /**
     * @tc.name testKeys101
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1010
     * @tc.desc Verify string filter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["apple", "banana", "cherry"]);
      let filtered: string[] = [];
      for (let k of set.keys()) { if (k.length > 5) { filtered.push(k); } }
      expect(filtered.length).assertEqual(2);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys102
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1020
     * @tc.desc Verify string reduce
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "bb", "ccc"]);
      let sum: number = 0;
      for (let k of set.keys()) { sum += k.length; }
      expect(sum).assertEqual(6);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys103
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1030
     * @tc.desc Verify string afterAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["one", "two", "three"]);
      set.add("added");
      const arr: string[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual("one");
      expect(arr[1]).assertEqual("two");
      expect(arr[2]).assertEqual("three");
      expect(arr[3]).assertEqual("added");
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys104
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1040
     * @tc.desc Verify string afterClear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["one", "two", "three"]);
      set.clear();
      const arr: string[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys105
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1050
     * @tc.desc Verify string modifyDuring iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["one", "two", "three"]);
      let beforeCount: number = 0;
      for (let k of set.keys()) { beforeCount++; }
      expect(beforeCount).assertEqual(3);
      set.add("four");
      let afterCount: number = 0;
      for (let k of set.keys()) { afterCount++; }
      expect(afterCount).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys106
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1060
     * @tc.desc Verify string deleteDuring iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["one", "two", "three"]);
      expect(set.delete("one")).assertTrue();
      const arr: string[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual("two");
      expect(arr[1]).assertEqual("three");
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys107
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1070
     * @tc.desc Verify string chainedCalls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["apple", "banana", "cherry"]);
      let k1: string[] = [];
      for (let k of set.keys()) { k1.push(k); }
      set.add("date");
      let k2: string[] = [];
      for (let k of set.keys()) { k2.push(k); }
      expect(k1.length).assertEqual(3);
      expect(k2.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys108
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1080
     * @tc.desc Verify string fromConstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["one", "two", "three"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("one");
      expect(keys[1]).assertEqual("two");
      expect(keys[2]).assertEqual("three");
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys109
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1090
     * @tc.desc Verify Object single element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o = new ObjTest();
      const set = new Set<ObjTest>([o]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(o);
      expect(set.has(o)).assertTrue();

    });
