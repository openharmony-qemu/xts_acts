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
 * WITHOUT WARRANTIES OR CONDITIONS OF ESObject KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

const PERM_READ: number = 1 << 0
const PERM_WRITE: number = 1 << 1
const PERM_EXEC: number = 1 << 2

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function BitwiseOperatorTest() {
  describe('BitwiseOperatorTest', () => {
    beforeAll(() => {
    });
    beforeEach(async() => {
      await sleep(30)
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0110
     * @tc.name testBitwiseOperator001
     * @tc.desc Verify 15 & 9 等于 9（1111 & 1001 = 1001）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(15 & 9).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0120
     * @tc.name testBitwiseOperator002
     * @tc.desc Verify 相同值按位与（结果不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 & 42).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0130
     * @tc.name testBitwiseOperator003
     * @tc.desc Verify 按位与0（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 & 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0140
     * @tc.name testBitwiseOperator004
     * @tc.desc Verify 按位与-1（结果不变，-1为全1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 & (-1)).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0150
     * @tc.name testBitwiseOperator005
     * @tc.desc Verify 按位与1（取最低位/奇偶判断）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(7 & 1).assertEqual(1)
      expect(8 & 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0160
     * @tc.name testBitwiseOperator006
     * @tc.desc Verify 按位与自身掩码（提取特定位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF & 0x0F).assertEqual(0x0F)
      expect(0xAB & 0x0F).assertEqual(0x0B)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0170
     * @tc.name testBitwiseOperator007
     * @tc.desc Verify 负数与正数按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) & 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0180
     * @tc.name testBitwiseOperator008
     * @tc.desc Verify 两个负数按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-16) & (-9)).assertEqual(-16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0190
     * @tc.name testBitwiseOperator009
     * @tc.desc Verify 负数与0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42) & 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0200
     * @tc.name testBitwiseOperator010
     * @tc.desc Verify 负数与-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42) & (-1)).assertEqual(-42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0210
     * @tc.name testBitwiseOperator011
     * @tc.desc Verify 0 & 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 & 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0220
     * @tc.name testBitwiseOperator012
     * @tc.desc Verify -1 & -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) & (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0230
     * @tc.name testBitwiseOperator013
     * @tc.desc Verify 2147483647（MAX_INT32）&自身
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483647 & 2147483647).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0240
     * @tc.name testBitwiseOperator014
     * @tc.desc Verify -2147483648（MIN_INT32）& -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) & (-1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0250
     * @tc.name testBitwiseOperator015
     * @tc.desc Verify 超过32位的数截断后按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x100000000 as ESObject) & 0xFF).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0260
     * @tc.name testBitwiseOperator016
     * @tc.desc Verify 数字字符串按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("15" as ESObject) & ("9" as ESObject)).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0270
     * @tc.name testBitwiseOperator017
     * @tc.desc Verify 非数字字符串转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0280
     * @tc.name testBitwiseOperator018
     * @tc.desc Verify 空字符串转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0290
     * @tc.name testBitwiseOperator019
     * @tc.desc Verify true & true（1 & 1 = 1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) & (true as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0300
     * @tc.name testBitwiseOperator020
     * @tc.desc Verify false & 任意值（0 & x = 0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) & (5 as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0310
     * @tc.name testBitwiseOperator021
     * @tc.desc Verify null转0后按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0320
     * @tc.name testBitwiseOperator022
     * @tc.desc Verify undefined转NaN再转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0330
     * @tc.name testBitwiseOperator023
     * @tc.desc Verify NaN转0后按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0340
     * @tc.name testBitwiseOperator024
     * @tc.desc Verify Infinity转0后按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0350
     * @tc.name testBitwiseOperator025
     * @tc.desc Verify 使用掩码提取低8位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0x1234 & 0xFF).assertEqual(0x34)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0360
     * @tc.name testBitwiseOperator026
     * @tc.desc Verify 使用掩码提取高8位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x1234 >> 8) & 0xFF).assertEqual(0x12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0370
     * @tc.name testBitwiseOperator027
     * @tc.desc Verify 用 & 1 判断奇偶
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(99 & 1).assertEqual(1)
      expect(100 & 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0380
     * @tc.name testBitwiseOperator028
     * @tc.desc Verify 清零低4位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF & 0xF0).assertEqual(0xF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0390
     * @tc.name testBitwiseOperator029
     * @tc.desc Verify 15 | 9 等于 15（1111 | 1001 = 1111）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(15 | 9).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0400
     * @tc.name testBitwiseOperator030
     * @tc.desc Verify 相同值按位或（结果不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 | 42).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0410
     * @tc.name testBitwiseOperator031
     * @tc.desc Verify 按位或0（结果不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 | 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0420
     * @tc.name testBitwiseOperator032
     * @tc.desc Verify 按位或-1（结果为-1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 | (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0430
     * @tc.name testBitwiseOperator033
     * @tc.desc Verify 负数与正数按位或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) | 5).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0440
     * @tc.name testBitwiseOperator034
     * @tc.desc Verify 负数与0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42) | 0).assertEqual(-42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0450
     * @tc.name testBitwiseOperator035
     * @tc.desc Verify 0 | 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 | 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0460
     * @tc.name testBitwiseOperator036
     * @tc.desc Verify -1 | -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) | (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0470
     * @tc.name testBitwiseOperator037
     * @tc.desc Verify 超过32位的数截断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x100000001 as ESObject) | 0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0480
     * @tc.name testBitwiseOperator038
     * @tc.desc Verify 数字字符串按位或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("15" as ESObject) | ("9" as ESObject)).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0490
     * @tc.name testBitwiseOperator039
     * @tc.desc Verify 非数字字符串转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) | 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0500
     * @tc.name testBitwiseOperator040
     * @tc.desc Verify 空字符串转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) | 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0510
     * @tc.name testBitwiseOperator041
     * @tc.desc Verify true | false（1 | 0 = 1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) | (false as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0520
     * @tc.name testBitwiseOperator042
     * @tc.desc Verify false | false（0 | 0 = 0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) | (false as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0530
     * @tc.name testBitwiseOperator043
     * @tc.desc Verify null转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) | 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0540
     * @tc.name testBitwiseOperator044
     * @tc.desc Verify undefined转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) | 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0550
     * @tc.name testBitwiseOperator045
     * @tc.desc Verify NaN转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN | 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0560
     * @tc.name testBitwiseOperator046
     * @tc.desc Verify Infinity转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity | 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0570
     * @tc.name testBitwiseOperator047
     * @tc.desc Verify 设置标志位（位1和位3）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flags: number = 0
      flags = flags | 0x02 | 0x08
      expect(flags).assertEqual(0x0A)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0580
     * @tc.name testBitwiseOperator048
     * @tc.desc Verify 正浮点数 | 0 取整
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.7 | 0).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0590
     * @tc.name testBitwiseOperator049
     * @tc.desc Verify 负浮点数 | 0 取整（向零取整）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(-3.7 | 0).assertEqual(-3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0600
     * @tc.name testBitwiseOperator050
     * @tc.desc Verify 大数 | 0 截断为32位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483648 | 0).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0610
     * @tc.name testBitwiseOperator051
     * @tc.desc Verify 15 ^ 9 等于 6（1111 ^ 1001 = 0110）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(15 ^ 9).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0620
     * @tc.name testBitwiseOperator052
     * @tc.desc Verify 相同值按位异或（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 ^ 42).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0630
     * @tc.name testBitwiseOperator053
     * @tc.desc Verify 按位异或0（结果不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 ^ 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0640
     * @tc.name testBitwiseOperator054
     * @tc.desc Verify 按位异或-1（等价于按位取反）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 ^ (-1)).assertEqual(-43)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0650
     * @tc.name testBitwiseOperator055
     * @tc.desc Verify 负数与正数按位异或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) ^ 5).assertEqual(-6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0660
     * @tc.name testBitwiseOperator056
     * @tc.desc Verify 两个负数按位异或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-5) ^ (-3)).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0670
     * @tc.name testBitwiseOperator057
     * @tc.desc Verify 0 ^ 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 ^ 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0680
     * @tc.name testBitwiseOperator058
     * @tc.desc Verify -1 ^ -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) ^ (-1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0690
     * @tc.name testBitwiseOperator059
     * @tc.desc Verify MAX_INT32 ^ 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483647 ^ 0).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0700
     * @tc.name testBitwiseOperator060
     * @tc.desc Verify 数字字符串按位异或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("15" as ESObject) ^ ("9" as ESObject)).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0710
     * @tc.name testBitwiseOperator061
     * @tc.desc Verify 非数字字符串转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0720
     * @tc.name testBitwiseOperator062
     * @tc.desc Verify true ^ false（1 ^ 0 = 1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) ^ (false as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0730
     * @tc.name testBitwiseOperator063
     * @tc.desc Verify null转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0740
     * @tc.name testBitwiseOperator064
     * @tc.desc Verify undefined转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0750
     * @tc.name testBitwiseOperator065
     * @tc.desc Verify NaN转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0760
     * @tc.name testBitwiseOperator066
     * @tc.desc Verify Infinity转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0770
     * @tc.name testBitwiseOperator067
     * @tc.desc Verify a ^ b == b ^ a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((15 ^ 9) === (9 ^ 15)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0780
     * @tc.name testBitwiseOperator068
     * @tc.desc Verify (a ^ b) ^ c == a ^ (b ^ c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((5 ^ 3) ^ 7) === (5 ^ (3 ^ 7))).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0790
     * @tc.name testBitwiseOperator069
     * @tc.desc Verify a ^ b ^ b == a（异或同一值两次恢复原值）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 ^ 99 ^ 99).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0800
     * @tc.name testBitwiseOperator070
     * @tc.desc Verify a ^ 0 == a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 ^ 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0810
     * @tc.name testBitwiseOperator071
     * @tc.desc Verify 使用异或交换两个整数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10, b: number = 20
      a = a ^ b
      b = a ^ b
      a = a ^ b
      expect(a).assertEqual(20)
      expect(b).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0820
     * @tc.name testBitwiseOperator072
     * @tc.desc Verify 使用异或进行简单加密解密
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: number = 0xAA
      let data: number = 0x55
      let encrypted: number = data ^ key
      let decrypted: number = encrypted ^ key
      expect(decrypted).assertEqual(data)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0830
     * @tc.name testBitwiseOperator073
     * @tc.desc Verify 异或找出数组中唯一出现一次的数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [2, 3, 2, 3, 5]
      let result: number = arr.reduce((acc, n) => acc ^ n, 0)
      expect(result).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0840
     * @tc.name testBitwiseOperator074
     * @tc.desc Verify 翻转第2位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1010 ^ 0b0100).assertEqual(0b1110)
      expect(0b1110 ^ 0b0100).assertEqual(0b1010)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0850
     * @tc.name testBitwiseOperator075
     * @tc.desc Verify ~15 等于 -16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~15).assertEqual(-16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0860
     * @tc.name testBitwiseOperator076
     * @tc.desc Verify ~9 等于 -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~9).assertEqual(-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0870
     * @tc.name testBitwiseOperator077
     * @tc.desc Verify ~0 等于 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~0).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0880
     * @tc.name testBitwiseOperator078
     * @tc.desc Verify ~1 等于 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~1).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0890
     * @tc.name testBitwiseOperator079
     * @tc.desc Verify ~(-1) 等于 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0900
     * @tc.name testBitwiseOperator080
     * @tc.desc Verify ~(-16) 等于 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-16)).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0910
     * @tc.name testBitwiseOperator081
     * @tc.desc Verify ~(-10) 等于 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-10)).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0920
     * @tc.name testBitwiseOperator082
     * @tc.desc Verify ~x 等价于 -(x+1)（正数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~42).assertEqual(-(42 + 1))
      expect(~100).assertEqual(-101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0930
     * @tc.name testBitwiseOperator083
     * @tc.desc Verify ~x 等价于 -(x+1)（负数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-42)).assertEqual(-((-42) + 1))
      expect(~(-42)).assertEqual(41)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0940
     * @tc.name testBitwiseOperator084
     * @tc.desc Verify 双重取反恢复原值（截断为32位整数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~~42).assertEqual(42)
      expect(~~(-42)).assertEqual(-42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0950
     * @tc.name testBitwiseOperator085
     * @tc.desc Verify ~~ 用于向下取整
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~~(-3.7)).assertEqual(-3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0960
     * @tc.name testBitwiseOperator086
     * @tc.desc Verify ~MAX_INT32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~2147483647).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_0970
     * @tc.name testBitwiseOperator087
     * @tc.desc Verify ~MIN_INT32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-2147483648)).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1060
     * @tc.name testBitwiseOperator096
     * @tc.desc Verify NaN取反（转0再取反 = -1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~NaN).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1070
     * @tc.name testBitwiseOperator097
     * @tc.desc Verify Infinity取反（转0再取反 = -1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~Infinity).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1080
     * @tc.name testBitwiseOperator098
     * @tc.desc Verify 使用 ~indexOf 判断是否找到
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hello world"
      expect(~str.indexOf("world") ).assertEqual(-7)
      expect(~str.indexOf("xyz") === 0).assertTrue()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1100
     * @tc.name testBitwiseOperator100
     * @tc.desc Verify ~~ 对负数的行为（向零取整）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~~(-3.999)).assertEqual(-3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1110
     * @tc.name testBitwiseOperator101
     * @tc.desc Verify 9 << 2 等于 36（1001 → 100100）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(9 << 2).assertEqual(36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1120
     * @tc.name testBitwiseOperator102
     * @tc.desc Verify 1 << 1 等于 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 1).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1130
     * @tc.name testBitwiseOperator103
     * @tc.desc Verify 1 << 3 等于 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 3).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1140
     * @tc.name testBitwiseOperator104
     * @tc.desc Verify 0 << 任意位等于0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 << 10).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1150
     * @tc.name testBitwiseOperator105
     * @tc.desc Verify 左移0位（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 << 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1160
     * @tc.name testBitwiseOperator106
     * @tc.desc Verify 1 << n 等于 2的n次方
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 0).assertEqual(1)
      expect(1 << 1).assertEqual(2)
      expect(1 << 2).assertEqual(4)
      expect(1 << 4).assertEqual(16)
      expect(1 << 8).assertEqual(256)
      expect(1 << 16).assertEqual(65536)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1170
     * @tc.name testBitwiseOperator107
     * @tc.desc Verify 负数左移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-9) << 2).assertEqual(-36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1180
     * @tc.name testBitwiseOperator108
     * @tc.desc Verify -1左移1位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) << 1).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1190
     * @tc.name testBitwiseOperator109
     * @tc.desc Verify 移位32位等于移位0位（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 32).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1200
     * @tc.name testBitwiseOperator110
     * @tc.desc Verify 移位33位等于移位1位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 33).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1210
     * @tc.name testBitwiseOperator111
     * @tc.desc Verify 移位31位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 31).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1220
     * @tc.name testBitwiseOperator112
     * @tc.desc Verify 移位负数位（-1模32等于31）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << (-1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1230
     * @tc.name testBitwiseOperator113
     * @tc.desc Verify 移位NaN（NaN转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 << NaN).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1240
     * @tc.name testBitwiseOperator114
     * @tc.desc Verify 移位Infinity（转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 << Infinity).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1250
     * @tc.name testBitwiseOperator115
     * @tc.desc Verify 左移导致符号位翻转
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0x40000000 << 1).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1260
     * @tc.name testBitwiseOperator116
     * @tc.desc Verify 左移丢弃高位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483647) << 1).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1270
     * @tc.name testBitwiseOperator117
     * @tc.desc Verify 数字字符串左移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("9" as ESObject) << ("2" as ESObject)).assertEqual(36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1280
     * @tc.name testBitwiseOperator118
     * @tc.desc Verify 非数字字符串左移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) << 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1290
     * @tc.name testBitwiseOperator119
     * @tc.desc Verify true左移（1 << n）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) << 3).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1300
     * @tc.name testBitwiseOperator120
     * @tc.desc Verify null左移（0 << n）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) << 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1310
     * @tc.name testBitwiseOperator121
     * @tc.desc Verify NaN左移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN << 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1320
     * @tc.name testBitwiseOperator122
     * @tc.desc Verify 左移1位等价于乘2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 << 1).assertEqual(10)
      expect(5 << 2).assertEqual(20)
      expect(5 << 3).assertEqual(40)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1330
     * @tc.name testBitwiseOperator123
     * @tc.desc Verify 使用左移生成RGB颜色
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: number = 255, g: number = 128, b: number = 0
      let color: number = (r << 16) | (g << 8) | b
      expect(color).assertEqual(0xFF8000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1340
     * @tc.name testBitwiseOperator124
     * @tc.desc Verify 9 >> 2 等于 2（1001 → 10）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(9 >> 2).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1350
     * @tc.name testBitwiseOperator125
     * @tc.desc Verify 8 >> 2 等于 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(8 >> 2).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1360
     * @tc.name testBitwiseOperator126
     * @tc.desc Verify 右移0位（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 >> 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1370
     * @tc.name testBitwiseOperator127
     * @tc.desc Verify 右移到全零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(255 >> 31).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1380
     * @tc.name testBitwiseOperator128
     * @tc.desc Verify 1 >> 1 等于 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 >> 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1390
     * @tc.name testBitwiseOperator129
     * @tc.desc Verify -9 >> 2 等于 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-9) >> 2).assertEqual(-3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1400
     * @tc.name testBitwiseOperator130
     * @tc.desc Verify -1 >> 任意位仍为-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >> 1).assertEqual(-1)
      expect((-1) >> 31).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1410
     * @tc.name testBitwiseOperator131
     * @tc.desc Verify -8 >> 2 等于 -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-8) >> 2).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1420
     * @tc.name testBitwiseOperator132
     * @tc.desc Verify -2147483648 >> 31 等于 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >> 31).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1430
     * @tc.name testBitwiseOperator133
     * @tc.desc Verify 移位32位等于移位0位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 >> 32).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1440
     * @tc.name testBitwiseOperator134
     * @tc.desc Verify 移位33位等于移位1位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 >> 33).assertEqual(21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1450
     * @tc.name testBitwiseOperator135
     * @tc.desc Verify 移位NaN（转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 >> NaN).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1460
     * @tc.name testBitwiseOperator136
     * @tc.desc Verify 移位Infinity（转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 >> Infinity).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1470
     * @tc.name testBitwiseOperator137
     * @tc.desc Verify 数字字符串右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("9" as ESObject) >> ("2" as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1480
     * @tc.name testBitwiseOperator138
     * @tc.desc Verify 非数字字符串右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) >> 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1490
     * @tc.name testBitwiseOperator139
     * @tc.desc Verify true右移（1 >> 1 = 0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) >> 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1500
     * @tc.name testBitwiseOperator140
     * @tc.desc Verify NaN右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN >> 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1510
     * @tc.name testBitwiseOperator141
     * @tc.desc Verify 右移1位等价于除2（向下取整）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(10 >> 1).assertEqual(5)
      expect(7 >> 1).assertEqual(3)
      expect((-7) >> 1).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1520
     * @tc.name testBitwiseOperator142
     * @tc.desc Verify 右移后掩码提取
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x12345678 >> 8) & 0xFF).assertEqual(0x56)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1530
     * @tc.name testBitwiseOperator143
     * @tc.desc Verify 19 >>> 2 等于 4（10011 → 100）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(19 >>> 2).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1540
     * @tc.name testBitwiseOperator144
     * @tc.desc Verify 正数右移与带符号右移结果一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 >>> 2).assertEqual(42 >> 2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1550
     * @tc.name testBitwiseOperator145
     * @tc.desc Verify 右移0位（值不变，但截断为32位无符号）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 >>> 0).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1560
     * @tc.name testBitwiseOperator146
     * @tc.desc Verify -9 >>> 2 等于 1073741821
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-9) >>> 2).assertEqual(1073741821)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1570
     * @tc.name testBitwiseOperator147
     * @tc.desc Verify -1 >>> 0 等于 4294967295（转为无符号32位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 0).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1580
     * @tc.name testBitwiseOperator148
     * @tc.desc Verify -1 >>> 1 等于 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 1).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1590
     * @tc.name testBitwiseOperator149
     * @tc.desc Verify -1 >>> 31 等于 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 31).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1600
     * @tc.name testBitwiseOperator150
     * @tc.desc Verify -1 >>> 32 等于 4294967295（移位32等于移位0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 32).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1610
     * @tc.name testBitwiseOperator151
     * @tc.desc Verify MIN_INT32 >>> 0 等于 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >>> 0).assertEqual(2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1620
     * @tc.name testBitwiseOperator152
     * @tc.desc Verify 正数时 >>> 和 >> 结果相同
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 >>> 3).assertEqual(100 >> 3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1630
     * @tc.name testBitwiseOperator153
     * @tc.desc Verify 负数时 >>> 和 >> 结果不同
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42) >>> 1).assertEqual(2147483627)
      expect((-42) >> 1).assertEqual(-21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1640
     * @tc.name testBitwiseOperator154
     * @tc.desc Verify -1 >> 1 仍为 -1，但 -1 >>> 1 为 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >> 1).assertEqual(-1)
      expect((-1) >>> 1).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1650
     * @tc.name testBitwiseOperator155
     * @tc.desc Verify 移位32位等于移位0位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 32).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1660
     * @tc.name testBitwiseOperator156
     * @tc.desc Verify 移位33位等于移位1位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 33).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1670
     * @tc.name testBitwiseOperator157
     * @tc.desc Verify 移位NaN（转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> NaN).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1680
     * @tc.name testBitwiseOperator158
     * @tc.desc Verify 数字字符串无符号右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("19" as ESObject) >>> ("2" as ESObject)).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1690
     * @tc.name testBitwiseOperator159
     * @tc.desc Verify 非数字字符串（转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("abc" as ESObject) >>> 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1700
     * @tc.name testBitwiseOperator160
     * @tc.desc Verify NaN无符号右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN >>> 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1710
     * @tc.name testBitwiseOperator161
     * @tc.desc Verify Infinity无符号右移（转0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity >>> 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1720
     * @tc.name testBitwiseOperator162
     * @tc.desc Verify 使用 >>> 0 将负数转为无符号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 0).assertEqual(4294967295)
      expect((-42) >>> 0).assertEqual(4294967254)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1730
     * @tc.name testBitwiseOperator163
     * @tc.desc Verify 使用 >>> 0 将浮点数取整
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.7 >>> 0).assertEqual(3)
      expect((-3.7) >>> 0).assertEqual(4294967293)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1740
     * @tc.name testBitwiseOperator164
     * @tc.desc Verify 使用 >>> 0 将大数截断为32位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x100000002 as ESObject) >>> 0).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1750
     * @tc.name testBitwiseOperator165
     * @tc.desc Verify 使用 >>> 0 转换 Math.random 结果
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let random: number = (Math.random() * 100) >>> 0
      expect(random >= 0 && random < 100).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1760
     * @tc.name testBitwiseOperator166
     * @tc.desc Verify 移位优先于按位与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 3 & 5).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1770
     * @tc.name testBitwiseOperator167
     * @tc.desc Verify 按位与优先于按位或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 & 3 | 8).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1780
     * @tc.name testBitwiseOperator168
     * @tc.desc Verify 按位或优先于按位异或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(5 | 3 ^ 2).assertEqual(5 | (3 ^ 2))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1790
     * @tc.name testBitwiseOperator169
     * @tc.desc Verify 按位与优先于按位异或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(6 & 3 ^ 1).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1800
     * @tc.name testBitwiseOperator170
     * @tc.desc Verify 算术运算优先于移位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 + 2 << 2).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1810
     * @tc.name testBitwiseOperator171
     * @tc.desc Verify 使用括号明确优先级
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 << 2) + (3 << 1)).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1820
     * @tc.name testBitwiseOperator172
     * @tc.desc Verify ~ 优先于二元位运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~5 & 3).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1830
     * @tc.name testBitwiseOperator173
     * @tc.desc Verify ~ 优先于算术运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~5 + 1).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1840
     * @tc.name testBitwiseOperator174
     * @tc.desc Verify 设置特定位（OR）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0b00000000
      value = value | 0b00000100
      expect(value).assertEqual(4)
      value = value | 0b00100000
      expect(value).assertEqual(36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1850
     * @tc.name testBitwiseOperator175
     * @tc.desc Verify 清除特定位（AND NOT）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0b00100100
      value = value & ~0b00000100
      expect(value).assertEqual(32)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1860
     * @tc.name testBitwiseOperator176
     * @tc.desc Verify 检查特定位是否设置（AND）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0b00100100
      let bit2Set: boolean = (value & 0b00000100) !== 0
      let bit1Set: boolean = (value & 0b00000010) !== 0
      expect(bit2Set).assertTrue()
      expect(bit1Set).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1870
     * @tc.name testBitwiseOperator177
     * @tc.desc Verify 翻转特定位（XOR）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: number = 0b1010
      value = value ^ 0b0100
      expect(value).assertEqual(14)
      value = value ^ 0b0100
      expect(value).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1880
     * @tc.name testBitwiseOperator178
     * @tc.desc Verify ~(a & b) === ~a | ~b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 12, b: number = 10
      expect(~(a & b)).assertEqual((~a) | (~b))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1890
     * @tc.name testBitwiseOperator179
     * @tc.desc Verify ~(a | b) === ~a & ~b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 12, b: number = 10
      expect(~(a | b)).assertEqual((~a) & (~b))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1900
     * @tc.name testBitwiseOperator180
     * @tc.desc Verify AND由OR和NOT构成
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 12, b: number = 10
      expect(a & b).assertEqual(~(~a | ~b))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1910
     * @tc.name testBitwiseOperator181
     * @tc.desc Verify XOR由OR、AND、NOT构成
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 15, b: number = 9
      expect(a ^ b).assertEqual((a | b) & ~(a & b))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1920
     * @tc.name testBitwiseOperator182
     * @tc.desc Verify 使用位掩码管理权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const READ: number = 1
      const WRITE: number = 2
      const EXECUTE: number = 4
      let perms: number = READ | WRITE
      expect((perms & READ) !== 0).assertTrue()
      expect((perms & EXECUTE) !== 0).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1930
     * @tc.name testBitwiseOperator183
     * @tc.desc Verify 添加权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let perms: number = 1
      perms |= 2
      perms |= 4
      expect(perms).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1940
     * @tc.name testBitwiseOperator184
     * @tc.desc Verify 移除权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let perms: number = 7
      perms &= ~2
      expect(perms).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1950
     * @tc.name testBitwiseOperator185
     * @tc.desc Verify 切换权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let perms: number = 5
      perms ^= 2
      expect(perms).assertEqual(7)
      perms ^= 2
      expect(perms).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1960
     * @tc.name testBitwiseOperator186
     * @tc.desc Verify 从RGB颜色值提取各通道
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let color: number = 0xFF8000
      let r: number = (color >> 16) & 0xFF
      let g: number = (color >> 8) & 0xFF
      let b: number = color & 0xFF
      expect(r).assertEqual(255)
      expect(g).assertEqual(128)
      expect(b).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1970
     * @tc.name testBitwiseOperator187
     * @tc.desc Verify 组合RGB通道为颜色值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: number = 0x12, g: number = 0x34, b: number = 0x56
      let color: number = (r << 16) | (g << 8) | b
      expect(color).assertEqual(0x123456)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1980
     * @tc.name testBitwiseOperator188
     * @tc.desc Verify 大数按位与截断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0xFFFFFFFFFF as ESObject) & 0xFF).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_1990
     * @tc.name testBitwiseOperator189
     * @tc.desc Verify 浮点数截断为整数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.9 & 3.9).assertEqual(3)
      expect(3.1 | 0).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2010
     * @tc.name testBitwiseOperator191
     * @tc.desc Verify NaN转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN | 0).assertEqual(0)
      expect(NaN & 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2020
     * @tc.name testBitwiseOperator192
     * @tc.desc Verify Infinity转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity | 0).assertEqual(0)
      expect(-Infinity | 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2030
     * @tc.name testBitwiseOperator193
     * @tc.desc Verify undefined转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) | 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2040
     * @tc.name testBitwiseOperator194
     * @tc.desc Verify null转0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) | 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2050
     * @tc.name testBitwiseOperator195
     * @tc.desc Verify ~~ 正数与 Math.floor 结果一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~~(3.7)).assertEqual(Math.floor(3.7))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2060
     * @tc.name testBitwiseOperator196
     * @tc.desc Verify ~~ 负数与 Math.floor 结果不一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~~(-3.7)).assertEqual(-3)
      expect(Math.floor(-3.7)).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2070
     * @tc.name testBitwiseOperator197
     * @tc.desc Verify | 0 正数与 Math.trunc 结果一致
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.7 | 0).assertEqual(Math.trunc(3.7))
      expect((-3.7) | 0).assertEqual(Math.trunc(-3.7))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2080
     * @tc.name testBitwiseOperator198
     * @tc.desc Verify 二元位运算返回number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (15 & 9)).assertEqual("number")
      expect(typeof (15 | 9)).assertEqual("number")
      expect(typeof (15 ^ 9)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2090
     * @tc.name testBitwiseOperator199
     * @tc.desc Verify 移位运算返回number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (9 << 2)).assertEqual("number")
      expect(typeof (9 >> 2)).assertEqual("number")
      expect(typeof (9 >>> 2)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2100
     * @tc.name testBitwiseOperator200
     * @tc.desc Verify 一元位非返回number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (~15)).assertEqual("number")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2130
     * @tc.name testBitwiseOperator203
     * @tc.desc Verify | 0 与 Math.floor 性能等价验证（正数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: number[] = [1.1, 2.5, 3.9, 4.0]
      let results1: number[] = vals.map(v => v | 0)
      let results2: number[] = vals.map(v => Math.floor(v))
      expect(results1[0]).assertEqual(results2[0])
      expect(results1[2]).assertEqual(results2[2])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2140
     * @tc.name testBitwiseOperator204
     * @tc.desc Verify n > 0 且 (n & (n-1)) === 0 为2的幂
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isPow204(1)).assertTrue()
      expect(isPow204(2)).assertTrue()
      expect(isPow204(4)).assertTrue()
      expect(isPow204(256)).assertTrue()
      expect(isPow204(3)).assertFalse()
      expect(isPow204(100)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2150
     * @tc.name testBitwiseOperator205
     * @tc.desc Verify 使用位运算统计1的位数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(countOnes205(7)).assertEqual(3)
      expect(countOnes205(255)).assertEqual(8)
      expect(countOnes205(0)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2160
     * @tc.name testBitwiseOperator206
     * @tc.desc Verify 使用位运算取绝对值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fastAbs206(5)).assertEqual(5)
      expect(fastAbs206(-5)).assertEqual(5)
      expect(fastAbs206(0)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2170
     * @tc.name testBitwiseOperator207
     * @tc.desc Verify 使用位运算获取符号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(sign207(42)).assertEqual(1)
      expect(sign207(-42)).assertEqual(-1)
      expect(sign207(0)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2180
     * @tc.name testBitwiseOperator208
     * @tc.desc Verify 文档示例验证——15与9的所有位运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(15 & 9).assertEqual(9)
      expect(15 | 9).assertEqual(15)
      expect(15 ^ 9).assertEqual(6)
      expect(~15).assertEqual(-16)
      expect(~9).assertEqual(-10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2190
     * @tc.name testBitwiseOperator209
     * @tc.desc Verify 文档示例验证——移位运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(9 << 2).assertEqual(36)
      expect(9 >> 2).assertEqual(2)
      expect((-9) >> 2).assertEqual(-3)
      expect(19 >>> 2).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2200
     * @tc.name testBitwiseOperator210
     * @tc.desc Verify NaN参与所有位运算均视为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN & 5).assertEqual(0)
      expect(NaN | 5).assertEqual(5)
      expect(NaN ^ 5).assertEqual(5)
      expect(~NaN).assertEqual(-1)
      expect(NaN << 2).assertEqual(0)
      expect(NaN >> 2).assertEqual(0)
      expect(NaN >>> 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2210
     * @tc.name testBitwiseOperator211
     * @tc.desc Verify Infinity参与所有位运算均视为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Infinity & 5).assertEqual(0)
      expect(Infinity | 5).assertEqual(5)
      expect(Infinity ^ 5).assertEqual(5)
      expect(~Infinity).assertEqual(-1)
      expect(Infinity << 2).assertEqual(0)
      expect(Infinity >> 2).assertEqual(0)
      expect(Infinity >>> 2).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2220
     * @tc.name testBitwiseOperator212
     * @tc.desc Verify null参与所有位运算均视为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) & 5).assertEqual(0)
      expect((null as ESObject) | 5).assertEqual(5)
      expect((null as ESObject) ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2230
     * @tc.name testBitwiseOperator213
     * @tc.desc Verify undefined参与所有位运算均视为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) & 5).assertEqual(0)
      expect((undefined as ESObject) | 5).assertEqual(5)
      expect((undefined as ESObject) ^ 5).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2240
     * @tc.name testBitwiseOperator214
     * @tc.desc Verify 全1与全1等于全1（-1 & -1 = -1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) & (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2250
     * @tc.name testBitwiseOperator215
     * @tc.desc Verify 0b1111 & 0b0101 = 0b0101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1111 & 0b0101).assertEqual(0b0101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2260
     * @tc.name testBitwiseOperator216
     * @tc.desc Verify 0b1010 & 0b0101 = 0b0000（互补模式）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1010 & 0b0101).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2270
     * @tc.name testBitwiseOperator217
     * @tc.desc Verify 0b1100 & 0b1010 = 0b1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1100 & 0b1010).assertEqual(0b1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2280
     * @tc.name testBitwiseOperator218
     * @tc.desc Verify 0xFF & 0x0F 提取低字节
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF & 0x0F).assertEqual(0x0F)
      expect(0xAB & 0x0F).assertEqual(0x0B)
      expect(0xCD & 0x0F).assertEqual(0x0D)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2290
     * @tc.name testBitwiseOperator219
     * @tc.desc Verify 0xFFFF & 0xFF00 提取高字节
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFFFF & 0xFF00).assertEqual(0xFF00)
      expect(0xABCD & 0xFF00).assertEqual(0xAB00)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2300
     * @tc.name testBitwiseOperator220
     * @tc.desc Verify 第0位与运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b00000001 & 0b00000001).assertEqual(1)
      expect(0b00000010 & 0b00000001).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2310
     * @tc.name testBitwiseOperator221
     * @tc.desc Verify 第7位与运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b10000000 & 0b10000000).assertEqual(128)
      expect(0b01000000 & 0b10000000).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2320
     * @tc.name testBitwiseOperator222
     * @tc.desc Verify 多位同时与运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b11010110 & 0b10101010).assertEqual(130)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2330
     * @tc.name testBitwiseOperator223
     * @tc.desc Verify 0b0000 | 0b0000 = 0b0000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b0000 | 0b0000).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2340
     * @tc.name testBitwiseOperator224
     * @tc.desc Verify 0b1010 | 0b0101 = 0b1111（互补合并）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1010 | 0b0101).assertEqual(0b1111)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2350
     * @tc.name testBitwiseOperator225
     * @tc.desc Verify 0b1100 | 0b0011 = 0b1111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1100 | 0b0011).assertEqual(0b1111)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2360
     * @tc.name testBitwiseOperator226
     * @tc.desc Verify 0xF0 | 0x0F = 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xF0 | 0x0F).assertEqual(0xFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2370
     * @tc.name testBitwiseOperator227
     * @tc.desc Verify 部分重叠的或运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b11010110 | 0b10101010).assertEqual(0b11111110)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2380
     * @tc.name testBitwiseOperator228
     * @tc.desc Verify 相同位异或为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1111 ^ 0b1111).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2390
     * @tc.name testBitwiseOperator229
     * @tc.desc Verify 全0与任意异或不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b0000 ^ 0b1010).assertEqual(0b1010)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2400
     * @tc.name testBitwiseOperator230
     * @tc.desc Verify 互补异或为全1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1010 ^ 0b0101).assertEqual(0b1111)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2410
     * @tc.name testBitwiseOperator231
     * @tc.desc Verify 部分重叠异或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b11010110 ^ 0b10101010).assertEqual(0b01111100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2420
     * @tc.name testBitwiseOperator232
     * @tc.desc Verify 左移1位（乘2）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 1).assertEqual(2)
      expect(100 << 1).assertEqual(200)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2430
     * @tc.name testBitwiseOperator233
     * @tc.desc Verify 左移4位（乘16）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 4).assertEqual(16)
      expect(10 << 4).assertEqual(160)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2440
     * @tc.name testBitwiseOperator234
     * @tc.desc Verify 左移8位（乘256）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 8).assertEqual(256)
      expect(0xFF << 8).assertEqual(0xFF00)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2450
     * @tc.name testBitwiseOperator235
     * @tc.desc Verify 左移16位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 16).assertEqual(65536)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2460
     * @tc.name testBitwiseOperator236
     * @tc.desc Verify 左移30位（接近最大正整数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 30).assertEqual(1073741824)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2470
     * @tc.name testBitwiseOperator237
     * @tc.desc Verify 左移31位（符号位翻转，变负数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 31).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2480
     * @tc.name testBitwiseOperator238
     * @tc.desc Verify 移位0位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xABCDEF01 << 0).assertEqual(0xABCDEF01 | 0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2490
     * @tc.name testBitwiseOperator239
     * @tc.desc Verify 移位32位等于移位0位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(123 << 32).assertEqual(123)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2500
     * @tc.name testBitwiseOperator240
     * @tc.desc Verify 移位64位等于移位0位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(123 << 64).assertEqual(123)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2520
     * @tc.name testBitwiseOperator242
     * @tc.desc Verify 移位63位等于移位31位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 63).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2530
     * @tc.name testBitwiseOperator243
     * @tc.desc Verify 移位-1位（模32等于31）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << (-1)).assertEqual(1 << 31)
      expect(1 << (-1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2540
     * @tc.name testBitwiseOperator244
     * @tc.desc Verify 移位-31位（模32等于1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << (-31)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2550
     * @tc.name testBitwiseOperator245
     * @tc.desc Verify 移位-32位（模32等于0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << (-32)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2560
     * @tc.name testBitwiseOperator246
     * @tc.desc Verify 正数右移1位（除2向下取整）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(100 >> 1).assertEqual(50)
      expect(101 >> 1).assertEqual(50)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2570
     * @tc.name testBitwiseOperator247
     * @tc.desc Verify 正数右移4位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(256 >> 4).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2580
     * @tc.name testBitwiseOperator248
     * @tc.desc Verify 正数右移31位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483647 >> 31).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2590
     * @tc.name testBitwiseOperator249
     * @tc.desc Verify -2 >> 1 = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2) >> 1).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2600
     * @tc.name testBitwiseOperator250
     * @tc.desc Verify -3 >> 1 = -2（向下取整效果）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-3) >> 1).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2610
     * @tc.name testBitwiseOperator251
     * @tc.desc Verify -100 >> 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-100) >> 3).assertEqual(-13)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2620
     * @tc.name testBitwiseOperator252
     * @tc.desc Verify -2147483648 >> 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >> 1).assertEqual(-1073741824)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2640
     * @tc.name testBitwiseOperator254
     * @tc.desc Verify 负数右移32位等于移位0位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42) >> 32).assertEqual(-42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2650
     * @tc.name testBitwiseOperator255
     * @tc.desc Verify 负数右移33位等于移位1位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-42) >> 33).assertEqual(-21)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2660
     * @tc.name testBitwiseOperator256
     * @tc.desc Verify 移位负数位-1（模32等于31）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >> (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2670
     * @tc.name testBitwiseOperator257
     * @tc.desc Verify -1 >>> 0 = 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 0).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2680
     * @tc.name testBitwiseOperator258
     * @tc.desc Verify -1 >>> 1 = 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 1).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2690
     * @tc.name testBitwiseOperator259
     * @tc.desc Verify -1 >>> 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 4).assertEqual(268435455)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2700
     * @tc.name testBitwiseOperator260
     * @tc.desc Verify -1 >>> 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 16).assertEqual(65535)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2710
     * @tc.name testBitwiseOperator261
     * @tc.desc Verify -1 >>> 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 30).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2720
     * @tc.name testBitwiseOperator262
     * @tc.desc Verify -1 >>> 31 = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 31).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2730
     * @tc.name testBitwiseOperator263
     * @tc.desc Verify -2147483648 >>> 0 = 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >>> 0).assertEqual(2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2740
     * @tc.name testBitwiseOperator264
     * @tc.desc Verify -2147483648 >>> 1 = 1073741824
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >>> 1).assertEqual(1073741824)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2750
     * @tc.name testBitwiseOperator265
     * @tc.desc Verify -2147483648 >>> 31 = 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >>> 31).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2760
     * @tc.name testBitwiseOperator266
     * @tc.desc Verify 正整数 >>> 0 不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(42 >>> 0).assertEqual(42)
      expect(2147483647 >>> 0).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2770
     * @tc.name testBitwiseOperator267
     * @tc.desc Verify 正浮点 >>> 0 取整
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3.14 >>> 0).assertEqual(3)
      expect(999.99 >>> 0).assertEqual(999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2780
     * @tc.name testBitwiseOperator268
     * @tc.desc Verify 负整数 >>> 0 转无符号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) >>> 0).assertEqual(4294967295)
      expect((-42) >>> 0).assertEqual(4294967254)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2790
     * @tc.name testBitwiseOperator269
     * @tc.desc Verify 负浮点 >>> 0（先取整再转无符号）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-3.7) >>> 0).assertEqual(4294967293)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2800
     * @tc.name testBitwiseOperator270
     * @tc.desc Verify 0 >>> 0 = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 >>> 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2810
     * @tc.name testBitwiseOperator271
     * @tc.desc Verify NaN >>> 0 = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(NaN >>> 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2820
     * @tc.name testBitwiseOperator272
     * @tc.desc Verify 超大数 >>> 0 截断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((4294967296 as ESObject) >>> 0).assertEqual(0)
      expect((4294967297 as ESObject) >>> 0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2830
     * @tc.name testBitwiseOperator273
     * @tc.desc Verify (a & b) | c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0xFF & 0x0F) | 0xF000).assertEqual(0xF00F)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2840
     * @tc.name testBitwiseOperator274
     * @tc.desc Verify a & (b | c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF & (0x0F | 0xF0)).assertEqual(0xFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2850
     * @tc.name testBitwiseOperator275
     * @tc.desc Verify AND优先于OR验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xF0 & 0x0F | 0xF0).assertEqual((0xF0 & 0x0F) | 0xF0)
      expect(0xF0 & 0x0F | 0xF0).assertEqual(0xF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2860
     * @tc.name testBitwiseOperator276
     * @tc.desc Verify (a ^ b) & c（先异或再与）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0xFF ^ 0x0F) & 0xF0).assertEqual(0xF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2870
     * @tc.name testBitwiseOperator277
     * @tc.desc Verify XOR优先级低于AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xFF & 0xF0 ^ 0x0F).assertEqual((0xFF & 0xF0) ^ 0x0F)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2880
     * @tc.name testBitwiseOperator278
     * @tc.desc Verify XOR与OR组合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xF0 | 0x0F ^ 0xFF).assertEqual(0xF0 | (0x0F ^ 0xFF))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2890
     * @tc.name testBitwiseOperator279
     * @tc.desc Verify ~a & b（先取反再与）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~0xFF & 0x0F).assertEqual(0)
      expect(~0xF0 & 0xFF).assertEqual(0x0F)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2900
     * @tc.name testBitwiseOperator280
     * @tc.desc Verify ~(a | b) 等价于 ~a & ~b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0x0F, b: number = 0xF0
      expect(~(a | b)).assertEqual(~a & ~b)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2910
     * @tc.name testBitwiseOperator281
     * @tc.desc Verify ~(a & b) 等价于 ~a | ~b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0xFF, b: number = 0x0F
      expect(~(a & b)).assertEqual(~a | ~b)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2920
     * @tc.name testBitwiseOperator282
     * @tc.desc Verify (a << n) & mask
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x0F << 4) & 0xFF).assertEqual(0xF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2930
     * @tc.name testBitwiseOperator283
     * @tc.desc Verify (a >> n) | b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0xFF00 >> 8) | 0x01).assertEqual(0x01 | 0xFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2940
     * @tc.name testBitwiseOperator284
     * @tc.desc Verify 移位优先于位逻辑验证
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 << 4 & 0x10).assertEqual((1 << 4) & 0x10)
      expect(1 << 4 & 0x10).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2950
     * @tc.name testBitwiseOperator285
     * @tc.desc Verify (a & b) << n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0xFF & 0x0F) << 4).assertEqual(0xF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2960
     * @tc.name testBitwiseOperator286
     * @tc.desc Verify (a | b) >> n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0x00FF | 0xFF00) >> 8).assertEqual(0xFF)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2970
     * @tc.name testBitwiseOperator287
     * @tc.desc Verify 需括号改变优先级
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((0x0F | 0xF0) << 4) & 0xFF0).assertEqual(0xFF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2980
     * @tc.name testBitwiseOperator288
     * @tc.desc Verify a & b | c ^ d
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0xF0 & 0xFF | 0x0F ^ 0xF0).assertEqual((0xF0 & 0xFF) | (0x0F ^ 0xF0))
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_2990
     * @tc.name testBitwiseOperator289
     * @tc.desc Verify ~a & b | c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~0xFF & 0x0F | 0xF0).assertEqual(((~0xFF) & 0x0F) | 0xF0)
      expect(~0xFF & 0x0F | 0xF0).assertEqual(0xF0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3000
     * @tc.name testBitwiseOperator290
     * @tc.desc Verify 左移后右移（提取中间位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0b11010111
      let extracted: number = (val >> 3) & 0b111
      expect(extracted).assertEqual(0b010)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3010
     * @tc.name testBitwiseOperator291
     * @tc.desc Verify 右移后左移（清除低位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0b11010111
      let cleared: number = (val >> 3) << 3
      expect(cleared).assertEqual(208)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3020
     * @tc.name testBitwiseOperator292
     * @tc.desc Verify 左移右移组合恢复（但有精度损失）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0xFF
      expect((val << 8) >> 8).assertEqual(0xFF)
      expect((0x80000000 << 1) >> 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3030
     * @tc.name testBitwiseOperator293
     * @tc.desc Verify 翻转第n位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(toggleBit293(0b1010, 0)).assertEqual(0b1011)
      expect(toggleBit293(0b1011, 0)).assertEqual(0b1010)
      expect(toggleBit293(0b0000, 3)).assertEqual(0b1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3040
     * @tc.name testBitwiseOperator294
     * @tc.desc Verify 翻转多个位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b0000 ^ 0b1010).assertEqual(0b1010)
      expect(0b1111 ^ 0b1010).assertEqual(0b0101)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3050
     * @tc.name testBitwiseOperator295
     * @tc.desc Verify n & (n-1) 清除最低位的1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0b1000 & 0b0111).assertEqual(0)
      expect(0b1010 & 0b1001).assertEqual(0b1000)
      expect(0b1100 & 0b1011).assertEqual(0b1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3060
     * @tc.name testBitwiseOperator296
     * @tc.desc Verify n & (-n) 获取最低位的1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(lowbit296(0b10100)).assertEqual(0b00100)
      expect(lowbit296(0b10000)).assertEqual(0b10000)
      expect(lowbit296(0b10110)).assertEqual(0b00010)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3070
     * @tc.name testBitwiseOperator297
     * @tc.desc Verify n & (n-1) 循环统计1的个数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(countBits297(0)).assertEqual(0)
      expect(countBits297(1)).assertEqual(1)
      expect(countBits297(7)).assertEqual(3)
      expect(countBits297(255)).assertEqual(8)
      expect(countBits297(0b10101010)).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3080
     * @tc.name testBitwiseOperator298
     * @tc.desc Verify 负数统计1的个数（32位全统计）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(countBits32298(-1)).assertEqual(32)
      expect(countBits32298(-2)).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3090
     * @tc.name testBitwiseOperator299
     * @tc.desc Verify 反转一个字节的位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(reverseByte299(0b10101010)).assertEqual(0b01010101)
      expect(reverseByte299(0b11110000)).assertEqual(0b00001111)
      expect(reverseByte299(0b11010100)).assertEqual(0b00101011)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3100
     * @tc.name testBitwiseOperator300
     * @tc.desc Verify 交换16位的高低位字节
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(swap16300(0xAABB)).assertEqual(0xBBAA)
      expect(swap16300(0x00FF)).assertEqual(0xFF00)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3110
     * @tc.name testBitwiseOperator301
     * @tc.desc Verify 交换32位字节序（大端↔小端）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(swap32301(0x12345678) >>> 0).assertEqual(0x78563412)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3120
     * @tc.name testBitwiseOperator302
     * @tc.desc Verify 使用位运算计算字符串哈希
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let h1: number = simpleHash302("hello")
      let h2: number = simpleHash302("hello")
      let h3: number = simpleHash302("world")
      expect(h1).assertEqual(h2)
      expect(h1 === h3).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3130
     * @tc.name testBitwiseOperator303
     * @tc.desc Verify XOR加密/解密字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: number[] = [72, 101, 108, 108, 111]
      let encrypted: number[] = xorEncrypt303(original, 0xAA)
      let decrypted: number[] = xorEncrypt303(encrypted, 0xAA)
      expect(decrypted[0]).assertEqual(72)
      expect(decrypted[4]).assertEqual(111)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3140
     * @tc.name testBitwiseOperator304
     * @tc.desc Verify 将两个16位数打包为32位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pack16304(0x1234, 0x5678) >>> 0).assertEqual(0x12345678)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3150
     * @tc.name testBitwiseOperator305
     * @tc.desc Verify 从32位解包两个16位
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let packed: number = 0x12345678
      let high: number = (packed >> 16) & 0xFFFF
      let low: number = packed & 0xFFFF
      expect(high).assertEqual(0x1234)
      expect(low).assertEqual(0x5678)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3160
     * @tc.name testBitwiseOperator306
     * @tc.desc Verify 将四个字节打包为32位整数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(packBytes306(0x12, 0x34, 0x56, 0x78) >>> 0).assertEqual(0x12345678)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3170
     * @tc.name testBitwiseOperator307
     * @tc.desc Verify 从32位提取四个字节
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0x12345678
      expect((val >> 24) & 0xFF).assertEqual(0x12)
      expect((val >> 16) & 0xFF).assertEqual(0x34)
      expect((val >> 8) & 0xFF).assertEqual(0x56)
      expect(val & 0xFF).assertEqual(0x78)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3180
     * @tc.name testBitwiseOperator308
     * @tc.desc Verify 将多个小范围值打包（如RGB565）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(toRGB565308(31, 63, 31)).assertEqual(0xFFFF)
      expect(toRGB565308(0, 0, 0)).assertEqual(0)
      expect(toRGB565308(16, 32, 16)).assertEqual(0x8410)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3190
     * @tc.name testBitwiseOperator309
     * @tc.desc Verify 0 & 任意数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 & 0).assertEqual(0)
      expect(0 & 1).assertEqual(0)
      expect(0 & (-1)).assertEqual(0)
      expect(0 & 2147483647).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3200
     * @tc.name testBitwiseOperator310
     * @tc.desc Verify 0 | 任意数（结果为对方）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 | 0).assertEqual(0)
      expect(0 | 42).assertEqual(42)
      expect(0 | (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3210
     * @tc.name testBitwiseOperator311
     * @tc.desc Verify 0 ^ 任意数（结果为对方）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(0 ^ 0).assertEqual(0)
      expect(0 ^ 42).assertEqual(42)
      expect(0 ^ (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3220
     * @tc.name testBitwiseOperator312
     * @tc.desc Verify ~0 = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~0).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3230
     * @tc.name testBitwiseOperator313
     * @tc.desc Verify -1 & 任意数（结果为对方）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) & 0).assertEqual(0)
      expect((-1) & 42).assertEqual(42)
      expect((-1) & (-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3240
     * @tc.name testBitwiseOperator314
     * @tc.desc Verify -1 | 任意数（结果为-1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) | 0).assertEqual(-1)
      expect((-1) | 42).assertEqual(-1)
      expect((-1) | (-42)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3250
     * @tc.name testBitwiseOperator315
     * @tc.desc Verify -1 ^ 任意数（等价于~）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-1) ^ 0).assertEqual(-1)
      expect((-1) ^ 42).assertEqual(~42)
      expect((-1) ^ 42).assertEqual(-43)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3260
     * @tc.name testBitwiseOperator316
     * @tc.desc Verify ~(-1) = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-1)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3270
     * @tc.name testBitwiseOperator317
     * @tc.desc Verify 2147483647 & 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483647 & 2147483647).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3280
     * @tc.name testBitwiseOperator318
     * @tc.desc Verify 2147483647 | 0（截断为32位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483647 | 0).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3290
     * @tc.name testBitwiseOperator319
     * @tc.desc Verify ~2147483647 = -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~2147483647).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3300
     * @tc.name testBitwiseOperator320
     * @tc.desc Verify 2147483647 ^ (-1) = -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(2147483647 ^ (-1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3310
     * @tc.name testBitwiseOperator321
     * @tc.desc Verify -2147483648 & (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) & (-1)).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3320
     * @tc.name testBitwiseOperator322
     * @tc.desc Verify -2147483648 | 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) | 0).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3330
     * @tc.name testBitwiseOperator323
     * @tc.desc Verify ~(-2147483648) = 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(~(-2147483648)).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3340
     * @tc.name testBitwiseOperator324
     * @tc.desc Verify (-2147483648) ^ (-1) = 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) ^ (-1)).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3350
     * @tc.name testBitwiseOperator325
     * @tc.desc Verify -2147483648 << 1 = 0（高位丢弃）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) << 1).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3360
     * @tc.name testBitwiseOperator326
     * @tc.desc Verify -2147483648 >> 31 = -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((-2147483648) >> 31).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BITWISE_OPERATOR_3380
     * @tc.name testBitwiseOperator328
     * @tc.desc Verify 2的幂 & (2的幂-1) = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBitwiseOperator328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 & 0).assertEqual(0)
      expect(2 & 1).assertEqual(0)
      expect(4 & 3).assertEqual(0)
      expect(8 & 7).assertEqual(0)
      expect(256 & 255).assertEqual(0)
    });
