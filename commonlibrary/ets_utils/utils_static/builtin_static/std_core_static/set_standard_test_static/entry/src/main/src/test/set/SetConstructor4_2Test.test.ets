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

export default function SetConstructor4_2Test(): void {
  describe('SetConstructor4Part1Test', (): void => {
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
     * @tc.name testConstructor4_001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0010
     * @tc.desc Verify constructing Set<byte> with bucket count 1 and byte value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(1);
      set.add(0);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0020
     * @tc.desc Verify constructing Set<byte> with bucket count 1 and byte value 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(1);
      set.add(127);
      expect(set.has(127)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0030
     * @tc.desc Verify constructing Set<byte> with bucket count 1 and byte value 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(1);
      set.add(-1 as byte);
      expect(set.has(-1 as byte)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0040
     * @tc.desc Verify constructing Set<byte> with bucket count 1 and hex value 0x0A
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(1);
      set.add(0x0A);
      expect(set.has(0x0A)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0050
     * @tc.desc Verify constructing Set<byte> with bucket count 1 and octal value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(1);
      set.add(0o77);
      expect(set.has(0o77)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0060
     * @tc.desc Verify constructing Set<short> with bucket count 1 and short value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(1);
      set.add(0);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0070
     * @tc.desc Verify constructing Set<short> with bucket count 1 and short value 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(1);
      set.add(32767);
      expect(set.has(32767)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0080
     * @tc.desc Verify constructing Set<short> with bucket count 1 and short value -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(1);
      set.add(-32768);
      expect(set.has(-32768)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0090
     * @tc.desc Verify constructing Set<short> with bucket count 1 and hex value 0x7FFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(1);
      set.add(0x7FFF);
      expect(set.has(0x7FFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0100
     * @tc.desc Verify constructing Set<short> with bucket count 16 and short value 256
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(16);
      set.add(256);
      expect(set.has(256)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0110
     * @tc.desc Verify constructing Set<int> with bucket count 1 and int value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(0);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0120
     * @tc.desc Verify constructing Set<int> with bucket count 1 and int value 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(1);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0130
     * @tc.desc Verify constructing Set<int> with bucket count 1 and int value -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(-1);
      expect(set.has(-1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0140
     * @tc.desc Verify constructing Set<int> with bucket count 1 and int value 2147483647
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      const maxInt: int = 2147483647;
      set.add(maxInt);
      expect(set.has(maxInt)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0150
     * @tc.desc Verify constructing Set<int> with bucket count 1 and int value Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(Int.MIN_VALUE);
      expect(set.has(Int.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0160
     * @tc.desc Verify constructing Set<int> with bucket count 1 and hex value 0xFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(0xFF);
      expect(set.has(0xFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0170
     * @tc.desc Verify constructing Set<int> with bucket count 1 and hex value 0x7FFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(0x7FFF);
      expect(set.has(0x7FFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0180
     * @tc.desc Verify constructing Set<int> with bucket count 1 and hex value 0x7FFFFFFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(0x7FFFFFFF);
      expect(set.has(0x7FFFFFFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0190
     * @tc.desc Verify constructing Set<int> with bucket count 1 and octal value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(0o77777);
      expect(set.has(0o77777)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0200
     * @tc.desc Verify constructing Set<int> with bucket count 1 and binary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(1);
      set.add(0b10101010);
      expect(set.has(0b10101010)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0210
     * @tc.desc Verify constructing Set<int> with bucket count 32 and int value 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(100);
      expect(set.has(100)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0220
     * @tc.desc Verify constructing Set<int> with bucket count 32 and int value 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1000);
      expect(set.has(1000)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0230
     * @tc.desc Verify constructing Set<int> with bucket count 32 and int value 65536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(65536);
      expect(set.has(65536)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0240
     * @tc.desc Verify constructing Set<long> with bucket count 1 and long value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(1);
      set.add(0);
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0250
     * @tc.desc Verify constructing Set<long> with bucket count 1 and long value 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(1);
      const v: long = 1;
      set.add(v);
      expect(set.has(v)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0260
     * @tc.desc Verify constructing Set<long> with bucket count 1 and long value -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(1);
      const v: long = -1;
      set.add(v);
      expect(set.has(v)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0270
     * @tc.desc Verify constructing Set<long> with bucket count 1 and large hex value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(1);
      set.add(0x1FFFFFFFF);
      expect(set.has(0x1FFFFFFFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0280
     * @tc.desc Verify constructing Set<long> with bucket count 1 and large binary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(1);
      set.add(0b11111111111111111111111111111111);
      expect(set.has(0b11111111111111111111111111111111)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0290
     * @tc.desc Verify constructing Set<long> with bucket count 16 and long value 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(16);
      const v: long = 100;
      set.add(v);
      expect(set.has(v)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0300
     * @tc.desc Verify constructing Set<double> with bucket count 1 and float value 0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(1);
      set.add(0.0);
      expect(set.has(0.0)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0310
     * @tc.desc Verify constructing Set<double> with bucket count 1 and float value 1.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(1);
      set.add(1.5);
      expect(set.has(1.5)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0320
     * @tc.desc Verify constructing Set<double> with bucket count 1 and float value -1.5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(1);
      set.add(-1.5);
      expect(set.has(-1.5)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0330
     * @tc.desc Verify constructing Set<double> with bucket count 1 and min positive float value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(1);
      set.add(1.4e-45);
      expect(set.has(1.4e-45)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0340
     * @tc.desc Verify constructing Set<double> with bucket count and precision arithmetic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      const computed: number = 0.1 + 0.2;
      set.add(computed);
      expect(set.has(computed)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0350
     * @tc.desc Verify constructing Set<string> with bucket count 1 and string value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(1);
      set.add("hello");
      expect(set.has("hello")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0360
     * @tc.desc Verify constructing Set<string> with bucket count 1 and empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(1);
      set.add("");
      expect(set.has("")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0370
     * @tc.desc Verify constructing Set<string> with bucket count 1 and long string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(1);
      set.add("abcdefghijklmnopqrstuvwxyz");
      expect(set.has("abcdefghijklmnopqrstuvwxyz")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0380
     * @tc.desc Verify constructing Set<string> with bucket count 32 and multiple strings
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(32);
      set.add("a");
      set.add("b");
      set.add("c");
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0390
     * @tc.desc Verify constructing Set<boolean> with bucket count 1 and true value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>(1);
      set.add(true);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0400
     * @tc.desc Verify constructing Set<boolean> with bucket count 1 and false value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>(1);
      set.add(false);
      expect(set.has(false)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0410
     * @tc.desc Verify Set<boolean> with bucket count, add true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>(2);
      set.add(true);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0420
     * @tc.desc Verify Set<boolean> with bucket count, add false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>(2);
      set.add(false);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0430
     * @tc.desc Verify constructing Set with zero bucket count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(0);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0440
     * @tc.desc Verify constructing Set with large bucket count 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(10000);
      for (let i: int = 0; i < 100; i++) {
        set.add("item" + i.toString());
      }
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testConstructor4_045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0450
     * @tc.desc Verify constructing Set with negative bucket count -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(-1);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0460
     * @tc.desc Verify constructing Set with Int.MIN_VALUE bucket count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(Int.MIN_VALUE);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0470
     * @tc.desc Verify constructing Set with hex bucket count 0x10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(0x10);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0480
     * @tc.desc Verify constructing Set with octal bucket count 0o10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(0o10);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0490
     * @tc.desc Verify constructing Set with binary bucket count 0b1010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(0b1010);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0500
     * @tc.desc Verify constructing Set<double> with Double.NaN after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<double>(16);
      s.add(Double.NaN);
      expect(s.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0510
     * @tc.desc Verify Set<double> deduplicates Double.NaN (SameValueZero semantics)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<double>(16);
      s.add(Double.NaN);
      s.add(Double.NaN);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0520
     * @tc.desc Verify Set<double> with -Double.NaN after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<double>(16);
      s.add(-Double.NaN);
      expect(s.has(-Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0530
     * @tc.desc Verify constructing Set<double> with positive infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<double>(16);
      s.add(Double.POSITIVE_INFINITY);
      expect(s.has(Double.POSITIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0540
     * @tc.desc Verify constructing Set<double> with negative infinity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<double>(16);
      s.add(Double.NEGATIVE_INFINITY);
      expect(s.has(Double.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0550
     * @tc.desc Verify constructing Set with all double special values together
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Set<double>(32);
      s.add(Double.NaN);
      s.add(Double.POSITIVE_INFINITY);
      s.add(Double.NEGATIVE_INFINITY);
      expect(s.size).assertEqual(3);
      expect(s.has(Double.NaN)).assertTrue();
      expect(s.has(Double.POSITIVE_INFINITY)).assertTrue();
      expect(s.has(Double.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0560
     * @tc.desc Verify larger bucket count Set performs normally with 1000 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>(1024);
      for (let i: int = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(1000);
      expect(set.has(0)).assertTrue();
      expect(set.has(999)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0570
     * @tc.desc Verify constructor with number generic type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>(32);
      set.add(1);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0580
     * @tc.desc Verify constructing Set<ObjTest> with bucket count and Object element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>(16);
      const obj = new ObjTest(1);
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0590
     * @tc.desc Verify Set with bucket count deduplicates repeated int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      set.add(42);
      set.add(42);
      set.add(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0600
     * @tc.desc Verify Set with bucket count deduplicates repeated string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add("dup");
      set.add("dup");
      set.add("dup");
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0610
     * @tc.desc Verify Set with bucket count handles single element addition
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      set.add(1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0620
     * @tc.desc Verify Set<byte> with bucket count handles byte boundary values 0, 127, 128, 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(16);
      set.add(0);
      set.add(127);
      set.add(-128 as byte);
      set.add(-1 as byte);
      expect(set.size).assertEqual(4);
      expect(set.has(127)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0630
     * @tc.desc Verify Set<byte> with bucket count handles negative byte values -128 to -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(32);
      for (let i: int = -128; i < 0; i++) {
        set.add(Int.toByte(i));
      }
      expect(set.size).assertEqual(128);
      expect(set.has(-1)).assertTrue();
      expect(set.has(-128 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0640
     * @tc.desc Verify Set<byte> with bucket count handles positive byte values 1 to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(64);
      for (let i: int = 1; i <= 127; i++) {
        set.add(Int.toByte(i));
      }
      expect(set.size).assertEqual(127);
      expect(set.has(1)).assertTrue();
      expect(set.has(127)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0650
     * @tc.desc Verify Set<short> with bucket count handles full short range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(128);
      set.add(-32768);
      set.add(32767);
      set.add(0);
      set.add(1);
      set.add(-1);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testConstructor4_066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0660
     * @tc.desc Verify Set<short> with bucket count handles various short values; 0x7FFF and 0b111111111111111 both truncate to same short value 32767 resulting in size 4 not 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(32);
      set.add(0x7FFF);
      set.add(-1 as short);
      set.add(0b111111111111111);
      set.add(256);
      set.add(-256);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testConstructor4_067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0670
     * @tc.desc Verify Set<int> with bucket count handles powers of two
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1);
      set.add(2);
      set.add(4);
      set.add(8);
      set.add(16);
      set.add(32);
      set.add(64);
      set.add(128);
      set.add(256);
      set.add(512);
      set.add(1024);
      expect(set.size).assertEqual(11);
    });

    /**
     * @tc.name testConstructor4_068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0680
     * @tc.desc Verify Set<int> with bucket count handles negative int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      for (let i: int = -100; i < 0; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(100);
      expect(set.has(-1)).assertTrue();
      expect(set.has(-100)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0690
     * @tc.desc Verify Set<int> with bucket count handles positive int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(64);
      for (let i: int = 1; i <= 100; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(100);
      expect(set.has(1)).assertTrue();
      expect(set.has(100)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0700
     * @tc.desc Verify Set<long> with bucket count handles positive long values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(16);
      set.add(0);
      set.add(1);
      set.add(100);
      set.add(10000000000);
      set.add(9999999999999);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name testConstructor4_071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0710
     * @tc.desc Verify Set<long> with bucket count handles negative long values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(16);
      const v1: long = -1;
      const v2: long = -100;
      const v3: long = -10000000000;
      const v4: long = -9999999999999;
      set.add(v1);
      set.add(v2);
      set.add(v3);
      set.add(v4);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testConstructor4_072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0720
     * @tc.desc Verify Set<double> with bucket count handles precision values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(3.14159);
      set.add(2.71828);
      set.add(1.41421);
      expect(set.size).assertEqual(3);
      expect(set.has(3.14159)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0730
     * @tc.desc Verify Set<double> with bucket count, Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(Number.MIN_VALUE);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0740
     * @tc.desc Verify Set<double> with bucket count, Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(Number.MAX_VALUE);
      expect(set.has(Number.MAX_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0750
     * @tc.desc Verify Set<double> with bucket count, -Number.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(-Number.MIN_VALUE);
      expect(set.has(-Number.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0760
     * @tc.desc Verify Set<double> with bucket count, -Number.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(-Number.MAX_VALUE);
      expect(set.has(-Number.MAX_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0770
     * @tc.desc Verify Set<double> with bucket count handles float point arithmetic for epsilon
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(1.0 / 3.0);
      set.add(1.0 / 7.0);
      set.add(1.0 / 9.0);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0780
     * @tc.desc Verify Set<double> with bucket count handles very small double values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(1.0e-10);
      set.add(1.0e-50);
      set.add(1.0e-100);
      set.add(1.0e-200);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testConstructor4_079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0790
     * @tc.desc Verify Set<double> with bucket count handles very large double values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(32);
      set.add(1.0e+10);
      set.add(1.0e+50);
      set.add(1.0e+100);
      set.add(1.0e+200);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testConstructor4_080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0800
     * @tc.desc Verify Set<string> with bucket count handles string with special characters
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add("hello world");
      set.add("line1\nline2");
      set.add("tab\tseparated");
      set.add("unicode: éàü");
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testConstructor4_081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0810
     * @tc.desc Verify Set<string> with bucket count handles unicode string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(32);
      set.add("中文测试");
      set.add("日本語");
      set.add("한국어");
      set.add("αβγδε");
      expect(set.size).assertEqual(4);
      expect(set.has("中文测试")).assertTrue();
    });

    /**
     * @tc.name testConstructor4_082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0820
     * @tc.desc Verify Set<string> with bucket count handles numeric string values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add("123");
      set.add("3.14159");
      set.add("-100");
      set.add("0xFF");
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testConstructor4_083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0830
     * @tc.desc Verify Set<int | string> with bucket count handles mixed type values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int | string> = new Set<int | string>(16);
      set.add(1);
      set.add("hello");
      set.add(42);
      set.add("world");
      expect(set.size).assertEqual(4);
      expect(set.has(1)).assertTrue();
      expect(set.has("hello")).assertTrue();
    });

    /**
     * @tc.name testConstructor4_084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0840
     * @tc.desc Verify Set<int> with bucket count handles int elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      set.add(1);
      set.add(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor4_085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0850
     * @tc.desc Verify Set<ObjTest> with bucket count handles multiple Object elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>(16);
      const o1 = new ObjTest(1);
      const o2 = new ObjTest(1);
      const o3 = new ObjTest(1);
      set.add(o1);
      set.add(o2);
      set.add(o3);
      expect(set.size).assertEqual(3);
      expect(set.has(o1)).assertTrue();
      expect(set.has(o2)).assertTrue();
      expect(set.has(o3)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0860
     * @tc.desc Verify Set<ObjTest> with bucket count deduplicates same Object reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>(16);
      const obj = new ObjTest(1);
      set.add(obj);
      set.add(obj);
      set.add(obj);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0870
     * @tc.desc Verify Set<ObjTest> with bucket count treats different references as distinct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>(32);
      set.add(new ObjTest(1));
      set.add(new ObjTest(1));
      set.add(new ObjTest(1));
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0880
     * @tc.desc Verify Set<int> with bucket count returns correct has values after clear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1);
      set.add(2);
      set.add(3);
      set.clear();
      expect(set.has(1)).assertFalse();
      expect(set.has(2)).assertFalse();
      expect(set.has(3)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor4_089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0890
     * @tc.desc Verify Set<int> with bucket count supports delete then add operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1);
      set.add(2);
      set.delete(1);
      expect(set.size).assertEqual(1);
      set.add(3);
      expect(set.size).assertEqual(2);
      expect(set.has(3)).assertTrue();
      expect(set.has(1)).assertFalse();
    });

    /**
     * @tc.name testConstructor4_090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0900
     * @tc.desc Verify Set<int> with bucket count supports forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(10);
      set.add(20);
      set.add(30);
      const result: number[] = [];
      set.forEach((value: int, key: int): void => {
        result.push(value);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name testConstructor4_091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0910
     * @tc.desc Verify Set<int> with bucket count supports values() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1);
      set.add(2);
      set.add(3);
      const result: number[] = [];
      for (const v of set.values()) {
        result.push(v);
      }
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0920
     * @tc.desc Verify Set<int> with bucket count supports keys() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(10);
      set.add(20);
      set.add(30);
      const keys: number[] = [];
      for (const k of set.keys()) {
        keys.push(k);
      }
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0930
     * @tc.desc Verify Set<int> with bucket count supports entries() iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1);
      set.add(2);
      const entries: int[] = [];
      for (const e of set.entries()) {
        expect(e[0]).assertEqual(e[1]);
        entries.push(e[0]);
      }
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name testConstructor4_094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0940
     * @tc.desc Verify Set<int> with bucket count supports spread operator
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      set.add(1);
      set.add(2);
      set.add(3);
      const arr: number[] = [];
      for (const v of set) { arr.push(v); }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0950
     * @tc.desc Verify Set<int> with bucket count size property after mixed operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(1);
      expect(set.size).assertEqual(1);
      set.add(2);
      expect(set.size).assertEqual(2);
      set.add(1);
      expect(set.size).assertEqual(2);
      set.delete(2);
      expect(set.size).assertEqual(1);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testConstructor4_096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0960
     * @tc.desc Verify different bucket counts produce consistent Set behavior across types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1: Set<int> = new Set<int>(1);
      const set2: Set<int> = new Set<int>(32);
      const set3: Set<int> = new Set<int>(1024);
      set1.add(42);
      set2.add(42);
      set3.add(42);
      expect(set1.has(42)).assertTrue();
      expect(set2.has(42)).assertTrue();
      expect(set3.has(42)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0970
     * @tc.desc Verify default constructor and explicit bucket count constructor produce equivalent behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const defaultSet: Set<int> = new Set<int>();
      const bucketSet: Set<int> = new Set<int>(16);
      for (let i: int = 0; i < 10; i++) {
        defaultSet.add(i);
        bucketSet.add(i);
      }
      expect(defaultSet.size).assertEqual(bucketSet.size);
      expect(defaultSet.has(0)).assertTrue();
      expect(bucketSet.has(0)).assertTrue();
      expect(defaultSet.has(9)).assertTrue();
      expect(bucketSet.has(9)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0980
     * @tc.desc Verify Set<byte> with bucket count handles hex byte values 0x0 to 0xFF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(16);
      set.add(0x0);
      set.add(0xA);
      set.add(0x1A);
      set.add(0x7F);
      set.add(-1 as byte);
      expect(set.size).assertEqual(5);
      expect(set.has(-1 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_0990
     * @tc.desc Verify Set<byte> with bucket count handles octal byte values 0 to 0377
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(16);
      set.add(0o0);
      set.add(0o7);
      set.add(0o77);
      set.add(0o177);
      set.add(-1 as byte);
      expect(set.size).assertEqual(5);
      expect(set.has(-1 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1000
     * @tc.desc Verify Set<byte> with bucket count handles binary byte values 0 to 11111111
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(16);
      set.add(0b0);
      set.add(0b1);
      set.add(0b1010);
      set.add(0b1111111);
      set.add(-1 as byte);
      expect(set.size).assertEqual(5);
      expect(set.has(-1 as byte)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_101
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1010
     * @tc.desc Verify Set<short> with bucket count handles hex short values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(16);
      set.add(0x0);
      set.add(0x7FFF);
      set.add(-32768 as short);
      set.add(-1 as short);
      expect(set.size).assertEqual(4);
      expect(set.has(-1 as short)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_102
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1020
     * @tc.desc Verify Set<long> with bucket count handles 32-bit hex boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(16);
      set.add(0x0);
      set.add(0x7FFFFFFF);
      set.add(0x80000000);
      set.add(0xFFFFFFFF);
      expect(set.size).assertEqual(4);
      expect(set.has(0x7FFFFFFF)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_103
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1030
     * @tc.desc Verify Set<int> with bucket count handles octal int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      set.add(0o0);
      set.add(0o777);
      set.add(0o77777);
      set.add(0o777777777);
      expect(set.size).assertEqual(4);
      expect(set.has(0o777777777)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_104
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1040
     * @tc.desc Verify Set<int> with bucket count handles binary int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(16);
      set.add(0b0);
      set.add(0b1);
      set.add(0b1010101010101010);
      set.add(0b1111111111111111111111111111111);
      expect(set.size).assertEqual(4);
      expect(set.has(0b1111111111111111111111111111111)).assertTrue();
    });

    /**
     * @tc.name testConstructor4_105
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1050
     * @tc.desc Verify Set<long> with bucket count handles hex long boundary values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(32);
      const v0: long = 0;
      set.add(v0);
      set.add(0x7FFFFFFFFFFFFFFF);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor4_106
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1060
     * @tc.desc Verify Set<long> with bucket count handles octal long large values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(16);
      const v0: long = 0;
      const v1: long = 1;
      set.add(0o777777777777777777777);
      set.add(v0);
      set.add(v1);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_107
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1070
     * @tc.desc Verify Set<long> with bucket count handles binary long large values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>(16);
      const v0: long = 0;
      const v1: long = 1;
      set.add(v0);
      set.add(v1);
      set.add(0b111111111111111111111111111111111111111111111111111111111111111);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testConstructor4_108
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1080
     * @tc.desc Verify generic Set<byte> with explicit bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>(8);
      set.add(1);
      set.add(2);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testConstructor4_109
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1090
     * @tc.desc Verify generic Set<short> with explicit bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>(16);
      set.add(100);
      expect(set.has(100)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_110
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1100
     * @tc.desc Verify generic Set<int> with explicit bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>(32);
      set.add(42);
      expect(set.has(42)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_111
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1110
     * @tc.desc Verify generic Set<double> with float bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(16);
      set.add(1.5);
      expect(set.has(1.5)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_112
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1120
     * @tc.desc Verify generic Set<double> with double bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>(32);
      set.add(3.14);
      expect(set.has(3.14)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_113
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1130
     * @tc.desc Verify generic Set<string> with explicit bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add("test");
      expect(set.has("test")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_114
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1140
     * @tc.desc Verify generic Set<boolean> with explicit bucket count parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>(2);
      set.add(true);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_115
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1150
     * @tc.desc Verify Set<string> with bucket count handles char element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add('a');
      expect(set.has('a')).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testConstructor4_116
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1160
     * @tc.desc Verify Set<string> with bucket count handles multiple char elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add('a');
      set.add('b');
      set.add('c');
      expect(set.size).assertEqual(3);
      expect(set.has('b')).assertTrue();
    });

    /**
     * @tc.name testConstructor4_117
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1170
     * @tc.desc Verify Set<string> with bucket count handles unicode char values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add('A');
      set.add('é');
      expect(set.size).assertEqual(2);
      expect(set.has('A')).assertTrue();
    });

    /**
     * @tc.name testConstructor4_118
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_CONSTRUCTOR4_P1_1180
     * @tc.desc Verify Set<string> with bucket count deduplicates char values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConstructor4_118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(16);
      set.add('x');
      set.add('x');
      expect(set.size).assertEqual(1);
    });
