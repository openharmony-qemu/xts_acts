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

export default function SetSize_2Test(): void {
  describe('SetSizePart1Test', (): void => {
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
     * @tc.name testSize001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0100
     * @tc.desc Verify size of Set<byte> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0200
     * @tc.desc Verify size after adding duplicates to Set<byte>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0300
     * @tc.desc Verify size of Set<short> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0400
     * @tc.desc Verify size after adding duplicates to Set<short>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0500
     * @tc.desc Verify size of Set<int> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0600
     * @tc.desc Verify size after adding duplicates to Set<int>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0700
     * @tc.desc Verify size of Set<long> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0800
     * @tc.desc Verify size after adding duplicates to Set<long>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([1, 1, 1]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_0900
     * @tc.desc Verify size of Set<double> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1000
     * @tc.desc Verify size after adding duplicates to Set<double>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.0, 1.0, 1.0]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1100
     * @tc.desc Verify size of Set<boolean> with one boolean element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([true]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1200
     * @tc.desc Verify size after adding duplicates to Set<boolean>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([true, true, true]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1300
     * @tc.desc Verify size of Set<string> with one string element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["a"]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1400
     * @tc.desc Verify size of Set<string> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["hello"]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1500
     * @tc.desc Verify size after adding duplicates to Set<string>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["hello", "hello", "hello"]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1600
     * @tc.desc Verify size of Set<string> with empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>([""]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1700
     * @tc.desc Verify size of Set<ObjTest> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>([new ObjTest(1)]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1800
     * @tc.desc Verify size of Set<number[]> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number[]> = new Set<number[]>([[1]]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_1900
     * @tc.desc Verify size of Set<number[]> with empty array element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number[]> = new Set<number[]>([[]]);
      expect(set.size).assertEqual(1);
      expect(set.has([])).assertFalse();
    });

    /**
     * @tc.name testSize020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2000
     * @tc.desc Verify size of Set<Function> with one element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<() => void> = new Set<() => void>([(): void => {}]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2100
     * @tc.desc Verify size after 3-element construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSize022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2200
     * @tc.desc Verify size changes from empty to full when adding elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(1);
      expect(set.size).assertEqual(1);
      set.add(2);
      expect(set.size).assertEqual(2);
      set.add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSize023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2300
     * @tc.desc Verify size changes from full to empty when removing elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSize024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2400
     * @tc.desc Verify size with hexadecimal int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0x0A, 0x0F, 0xFF]);
      expect(set.size).assertEqual(3);
      set.add(0x100);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSize025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2500
     * @tc.desc Verify size with octal int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0o10, 0o17, 0o77]);
      expect(set.size).assertEqual(3);
      set.add(0o100);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSize026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2600
     * @tc.desc Verify size with binary int values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0b1010, 0b1111, 0b10101010]);
      expect(set.size).assertEqual(3);
      set.add(0b10000);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSize027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2700
     * @tc.desc Verify size type checking with int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      set.add(4);
      expect(set.size).assertEqual(4);
      set.delete(2);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSize028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2800
     * @tc.desc Verify size with Array.from serialization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([10, 20, 30]);
      const arr = Array.from(set);
      expect(arr.length).assertEqual(set.size);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.name testSize029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_2900
     * @tc.desc Verify Set<int> size with two elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 3]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3000
     * @tc.desc Verify size property read to variable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      let size: number = set.size;
      expect(size).assertEqual(3);
    });

    /**
     * @tc.name testSize031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3100
     * @tc.desc Verify size reflects element count correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      set.delete(1);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3200
     * @tc.desc Verify size with large Set 1000 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      for (let i: int = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(1000);
    });

    /**
     * @tc.name testSize033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3300
     * @tc.desc Verify Set<byte> size with -128 as byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(-128 as byte);
      expect(s.has(-128 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3400
     * @tc.desc Verify Set<byte> size with 0 as byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(0 as byte);
      expect(s.has(0 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3500
     * @tc.desc Verify Set<byte> size with 127 as byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<byte> = new Set<byte>();
      s.add(127 as byte);
      expect(s.has(127 as byte)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3600
     * @tc.desc Verify Set<short> size with -32768 as short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(-32768 as short);
      expect(s.has(-32768 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3700
     * @tc.desc Verify Set<short> size with 0 as short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(0 as short);
      expect(s.has(0 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3800
     * @tc.desc Verify Set<short> size with 32767 as short
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<short> = new Set<short>();
      s.add(32767 as short);
      expect(s.has(32767 as short)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_3900
     * @tc.desc Verify size Int.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE);
      expect(s.has(Int.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4000
     * @tc.desc Verify size 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(0);
      expect(s.has(0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4100
     * @tc.desc Verify size Int.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE);
      expect(s.has(Int.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4200
     * @tc.desc Verify size Long.MIN_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<long> = new Set<long>();
      s.add(Long.MIN_VALUE);
      expect(s.has(Long.MIN_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4300
     * @tc.desc Verify size 0 as long
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<long> = new Set<long>();
      s.add(0 as long);
      expect(s.has(0 as long)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4400
     * @tc.desc Verify size Long.MAX_VALUE
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<long> = new Set<long>();
      s.add(Long.MAX_VALUE);
      expect(s.has(Long.MAX_VALUE)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4500
     * @tc.desc Verify size Int.MIN_VALUE + 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MIN_VALUE + 1);
      expect(s.has(Int.MIN_VALUE + 1)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4600
     * @tc.desc Verify size Int.MAX_VALUE - 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<int> = new Set<int>();
      s.add(Int.MAX_VALUE - 1);
      expect(s.has(Int.MAX_VALUE - 1)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSize047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4700
     * @tc.desc Verify size with byte off-by-one boundary values (MIN+1=-127, MAX-1=126)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([-127 as byte, 126 as byte]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4800
     * @tc.desc Verify size with short off-by-one boundary values (MIN+1=-32767, MAX-1=32766)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([-32767 as short, 32766 as short]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_4900
     * @tc.desc Verify Set<float> size after delete and clear lifecycle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      expect(set.size).assertEqual(0);
      set.add(1.5 as float);
      expect(set.size).assertEqual(1);
      set.add(1.5 as float);
      expect(set.size).assertEqual(1);
      set.delete(1.5 as float);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSize050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5000
     * @tc.desc Verify Set<char> size with distinct Unicode chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'a');
      set.add(c'中');
      set.add(c'0');
      expect(set.size).assertEqual(3);
      set.add(c'a');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSize051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5100
     * @tc.desc Verify Set<char> size starts at 0 and increments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      expect(set.size).assertEqual(0);
      set.add(c'Z');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5200
     * @tc.desc Verify Set<number> size with mixed int and float values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>();
      set.add(0);
      set.add(1.5);
      set.add(-3.14);
      set.add(Number.POSITIVE_INFINITY);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSize053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5300
     * @tc.desc Verify Set<number> size Number.NaN handling
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([Number.NaN, Number.NaN, 0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5400
     * @tc.desc Verify Set<string | number> size with union type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string | number> = new Set<string | number>(["hello", 42, "world", 3.14]);
      expect(set.size).assertEqual(4);
      set.add("hello");
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSize055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5500
     * @tc.desc Verify single-element Set size is 1 across all APIs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([3.14]);
      expect(set.size).assertEqual(1);
      expect(set.has(3.14)).assertTrue();
      set.delete(3.14);
      expect(set.size).assertEqual(0);
      set.add(3.14);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5600
     * @tc.desc Verify Set<Date> size: same ref dedup, different ref same value NOT dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d = new Date(2025, 0, 1);
      const set: Set<Date> = new Set<Date>([d, d]);
      expect(set.size).assertEqual(1);
      const set2: Set<Date> = new Set<Date>([new Date(2025, 0, 1), new Date(2025, 0, 1)]);
      expect(set2.size).assertEqual(2);
    });

    /**
     * @tc.name testSize057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5700
     * @tc.desc Verify Set<RegExp> size with ref-based dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r = new RegExp("test");
      const set: Set<RegExp> = new Set<RegExp>([r, r]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5800
     * @tc.desc Verify Set<Map> size with same-content different ref → size=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('k', 1);
      const m2 = new Map<string, number>();
      m2.set('k', 1);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m1, m2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_5900
     * @tc.desc Verify Set<Map> size with same-content different ref → size=2 (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('k', 1);
      const m2 = new Map<string, number>();
      m2.set('k', 1);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m1);
      set.add(m2);

      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6000
     * @tc.desc Verify Set<Set<int>> nested Set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>([inner, inner]);
      expect(outer.size).assertEqual(1);
    });

    /**
     * @tc.name testSize061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6100
     * @tc.desc Verify Set<Set<int>> nested Set size (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(inner);
      outer.add(inner);

      expect(outer.size).assertEqual(1);
    });

    /**
     * @tc.name testSize062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6200
     * @tc.desc Verify Set<Record> size with same-struct different refs → size=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'a': 1 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>([r1, r2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6300
     * @tc.desc Verify Set<Record> size with same-struct different refs → size=2 (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'a': 1 };
      const r2: Record<string, int> = { 'a': 1 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      set.add(r1);
      set.add(r2);

      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6400
     * @tc.desc Verify Set<Int8Array> size with ref-based dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Int8Array([1, 2]);
      const set: Set<Int8Array> = new Set<Int8Array>([a, a, new Int8Array([1, 2])]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6500
     * @tc.desc Verify Set<Int8Array> size with ref-based dedup (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Int8Array = new Int8Array([1, 2]);
      const set: Set<Int8Array> = new Set<Int8Array>();
      set.add(a);
      set.add(a);
      set.add(new Int8Array([1, 2]));
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6600
     * @tc.desc Verify Set<Error> size: same ref dedup, different refs → size=2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('test');
      const set: Set<Error> = new Set<Error>([e, e]);
      expect(set.size).assertEqual(1);
      const set2: Set<Error> = new Set<Error>([new Error('a'), new Error('b')]);
      expect(set2.size).assertEqual(2);
    });

    /**
     * @tc.name testSize067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6700
     * @tc.desc Verify Set<WeakMap> size with same ref dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([wm, wm]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6800
     * @tc.desc Verify Set<WeakMap> size with same ref dedup (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      set.add(wm);
      set.add(wm);

      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_6900
     * @tc.desc Verify Set<WeakSet> size with same ref dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws, ws]);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7000
     * @tc.desc Verify Set<WeakSet> size with same ref dedup (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      set.add(ws);
      set.add(ws);

      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSize071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7100
     * @tc.desc Verify Set<Set<Set<int>>> triple nested Set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1, 2]);
      const mid: Set<Set<int>> = new Set<Set<int>>([inner]);
      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>([mid, mid]);
      expect(outer.size).assertEqual(1);
    });

    /**
     * @tc.name testSize072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7200
     * @tc.desc Verify Set<Set<Set<int>>> triple nested Set size (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1, 2]);
      const mid: Set<Set<int>> = new Set<Set<int>>();
      mid.add(inner);

      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>([mid, mid]);
      expect(outer.size).assertEqual(1);
    });

    /**
     * @tc.name testSize073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7300
     * @tc.desc Verify Set<Map<string, Set<int>>> mixed generic size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const m1: Map<string, Set<int>> = new Map<string, Set<int>>();
      m1.set('a', inner);
      const m2: Map<string, Set<int>> = new Map<string, Set<int>>();
      m2.set('a', inner);
      const set: Set<Map<string, Set<int>>> = new Set<Map<string, Set<int>>>([m1, m2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7400
     * @tc.desc Verify Set<Map<string, Set<int>>> mixed generic size (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const m1: Map<string, Set<int>> = new Map<string, Set<int>>();
      m1.set('a', inner);
      const m2: Map<string, Set<int>> = new Map<string, Set<int>>();
      m2.set('a', inner);

      const set: Set<Map<string, Set<int>>> = new Set<Map<string, Set<int>>>();
      set.add(m1);
      set.add(m2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7500
     * @tc.desc Verify Set<bigint> size with value dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>([0n, 1n, -1n, 1n, BigInt(0xFFFF)]);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSize076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7600
     * @tc.desc Verify Set<ObjTest> size with value-same different instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>([new ObjTest(1), new ObjTest(1)]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7700
     * @tc.desc Verify ReadonlySet<int> size reflects underlying Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      const rs: ReadonlySet<int> = set;
      expect(rs.size).assertEqual(3);
      set.add(4);
      expect(rs.size).assertEqual(4);
    });

    /**
     * @tc.name testSize078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7800
     * @tc.desc Verify Set<float> size with Float.NaN dedup and Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(1.0 as float);
      set.add(Float.NaN);
      set.add(Float.NaN);
      set.add(Float.POSITIVE_INFINITY);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSize079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_7900
     * @tc.desc Verify Set<object> size: same ref dedup, different refs counted separately
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: object = new ObjTest(1);
      const obj2: object = new ObjTest(1);
      const set: Set<object> = new Set<object>([obj1, obj1, obj2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_8000
     * @tc.desc Verify Set<Promise<Set<int>>> size nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p1: Promise<Set<int>> = Promise.resolve(inner);
      const p2: Promise<Set<int>> = Promise.resolve(inner);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p1, p1, p2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSize081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SIZE_P1_8100
     * @tc.desc Verify Set<jsonx.JsonElement> size with JSON parsed objects: same ref dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSize081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"b":2}');
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1, j1, j2]);
      expect(set.size).assertEqual(2);
    });
  });
}

