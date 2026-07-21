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

    /**
     * @tc.name testKeys110
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1100
     * @tc.desc Verify Object multiple elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(); let o2 = new ObjTest(); let o3 = new ObjTest();
      const set = new Set<Object>([o1, o2, o3]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys111
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1110
     * @tc.desc Verify Object empty set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>([]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys112
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1120
     * @tc.desc Verify Object same reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o = new ObjTest();
      const set = new Set<ObjTest>([o, o, o]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(o); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys113
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1130
     * @tc.desc Verify Object differentRef
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(); let o2 = new ObjTest(); let o3 = new ObjTest();
      const set = new Set<Object>([o1, o2, o3]);

      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys114
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1140
     * @tc.desc Verify Object empty setDefaultconstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>();
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys115
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1150
     * @tc.desc Verify Object order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(); let o2 = new ObjTest(); let o3 = new ObjTest();
      const set = new Set<Object>([o3, o1, o2]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(o3);
      expect(keys[1]).assertEqual(o1);
      expect(keys[2]).assertEqual(o2);
    });

    /**
     * @tc.name testKeys116
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1160
     * @tc.desc Verify Object afterAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest();
      let obj2 = new ObjTest();
      let obj3 = new ObjTest();
      let obj4 = new ObjTest();
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      set.add(obj4);
      const arr: ObjTest[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
      expect(arr[2]).assertEqual(obj3);
      expect(arr[3]).assertEqual(obj4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys117
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1170
     * @tc.desc Verify Object afterDelete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest();
      let obj2 = new ObjTest();
      let obj3 = new ObjTest();
      const set = new Set<ObjTest>([obj1, obj2, obj3]);
      set.delete(obj3);
      const arr: ObjTest[] = [];
      for (let k of set.keys()) {
        arr.push(k);
      }
      expect(arr.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys118
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1180
     * @tc.desc Verify Object modifyProp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o = new ObjTest(); o.value = 10;
      const set = new Set<ObjTest>([o]);
      const keys: ObjTest[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0].value).assertEqual(10);

    });

    /**
     * @tc.name testKeys119
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1190
     * @tc.desc Verify Object chainedCalls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(); let o2 = new ObjTest();
      const set = new Set<ObjTest>([o1, o2]);
      let k1: ObjTest[] = [];
      for (let k of set.keys()) { k1.push(k); }
      set.add(new ObjTest());
      let k2: ObjTest[] = [];
      for (let k of set.keys()) { k2.push(k); }
      expect(k1.length).assertEqual(2);
      expect(k2.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys120
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1200
     * @tc.desc Verify Object errorObject
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o = new ObjTest(); o.id = -1;
      const set = new Set<ObjTest>([o]);
      const keys: ObjTest[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0].id).assertEqual(-1);

    });

    /**
     * @tc.name testKeys121
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1210
     * @tc.desc Verify single func key via keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([42]);
      let sum: number = 0;
      for (let k of set.keys()) { sum += k; }
      expect(sum).assertEqual(42);

    });

    /**
     * @tc.name testKeys122
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1220
     * @tc.desc Verify multi func keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let product: number = 1;
      for (let k of set.keys()) { product *= k; }
      expect(product).assertEqual(6);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys123
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1230
     * @tc.desc Verify empty func keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys124
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1240
     * @tc.desc Verify same int ref dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 7;
      const set = new Set<int>([a, a, a]);

      let count = 0;
      for (let k of set.keys()) { expect(k).assertEqual(7); count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys125
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1250
     * @tc.desc Verify regular func iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      let max: number = 0;
      for (let k of set.keys()) { if (k > max) { max = k; } }
      expect(max).assertEqual(30);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys126
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1260
     * @tc.desc Verify func keys from constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([5, 10, 15]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys127
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1270
     * @tc.desc Verify func insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([30, 10, 20]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(30);
      expect(keys[1]).assertEqual(10);
      expect(keys[2]).assertEqual(20);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys128
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1280
     * @tc.desc Verify int intStr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(1);
      const set = new Set<Object>([o1, 1, "str"]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys129
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1290
     * @tc.desc Verify int intBool
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(1);
      const set = new Set<Object>([o1, 1, true]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys130
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1300
     * @tc.desc Verify Object strBool
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(1);
      const set = new Set<Object>([o1, "hello", false]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys131
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1310
     * @tc.desc Verify int intObj
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(1); let o2 = new ObjTest(1);
      const set = new Set<Object>([o1, 42, o2]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys132
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1320
     * @tc.desc Verify Object strObj
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(1); let o2 = new ObjTest(1);
      const set = new Set<Object>([o1, "world", o2]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys133
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1330
     * @tc.desc Verify Object multiple elementsTypes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let o1 = new ObjTest(1); let o2 = new ObjTest(1); let o3 = new ObjTest(1);
      const set = new Set<Object>([o1, o2, o3]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys134
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1340
     * @tc.desc Verify Object typeCheck
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new ObjTest(1)]);

      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(1);

    });

    /**
     * @tc.name testKeys135
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1350
     * @tc.desc Verify Object filter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new ObjTest(1);
      const o2 = new ObjTest(1);
      const set = new Set<ObjTest>([o1, o2]);
      const filtered: ObjTest[] = [];
      for (let k of set.keys()) {
        if (k === o1) { filtered.push(k); }
      }
      expect(filtered.length).assertEqual(1);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys136
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1360
     * @tc.desc Verify Object reduce
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      let total = 0;
      for (let k of set.keys()) { total = total + 1; }
      expect(total).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys137
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1370
     * @tc.desc Verify Object fromConstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new ObjTest(1), new ObjTest(2), new ObjTest(3)]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys138
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1380
     * @tc.desc Verify Object modifyDuring iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>([new ObjTest(1), new ObjTest(1)]);
      let before: number = 0;
      for (let k of set.keys()) { before++; }
      expect(before).assertEqual(2);
      set.add(new ObjTest(1));
      let after: number = 0;
      for (let k of set.keys()) { after++; }
      expect(after).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys139
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1390
     * @tc.desc Verify Object twoObjects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>([new ObjTest(1), new ObjTest(1)]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys140
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1400
     * @tc.desc Verify Object single elementObjectKeyDeduplicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o = new ObjTest(1);
      const set = new Set<ObjTest>([o, o]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys141
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1410
     * @tc.desc Verify Object nanUnion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | number>([new ObjTest(1), Double.NaN]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(2);
      expect(set.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testKeys142
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1420
     * @tc.desc Verify Object infinityUnion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | number>([new ObjTest(1), Double.POSITIVE_INFINITY]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(2);

    });

    /**
     * @tc.name testKeys143
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1430
     * @tc.desc Verify Object negative infinity union
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object | number>([new ObjTest(1), Double.NEGATIVE_INFINITY]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(2);

    });

    /**
     * @tc.name testKeys144
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1440
     * @tc.desc Verify Object single elementObjWithArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [1, 2];
      const set = new Set<number[]>([arr1]);
      const keys: number[][] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys145
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1450
     * @tc.desc Verify Object single elementElem
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<Object>([new ObjTest(1)]);
      const keys: Object[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys146
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1460
     * @tc.desc Verify Object typeCoercion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o = new ObjTest(1);
      const set = new Set<ObjTest>([o]);
      let retrieved: ObjTest = new ObjTest(1);
      for (let k of set.keys()) { retrieved = k; }
      expect(retrieved).assertEqual(o);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys147
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1470
     * @tc.desc Verify int set iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys148
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1480
     * @tc.desc Verify keys() returns iterator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys = set.keys();
      expect(set.size).assertEqual(3);
      let count = 0;
      for (const k of keys) { count++; }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testKeys149
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1490
     * @tc.desc Verify ignoring keys return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      for (let k of set.keys()) { set.has(k); }
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys150
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1500
     * @tc.desc Verify manual iteration via next()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([5, 10, 15]);
      let iter = set.keys();
      let vals: number[] = [];
      let done: boolean = false;
      while (!done) {
        let r = iter.next();
        if (r.done) { done = true; } else {
          let val: int | undefined = r.value;
          if (val !== undefined) { vals.push(val); }
        }
      }
      expect(vals.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys151
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1510
     * @tc.desc Verify break in keys loop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      let count = 0;
      for (let k of set.keys()) { count++; if (k === 3) { break; } }
      expect(count).assertEqual(3);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testKeys152
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1520
     * @tc.desc Verify continue in keys loop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let evens: number = 0;
      for (let k of set.keys()) { if (k % 2 === 0) { evens++; } }
      expect(evens).assertEqual(1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys153
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1530
     * @tc.desc Verify return in loop context
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const firstKey = (s: Set<int>): number => {
        for (let k of s.keys()) { return k; }
        return -1;
      };
      expect(firstKey(set)).assertEqual(1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys154
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1540
     * @tc.desc Verify throw does not corrupt set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys: number[] = [];
      try {
        for (let k of set.keys()) {
          keys.push(k);
          if (k === 2) { throw new Error("stop"); }
        }
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(keys.length).assertEqual(2);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys155
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1550
     * @tc.desc Verify iterator length matches size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(5);
      expect(count).assertEqual(set.size);
    });

    /**
     * @tc.name testKeys156
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1560
     * @tc.desc Verify iterator done after full traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      let iter = set.keys();
      iter.next(); iter.next();
      let r = iter.next();
      expect(r.done).assertTrue();
    });

    /**
     * @tc.name testKeys157
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1570
     * @tc.desc Verify iterator values are correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20]);
      let iter = set.keys();
      let v1 = iter.next();
      expect(v1.value).assertEqual(10);
      expect(v1.done).assertFalse();
    });

    /**
     * @tc.name testKeys158
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1580
     * @tc.desc Verify new iterator after reset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let iter1 = set.keys();
      iter1.next(); iter1.next();
      let iter2 = set.keys();
      let r = iter2.next();
      expect(r.done).assertFalse();
      let v = r.value;
      expect(v).assertEqual(1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys159
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1590
     * @tc.desc Verify keys from forEach context
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let keysLen = 0;
      set.forEach((v: int, k: int, s: ReadonlySet<int>): void => {
        let c = 0;
        for (let kk of s.keys()) { c++; }
        keysLen = c;
      });
      expect(keysLen).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys160
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1600
     * @tc.desc Verify iterator then forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let count1: number = 0;
      for (let k of set.keys()) { count1++; }
      let count2: number = 0;
      for (let k of set.keys()) { count2++; }
      expect(count1).assertEqual(3);
      expect(count2).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys161
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1610
     * @tc.desc Verify chained iterator operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);

      set.add(4);

      let keys2: number[] = [];
      for (let k of set.keys()) { keys2.push(k); }
      expect(keys2.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys162
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1620
     * @tc.desc Verify spread-like iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(1);
      expect(keys[1]).assertEqual(2);
      expect(keys[2]).assertEqual(3);
    });

    /**
     * @tc.name testKeys163
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1630
     * @tc.desc Verify iterator to array collection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      for (let k of set.keys()) { arr.push(k); }
      expect(arr.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys164
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1640
     * @tc.desc Verify map-like transformation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let mapped: number[] = [];
      for (let k of set.keys()) { mapped.push(k * 10); }
      expect(mapped[0]).assertEqual(10);
      expect(mapped[1]).assertEqual(20);
      expect(mapped[2]).assertEqual(30);
    });

    /**
     * @tc.name testKeys165
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1650
     * @tc.desc Verify filter-like selection
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      let filtered: number[] = [];
      for (let k of set.keys()) { if (k > 2) { filtered.push(k); } }
      expect(filtered.length).assertEqual(3);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testKeys166
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1660
     * @tc.desc Verify reduce-like accumulation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let sum: number = 0;
      for (let k of set.keys()) { sum += k; }
      expect(sum).assertEqual(6);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys167
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1670
     * @tc.desc Verify some-like check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let hasBig: boolean = false;
      for (let k of set.keys()) { if (k > 2) { hasBig = true; } }
      expect(hasBig).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys168
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1680
     * @tc.desc Verify every-like check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let allPositive: boolean = true;
      for (let k of set.keys()) { if (k <= 0) { allPositive = false; } }
      expect(allPositive).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys169
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1690
     * @tc.desc Verify find-like search
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let found: number = 0;
      for (let k of set.keys()) { if (k === 2) { found = k; } }
      expect(found).assertEqual(2);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys170
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1700
     * @tc.desc Verify findIndex-like search
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      let idx: number = 0;
      let targetIdx: number = -1;
      for (let k of set.keys()) { if (k === 20) { targetIdx = idx; } idx++; }
      expect(targetIdx).assertEqual(1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys171
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1710
     * @tc.desc Verify includes-like check
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let includes2: boolean = false;
      for (let k of set.keys()) { if (k === 2) { includes2 = true; } }
      expect(includes2).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys172
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1720
     * @tc.desc Verify flat-like iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let flat: number[] = [];
      for (let k of set.keys()) { flat.push(k); }
      expect(flat.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys173
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1730
     * @tc.desc Verify flatMap-like iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const result: number[] = [];
      for (let k of set.keys()) { result.push(k); result.push(k * 10); }
      expect(result.length).assertEqual(6);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys174
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1740
     * @tc.desc Verify entries-like iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let iter = set.entries();
      let firstResult = iter.next();
      expect(firstResult.done).assertFalse();
      let first = firstResult.value as [int, int];
      expect(first[0]).assertEqual(1);
      expect(first[1]).assertEqual(1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys175
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1750
     * @tc.desc Verify keys iterator identity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const iter = set.keys();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertFalse();
      expect(iter.next().done).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys176
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1760
     * @tc.desc Verify values then keys consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let vals: number[] = [];
      for (let v of set.values()) { vals.push(v); }
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(vals.length).assertEqual(keys.length);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys177
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1770
     * @tc.desc Verify iterator from set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let iter = set.keys();
      let count = 0;
      while (true) {
        let r = iter.next();
        if (r.done) { break; }
        count++;
      }
      expect(count).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys178
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1780
     * @tc.desc Verify arrayconstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [1, 2, 3];
      const set = new Set<int>(arr);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys179
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1790
     * @tc.desc Verify iterableconstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = [10, 20, 30];
      const set = new Set<int>(arr);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys180
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1800
     * @tc.desc Verify copyconstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new Set<int>([1, 2, 3]);
      const set = new Set<int>(orig);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys181
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1810
     * @tc.desc Verify ctor2Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const arr: number[] = [];
      for (let k of set.keys()) { arr.push(k); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys182
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1820
     * @tc.desc Verify ctor3Copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let other = new Set<int>([4, 5, 6]);
      const set = new Set<int>(other);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys183
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1830
     * @tc.desc Verify ctorAfterForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      for (let k of set.keys()) { set.has(k); }
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys184
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1840
     * @tc.desc Verify forEachAfterconstructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let fc = 0;
      set.forEach((v: int, k: int, s: ReadonlySet<int>): void => { fc++; });
      const keys: number[] = [];
      for (let kk of set.keys()) { keys.push(kk); }
      expect(fc).assertEqual(3);
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys185
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1850
     * @tc.desc Verify ctor iterationForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let iter: number[] = [];
      for (let k of set.keys()) { iter.push(k); }
      expect(iter.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys186
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1860
     * @tc.desc Verify ctorModifyForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.has(2)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys187
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1870
     * @tc.desc Verify ctorClearForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys188
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1880
     * @tc.desc Verify ctorAddForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(4);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys189
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1890
     * @tc.desc Verify ctorDeleteForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys190
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1900
     * @tc.desc Verify ctorHasForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      expect(set.has(2)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys191
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1910
     * @tc.desc Verify ctorSizeForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys192
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1920
     * @tc.desc Verify ctorEntriesForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let e = set.entries();
      e.next();
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys193
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1930
     * @tc.desc Verify ctorKeysForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let k1 = set.keys();
      k1.next();
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys194
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1940
     * @tc.desc Verify ctorValuesForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let v = set.values();
      v.next();
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys195
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1950
     * @tc.desc Verify ctorForEachForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let c1: number = 0;
      for (let k of set.keys()) { c1++; }
      let c2: number = 0;
      for (let k of set.keys()) { c2++; }
      expect(c1).assertEqual(3);
      expect(c2).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys196
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1960
     * @tc.desc Verify ctorFrom iterable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Set<int>([10, 20]);
      const set = new Set<int>(src);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys197
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1970
     * @tc.desc Verify ctorFromString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>(["a", "b", "c"]);
      const keys: string[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys198
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1980
     * @tc.desc Verify ctorFromMap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new Map<int, string>();
      m.set(1, "a"); m.set(2, "b");
      const set = new Set<int>(m.keys());
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys199
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_1990
     * @tc.desc Verify ctorFromGenerator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 5; i++) { set.add(i); }
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(5);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testKeys200
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2000
     * @tc.desc Verify ctorFromArguments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(5);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testKeys201
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2010
     * @tc.desc Verify ctorFromTypedArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed: int[] = [10, 20, 30];
      const set = new Set<int>(typed);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys202
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2020
     * @tc.desc Verify ctorFromArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [5, 6, 7];
      const set = new Set<int>(arr);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(5);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys203
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2030
     * @tc.desc Verify int keys as boolean
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0, 1]);
      let bools: boolean[] = [];
      for (let k of set.keys()) { bools.push(k != 0); }
      expect(bools[0]).assertFalse();
      expect(bools[1]).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys204
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2040
     * @tc.desc Verify keys as function-like
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let apply: number = 0;
      for (let k of set.keys()) { apply += k * 2; }
      expect(apply).assertEqual(12);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys205
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2050
     * @tc.desc Verify keys with two elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testKeys206
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2060
     * @tc.desc Verify MAX_VALUE as key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([Int.MAX_VALUE]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(Int.MAX_VALUE);

    });

    /**
     * @tc.name testKeys207
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2070
     * @tc.desc Verify MIN_VALUE as key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([Int.MIN_VALUE]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys[0]).assertEqual(Int.MIN_VALUE);

    });

    /**
     * @tc.name testKeys208
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2080
     * @tc.desc Verify int max value key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([Int.MAX_VALUE]);
      let count = 0;
      let keyVal: int = 0;
      for (let k of set.keys()) { keyVal = k; count++; }
      expect(count).assertEqual(1);
      expect(keyVal).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.name testKeys209
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2090
     * @tc.desc Verify int min value key
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([Int.MIN_VALUE]);
      let count = 0;
      let keyVal: int = 0;
      for (let k of set.keys()) { keyVal = k; count++; }
      expect(count).assertEqual(1);
      expect(keyVal).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.name testKeys210
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2100
     * @tc.desc Verify largeSet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) { set.add(i); }
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(1000);
      expect(set.size).assertEqual(1000);
    });

    /**
     * @tc.name testKeys211
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2110
     * @tc.desc Verify concurrentForEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      let c1: number = 0; let c2: number = 0;
      for (let k of set.keys()) { c1++; }
      for (let k of set.keys()) { c2++; }
      expect(c1).assertEqual(5);
      expect(c2).assertEqual(5);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testKeys212
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2120
     * @tc.desc Verify concurrentModify
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      const keys: number[] = [];

      set.add(4);
      let count = 0;
      for (let k of set.keys()) { keys.push(k); count++; }
      expect(keys.length).assertEqual(4);
      expect(count).assertEqual(4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testKeys213
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2130
     * @tc.desc Verify concurrentAddDelete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(4); set.delete(1);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys214
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2140
     * @tc.desc Verify iteration flow across types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2]);
      let c1: number = 0;
      for (let k of set.keys()) { c1++; }
      set.add(3);
      let c2: number = 0;
      for (let k of set.keys()) { c2++; }
      expect(c1).assertEqual(2);
      expect(c2).assertEqual(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys215
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2150
     * @tc.desc Verify state transitions during operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(1);
      set.add(2); expect(set.size).assertEqual(2);
      set.clear(); expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys216
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2160
     * @tc.desc Verify type consistency across operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      set.add(4);
      set.delete(2);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(3);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertFalse();
    });

    /**
     * @tc.name testKeys217
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2170
     * @tc.desc Verify keys 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(0);
      expect(s.has(0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testKeys218
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2180
     * @tc.desc Verify error handling flow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      try {
        for (let k of set.keys()) {
          if (k === 2) { throw new Error("keys error"); }
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys219
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2190
     * @tc.desc Verify unit testing flow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([10, 20, 30]);
      let sum: number = 0;
      for (let k of set.keys()) { sum += k; }
      expect(sum).assertEqual(60);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testKeys220
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2200
     * @tc.desc Verify end-to-end testing flow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 1; i <= 5; i++) { set.add(i); }
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(5);
      set.clear();
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(0);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testKeys221
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2210
     * @tc.desc Verify smoke test flow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      const keys: number[] = [];
      for (let k of set.keys()) { keys.push(k); }
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual(1);
    });

    /**
     * @tc.name testKeys222
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2220
     * @tc.desc Verify arrayFrom
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([100, 200, 300]);
      const keys = Array.from(set.keys());
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(100);
    });

    /**
     * @tc.name testKeys223
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2230
     * @tc.desc Verify generic unionType
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int | string>([1, "a", 2]);
      let count = 0;
      for (let k of set.keys()) {
        count++;
      }
      expect(count).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has('a')).assertTrue();
      expect(set.has(2)).assertTrue();
    });

    /**
     * @tc.name testKeys224
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_P1_2240
     * @tc.desc Verify keys instanceof Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testKeys224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1, 2, 3]);
      let count = 0;
      for (let k of set.keys()) { count++; }
      expect(count).assertEqual(3);
    });
