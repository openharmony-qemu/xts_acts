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

type State356 = "idle" | "running" | "stopped"

enum Color385 { Red, Green, Blue }

enum Direction386 { North = 1, South = 2, East = 3, West = 4 }

enum Perm387 { Read = 1, Write = 2, Execute = 4 }

enum Status388 { Active = "ACTIVE", Inactive = "INACTIVE" }

enum Prefix389 { User = "user_", Admin = "admin_" }

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function AssignmentOperatorTest() {
  describe('AssignmentOperatorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0110
     * @tc.name testAssignmentOperator001
     * @tc.desc Verify 整数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0120
     * @tc.name testAssignmentOperator002
     * @tc.desc Verify 浮点数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 3.14
      expect(x).assertEqual(3.14)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0130
     * @tc.name testAssignmentOperator003
     * @tc.desc Verify 负数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -100
      expect(x).assertEqual(-100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0150
     * @tc.name testAssignmentOperator005
     * @tc.desc Verify NaN赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0160
     * @tc.name testAssignmentOperator006
     * @tc.desc Verify Infinity赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = Infinity
      let b: number = -Infinity
      expect(a).assertEqual(Infinity)
      expect(b).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0170
     * @tc.name testAssignmentOperator007
     * @tc.desc Verify Number.MAX_SAFE_INTEGER赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MAX_SAFE_INTEGER
      expect(x).assertEqual(9007199254740991)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0180
     * @tc.name testAssignmentOperator008
     * @tc.desc Verify Number.MIN_SAFE_INTEGER赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MIN_SAFE_INTEGER
      expect(x).assertEqual(-9007199254740991)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0190
     * @tc.name testAssignmentOperator009
     * @tc.desc Verify Number.MAX_VALUE赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MAX_VALUE
      expect(x).assertEqual(Number.MAX_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0200
     * @tc.name testAssignmentOperator010
     * @tc.desc Verify Number.MIN_VALUE赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MIN_VALUE
      expect(x).assertEqual(Number.MIN_VALUE)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0210
     * @tc.name testAssignmentOperator011
     * @tc.desc Verify Number.EPSILON赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.EPSILON
      expect(x).assertEqual(2.220446049250313e-16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0220
     * @tc.name testAssignmentOperator012
     * @tc.desc Verify 普通字符串赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "Hello"
      expect(x).assertEqual("Hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0230
     * @tc.name testAssignmentOperator013
     * @tc.desc Verify 空字符串赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = ""
      expect(x.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0240
     * @tc.name testAssignmentOperator014
     * @tc.desc Verify 中文字符串赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "你好世界"
      expect(x).assertEqual("你好世界")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0250
     * @tc.name testAssignmentOperator015
     * @tc.desc Verify 包含特殊字符的字符串赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "line1\nline2\ttab"
      expect(x).assertEqual("line1\nline2\ttab")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0260
     * @tc.name testAssignmentOperator016
     * @tc.desc Verify emoji字符串赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "😀🔥⭐"
      expect(x).assertEqual("😀🔥⭐")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0270
     * @tc.name testAssignmentOperator017
     * @tc.desc Verify 超长字符串赋值（10000字符）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "A".repeat(10000)
      let x: string = longStr
      expect(x.length).assertEqual(10000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0280
     * @tc.name testAssignmentOperator018
     * @tc.desc Verify true赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      expect(x).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0290
     * @tc.name testAssignmentOperator019
     * @tc.desc Verify false赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      expect(x).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0300
     * @tc.name testAssignmentOperator020
     * @tc.desc Verify 布尔表达式结果赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = 3 > 2
      expect(x).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0320
     * @tc.name testAssignmentOperator022
     * @tc.desc Verify 数组赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number[] = [1, 2, 3]
      expect(x.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0330
     * @tc.name testAssignmentOperator023
     * @tc.desc Verify 引用赋值（浅拷贝验证）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1, 2, 3]
      let b: number[] = a
      b[0] = 99
      expect(a[0]).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0340
     * @tc.name testAssignmentOperator024
     * @tc.desc Verify 函数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: (a: number) => number = (a: number) => a + 1
      expect(fn(1)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0350
     * @tc.name testAssignmentOperator025
     * @tc.desc Verify undefined赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | undefined = undefined
      expect(x).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0360
     * @tc.name testAssignmentOperator026
     * @tc.desc Verify null赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string | null = null
      expect(x).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0370
     * @tc.name testAssignmentOperator027
     * @tc.desc Verify 链式赋值（多个变量赋相同值）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number, b: number, c: number
      a = b = c = 5
      expect(a).assertEqual(5)
      expect(b).assertEqual(5)
      expect(c).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0380
     * @tc.name testAssignmentOperator028
     * @tc.desc Verify 链式赋值（引用类型共享同一引用）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[], b: number[], c: number[]
      a = b = c = [1, 2]
      c.push(3)
      expect(a.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0390
     * @tc.name testAssignmentOperator029
     * @tc.desc Verify 赋值表达式返回赋的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number
      let result = (x = 42)
      expect(result).assertEqual(42)
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0400
     * @tc.name testAssignmentOperator030
     * @tc.desc Verify 赋值表达式在条件语句中的使用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      while ((x = x + 1) < 3) {
      }
      expect(x).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0460
     * @tc.name testAssignmentOperator036
     * @tc.desc Verify 正整数加法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x += 3
      expect(x).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0470
     * @tc.name testAssignmentOperator037
     * @tc.desc Verify 负数加法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x += -3
      expect(x).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0480
     * @tc.name testAssignmentOperator038
     * @tc.desc Verify 浮点数加法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1.5
      x += 2.5
      expect(x).assertEqual(4.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0490
     * @tc.name testAssignmentOperator039
     * @tc.desc Verify 加零赋值（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x += 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0520
     * @tc.name testAssignmentOperator042
     * @tc.desc Verify Infinity加法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x += 100
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0530
     * @tc.name testAssignmentOperator043
     * @tc.desc Verify Infinity + (-Infinity) = NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x += -Infinity
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0540
     * @tc.name testAssignmentOperator044
     * @tc.desc Verify NaN加法赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x += NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0550
     * @tc.name testAssignmentOperator045
     * @tc.desc Verify MAX_SAFE_INTEGER溢出
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MAX_SAFE_INTEGER
      x += 1
      expect(x).assertEqual(Number.MAX_SAFE_INTEGER + 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0560
     * @tc.name testAssignmentOperator046
     * @tc.desc Verify 字符串拼接加法赋值（x为string类型时）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "Hello"
      x += " World"
      expect(x).assertEqual("Hello World")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0570
     * @tc.name testAssignmentOperator047
     * @tc.desc Verify 数字与字符串拼接赋值（string += number）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "Value: "
      x += 42
      expect(x).assertEqual("Value: 42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0580
     * @tc.name testAssignmentOperator048
     * @tc.desc Verify 正数减法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x -= 3
      expect(x).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0590
     * @tc.name testAssignmentOperator049
     * @tc.desc Verify 结果为负数的减法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x -= 10
      expect(x).assertEqual(-5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0600
     * @tc.name testAssignmentOperator050
     * @tc.desc Verify 浮点数减法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5.5
      x -= 2.5
      expect(x).assertEqual(3.0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0610
     * @tc.name testAssignmentOperator051
     * @tc.desc Verify 减零赋值（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x -= 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0620
     * @tc.name testAssignmentOperator052
     * @tc.desc Verify 正数减负零（结果为正数，但符号位保持）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x -= -0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0650
     * @tc.name testAssignmentOperator055
     * @tc.desc Verify Infinity减法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x -= 100
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0660
     * @tc.name testAssignmentOperator056
     * @tc.desc Verify Infinity - Infinity = NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x -= Infinity
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0670
     * @tc.name testAssignmentOperator057
     * @tc.desc Verify NaN减法赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x -= NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0680
     * @tc.name testAssignmentOperator058
     * @tc.desc Verify MIN_SAFE_INTEGER下溢
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MIN_SAFE_INTEGER
      x -= 1
      expect(x).assertEqual(Number.MIN_SAFE_INTEGER - 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0690
     * @tc.name testAssignmentOperator059
     * @tc.desc Verify 正数乘法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 6
      x *= 7
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0700
     * @tc.name testAssignmentOperator060
     * @tc.desc Verify 负数乘法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -3
      x *= 4
      expect(x).assertEqual(-12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0710
     * @tc.name testAssignmentOperator061
     * @tc.desc Verify 两负数相乘
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -3
      x *= -4
      expect(x).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0720
     * @tc.name testAssignmentOperator062
     * @tc.desc Verify 浮点数乘法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.5
      x *= 4
      expect(x).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0730
     * @tc.name testAssignmentOperator063
     * @tc.desc Verify 乘以1（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x *= 1
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0740
     * @tc.name testAssignmentOperator064
     * @tc.desc Verify 乘以0（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x *= 0
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0760
     * @tc.name testAssignmentOperator066
     * @tc.desc Verify Infinity乘法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x *= 2
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0770
     * @tc.name testAssignmentOperator067
     * @tc.desc Verify Infinity * 0 = NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x *= 0
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0780
     * @tc.name testAssignmentOperator068
     * @tc.desc Verify NaN乘法赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x *= NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0790
     * @tc.name testAssignmentOperator069
     * @tc.desc Verify 大数溢出乘法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1e308
      x *= 10
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0800
     * @tc.name testAssignmentOperator070
     * @tc.desc Verify MIN_VALUE * 大数下溢为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MIN_VALUE
      x *= 0.5
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0810
     * @tc.name testAssignmentOperator071
     * @tc.desc Verify 整除赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x /= 6
      expect(x).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0820
     * @tc.name testAssignmentOperator072
     * @tc.desc Verify 非整除赋值（产生浮点数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 7
      x /= 2
      expect(x).assertEqual(3.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0830
     * @tc.name testAssignmentOperator073
     * @tc.desc Verify 负数除法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -12
      x /= 3
      expect(x).assertEqual(-4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0840
     * @tc.name testAssignmentOperator074
     * @tc.desc Verify 两负数相除
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -12
      x /= -3
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0850
     * @tc.name testAssignmentOperator075
     * @tc.desc Verify 除以1（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x /= 1
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0860
     * @tc.name testAssignmentOperator076
     * @tc.desc Verify 零除以非零数（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x /= 5
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0870
     * @tc.name testAssignmentOperator077
     * @tc.desc Verify 正数除以零（结果为Infinity）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x /= 0
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0880
     * @tc.name testAssignmentOperator078
     * @tc.desc Verify 负数除以零（结果为-Infinity）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -42
      x /= 0
      expect(x).assertEqual(-Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0890
     * @tc.name testAssignmentOperator079
     * @tc.desc Verify 零除以零（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x /= 0
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0900
     * @tc.name testAssignmentOperator080
     * @tc.desc Verify Infinity除法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x /= 2
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0910
     * @tc.name testAssignmentOperator081
     * @tc.desc Verify 有限数除以Infinity（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x /= Infinity
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0920
     * @tc.name testAssignmentOperator082
     * @tc.desc Verify Infinity / Infinity = NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x /= Infinity
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0930
     * @tc.name testAssignmentOperator083
     * @tc.desc Verify NaN除法赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x /= NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0940
     * @tc.name testAssignmentOperator084
     * @tc.desc Verify 正数求余赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12
      x %= 5
      expect(x).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0950
     * @tc.name testAssignmentOperator085
     * @tc.desc Verify 求余结果为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x %= 5
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0960
     * @tc.name testAssignmentOperator086
     * @tc.desc Verify 被除数为负数（余数符号跟随被除数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -12
      x %= 5
      expect(x).assertEqual(-2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0970
     * @tc.name testAssignmentOperator087
     * @tc.desc Verify 除数为负数（余数符号跟随被除数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 12
      x %= -5
      expect(x).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0980
     * @tc.name testAssignmentOperator088
     * @tc.desc Verify 浮点数求余赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5.5
      x %= 2
      expect(x).assertEqual(1.5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_0990
     * @tc.name testAssignmentOperator089
     * @tc.desc Verify 求余1（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x %= 1
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1000
     * @tc.name testAssignmentOperator090
     * @tc.desc Verify 有限数求余Infinity（结果为自身）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x %= Infinity
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1010
     * @tc.name testAssignmentOperator091
     * @tc.desc Verify 求余0（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x %= 0
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1020
     * @tc.name testAssignmentOperator092
     * @tc.desc Verify Infinity求余赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Infinity
      x %= 5
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1030
     * @tc.name testAssignmentOperator093
     * @tc.desc Verify NaN求余赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x %= NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1040
     * @tc.name testAssignmentOperator094
     * @tc.desc Verify 零求余赋值（0 % n = 0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x %= 5
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1050
     * @tc.name testAssignmentOperator095
     * @tc.desc Verify 正整数幂赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2
      x **= 3
      expect(x).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1060
     * @tc.name testAssignmentOperator096
     * @tc.desc Verify 负底数奇数次幂
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -2
      x **= 3
      expect(x).assertEqual(-8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1070
     * @tc.name testAssignmentOperator097
     * @tc.desc Verify 负底数偶数次幂
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -2
      x **= 4
      expect(x).assertEqual(16)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1080
     * @tc.name testAssignmentOperator098
     * @tc.desc Verify 负指数幂（结果为小数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x **= -1
      expect(x).assertEqual(0.1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1090
     * @tc.name testAssignmentOperator099
     * @tc.desc Verify 分数指数幂（平方根）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 9
      x **= 0.5
      expect(x).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1100
     * @tc.name testAssignmentOperator100
     * @tc.desc Verify 零次幂（结果为1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x **= 0
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1110
     * @tc.name testAssignmentOperator101
     * @tc.desc Verify 1的任意次幂（结果为1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1
      x **= 1000000
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1120
     * @tc.name testAssignmentOperator102
     * @tc.desc Verify 零的零次幂（0 ** 0 = 1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x **= 0
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1130
     * @tc.name testAssignmentOperator103
     * @tc.desc Verify 零的正数次幂（0 ** n = 0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x **= 5
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1140
     * @tc.name testAssignmentOperator104
     * @tc.desc Verify 零的负数次幂（0 ** -1 = Infinity）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x **= -1
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1170
     * @tc.name testAssignmentOperator107
     * @tc.desc Verify Infinity幂赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2
      x **= Infinity
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1180
     * @tc.name testAssignmentOperator108
     * @tc.desc Verify NaN幂赋值（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x **= NaN
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1190
     * @tc.name testAssignmentOperator109
     * @tc.desc Verify 负底数的分数指数（结果为NaN）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -4
      x **= 0.5
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1200
     * @tc.name testAssignmentOperator110
     * @tc.desc Verify 大数溢出幂赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x **= 309
      expect(x).assertEqual(Infinity)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1210
     * @tc.name testAssignmentOperator111
     * @tc.desc Verify 正数左移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 9
      x <<= 2
      expect(x).assertEqual(36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1220
     * @tc.name testAssignmentOperator112
     * @tc.desc Verify 负数左移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -9
      x <<= 2
      expect(x).assertEqual(-36)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1230
     * @tc.name testAssignmentOperator113
     * @tc.desc Verify 左移使低位补零
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1
      x <<= 31
      expect(x).assertEqual(-2147483648)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1240
     * @tc.name testAssignmentOperator114
     * @tc.desc Verify 左移0位（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x <<= 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1250
     * @tc.name testAssignmentOperator115
     * @tc.desc Verify 移位位数超过31（取模32）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1
      x <<= 32
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1260
     * @tc.name testAssignmentOperator116
     * @tc.desc Verify 移位位数为33（等价于左移1位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1
      x <<= 33
      expect(x).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1270
     * @tc.name testAssignmentOperator117
     * @tc.desc Verify 左移NaN（NaN先转为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x <<= NaN
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1280
     * @tc.name testAssignmentOperator118
     * @tc.desc Verify 左移Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x <<= Infinity
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1290
     * @tc.name testAssignmentOperator119
     * @tc.desc Verify 0左移任意位数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x <<= 10
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1300
     * @tc.name testAssignmentOperator120
     * @tc.desc Verify 正数右移（符号位为0，高位补0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 9
      x >>= 2
      expect(x).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1310
     * @tc.name testAssignmentOperator121
     * @tc.desc Verify 负数右移（符号位为1，高位补1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -9
      x >>= 2
      expect(x).assertEqual(-3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1320
     * @tc.name testAssignmentOperator122
     * @tc.desc Verify 右移0位（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x >>= 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1330
     * @tc.name testAssignmentOperator123
     * @tc.desc Verify 移位位数超过31（取模32）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x >>= 32
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1340
     * @tc.name testAssignmentOperator124
     * @tc.desc Verify 右移后全零（大数右移很多位）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 255
      x >>= 31
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1350
     * @tc.name testAssignmentOperator125
     * @tc.desc Verify 右移NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x >>= NaN
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1360
     * @tc.name testAssignmentOperator126
     * @tc.desc Verify 0右移任意位数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x >>= 10
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1370
     * @tc.name testAssignmentOperator127
     * @tc.desc Verify 正数无符号右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 19
      x >>>= 2
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1380
     * @tc.name testAssignmentOperator128
     * @tc.desc Verify 负数无符号右移（高位补0，结果为大正数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -9
      x >>>= 2
      expect(x).assertEqual(1073741821)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1390
     * @tc.name testAssignmentOperator129
     * @tc.desc Verify -1无符号右移0位（仍为大正数，因为先转32位整数）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -1
      x >>>= 0
      expect(x).assertEqual(4294967295)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1400
     * @tc.name testAssignmentOperator130
     * @tc.desc Verify 无符号右移0位（值不变但可能改变符号）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = -42
      x >>>= 0
      expect(x).assertEqual(4294967254)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1410
     * @tc.name testAssignmentOperator131
     * @tc.desc Verify 移位位数超过31（取模32）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x >>>= 32
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1420
     * @tc.name testAssignmentOperator132
     * @tc.desc Verify 无符号右移NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x >>>= NaN
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1430
     * @tc.name testAssignmentOperator133
     * @tc.desc Verify 0无符号右移
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x >>>= 10
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1440
     * @tc.name testAssignmentOperator134
     * @tc.desc Verify 按位与基本操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 15
      x &= 9
      expect(x).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1450
     * @tc.name testAssignmentOperator135
     * @tc.desc Verify 按位与自身（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x &= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1460
     * @tc.name testAssignmentOperator136
     * @tc.desc Verify 按位与0（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x &= 0
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1470
     * @tc.name testAssignmentOperator137
     * @tc.desc Verify 按位与-1（值不变，-1为全1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x &= -1
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1480
     * @tc.name testAssignmentOperator138
     * @tc.desc Verify 按位与NaN（NaN转为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x &= NaN
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1490
     * @tc.name testAssignmentOperator139
     * @tc.desc Verify 按位与Infinity（Infinity截断为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x &= Infinity
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1500
     * @tc.name testAssignmentOperator140
     * @tc.desc Verify 按位异或基本操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 15
      x ^= 9
      expect(x).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1510
     * @tc.name testAssignmentOperator141
     * @tc.desc Verify 按位异或自身（结果为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x ^= 42
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1520
     * @tc.name testAssignmentOperator142
     * @tc.desc Verify 按位异或0（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x ^= 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1530
     * @tc.name testAssignmentOperator143
     * @tc.desc Verify 按位异或-1（等价于按位取反）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x ^= -1
      expect(x).assertEqual(-43)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1540
     * @tc.name testAssignmentOperator144
     * @tc.desc Verify 两次异或同一个值恢复原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x ^= 99
      x ^= 99
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1550
     * @tc.name testAssignmentOperator145
     * @tc.desc Verify 按位或基本操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 15
      x |= 9
      expect(x).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1560
     * @tc.name testAssignmentOperator146
     * @tc.desc Verify 按位或自身（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x |= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1570
     * @tc.name testAssignmentOperator147
     * @tc.desc Verify 按位或0（值不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x |= 0
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1580
     * @tc.name testAssignmentOperator148
     * @tc.desc Verify 按位或-1（结果为-1，全1）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x |= -1
      expect(x).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1590
     * @tc.name testAssignmentOperator149
     * @tc.desc Verify 按位或NaN（NaN转为0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x |= NaN
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1600
     * @tc.name testAssignmentOperator150
     * @tc.desc Verify 左操作数为truthy时，赋值为右操作数的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x &&= 10
      expect(x).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1610
     * @tc.name testAssignmentOperator151
     * @tc.desc Verify 左操作数为非空对象时，执行赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | null = 42
      x &&= 99
      expect(x).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1620
     * @tc.name testAssignmentOperator152
     * @tc.desc Verify 左操作数为0时不赋值，保持0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x &&= 10
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1630
     * @tc.name testAssignmentOperator153
     * @tc.desc Verify 左操作数为false时不赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      x &&= true
      expect(x).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1640
     * @tc.name testAssignmentOperator154
     * @tc.desc Verify 左操作数为空字符串时不赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = ""
      x &&= "new"
      expect(x).assertEqual("")
    });
