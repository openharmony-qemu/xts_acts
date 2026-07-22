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
