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

class TestItem {
  id: number = 0;

  constructor(id: number) {
    this.id = id;
  }
}

export default function SetDelete_2Test(): void {
  describe('SetDeletePart1Test', (): void => {
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
     * @tc.name testDelete001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0100
     * @tc.desc Verify delete returns true for existing byte element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([1]);
      expect(set.has(1)).assertTrue();
      expect(set.delete(1)).assertTrue();
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0200
     * @tc.desc Verify delete of byte minimum boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([-128 as byte]);
      expect(set.has(-128)).assertTrue();
      expect(set.delete(-128)).assertTrue();
      expect(set.has(-128)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0300
     * @tc.desc Verify delete of byte maximum boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([127 as byte]);
      expect(set.has(127)).assertTrue();
      expect(set.delete(127)).assertTrue();
      expect(set.has(127)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0400
     * @tc.desc Verify delete of byte zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.delete(0)).assertTrue();
      expect(set.has(0)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0500
     * @tc.desc Verify second delete of same byte returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([1]);
      set.delete(1);
      expect(set.delete(1)).assertFalse();
    });

    /**
     * @tc.name testDelete006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0600
     * @tc.desc Verify delete with hex byte value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([0x0A]);
      expect(set.delete(0x0A)).assertTrue();
    });

    /**
     * @tc.name testDelete007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0700
     * @tc.desc Verify delete with octal byte value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([0o12]);
      expect(set.delete(0o12)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0800
     * @tc.desc Verify delete with binary byte value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>([0b1010]);
      expect(set.delete(0b1010)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_0900
     * @tc.desc Verify delete returns true for existing short element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([1]);
      expect(set.has(1)).assertTrue();
      expect(set.delete(1)).assertTrue();
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1000
     * @tc.desc Verify delete of short minimum boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([-32768 as short]);
      expect(set.delete(-32768)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1100
     * @tc.desc Verify delete of short maximum boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([32767 as short]);
      expect(set.delete(32767)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1200
     * @tc.desc Verify delete of short zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.delete(0)).assertTrue();
      expect(set.has(0)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1300
     * @tc.desc Verify second delete of same short returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([1]);
      set.delete(1);
      expect(set.delete(1)).assertFalse();
    });

    /**
     * @tc.name testDelete014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1400
     * @tc.desc Verify delete with hex short value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<short> = new Set<short>([0x7FFF]);
      expect(set.delete(0x7FFF)).assertTrue();
    });

    /**
     * @tc.name testDelete015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1500
     * @tc.desc Verify delete returns true for existing int element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([1]);
      expect(set.has(1)).assertTrue();
      expect(set.delete(1)).assertTrue();
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1600
     * @tc.desc Verify delete of int minimum boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([Int.MIN_VALUE]);
      expect(set.delete(Int.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1700
     * @tc.desc Verify delete of int maximum boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([2147483647]);
      expect(set.delete(2147483647)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1800
     * @tc.desc Verify delete of int zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.delete(0)).assertTrue();
      expect(set.has(0)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_1900
     * @tc.desc Verify delete of negative int value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([-1]);
      expect(set.delete(-1)).assertTrue();
    });

    /**
     * @tc.name testDelete020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2000
     * @tc.desc Verify second delete of same int returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1]);
      set.delete(1);
      expect(set.delete(1)).assertFalse();
    });

    /**
     * @tc.name testDelete021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2100
     * @tc.desc Verify delete with hex int value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0xFF]);
      expect(set.delete(0xFF)).assertTrue();
    });

    /**
     * @tc.name testDelete022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2200
     * @tc.desc Verify delete returns true for existing long element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([1]);
      expect(set.has(1)).assertTrue();
      expect(set.delete(1)).assertTrue();
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2300
     * @tc.desc Verify delete of long zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.delete(0)).assertTrue();
      expect(set.has(0)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2400
     * @tc.desc Verify delete of large negative long value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([-10000000000]);
      expect(set.delete(-10000000000)).assertTrue();
    });

    /**
     * @tc.name testDelete025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2500
     * @tc.desc Verify delete with large hex long value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([0x1FFFFFFFF]);
      expect(set.delete(0x1FFFFFFFF)).assertTrue();
    });

    /**
     * @tc.name testDelete026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2600
     * @tc.desc Verify second delete of same long returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>([1]);
      set.delete(1);
      expect(set.delete(1)).assertFalse();
    });

    /**
     * @tc.name testDelete027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2700
     * @tc.desc Verify delete returns true for existing double element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([1]);
      expect(set.has(1)).assertTrue();
      expect(set.delete(1)).assertTrue();
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2800
     * @tc.desc Verify delete of double maximum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([Number.MAX_VALUE]);
      expect(set.delete(Number.MAX_VALUE)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_2900
     * @tc.desc Verify delete of double minimum positive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([Number.MIN_VALUE]);
      expect(set.delete(Number.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3000
     * @tc.desc Verify delete of double max safe integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([Double.MAX_SAFE_INTEGER]);
      expect(set.delete(Double.MAX_SAFE_INTEGER)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3100
     * @tc.desc Verify delete of double min safe integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([-Double.MAX_SAFE_INTEGER]);
      expect(set.delete(-Double.MAX_SAFE_INTEGER)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3200
     * @tc.desc Verify delete of double zero value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([0]);
      expect(set.has(0)).assertTrue();
      expect(set.delete(0)).assertTrue();
      expect(set.has(0)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3300
     * @tc.desc Verify delete of double negative zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>([-0.0]);
      expect(set.has(-0.0)).assertTrue();
      expect(set.delete(-0.0)).assertTrue();
      expect(set.has(-0.0)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3400
     * @tc.desc Verify second delete of same double returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.0]);
      set.delete(1.0);
      expect(set.delete(1.0)).assertFalse();
    });

    /**
     * @tc.name testDelete035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3500
     * @tc.desc Verify second delete of same string returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["a"]);
      set.delete("a");
      expect(set.delete("a")).assertFalse();
    });

    /**
     * @tc.name testDelete036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3600
     * @tc.desc Verify delete of zero-width space string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["​"]);
      expect(set.delete("​")).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3700
     * @tc.desc Verify delete with hex escape string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["\x41"]);
      expect(set.delete("\x41")).assertTrue();
    });

    /**
     * @tc.name testDelete038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3800
     * @tc.desc Verify zero-width string and empty string are distinct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["", "​"]);
      expect(set.size).assertEqual(2);
      expect(set.delete("")).assertTrue();
      expect(set.has("​")).assertTrue();
    });

    /**
     * @tc.name testDelete039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_3900
     * @tc.desc Verify second delete of boolean true returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([true]);
      set.delete(true);
      expect(set.delete(true)).assertFalse();
    });

    /**
     * @tc.name testDelete040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4000
     * @tc.desc Verify second delete of boolean false returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<boolean> = new Set<boolean>([false]);
      set.delete(false);
      expect(set.delete(false)).assertFalse();
    });

    /**
     * @tc.name testDelete041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4100
     * @tc.desc Verify delete of different Object reference returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: ObjTest = new ObjTest(1);
      const obj2: ObjTest = new ObjTest(1);
      const set: Set<ObjTest> = new Set<ObjTest>([obj1]);
      const result: boolean = set.delete(obj2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testDelete042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4200
     * @tc.desc Verify delete of different custom class instance returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1: TestItem = new TestItem(1);
      const item2: TestItem = new TestItem(2);
      const set: Set<TestItem> = new Set<TestItem>([item1]);
      const result: boolean = set.delete(item2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name testDelete043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4300
     * @tc.desc Verify delete returns false for different-reference array and true for same-reference array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number[]> = new Set<number[]>([[1, 2, 3]]);
      const result: boolean = set.delete([4, 5, 6]);
      expect(result).assertFalse();
      const arr: number[] = [7, 8, 9];
      const set2: Set<number[]> = new Set<number[]>([arr]);
      expect(set2.delete(arr)).assertTrue();
      expect(set2.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4400
     * @tc.desc Verify delete at zero key edge
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([0]);
      expect(set.delete(0)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4500
     * @tc.desc Verify delete empty string from Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string> = new Set<string>(["", "a"]);
      expect(set.delete("")).assertTrue();
      expect(set.has("")).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testDelete046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4600
     * @tc.desc Verify delete very long string from Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = "a".repeat(10000);
      const set: Set<string> = new Set<string>([longStr]);
      expect(set.delete(longStr)).assertTrue();
      expect(set.has(longStr)).assertFalse();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4700
     * @tc.desc Verify delete type checking with int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 2, 3]);
      expect(set.has(2)).assertTrue();
      expect(set.delete(2)).assertTrue();
      expect(set.has(2)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4800
     * @tc.desc Verify delete with spread serialization
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<int>([1, 2, 3]);
      set1.delete(2);
      const set2 = new Set<int>();
      for (const v of set1) { set2.add(v); }
      expect(set2.size).assertEqual(2);
      expect(set2.has(2)).assertFalse();
    });

    /**
     * @tc.name testDelete049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_4900
     * @tc.desc Verify Set<int> size with two elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([1, 3]);
      expect(set.size).assertEqual(2);
      expect(set.delete(1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testDelete050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5000
     * @tc.desc Verify delete sequential multi-operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>([0, 1, 2, 3, 4]);
      for (let i: int = 0; i < 3; i++) {
        set.delete(i);
      }
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5100
     * @tc.desc Verify delete with large Set 1000 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.delete(500)).assertTrue();
      expect(set.has(500)).assertFalse();
      expect(set.size).assertEqual(999);
    });

    /**
     * @tc.name testDelete052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5200
     * @tc.desc Verify Set<double> delete existing element from multi-element set and has returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<double> = new Set<double>([1.0, 2.0, 3.0]);
      set.delete(2.0);
      expect(set.has(2.0)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5300
     * @tc.desc Verify Set<float> delete existing float value → true, size decreases
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(3.14 as float);
      set.add(Float.NaN);
      expect(set.delete(3.14 as float)).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(3.14 as float)).assertFalse();
    });

    /**
     * @tc.name testDelete054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5400
     * @tc.desc Verify Set<float> delete non-existent value → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>([1.0 as float, 2.0 as float]);
      expect(set.delete(99.0 as float)).assertFalse();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5500
     * @tc.desc Verify Set<char> delete existing char returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'a');
      set.add(c'中');
      expect(set.delete(c'a')).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(c'a')).assertFalse();
    });

    /**
     * @tc.name testDelete056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5600
     * @tc.desc Verify Set<char> delete non-existent char returns false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'Z');
      expect(set.delete(c'X')).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testDelete057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5700
     * @tc.desc Verify Set<number> delete mixed int and float values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([0, 1.5, -3.14, Number.POSITIVE_INFINITY]);
      expect(set.delete(1.5)).assertTrue();
      expect(set.has(1.5)).assertFalse();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testDelete058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5800
     * @tc.desc Verify Set<number> delete Number.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([Number.NaN, 0, 1]);
      expect(set.delete(Number.NaN)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_5900
     * @tc.desc Verify Set<string | int> delete union type elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<string | int> = new Set<string | int>(["a", 1, "b", 2]);
      expect(set.delete("a")).assertTrue();
      expect(set.delete(1)).assertTrue();
      expect(set.size).assertEqual(2);
      expect(set.has("a")).assertFalse();
      expect(set.has(1)).assertFalse();
    });

    /**
     * @tc.name testDelete060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6000
     * @tc.desc Verify delete then re-add same value restores element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>([10, 20]);
      expect(set.delete(10)).assertTrue();
      expect(set.has(10)).assertFalse();
      set.add(10);
      expect(set.has(10)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6100
     * @tc.desc Verify Set<Date> delete same ref → true, different ref same value → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d1 = new Date(2025, 0, 1);
      const d2 = new Date(2025, 0, 1);
      const set: Set<Date> = new Set<Date>([d1]);
      expect(set.delete(d1)).assertTrue();
      set.add(d1);
      expect(set.delete(d2)).assertFalse();
    });

    /**
     * @tc.name testDelete062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6200
     * @tc.desc Verify Set<RegExp> delete by ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = new RegExp("abc");
      const r2 = new RegExp("abc");
      const set: Set<RegExp> = new Set<RegExp>([r1]);
      expect(set.delete(r2)).assertFalse();
      expect(set.delete(r1)).assertTrue();
    });

    /**
     * @tc.name testDelete063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6300
     * @tc.desc Verify Set<Map> delete Map by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('k', 1);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m]);
      expect(set.delete(m)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6400
     * @tc.desc Verify Set<Map> delete Map by ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m = new Map<string, number>();
      m.set('k', 1);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m);

      expect(set.delete(m)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6500
     * @tc.desc Verify Set<Set<int>> delete nested Set by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>([inner]);
      expect(outer.delete(inner)).assertTrue();
      expect(outer.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6600
     * @tc.desc Verify Set<Set<int>> delete nested Set by ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(inner);

      expect(outer.delete(inner)).assertTrue();
      expect(outer.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6700
     * @tc.desc Verify Set<Record> delete Record by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = { 'a': 1 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>([r]);
      expect(set.delete(r)).assertTrue();
    });

    /**
     * @tc.name testDelete068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6800
     * @tc.desc Verify Set<Record> delete Record by ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Record<string, int> = { 'a': 1 };
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      set.add(r);

      expect(set.delete(r)).assertTrue();
    });

    /**
     * @tc.name testDelete069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_6900
     * @tc.desc Verify Set<Int8Array> delete TypedArray by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2]);
      const set: Set<Int8Array> = new Set<Int8Array>([arr]);
      expect(set.delete(arr)).assertTrue();
    });

    /**
     * @tc.name testDelete070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7000
     * @tc.desc Verify Set<Int8Array> delete TypedArray by ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int8Array([1, 2]);
      const set: Set<Int8Array> = new Set<Int8Array>();
      set.add(arr);

      expect(set.delete(arr)).assertTrue();
    });

    /**
     * @tc.name testDelete071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7100
     * @tc.desc Verify Set<WeakMap> delete WeakMap by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>([wm]);
      expect(set.delete(wm)).assertTrue();
    });

    /**
     * @tc.name testDelete072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7200
     * @tc.desc Verify Set<WeakMap> delete WeakMap by ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm = new WeakMap<object, number>();
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      set.add(wm);

      expect(set.delete(wm)).assertTrue();
    });

    /**
     * @tc.name testDelete073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7300
     * @tc.desc Verify Set<WeakSet> delete WeakSet by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>([ws]);
      expect(set.delete(ws)).assertTrue();
    });

    /**
     * @tc.name testDelete074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7400
     * @tc.desc Verify Set<WeakSet> delete WeakSet by ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws = new WeakSet<object>();
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      set.add(ws);

      expect(set.delete(ws)).assertTrue();
    });

    /**
     * @tc.name testDelete075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7500
     * @tc.desc Verify Set<Error> delete Error by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e = new Error('test');
      const set: Set<Error> = new Set<Error>([e]);
      expect(set.delete(e)).assertTrue();
      expect(set.has(e)).assertFalse();
    });

    /**
     * @tc.name testDelete076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7600
     * @tc.desc Verify Set<Set<Set<int>>> triple nested delete inner ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1, 2]);
      const mid: Set<Set<int>> = new Set<Set<int>>([inner]);
      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>([mid]);
      expect(outer.delete(mid)).assertTrue();
      expect(outer.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7700
     * @tc.desc Verify Set<Set<Set<int>>> triple nested delete inner ref (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([1, 2]);
      const mid: Set<Set<int>> = new Set<Set<int>>();
      mid.add(inner);

      const outer: Set<Set<Set<int>>> = new Set<Set<Set<int>>>([mid]);
      expect(outer.delete(mid)).assertTrue();
      expect(outer.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7800
     * @tc.desc Verify Set<bigint> delete existing value returns true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>([1n, 2n, 3n]);
      expect(set.delete(2n)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testDelete079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_7900
     * @tc.desc Verify Set<ObjTest> delete class instance by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const o1 = new ObjTest(10);
      const o2 = new ObjTest(10);
      const set: Set<ObjTest> = new Set<ObjTest>([o1]);
      expect(set.delete(o1)).assertTrue();
      set.add(o1);
      expect(set.delete(o2)).assertFalse();
    });

    /**
     * @tc.name testDelete080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_8000
     * @tc.desc Verify Set<number> delete mixed int and float values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number> = new Set<number>([0, 1.5, -3.14, Number.POSITIVE_INFINITY, Number.NaN]);
      expect(set.delete(1.5)).assertTrue();
      expect(set.delete(99)).assertFalse();
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testDelete081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_8100
     * @tc.desc Verify Set<object> delete POJO by ref: same ref → true, different ref → false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: object = new ObjTest(1);
      const obj2: object = new ObjTest(1);
      const set: Set<object> = new Set<object>([obj1]);
      expect(set.delete(obj1)).assertTrue();
      set.add(obj1);
      expect(set.delete(obj2)).assertFalse();
    });

    /**
     * @tc.name testDelete082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_8200
     * @tc.desc Verify Set<Promise<Set<int>>> delete nested Promise generic by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>([p]);
      expect(set.delete(p)).assertTrue();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testDelete083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_DELETE_P1_8300
     * @tc.desc Verify Set<jsonx.JsonElement> delete JSON parsed object by ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testDelete083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>([j1]);
      expect(set.delete(j1)).assertTrue();
      set.add(j1);
      expect(set.delete(j2)).assertFalse();
    });
  });
}

