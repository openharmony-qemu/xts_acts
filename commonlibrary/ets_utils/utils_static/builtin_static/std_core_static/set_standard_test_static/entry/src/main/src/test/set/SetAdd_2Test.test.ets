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

class CustomItem {
  id: number = 0;
  self: CustomItem | null = null;
}

export default function SetAdd_2Test(): void {
  describe('SetAddPart1Test', (): void => {
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
     * @tc.name testSetAdd001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0010
     * @tc.desc Verify Byte hex add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(0x0A);
      expect(set.has(0x0A)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0020
     * @tc.desc Verify Byte octal add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<byte> = new Set<byte>();
      set.add(0o14);
      expect(set.has(0o14)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0030
     * @tc.desc Verify Short hex add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      set.add(0x7FFF);
      expect(set.has(0x7FFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0040
     * @tc.desc Verify Int hex 255 add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(0xFF);
      expect(set.has(0xFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0050
     * @tc.desc Verify Int octal add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(63);
      expect(set.has(63)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0060
     * @tc.desc Verify Int binary 10 add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(0b1010);
      expect(set.has(0b1010)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0070
     * @tc.desc Verify Long hex large number add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(0x1FFFFFFFF);
      expect(set.has(0x1FFFFFFFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0080
     * @tc.desc Verify Long binary large number add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(0b11111111111111111111111111111111);
      expect(set.has(0b11111111111111111111111111111111)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0090
     * @tc.desc Verify double precision verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(0.1 + 0.2);
      expect(set.has(0.1 + 0.2)).assertTrue();
      expect(set.has(0.3)).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0100
     * @tc.desc Verify double min positive value add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(1.4e-45);
      expect(set.has(1.4e-45)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0110
     * @tc.desc Verify Double max value add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Number.MAX_VALUE);
      expect(set.has(Number.MAX_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0120
     * @tc.desc Verify Double min value add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Number.MIN_VALUE);
      expect(set.has(Number.MIN_VALUE)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0130
     * @tc.desc Verify Double Double.NaN add and deduplication (SameValueZero semantics)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Double.NaN);
      set.add(Double.NaN);
      expect(set.size).assertEqual(1);
      expect(set.has(Double.NaN)).assertTrue();
    });

    /**
     * @tc.name testSetAdd014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0140
     * @tc.desc Verify Double tiny value add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Number.EPSILON);
      expect(set.has(Number.EPSILON)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0150
     * @tc.desc Verify Double safe integer max value add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Number.MAX_SAFE_INTEGER);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0160
     * @tc.desc Verify Double safe integer min value add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Number.MIN_SAFE_INTEGER);
      expect(set.has(Number.MIN_SAFE_INTEGER)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0170
     * @tc.desc Verify number hex value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(0xFF);
      expect(set.has(0xFF)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0180
     * @tc.desc Verify number octal value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(63);
      expect(set.has(63)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0190
     * @tc.desc Verify number binary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(0b1010);
      expect(set.has(0b1010)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0200
     * @tc.desc Verify Whitespace string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("");
      expect(set.has("")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0210
     * @tc.desc Verify Double space string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("  ");
      expect(set.has("  ")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0220
     * @tc.desc Verify Tab character string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\t");
      expect(set.has("\t")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0230
     * @tc.desc Verify Newline character string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\n");
      expect(set.has("\n")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0240
     * @tc.desc Verify Carriage return and newline string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\r\n");
      expect(set.has("\r\n")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0250
     * @tc.desc Verify Japanese string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("テスト");
      expect(set.has("テスト")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0260
     * @tc.desc Verify Korean string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("테스트");
      expect(set.has("테스트")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0270
     * @tc.desc Verify Arabic string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("سلام");
      expect(set.has("سلام")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0280
     * @tc.desc Verify XSS string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("<script>alert(1)");
      expect(set.has("<script>alert(1)")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0290
     * @tc.desc Verify SQL injection string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("' OR '1'='1");
      expect(set.has("' OR '1'='1")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0300
     * @tc.desc Verify XML string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("<tag>value</tag>");
      expect(set.has("<tag>value</tag>")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0310
     * @tc.desc Verify With null byte string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("test\0null");
      expect(set.has("test\0null")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0320
     * @tc.desc Verify Zero-width space string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("​");
      expect(set.has("​")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0330
     * @tc.desc Verify RTL string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("‮反转字符串");
      expect(set.has("‮反转字符串")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0340
     * @tc.desc Verify Combining characters string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("ç");
      expect(set.has("ç")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0350
     * @tc.desc Verify Multilingual mixed string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("En中テストテスト");
      expect(set.has("En中テストテスト")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0360
     * @tc.desc Verify large string (1M) add and has correctness
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a".repeat(1048576));
      expect(set.has("a".repeat(1048576))).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0370
     * @tc.desc Verify Escape characters chained add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\n\t");
      expect(set.has("\n\t")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0380
     * @tc.desc Verify String and escape equivalence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\x61");
      expect(set.has("\x61")).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetAdd039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0390
     * @tc.desc Verify Case sensitivity as different values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("A");
      expect(set.has("A")).assertTrue();
      expect(set.has("a")).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0400
     * @tc.desc Verify Leading/trailing spaces result in different values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add(" a ");
      expect(set.has("a")).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0410
     * @tc.desc Verify Newline results in different value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a\nb");
      expect(set.has("a\nb")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0420
     * @tc.desc Verify Fullwidth and halfwidth treated as different values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("Ａ");
      expect(set.has("A")).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0430
     * @tc.desc Verify Accent marks result in different values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("café");
      expect(set.has("cafe")).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0440
     * @tc.desc Verify NFC and NFD form treated as different values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("é");
      expect(set.has("é")).assertFalse();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0450
     * @tc.desc Verify Delete and re-add same string verification exists
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("hello");
      set.add("hello");
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0460
     * @tc.desc Verify Clear then re-add works correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("hello");
      set.clear();
      set.add("hello");
      expect(set.has("hello")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0470
     * @tc.desc Verify Consecutive multiple add same string size 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a");
      set.add("a");
      set.add("a");
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0480
     * @tc.desc Verify Zero-width space different from empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("​");
      set.add("");
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0490
     * @tc.desc Verify Tab character different from space
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\t");
      set.add(" ");
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0500
     * @tc.desc Verify Delete and re-add same string verification can exist again
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("hello");
      set.delete("hello");
      set.add("hello");
      expect(set.has("hello")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0510
     * @tc.desc Verify Containing null byte string fully preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("abc\0def");
      expect(set.has("abc\0def")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0520
     * @tc.desc Verify boolean duplicate add (true repeated)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.add(true);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0530
     * @tc.desc Verify boolean duplicate add (false repeated)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(false);
      set.add(false);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0540
     * @tc.desc Verify Bool chained add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.add(false);
      set.add(true);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0550
     * @tc.desc Verify Bool delete re-add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.delete(true);
      set.add(true);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0560
     * @tc.desc Verify Bool consecutive multiple add same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>();
      set.add(true);
      set.add(true);
      set.add(true);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0570
     * @tc.desc Verify Boolean and int coexistence number type indirectly handled
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean | number>();
      set.add(true);
      set.add(1);
      expect(set.has(true)).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd058
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0580
     * @tc.desc Verify String and boolean mixed add then verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean | string>();
      set.add(true);
      set.add("true");
      expect(set.has(true)).assertTrue();
      expect(set.has("true")).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0590
     * @tc.desc Verify Boolean and Object mixed add then verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean | ObjTest>();
      set.add(true);
      set.add(new ObjTest());
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0600
     * @tc.desc Verify Object empty setLiteral
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ObjTest = new ObjTest();
      const set = new Set<ObjTest>();
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0610
     * @tc.desc Verify Object single elementRef
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest();
      obj.value = 1;
      const set = new Set<ObjTest>();
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0620
     * @tc.desc Verify Object different referencesSameContent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest();
      obj1.value = 1;
      let obj2 = new ObjTest();
      obj2.value = 1;
      const set = new Set<ObjTest>();
      set.add(obj1);
      set.add(obj2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0630
     * @tc.desc Verify Object same referenceMultiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest();
      obj.value = 1;
      const set = new Set<ObjTest>();
      set.add(obj);
      set.add(obj);
      set.add(obj);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0640
     * @tc.desc Verify Object chainRefs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new ObjTest();
      obj1.id = 1;
      let obj2 = new ObjTest();
      obj2.id = 2;
      let obj3 = new ObjTest();
      obj3.id = 3;
      const set = new Set<ObjTest>();
      set.add(obj1);
      set.add(obj2);
      set.add(obj3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0650
     * @tc.desc Verify Object deleteThenReadd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest();
      obj.id = 1;
      const set = new Set<ObjTest>();
      set.add(obj);
      set.delete(obj);
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd066
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0660
     * @tc.desc Verify Object clearThenAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest();
      obj.id = 1;
      const set = new Set<ObjTest>();
      set.add(obj);
      set.clear();
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0670
     * @tc.desc Verify CustomItem single elementInstance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      const set = new Set<CustomItem>();
      set.add(instance);
      expect(set.has(instance)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0680
     * @tc.desc Verify CustomItem addAfterClear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      const set = new Set<CustomItem>();
      set.add(instance);
      set.clear();
      set.add(instance);
      expect(set.has(instance)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0690
     * @tc.desc Verify CustomItem different referencesSameFields
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new CustomItem();
      item1.id = 1;
      item1.self = item1;
      let item2 = new CustomItem();
      item2.id = 1;
      item2.self = item2;
      const set = new Set<CustomItem>();
      set.add(item1);
      set.add(item2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0700
     * @tc.desc Verify CustomItem duplicate
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new CustomItem();
      item1.id = 1;
      const set = new Set<CustomItem>();
      set.add(item1);
      set.add(item1);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0710
     * @tc.desc Verify CustomItem addMultiple
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new CustomItem();
      item1.id = 1;
      let item2 = new CustomItem();
      item2.id = 2;
      const set = new Set<CustomItem>();
      set.add(item1);
      set.add(item2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0720
     * @tc.desc Verify CustomItem chainAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new CustomItem();
      item1.id = 1;
      let item2 = new CustomItem();
      item2.id = 2;
      let item3 = new CustomItem();
      item3.id = 3;
      const set = new Set<CustomItem>();
      set.add(item1);
      set.add(item2);
      set.add(item3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd073
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0730
     * @tc.desc Verify CustomItem deleteThenReadd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      const set = new Set<CustomItem>();
      set.add(instance);
      set.delete(instance);
      set.add(instance);
      expect(set.has(instance)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0740
     * @tc.desc Verify CustomItem addAndCheck
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      const set = new Set<CustomItem>();
      set.add(instance);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd075
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0750
     * @tc.desc Verify CustomItem selfReference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      instance.self = instance;
      const set = new Set<CustomItem>();
      set.add(instance);
      expect(set.has(instance)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd076
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0760
     * @tc.desc Verify CustomItem mutableFieldChange
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      instance.id = 1;
      const set = new Set<CustomItem>();
      set.add(instance);
      instance.id = 2;
      expect(set.has(instance)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0770
     * @tc.desc Verify CustomItem manyDistinct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<CustomItem>();
      for (let i: int = 0; i < 100; i++) {
        let item = new CustomItem();
        item.id = i;
        set.add(item);
      }
      expect(set.size).assertEqual(100);
    });

    /**
     * @tc.name testSetAdd078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0780
     * @tc.desc Verify CustomItem addToEmptyAfterDeleteAll
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<CustomItem>();
      let item1 = new CustomItem();
      set.add(item1);
      set.delete(item1);
      let item2 = new CustomItem();
      set.add(item2);
      expect(set.has(item2)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0790
     * @tc.desc Verify CustomItem consecutiveSameRef
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new CustomItem();
      const set = new Set<CustomItem>();
      set.add(instance);
      set.add(instance);
      set.add(instance);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0800
     * @tc.desc Verify CustomItem addInstance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<CustomItem>();
      let instance = new CustomItem();
      set.add(instance);
      expect(set.has(instance)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0810
     * @tc.desc Verify int intEmpty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const set = new Set<number[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd082
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0820
     * @tc.desc Verify int intSingle
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [42];
      const set = new Set<number[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0830
     * @tc.desc Verify int intMulti
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0840
     * @tc.desc Verify array same referenceDup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>();
      set.add(arr);
      set.add(arr);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0850
     * @tc.desc Verify array different referencesSameContent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [1, 2, 3];
      const set = new Set<number[]>();
      set.add(arr1);
      set.add(arr2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0860
     * @tc.desc Verify Empty string array add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = [];
      const set = new Set<string[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0870
     * @tc.desc Verify Multiple elements string array add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const set = new Set<string[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0880
     * @tc.desc Verify Boolean array add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const set = new Set<boolean[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0890
     * @tc.desc Verify array largeArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      const set = new Set<number[]>();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd090
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0900
     * @tc.desc Verify array chainAdd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1];
      let arr2: number[] = [2];
      let arr3: number[] = [3];
      const set = new Set<number[]>();
      set.add(arr1);
      set.add(arr2);
      set.add(arr3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd091
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0910
     * @tc.desc Verify array deleteThenReadd
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>();
      set.add(arr);
      set.delete(arr);
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0920
     * @tc.desc Verify array addAfterClear
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const set = new Set<number[]>();
      set.add(arr);
      set.clear();
      set.add(arr);
      expect(set.has(arr)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0930
     * @tc.desc Verify array mixedLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: number[] = [1];
      let arr2: number[] = [1, 2, 3];
      const set = new Set<number[]>();
      set.add(arr1);
      set.add(arr2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0940
     * @tc.desc Verify union type mix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("hello");
      set.add(42);
      expect(set.has("hello")).assertTrue();
      expect(set.has(42)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0950
     * @tc.desc Verify union type duplicateStr
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("hello");
      set.add("hello");
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0960
     * @tc.desc Verify union type duplicateInt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add(42);
      set.add(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0970
     * @tc.desc Verify union type chain
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("a");
      set.add(1);
      set.add("b");
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0980
     * @tc.desc Verify union type strBool
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | boolean>();
      set.add("hello");
      set.add(true);
      expect(set.has("hello")).assertTrue();
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_0990
     * @tc.desc Verify int intBool
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number | boolean>();
      set.add(42);
      set.add(true);
      expect(set.has(42)).assertTrue();
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1000
     * @tc.desc Verify union type strNumBool
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number | boolean>();
      set.add("hello");
      set.add(42);
      set.add(true);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd101
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1010
     * @tc.desc Verify union type duplicateAfterDelete
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("hello");
      set.delete("hello");
      set.add("hello");
      expect(set.has("hello")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd102
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1020
     * @tc.desc Verify union type interleaved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("a");
      set.add(1);
      set.add("b");
      set.add(2);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name testSetAdd103
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1030
     * @tc.desc Verify union type allSame
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add(42);
      set.add(42);
      set.add(42);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd104
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1040
     * @tc.desc Verify union type strSpecial
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string | number>();
      set.add("");
      set.add(0);
      expect(set.has("")).assertTrue();
      expect(set.has(0)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd105
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1050
     * @tc.desc Verify union number | string with long and int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number | string>();
      set.add(1);
      set.add(2.5);
      expect(set.has(1)).assertTrue();
      expect(set.has(2.5)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd106
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1060
     * @tc.desc Verify float floatDouble
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number | string>();
      set.add(1.5);
      set.add(2.5);
      expect(set.has(1.5)).assertTrue();
      expect(set.has(2.5)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd107
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1070
     * @tc.desc Verify Long generic parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<long>();
      set.add(1);
      set.add(2);
      set.add(3);
      expect(set.has(2)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd108
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1080
     * @tc.desc Verify double generic parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(1.0);
      set.add(2.0);
      set.add(3.0);
      expect(set.has(2.0)).assertTrue();
      expect(set.has(1.0)).assertTrue();
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd109
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1090
     * @tc.desc Verify String generic parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("hello");
      set.add("world");
      expect(set.has("hello")).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd110
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1100
     * @tc.desc Verify Set<boolean> add true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([true]);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd111
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1110
     * @tc.desc Verify Set<boolean> add false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<boolean>([false]);
      expect(set.has(false)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd112
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1120
     * @tc.desc Verify Byte generic parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(1);
      set.add(2);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd113
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1130
     * @tc.desc Verify Short generic parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<short>();
      set.add(1);
      set.add(2);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd114
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1140
     * @tc.desc Verify generic object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<ObjTest>();
      let obj1 = new ObjTest();
      obj1.id = 1;
      let obj2 = new ObjTest();
      obj2.id = 2;
      set.add(obj1);
      set.add(obj2);
      expect(set.has(obj1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd115
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1150
     * @tc.desc Verify CustomItem customClass
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<CustomItem>();
      let item1 = new CustomItem();
      item1.id = 1;
      let item2 = new CustomItem();
      item2.id = 2;
      set.add(item1);
      set.add(item2);
      expect(set.has(item1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd116
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1160
     * @tc.desc Verify generic arrayInt
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number[]>();
      let arr1: number[] = [1, 2];
      let arr2: number[] = [3, 4];
      set.add(arr1);
      set.add(arr2);
      expect(set.has(arr1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd117
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1170
     * @tc.desc Verify generic arrayString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string[]>();
      let arr1: string[] = ["a", "b"];
      let arr2: string[] = ["c", "d"];
      set.add(arr1);
      set.add(arr2);
      expect(set.has(arr1)).assertTrue();
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd118
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1180
     * @tc.desc Verify identityCheck
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new ObjTest();
      obj.id = 1;
      const set = new Set<ObjTest>();
      set.add(obj);
      expect(set.has(obj)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd119
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1190
     * @tc.desc Verify sameValueZero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<number>();
      set.add(1);
      set.add(1.0);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd120
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1200
     * @tc.desc Verify negativeNaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(-Double.NaN);
      expect(set.has(-Double.NaN)).assertTrue();
      expect(set.has(Double.NaN)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd121
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1210
     * @tc.desc Verify ulp
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(Number.EPSILON / 2);
      expect(set.has(Number.EPSILON / 2)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd122
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1220
     * @tc.desc Verify With backslash string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("test\\path");
      expect(set.has("test\\path")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd123
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1230
     * @tc.desc Verify With quotes string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add('他说“测试”');
      expect(set.has('他说“测试”')).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd124
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1240
     * @tc.desc Verify string Emoji string add (surrogate pair)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add('😀测试');
      expect(set.has('😀测试')).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd125
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1250
     * @tc.desc Verify Control characters string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("");
      expect(set.has("")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd126
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1260
     * @tc.desc Verify Private use area string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("");
      expect(set.has("")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd127
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1270
     * @tc.desc Verify Surrogate pair string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("𐀀");
      expect(set.has("𐀀")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd128
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1280
     * @tc.desc Verify Combining diacritics string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("à");
      expect(set.has("à")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd129
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1290
     * @tc.desc Verify Math symbols string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add('∑∏∫∂');
      expect(set.has('∑∏∫∂')).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd130
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1300
     * @tc.desc Verify Consecutive whitespace string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("a    b");
      expect(set.has("a    b")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd131
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1310
     * @tc.desc Verify With leading/trailing spaces string add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("  test  ");
      expect(set.has("  test  ")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd132
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1320
     * @tc.desc Verify Case sensitivity verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("Hello");
      expect(set.has("Hello")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd133
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1330
     * @tc.desc Verify Numeric string and number after conversion string comparison
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("123");
      expect(set.has("123")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd134
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1340
     * @tc.desc Verify Boolean string comparison
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("true");
      expect(set.has("true")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd135
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1350
     * @tc.desc Verify Hex escape characters add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<string>();
      set.add("\x48\x65\x6C\x6C\x6F");
      expect(set.has("\x48\x65\x6C\x6C\x6F")).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd136
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1360
     * @tc.desc Verify Add delete add round-trip operation verification
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<byte>();
      set.add(1);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(1);
      set.delete(1);
      expect(set.has(1)).assertFalse();
      expect(set.size).assertEqual(0);
      set.add(1);
      expect(set.has(1)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd137
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1370
     * @tc.desc Verify add int.MinValue+1 boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(-2147483647);
      expect(set.has(-2147483647)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd138
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1380
     * @tc.desc Verify add int.MaxValue-1 boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(2147483646);
      expect(set.has(2147483646)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd139
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1390
     * @tc.desc Verify add long.MinValue+1 boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>();
      let nearMinLong: long = -9223372036854775807;
      set.add(nearMinLong);
      expect(set.has(nearMinLong)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd140
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1400
     * @tc.desc Verify add long.MaxValue-1 boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<long> = new Set<long>();
      let nearMaxLong: long = 9223372036854775806;
      set.add(nearMaxLong);
      expect(set.has(nearMaxLong)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd141
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1410
     * @tc.desc Verify add -Float.MIN_VALUE boundary value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<double>();
      set.add(-1.4e-45);
      expect(set.has(-1.4e-45)).assertTrue();
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd142
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1420
     * @tc.desc Verify copy via iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set1 = new Set<int>([1, 2]);
      let set2 = new Set<int>();
      for (const v of set1) { set2.add(v); }
      set2.add(3);
      set2.add(4);
      expect(set2.size).assertEqual(4);
      expect(set2.has(1)).assertTrue();
      expect(set2.has(4)).assertTrue();
    });

    /**
     * @tc.name testSetAdd143
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1430
     * @tc.desc Verify generic unionType
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int | string>();
      set.add(1);
      set.add("a");
      expect(set.size).assertEqual(2);
      expect(set.has(1)).assertTrue();
      expect(set.has("a")).assertTrue();
    });

    /**
     * @tc.name testSetAdd144
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1440
     * @tc.desc Verify add and has on Set\<int\>
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      set.add(42);
      expect(set.has(42)).assertTrue();
    });

    /**
     * @tc.name testSetAdd145
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1450
     * @tc.desc Verify sequentialMulti
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 10; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(10);
    });

    /**
     * @tc.name testSetAdd146
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1460
     * @tc.desc Verify largeSet
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set = new Set<int>();
      for (let i: int = 0; i < 1000; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(1000);
      expect(set.has(999)).assertTrue();
    });

    /**
     * @tc.name testSetAdd147
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1470
     * @tc.desc Verify add Double.NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(Double.NaN);
      expect(s.has(Double.NaN)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd148
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1480
     * @tc.desc Verify add Double.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(Double.POSITIVE_INFINITY);
      expect(s.has(Double.POSITIVE_INFINITY)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd149
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1490
     * @tc.desc Verify add Double.NEGATIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(Double.NEGATIVE_INFINITY);
      expect(s.has(Double.NEGATIVE_INFINITY)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd150
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1500
     * @tc.desc Verify binary valueAndStatic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerSet: Set<byte> = new Set<byte>();
      innerSet.add(0b1010 as byte);
      innerSet.add(-1 as byte);
      innerSet.add(-1 as byte);
      const outerSet: Set<Set<byte>> = new Set<Set<byte>>();
      outerSet.add(innerSet);
      expect(outerSet.size).assertEqual(1);
      expect(outerSet.has(innerSet)).assertTrue();
      let count = 0;
      for (let s of outerSet.values()) {
        count++;
        expect(s.has(0b1010 as byte)).assertTrue();
        expect(s.has(-1 as byte)).assertTrue();
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd151
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1510
     * @tc.desc Verify Set<Set<byte>> add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerSet: Set<byte> = new Set<byte>();
      innerSet.add(0b1010 as byte);
      innerSet.add(-1 as byte);
      const outerSet: Set<Set<byte>> = new Set<Set<byte>>([innerSet]);
      expect(outerSet.size).assertEqual(1);
      expect(outerSet.has(innerSet)).assertTrue();
    });

    /**
     * @tc.name testSetAdd152
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1520
     * @tc.desc Verify Set<Set<byte>> add (no-arg)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerSet: Set<byte> = new Set<byte>();
      innerSet.add(0b1010 as byte);
      innerSet.add(-1 as byte);
      const outerSet: Set<Set<byte>> = new Set<Set<byte>>();
      outerSet.add(innerSet);

      expect(outerSet.size).assertEqual(1);
      expect(outerSet.has(innerSet)).assertTrue();
    });

    /**
     * @tc.name testSetAdd153
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1530
     * @tc.desc Verify add Number.EPSILON * 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(Number.EPSILON * 2);
      expect(s.has(Number.EPSILON * 2)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd154
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1540
     * @tc.desc Verify 1.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(1.0);
      expect(s.has(1.0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd155
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1550
     * @tc.desc Verify returnThis
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(10);
      const returned: Set<int> = set.add(20);
      returned.add(30);
      expect(set.size).assertEqual(3);
      expect(set.has(10)).assertTrue();
      expect(set.has(20)).assertTrue();
      expect(set.has(30)).assertTrue();
      set.add(2).add(3).add(4);
      expect(set.size).assertEqual(6);
    });

    /**
     * @tc.name testSetAdd156
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1560
     * @tc.desc Verify add +0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(+0.0);
      expect(s.has(+0.0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd157
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1570
     * @tc.desc Verify add -0.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<double> = new Set<double>();
      s.add(-0.0);
      expect(s.has(-0.0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd158
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1580
     * @tc.desc Verify add 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(0);
      expect(s.has(0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd159
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1590
     * @tc.desc Verify add -0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>();
      s.add(-0);
      expect(s.has(-0)).assertTrue();
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd160
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1600
     * @tc.desc Verify Set<float> chain add with Float.POSITIVE_INFINITY
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<float> = new Set<float>();
      set.add(1.0 as float).add(Float.NEGATIVE_INFINITY).add(Float.POSITIVE_INFINITY);
      expect(set.size).assertEqual(3);
      expect(set.has(Float.NEGATIVE_INFINITY)).assertTrue();
    });

    /**
     * @tc.name testSetAdd161
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1610
     * @tc.desc Verify chain call add(1).add(2).add(3).delete(2).has(1) returns set ref
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<int> = new Set<int>();
      set.add(1).add(2).add(3);
      expect(set.delete(2)).assertTrue();
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertFalse();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetAdd162
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1620
     * @tc.desc Verify Set<Date> add: same ref dedup, different ref same value NOT dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Date> = new Set<Date>();
      const d = new Date(2025, 0, 1);
      set.add(d);
      set.add(d);
      expect(set.size).assertEqual(1);
      set.add(new Date(2025, 0, 1));
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd163
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1630
     * @tc.desc Verify Set<RegExp> add: literal vs constructor refs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<RegExp> = new Set<RegExp>();
      const r1 = new RegExp("abc");
      const r2 = new RegExp("abc");
      set.add(r1);
      set.add(r2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd164
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1640
     * @tc.desc Verify Set<ObjTest> add: same ref dedup, different ref same value NOT dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<ObjTest> = new Set<ObjTest>();
      const obj = new ObjTest(1);
      set.add(obj);
      set.add(obj);
      expect(set.size).assertEqual(1);
      set.add(new ObjTest(1));
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd165
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1650
     * @tc.desc Verify Set<Map> add Map instances with ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('key', 42);
      const m2 = new Map<string, number>();
      m2.set('key', 42);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m1);
      set.add(m2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd166
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1660
     * @tc.desc Verify Set<Map> add Map instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('key', 42);
      const m2 = new Map<string, number>();
      m2.set('key', 42);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([m1, m2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd167
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1670
     * @tc.desc Verify Set<Map> add Map instances with array constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m1 = new Map<string, number>();
      m1.set('key', 42);
      const m2 = new Map<string, number>();
      m2.set('key', 42);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>();
      set.add(m1);
      set.add(m2);

      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd168
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1680
     * @tc.desc Verify Set<Set<int>> nested Set add with ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer: Set<Set<int>> = new Set<Set<int>>();
      const s1 = new Set<int>([1, 2]);
      const s2 = new Set<int>([1, 2]);
      outer.add(s1);
      outer.add(s2);
      expect(outer.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd169
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1690
     * @tc.desc Verify Set<Set<int>> nested Set add with array constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1 = new Set<int>([1, 2]);
      const s2 = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>([s1, s2]);
      expect(outer.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd170
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1700
     * @tc.desc Verify Set<Set<int>> nested Set add with array constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1 = new Set<int>([1, 2]);
      const s2 = new Set<int>([1, 2]);
      const outer: Set<Set<int>> = new Set<Set<int>>();
      outer.add(s1);
      outer.add(s2);

      expect(outer.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd171
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1710
     * @tc.desc Verify Set<Record> add with ref-based dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Record<string, int>> = new Set<Record<string, int>>();
      const r1: Record<string, int> = { 'x': 1 };
      const r2: Record<string, int> = { 'x': 1 };
      set.add(r1);
      set.add(r2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd172
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1720
     * @tc.desc Verify Set<Record> add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'x': 1 };
      const r2: Record<string, int> = { 'x': 1 };
      const s: Set<Record<string, int>> = new Set<Record<string, int>>([r1, r2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd173
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1730
     * @tc.desc Verify Set<Record> add with array constructor (no-arg add)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: Record<string, int> = { 'x': 1 };
      const r2: Record<string, int> = { 'x': 1 };
      const s: Set<Record<string, int>> = new Set<Record<string, int>>();
      s.add(r1);
      s.add(r2);

      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd174
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1740
     * @tc.desc Verify Set<Int8Array> add TypedArray with ref semantics
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Int8Array> = new Set<Int8Array>();
      const a1 = new Int8Array([1, 2]);
      const a2 = new Int8Array([1, 2]);
      set.add(a1);
      set.add(a2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd175
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1750
     * @tc.desc Verify Set<WeakMap> add WeakMap instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<WeakMap<object, number>> = new Set<WeakMap<object, number>>();
      const wm = new WeakMap<object, number>();
      set.add(wm);
      set.add(wm);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd176
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1760
     * @tc.desc Verify Set<WeakSet> add WeakSet instances
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<WeakSet<object>> = new Set<WeakSet<object>>();
      const ws = new WeakSet<object>();
      set.add(ws);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd177
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1770
     * @tc.desc Verify Set<Error> add Error instances: same ref dedup, different ref NOT dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Error> = new Set<Error>();
      const e1 = new Error('msg');
      const e2 = new Error('msg');
      set.add(e1);
      set.add(e2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd178
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1780
     * @tc.desc Verify Set<Set<Set<int>>> triple nested Set add
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l3: Set<Set<Set<int>>> = new Set<Set<Set<int>>>();
      const inner: Set<int> = new Set<int>([1, 2]);
      const mid: Set<Set<int>> = new Set<Set<int>>();
      mid.add(inner);
      l3.add(mid);
      expect(l3.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd179
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1790
     * @tc.desc Verify Set<Map<string, Set<int>>> mixed generic nesting
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Map<string, Set<int>>> = new Set<Map<string, Set<int>>>();
      const inner: Set<int> = new Set<int>([1, 2]);
      const m: Map<string, Set<int>> = new Map<string, Set<int>>();
      m.set('key', inner);
      set.add(m);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd180
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1800
     * @tc.desc Verify Set<number[]> add array-typed elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<number[]> = new Set<number[]>();
      const a1: number[] = [1, 2, 3];
      const a2: number[] = [1, 2, 3];
      set.add(a1);
      set.add(a2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd181
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1810
     * @tc.desc Verify Set<Promise<Set<int>>> nested Promise generic
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Promise<Set<int>>> = new Set<Promise<Set<int>>>();
      const inner: Set<int> = new Set<int>([42]);
      const p: Promise<Set<int>> = Promise.resolve(inner);
      set.add(p);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd182
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1820
     * @tc.desc Verify Set<Record<string, number[]>> Record with array value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<Record<string, number[]>> = new Set<Record<string, number[]>>();
      const r1: Record<string, number[]> = { 'a': [1, 2] };
      const r2: Record<string, number[]> = { 'a': [1, 2] };
      set.add(r1);
      set.add(r2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd183
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1830
     * @tc.desc Verify Set<bigint> add with value dedup and BigInt constructor from hex
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<bigint> = new Set<bigint>();
      set.add(0n);
      set.add(1n);
      set.add(BigInt(0xFF));
      set.add(1n);
      expect(set.size).assertEqual(3);
      expect(set.has(BigInt(0xFF))).assertTrue();
    });

    /**
     * @tc.name testSetAdd184
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1840
     * @tc.desc Verify Set<char> add single chars and Unicode with c prefix
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'a');
      set.add(c'中');
      set.add(c'\n');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd185
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1850
     * @tc.desc Verify Set<char> dedup same char value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'Z');
      set.add(c'Z');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name testSetAdd186
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1860
     * @tc.desc Verify Set<char> chain add with digit and letter chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<char> = new Set<char>();
      set.add(c'0').add(c'A').add(c'z');
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name testSetAdd187
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1870
     * @tc.desc Verify Set<object> add POJO: same ref dedup, different refs counted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<object> = new Set<object>();
      const obj1: object = new ObjTest(1);
      const obj2: object = new ObjTest(1);
      set.add(obj1);
      set.add(obj1);
      set.add(obj2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name testSetAdd188
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_SETADD_P1_1880
     * @tc.desc Verify Set<jsonx.JsonElement> add JSON parsed objects: same ref dedup
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetAdd188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: Set<jsonx.JsonElement> = new Set<jsonx.JsonElement>();
      const j1: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      const j2: jsonx.JsonElement = JSON.parseJsonElement('{"a":1}');
      set.add(j1);
      set.add(j1);
      set.add(j2);
      expect(set.size).assertEqual(2);
    });
  });
}

