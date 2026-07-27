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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1650
     * @tc.name testAssignmentOperator155
     * @tc.desc Verify 左操作数为null时不赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | null = null
      x &&= 42
      expect(x).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1660
     * @tc.name testAssignmentOperator156
     * @tc.desc Verify 左操作数为undefined时不赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | undefined = undefined
      x &&= 42
      expect(x).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1670
     * @tc.name testAssignmentOperator157
     * @tc.desc Verify 左操作数为NaN时不赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      x &&= 42
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1680
     * @tc.name testAssignmentOperator158
     * @tc.desc Verify 左操作数为falsy时右操作数函数不被调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number = 0
      x &&= (() => {
        called = true;
        return 42
      })()
      expect(called).assertFalse()
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1690
     * @tc.name testAssignmentOperator159
     * @tc.desc Verify 左操作数为truthy时右操作数函数被调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number = 1
      x &&= (() => {
        called = true;
        return 42
      })()
      expect(called).assertTrue()
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1700
     * @tc.name testAssignmentOperator160
     * @tc.desc Verify 左操作数为0时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x ||= 10
      expect(x).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1710
     * @tc.name testAssignmentOperator161
     * @tc.desc Verify 左操作数为空字符串时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = ""
      x ||= "default"
      expect(x).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1720
     * @tc.name testAssignmentOperator162
     * @tc.desc Verify 左操作数为false时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      x ||= true
      expect(x).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1730
     * @tc.name testAssignmentOperator163
     * @tc.desc Verify 左操作数为null时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | null = null
      x ||= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1740
     * @tc.name testAssignmentOperator164
     * @tc.desc Verify 左操作数为undefined时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | undefined = undefined
      x ||= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1750
     * @tc.name testAssignmentOperator165
     * @tc.desc Verify 左操作数为NaN时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      x ||= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1760
     * @tc.name testAssignmentOperator166
     * @tc.desc Verify 左操作数为非零数字时保持原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x ||= 99
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1770
     * @tc.name testAssignmentOperator167
     * @tc.desc Verify 左操作数为非空字符串时保持原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "hello"
      x ||= "world"
      expect(x).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1780
     * @tc.name testAssignmentOperator168
     * @tc.desc Verify 左操作数为truthy时右操作数函数不被调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number = 1
      x ||= (() => {
        called = true;
        return 42
      })()
      expect(called).assertFalse()
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1790
     * @tc.name testAssignmentOperator169
     * @tc.desc Verify 左操作数为null时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | null = null
      x ??= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1800
     * @tc.name testAssignmentOperator170
     * @tc.desc Verify 左操作数为undefined时，赋值为右操作数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | undefined = undefined
      x ??= 42
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1810
     * @tc.name testAssignmentOperator171
     * @tc.desc Verify 左操作数为0时保持原值（??=与||=的区别）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      x ??= 42
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1820
     * @tc.name testAssignmentOperator172
     * @tc.desc Verify 左操作数为空字符串时保持原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = ""
      x ??= "default"
      expect(x).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1830
     * @tc.name testAssignmentOperator173
     * @tc.desc Verify 左操作数为false时保持原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      x ??= true
      expect(x).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1840
     * @tc.name testAssignmentOperator174
     * @tc.desc Verify 左操作数为NaN时保持原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = NaN
      x ??= 42
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1850
     * @tc.name testAssignmentOperator175
     * @tc.desc Verify 左操作数为非空对象时保持原值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      x ??= 99
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1860
     * @tc.name testAssignmentOperator176
     * @tc.desc Verify 左操作数非null/undefined时右操作数函数不被调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number = 0
      x ??= (() => {
        called = true;
        return 42
      })()
      expect(called).assertFalse()
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_1870
     * @tc.name testAssignmentOperator177
     * @tc.desc Verify 左操作数为null时右操作数函数被调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false
      let x: number | null = null
      x ??= (() => {
        called = true;
        return 42
      })()
      expect(called).assertTrue()
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2110
     * @tc.name testAssignmentOperator201
     * @tc.desc Verify 复合赋值优先级低于算术运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      x += 3 * 2
      expect(x).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2120
     * @tc.name testAssignmentOperator202
     * @tc.desc Verify 赋值运算从右到左结合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number, b: number
      a = b = 5 + 3
      expect(a).assertEqual(8)
      expect(b).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2130
     * @tc.name testAssignmentOperator203
     * @tc.desc Verify 多次复合赋值累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1
      x += 1
      x += 1
      x += 1
      expect(x).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2140
     * @tc.name testAssignmentOperator204
     * @tc.desc Verify 混合复合赋值运算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      x += 5
      x *= 2
      x -= 10
      expect(x).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2150
     * @tc.name testAssignmentOperator205
     * @tc.desc Verify 复合赋值表达式返回赋值后的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let result = (x += 3)
      expect(result).assertEqual(8)
      expect(x).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2160
     * @tc.name testAssignmentOperator206
     * @tc.desc Verify 逻辑赋值表达式返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | null = null
      let result = (x ??= 42)
      expect(result).assertEqual(42)
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2170
     * @tc.name testAssignmentOperator207
     * @tc.desc Verify 对象属性基本赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = {}
      obj.key = 42
      expect(obj.key).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2200
     * @tc.name testAssignmentOperator210
     * @tc.desc Verify 数组元素基本赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      arr[1] = 42
      expect(arr[1]).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2210
     * @tc.name testAssignmentOperator211
     * @tc.desc Verify 数组元素复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      arr[0] += 10
      expect(arr[0]).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2220
     * @tc.name testAssignmentOperator212
     * @tc.desc Verify 数组越界索引赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      arr[10] = 99
      expect(arr[10]).assertEqual(99)
      expect(arr.length).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2230
     * @tc.name testAssignmentOperator213
     * @tc.desc Verify 十六进制正数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0xFF
      expect(x).assertEqual(255)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2240
     * @tc.name testAssignmentOperator214
     * @tc.desc Verify 十六进制大数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0x7FFFFFFF
      expect(x).assertEqual(2147483647)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2250
     * @tc.name testAssignmentOperator215
     * @tc.desc Verify 十六进制复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0x10
      x += 0x0F
      expect(x).assertEqual(31)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2260
     * @tc.name testAssignmentOperator216
     * @tc.desc Verify 八进制赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0o17
      expect(x).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2270
     * @tc.name testAssignmentOperator217
     * @tc.desc Verify 二进制赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0b1010
      expect(x).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2280
     * @tc.name testAssignmentOperator218
     * @tc.desc Verify 二进制位运算复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0b1100
      x &= 0b1010
      expect(x).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2290
     * @tc.name testAssignmentOperator219
     * @tc.desc Verify 科学计数法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1e3
      expect(x).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2300
     * @tc.name testAssignmentOperator220
     * @tc.desc Verify 负指数科学计数法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1e-7
      expect(x).assertEqual(0.0000001)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2310
     * @tc.name testAssignmentOperator221
     * @tc.desc Verify 大指数科学计数法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1.5e308
      expect(x).assertEqual(1.5e308)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2320
     * @tc.name testAssignmentOperator222
     * @tc.desc Verify 指数复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1e2
      x *= 1e1
      expect(x).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2330
     * @tc.name testAssignmentOperator223
     * @tc.desc Verify 0.1 + 0.2浮点精度问题
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.1
      x += 0.2
      expect(x).assertEqual(0.30000000000000004)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2340
     * @tc.name testAssignmentOperator224
     * @tc.desc Verify 0.1 + 0.2不等于0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0.1
      x += 0.2
      expect(x === 0.3).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2350
     * @tc.name testAssignmentOperator225
     * @tc.desc Verify 大整数精度丢失
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 9007199254740993
      expect(x).assertEqual(9007199254740992)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2360
     * @tc.name testAssignmentOperator226
     * @tc.desc Verify 大整数复合赋值精度丢失
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MAX_SAFE_INTEGER
      x += 2
      expect(x).assertEqual(Number.MAX_SAFE_INTEGER + 2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2370
     * @tc.name testAssignmentOperator227
     * @tc.desc Verify Number.EPSILON加法赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1.0
      x += Number.EPSILON
      expect(x).assertEqual(1.0 + Number.EPSILON)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2380
     * @tc.name testAssignmentOperator228
     * @tc.desc Verify 极小浮点数下溢
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number.MIN_VALUE
      x /= 2
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2400
     * @tc.name testAssignmentOperator230
     * @tc.desc Verify 最小正规格化浮点数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 2.2250738585072014e-308
      expect(x > 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2410
     * @tc.name testAssignmentOperator231
     * @tc.desc Verify 最小次规格化浮点数赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5e-324
      expect(x > 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2460
     * @tc.name testAssignmentOperator236
     * @tc.desc Verify string += number拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "count: "
      x += 42
      expect(x).assertEqual("count: 42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2470
     * @tc.name testAssignmentOperator237
     * @tc.desc Verify string += boolean拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "flag: "
      x += true
      expect(x).assertEqual("flag: true")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2480
     * @tc.name testAssignmentOperator238
     * @tc.desc Verify string += null拼接（使用ESObject绕过类型检查）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "val: "
      x += (null as ESObject)
      expect(x).assertEqual("val: null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2490
     * @tc.name testAssignmentOperator239
     * @tc.desc Verify string += undefined拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "val: "
      x += (undefined as ESObject)
      expect(x).assertEqual("val: undefined")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2500
     * @tc.name testAssignmentOperator240
     * @tc.desc Verify string += 对象拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "obj: "
      x += ({ a: 1 } as ESObject)
      expect(x).assertEqual("obj: [object Object]")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2510
     * @tc.name testAssignmentOperator241
     * @tc.desc Verify string += 数组拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "arr: "
      x += ([1, 2, 3] as ESObject)
      expect(x).assertEqual("arr: 1,2,3")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2520
     * @tc.name testAssignmentOperator242
     * @tc.desc Verify string += NaN拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "result: "
      x += (NaN as ESObject)
      expect(x).assertEqual("result: NaN")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2530
     * @tc.name testAssignmentOperator243
     * @tc.desc Verify string += Infinity拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "result: "
      x += (Infinity as ESObject)
      expect(x).assertEqual("result: Infinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2540
     * @tc.name testAssignmentOperator244
     * @tc.desc Verify Number()转换string后赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number("42")
      expect(x).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2550
     * @tc.name testAssignmentOperator245
     * @tc.desc Verify Number()转换非数字字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number("abc")
      expect(Number.isNaN(x)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2560
     * @tc.name testAssignmentOperator246
     * @tc.desc Verify Number()转换空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number("")
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2570
     * @tc.name testAssignmentOperator247
     * @tc.desc Verify Number()转换boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = Number(true)
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2580
     * @tc.name testAssignmentOperator248
     * @tc.desc Verify String()转换number后赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = String(42)
      expect(x).assertEqual("42")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2590
     * @tc.name testAssignmentOperator249
     * @tc.desc Verify String()转换NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = String(NaN)
      expect(x).assertEqual("NaN")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2600
     * @tc.name testAssignmentOperator250
     * @tc.desc Verify String()转换Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = String(Infinity)
      expect(x).assertEqual("Infinity")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2610
     * @tc.name testAssignmentOperator251
     * @tc.desc Verify String()转换null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = String(null as ESObject)
      expect(x).assertEqual("null")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2620
     * @tc.name testAssignmentOperator252
     * @tc.desc Verify Boolean()转换number（0为false）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = Boolean(0)
      expect(x).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2630
     * @tc.name testAssignmentOperator253
     * @tc.desc Verify Boolean()转换number（非零为true）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = Boolean(42)
      expect(x).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2640
     * @tc.name testAssignmentOperator254
     * @tc.desc Verify Boolean()转换空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = Boolean("")
      expect(x).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2650
     * @tc.name testAssignmentOperator255
     * @tc.desc Verify Boolean()转换非空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = Boolean("hello")
      expect(x).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2680
     * @tc.name testAssignmentOperator258
     * @tc.desc Verify const数组元素可以修改（引用不变）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3]
      arr[0] = 99
      expect(arr[0]).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2690
     * @tc.name testAssignmentOperator259
     * @tc.desc Verify const数组push操作合法
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2]
      arr.push(3)
      expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2700
     * @tc.name testAssignmentOperator260
     * @tc.desc Verify const对象属性可以修改
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ESObject = { a: 1 }
      obj.a = 42
      obj.b = 99
      expect(obj.a).assertEqual(42)
      expect(obj.b).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2710
     * @tc.name testAssignmentOperator261
     * @tc.desc Verify const对象属性复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ESObject = { count: 5 }
      obj.count += 10
      expect(obj.count).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2720
     * @tc.name testAssignmentOperator262
     * @tc.desc Verify let块级作用域内重新赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 1
      {
        let x: number = 2
        expect(x).assertEqual(2)
      }
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2730
     * @tc.name testAssignmentOperator263
     * @tc.desc Verify let在循环中每次迭代新作用域
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let funcs: (() => number)[] = []
      for (let i = 0; i < 3; i++) {
        funcs.push(() => i)
      }
      expect(funcs[0]()).assertEqual(0)
      expect(funcs[1]()).assertEqual(1)
      expect(funcs[2]()).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2740
     * @tc.name testAssignmentOperator264
     * @tc.desc Verify let在if块中赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      if (true) {
        let x: number = 20
        x += 5
        expect(x).assertEqual(25)
      }
      expect(x).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2750
     * @tc.name testAssignmentOperator265
     * @tc.desc Verify 外层变量在块内修改
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      {
        x = 20
      }
      expect(x).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2760
     * @tc.name testAssignmentOperator266
     * @tc.desc Verify 通过setter赋值触发自定义逻辑
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stored: number = 0
      const obj: ESObject = {
        set value(v: number) {
          stored = v * 2
        }
      }
      obj.value = 5
      expect(stored).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2770
     * @tc.name testAssignmentOperator267
     * @tc.desc Verify setter中赋值验证范围
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stored: number = 0
      const obj: ESObject = {
        set val(v: number) {
          stored = v > 100 ? 100 : v
        }
      }
      obj.val = 200
      expect(stored).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2780
     * @tc.name testAssignmentOperator268
     * @tc.desc Verify getter读取setter设置的值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let _data: number = 0
      const obj: ESObject = {
        get data(): number {
          return _data
        },
        set data(v: number) {
          _data = v + 1
        }
      }
      obj.data = 10
      expect(obj.data).assertEqual(11)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2790
     * @tc.name testAssignmentOperator269
     * @tc.desc Verify 复合赋值通过setter触发
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let _count: number = 0
      const obj: ESObject = {
        get count(): number {
          return _count
        },
        set count(v: number) {
          _count = v
        }
      }
      obj.count = 5
      obj.count += 3
      expect(obj.count).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2800
     * @tc.name testAssignmentOperator270
     * @tc.desc Verify 类实例通过setter赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let temp = new Temperature270()
      temp.celsius = 25
      expect(temp.celsius).assertEqual(25)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2810
     * @tc.name testAssignmentOperator271
     * @tc.desc Verify 类setter中进行单位转换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let temp = new Temperature271()
      temp.fahrenheit = 212
      expect(temp.fahrenheit).assertEqual(212)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2820
     * @tc.name testAssignmentOperator272
     * @tc.desc Verify 类属性复合赋值通过setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new Counter272()
      c.value = 10
      c.value += 5
      c.value *= 2
      expect(c.value).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2840
     * @tc.name testAssignmentOperator274
     * @tc.desc Verify 条件为true时赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 20
      let status: string = age >= 18 ? "adult" : "minor"
      expect(status).assertEqual("adult")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2850
     * @tc.name testAssignmentOperator275
     * @tc.desc Verify 条件为false时赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 15
      let status: string = age >= 18 ? "adult" : "minor"
      expect(status).assertEqual("minor")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2860
     * @tc.name testAssignmentOperator276
     * @tc.desc Verify 三元赋值number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = true
      let x: number = flag ? 1 : 0
      expect(x).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2870
     * @tc.name testAssignmentOperator277
     * @tc.desc Verify 三元嵌套赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let score: number = 75
      let grade: string = score >= 90 ? "A" : score >= 60 ? "B" : "C"
      expect(grade).assertEqual("B")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2880
     * @tc.name testAssignmentOperator278
     * @tc.desc Verify 三元赋值对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isAdmin: boolean = true
      let config: ESObject = isAdmin ? { role: "admin", level: 5 } : { role: "user", level: 1 }
      expect(config.role).assertEqual("admin")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2890
     * @tc.name testAssignmentOperator279
     * @tc.desc Verify += 三元表达式结果
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 5
      let bonus: boolean = true
      x += bonus ? 10 : 0
      expect(x).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2900
     * @tc.name testAssignmentOperator280
     * @tc.desc Verify *= 三元表达式结果
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 3
      let double: boolean = true
      x *= double ? 2 : 1
      expect(x).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2910
     * @tc.name testAssignmentOperator281
     * @tc.desc Verify 逻辑与短路返回赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | undefined = undefined
      let result: number = x && (x as number) || 0
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2920
     * @tc.name testAssignmentOperator282
     * @tc.desc Verify 逻辑或设置默认值赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string | undefined = undefined
      let name: string = input || "default"
      expect(name).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2930
     * @tc.name testAssignmentOperator283
     * @tc.desc Verify 逻辑或设置默认值（实际值优先）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello"
      let name: string = input || "default"
      expect(name).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2940
     * @tc.name testAssignmentOperator284
     * @tc.desc Verify nullish合并设置默认值赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number | null = null
      let val: number = input ?? 0
      expect(val).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2950
     * @tc.name testAssignmentOperator285
     * @tc.desc Verify nullish合并（0不是nullish，保持0）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number | null = 0
      let val: number = input ?? 99
      expect(val).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2960
     * @tc.name testAssignmentOperator286
     * @tc.desc Verify 展开数组到新数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1, 2, 3]
      let b: number[] = [...a, 4, 5]
      expect(b.length).assertEqual(5)
      expect(b[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2970
     * @tc.name testAssignmentOperator287
     * @tc.desc Verify 展开多个数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [1, 2]
      let b: number[] = [3, 4]
      let c: number[] = [...a, ...b]
      expect(c.length).assertEqual(4)
      expect(c[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2980
     * @tc.name testAssignmentOperator288
     * @tc.desc Verify 展开空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = []
      let b: number[] = [...a, 1]
      expect(b.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_2990
     * @tc.name testAssignmentOperator289
     * @tc.desc Verify 展开后在头部插入
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number[] = [2, 3]
      let b: number[] = [1, ...a]
      expect(b[0]).assertEqual(1)
      expect(b[1]).assertEqual(2)
      expect(b[2]).assertEqual(3)
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3050
     * @tc.name testAssignmentOperator295
     * @tc.desc Verify for循环计数器自增赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0
      for (let i = 1; i <= 5; i++) {
        sum += i
      }
      expect(sum).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3060
     * @tc.name testAssignmentOperator296
     * @tc.desc Verify for循环计数器自减赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let product: number = 1
      for (let i = 5; i >= 1; i--) {
        product *= i
      }
      expect(product).assertEqual(120)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3070
     * @tc.name testAssignmentOperator297
     * @tc.desc Verify 循环体内复合赋值累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let total: number = 100
      for (let i = 0; i < 3; i++) {
        total -= 10
      }
      expect(total).assertEqual(70)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3080
     * @tc.name testAssignmentOperator298
     * @tc.desc Verify for循环填充数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      for (let i = 0; i < 5; i++) {
        arr[i] = i * i
      }
      expect(arr[3]).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3090
     * @tc.name testAssignmentOperator299
     * @tc.desc Verify 循环修改数组元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      for (let i = 0; i < arr.length; i++) {
        arr[i] *= 2
      }
      expect(arr[2]).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3100
     * @tc.name testAssignmentOperator300
     * @tc.desc Verify for...of迭代数组赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [10, 20, 30]
      let sum: number = 0
      for (const val of arr) {
        sum += val
      }
      expect(sum).assertEqual(60)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3110
     * @tc.name testAssignmentOperator301
     * @tc.desc Verify for...of迭代字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ""
      for (const ch of "ABC") {
        result += ch
      }
      expect(result).assertEqual("ABC")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3150
     * @tc.name testAssignmentOperator305
     * @tc.desc Verify while循环中条件赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number[] = [1, 2, 3]
      let i: number = 0
      let sum: number = 0
      while (i < data.length) {
        sum += data[i]
        i++
      }
      expect(sum).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3160
     * @tc.name testAssignmentOperator306
     * @tc.desc Verify do-while循环中赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      do {
        x += 5
      } while (x < 20)
      expect(x).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3170
     * @tc.name testAssignmentOperator307
     * @tc.desc Verify 闭包捕获并修改外部变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0
      let increment = () => {
        count++
      }
      increment()
      increment()
      increment()
      expect(count).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3180
     * @tc.name testAssignmentOperator308
     * @tc.desc Verify 闭包中复合赋值外部变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let total: number = 10
      let addAndReturn = (n: number): number => {
        total += n
        return total
      }
      let r1 = addAndReturn(5)
      let r2 = addAndReturn(3)
      expect(r1).assertEqual(15)
      expect(r2).assertEqual(18)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3190
     * @tc.name testAssignmentOperator309
     * @tc.desc Verify 多个闭包共享同一变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0
      let set = (n: number) => {
        val = n
      }
      let get = (): number => val
      set(42)
      expect(get()).assertEqual(42)
      set(99)
      expect(get()).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3350
     * @tc.name testAssignmentOperator325
     * @tc.desc Verify 使用变量作为属性名赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "dynamic"
      let obj: ESObject = {}
      obj[key] = 42
      expect(obj.dynamic).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3360
     * @tc.name testAssignmentOperator326
     * @tc.desc Verify 使用表达式作为属性名赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {}
      let i: number = 5
      obj["key" + i] = "val"
      expect(obj.key5).assertEqual("val")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3370
     * @tc.name testAssignmentOperator327
     * @tc.desc Verify 使用数字作为属性名赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {}
      let idx: number = 42
      obj[idx] = "found"
      expect(obj[42]).assertEqual("found")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3380
     * @tc.name testAssignmentOperator328
     * @tc.desc Verify 计算属性复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: string = "count"
      let obj: ESObject = { count: 5 }
      obj[key] += 10
      expect(obj.count).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3430
     * @tc.name testAssignmentOperator333
     * @tc.desc Verify 类静态属性基本赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Config333.version = "2.0"
      expect(Config333.version).assertEqual("2.0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3440
     * @tc.name testAssignmentOperator334
     * @tc.desc Verify 类静态属性复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Counter334.count += 5
      Counter334.count += 3
      expect(Counter334.count).assertEqual(8)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3450
     * @tc.name testAssignmentOperator335
     * @tc.desc Verify 静态属性在所有实例间共享
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      new Instance335()
      new Instance335()
      new Instance335()
      expect(Instance335.total).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3460
     * @tc.name testAssignmentOperator336
     * @tc.desc Verify 构造函数中实例属性赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p = new Point336(3, 4)
      expect(p.x).assertEqual(3)
      expect(p.y).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3470
     * @tc.name testAssignmentOperator337
     * @tc.desc Verify 实例属性复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc = new Bank337()
      acc.balance += 100
      acc.balance += 50
      acc.balance -= 30
      expect(acc.balance).assertEqual(120)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3480
     * @tc.name testAssignmentOperator338
     * @tc.desc Verify 实例属性字符串拼接赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let logger = new Logger338()
      logger.log += "[INFO] "
      logger.log += "Started"
      expect(logger.log).assertEqual("[INFO] Started")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3500
     * @tc.name testAssignmentOperator340
     * @tc.desc Verify Map.set基本赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new Map<string, number>()
      m.set("a", 1)
      m.set("b", 2)
      expect(m.get("a")).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3510
     * @tc.name testAssignmentOperator341
     * @tc.desc Verify Map.set覆盖已有键
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new Map<string, number>()
      m.set("a", 1)
      m.set("a", 99)
      expect(m.get("a")).assertEqual(99)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3520
     * @tc.name testAssignmentOperator342
     * @tc.desc Verify Map.set返回Map实例（可链式调用）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = new Map<string, number>()
      m.set("a", 1).set("b", 2).set("c", 3)
      expect(m.size).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3540
     * @tc.name testAssignmentOperator344
     * @tc.desc Verify Set.add基本操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<number>()
      s.add(1)
      s.add(2)
      s.add(3)
      expect(s.size).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3550
     * @tc.name testAssignmentOperator345
     * @tc.desc Verify Set.add去重
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<number>()
      s.add(1)
      s.add(1)
      s.add(1)
      expect(s.size).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3560
     * @tc.name testAssignmentOperator346
     * @tc.desc Verify Set.add链式调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<number>()
      s.add(1).add(2).add(3)
      expect(s.size).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3570
     * @tc.name testAssignmentOperator347
     * @tc.desc Verify Set.add NaN去重（NaN在Set中视为相同）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = new Set<number>()
      s.add(NaN)
      s.add(NaN)
      expect(s.size).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3580
     * @tc.name testAssignmentOperator348
     * @tc.desc Verify 累加器求和
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let sum: number = 0
      for (const n of arr) {
        sum += n
      }
      expect(sum).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3590
     * @tc.name testAssignmentOperator349
     * @tc.desc Verify 累乘器求积
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let product: number = 1
      for (const n of arr) {
        product *= n
      }
      expect(product).assertEqual(120)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3600
     * @tc.name testAssignmentOperator350
     * @tc.desc Verify 条件累加
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5, 6]
      let evenSum: number = 0
      for (const n of arr) {
        if (n % 2 === 0) {
          evenSum += n
        }
      }
      expect(evenSum).assertEqual(12)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3610
     * @tc.name testAssignmentOperator351
     * @tc.desc Verify 循环拼接字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let words: string[] = ["Hello", " ", "World", "!"]
      let result: string = ""
      for (const w of words) {
        result += w
      }
      expect(result).assertEqual("Hello World!")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3620
     * @tc.name testAssignmentOperator352
     * @tc.desc Verify 条件拼接字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let items: string[] = ["a", "", "b", "", "c"]
      let result: string = ""
      for (const item of items) {
        if (item) {
          result += item
        }
      }
      expect(result).assertEqual("abc")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3630
     * @tc.name testAssignmentOperator353
     * @tc.desc Verify 分隔符拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["apple", "banana", "cherry"]
      let result: string = ""
      for (let i = 0; i < arr.length; i++) {
        result += arr[i]
        if (i < arr.length - 1) {
          result += ", "
        }
      }
      expect(result).assertEqual("apple, banana, cherry")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3640
     * @tc.name testAssignmentOperator354
     * @tc.desc Verify 统计元素出现次数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = ["a", "b", "a", "c", "a", "b"]
      let counts: Map<string, number> = new Map()
      for (const item of arr) {
        let current = counts.get(item) ?? 0
        counts.set(item, current + 1)
      }
      expect(counts.get("a")).assertEqual(3)
      expect(counts.get("b")).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3650
     * @tc.name testAssignmentOperator355
     * @tc.desc Verify 统计正负零个数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, -2, 0, 3, -4, 0, 5]
      let pos: number = 0, neg: number = 0, zero: number = 0
      for (const n of arr) {
        if (n > 0) {
          pos++
        } else if (n < 0) {
          neg++
        } else {
          zero++
        }
      }
      expect(pos).assertEqual(3)
      expect(neg).assertEqual(2)
      expect(zero).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3660
     * @tc.name testAssignmentOperator356
     * @tc.desc Verify 状态机模式赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state: State356 = "idle"
      state = "running"
      expect(state).assertEqual("running")
      state = "stopped"
      expect(state).assertEqual("stopped")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3680
     * @tc.name testAssignmentOperator358
     * @tc.desc Verify 权限合并赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let basePerms: Set<string> = new Set(["read"])
      basePerms.add("write")
      basePerms.add("delete")
      expect(basePerms.size).assertEqual(3)
      basePerms.delete("delete")
      expect(basePerms.has("delete")).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3690
     * @tc.name testAssignmentOperator359
     * @tc.desc Verify map回调中赋值外部变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let lastVal: number = 0
      arr.map(n => {
        lastVal = n;
        return n
      })
      expect(lastVal).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3700
     * @tc.name testAssignmentOperator360
     * @tc.desc Verify reduce中累加赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let sum: number = arr.reduce((acc, n) => acc + n, 0)
      expect(sum).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3710
     * @tc.name testAssignmentOperator361
     * @tc.desc Verify reduce中累乘赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4]
      let product: number = arr.reduce((acc, n) => acc * n, 1)
      expect(product).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3720
     * @tc.name testAssignmentOperator362
     * @tc.desc Verify forEach中复合赋值外部变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [10, 20, 30]
      let total: number = 0
      arr.forEach(n => {
        total += n
      })
      expect(total).assertEqual(60)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3730
     * @tc.name testAssignmentOperator363
     * @tc.desc Verify filter中条件赋值到新数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5, 6]
      let evens: number[] = arr.filter(n => n % 2 === 0)
      expect(evens.length).assertEqual(3)
      expect(evens[0]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3740
     * @tc.name testAssignmentOperator364
     * @tc.desc Verify 数组方法链式调用结果赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let result: number = arr.filter(n => n > 2).map(n => n * 2).reduce((a, b) => a + b, 0)
      expect(result).assertEqual(24)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3750
     * @tc.name testAssignmentOperator365
     * @tc.desc Verify sort后赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [3, 1, 4, 1, 5, 9, 2, 6]
      let sorted: number[] = [...arr].sort((a, b) => a - b)
      expect(sorted[0]).assertEqual(1)
      expect(sorted[7]).assertEqual(9)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3760
     * @tc.name testAssignmentOperator366
     * @tc.desc Verify slice结果赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let part: number[] = arr.slice(1, 3)
      expect(part.length).assertEqual(2)
      expect(part[0]).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3770
     * @tc.name testAssignmentOperator367
     * @tc.desc Verify 联合类型赋值number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = 42
      expect(val).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3780
     * @tc.name testAssignmentOperator368
     * @tc.desc Verify 联合类型赋值string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = "hello"
      expect(val).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3790
     * @tc.name testAssignmentOperator369
     * @tc.desc Verify 联合类型重新赋值不同类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = 42
      val = "changed"
      expect(val).assertEqual("changed")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3800
     * @tc.name testAssignmentOperator370
     * @tc.desc Verify 联合类型复合赋值（number分支）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = 10
      if (typeof val === "number") {
        val += 5
      }
      expect(val).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3810
     * @tc.name testAssignmentOperator371
     * @tc.desc Verify 联合类型+=在string分支
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = "hello"
      if (typeof val === "string") {
        val += " world"
      }
      expect(val).assertEqual("hello world")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3820
     * @tc.name testAssignmentOperator372
     * @tc.desc Verify nullable类型赋值实际值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | null = null
      val = 42
      expect(val).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3830
     * @tc.name testAssignmentOperator373
     * @tc.desc Verify nullable类型赋值null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | null = 42
      val = null
      expect(val).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3840
     * @tc.name testAssignmentOperator374
     * @tc.desc Verify nullable类型复合赋值前需要非空检查
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | null = 10
      if (val !== null) {
        val += 5
      }
      expect(val).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3850
     * @tc.name testAssignmentOperator375
     * @tc.desc Verify as断言后赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = 42
      let num: number = val as number
      expect(num).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3860
     * @tc.name testAssignmentOperator376
     * @tc.desc Verify as断言联合类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = "test"
      let str: string = val as string
      expect(str).assertEqual("test")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3880
     * @tc.name testAssignmentOperator378
     * @tc.desc Verify 非空断言赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | null = 42
      let num: number = val!
      expect(num).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3890
     * @tc.name testAssignmentOperator379
     * @tc.desc Verify void表达式返回undefined赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: undefined = void 0
      expect(x).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3900
     * @tc.name testAssignmentOperator380
     * @tc.desc Verify void运算符丢弃表达式值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: undefined = void (42 + 1)
      expect(x).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3950
     * @tc.name testAssignmentOperator385
     * @tc.desc Verify 枚举成员赋值给变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Color385 = Color385.Green
      expect(c).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3960
     * @tc.name testAssignmentOperator386
     * @tc.desc Verify 枚举复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d: number = Direction386.North
      d += Direction386.South
      expect(d).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3970
     * @tc.name testAssignmentOperator387
     * @tc.desc Verify 枚举值作为位标志复合赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: number = Perm387.Read
      p |= Perm387.Write
      p |= Perm387.Execute
      expect(p).assertEqual(7)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3980
     * @tc.name testAssignmentOperator388
     * @tc.desc Verify 字符串枚举成员赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Status388 = Status388.Active
      expect(s).assertEqual("ACTIVE")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_3990
     * @tc.name testAssignmentOperator389
     * @tc.desc Verify 字符串枚举拼接赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix: string = Prefix389.User
      prefix += "123"
      expect(prefix).assertEqual("user_123")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4010
     * @tc.name testAssignmentOperator391
     * @tc.desc Verify typeof守卫number分支赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = Math.random() > 0.5 ? 42 : "hello"
      let result: number = 0
      if (typeof val === "number") {
        result = val * 2
      } else {
        result = val.length
      }
      expect(result >= 0).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4020
     * @tc.name testAssignmentOperator392
     * @tc.desc Verify typeof守卫string分支拼接赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | string = "hello"
      let result: string = ""
      if (typeof val === "string") {
        result = val.toUpperCase()
      }
      expect(result).assertEqual("HELLO")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4030
     * @tc.name testAssignmentOperator393
     * @tc.desc Verify typeof守卫boolean分支赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: boolean | number = true
      let result: number = 0
      if (typeof val === "boolean") {
        result = val ? 1 : 0
      }
      expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4040
     * @tc.name testAssignmentOperator394
     * @tc.desc Verify instanceof守卫Array分支赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = [1, 2, 3]
      let length: number = 0
      if (val instanceof Array) {
        length = val.length
      }
      expect(length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4050
     * @tc.name testAssignmentOperator395
     * @tc.desc Verify instanceof守卫Date分支赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = new Date(2024, 0, 1)
      let year: number = 0
      if (val instanceof Date) {
        year = val.getFullYear()
      }
      expect(year).assertEqual(2024)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4060
     * @tc.name testAssignmentOperator396
     * @tc.desc Verify instanceof守卫Map分支赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = new Map<string, number>()
      val.set("a", 1)
      let size: number = 0
      if (val instanceof Map) {
        size = val.size
      }
      expect(size).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4070
     * @tc.name testAssignmentOperator397
     * @tc.desc Verify catch块中赋值错误信息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorMsg: string = ""
      try {
        throw new Error("test error")
      } catch (e) {
        errorMsg = (e as Error).message
      }
      expect(errorMsg).assertEqual("test error")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4080
     * @tc.name testAssignmentOperator398
     * @tc.desc Verify try块成功后赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 0
      let success: boolean = false
      try {
        result = 42
        success = true
      } catch (e) {
        result = -1
      }
      expect(result).assertEqual(42)
      expect(success).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4090
     * @tc.name testAssignmentOperator399
     * @tc.desc Verify finally块中的赋值（无论是否异常都执行）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cleaned: boolean = false
      try {
        let x: number = 10 / 0
      } finally {
        cleaned = true
      }
      expect(cleaned).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4100
     * @tc.name testAssignmentOperator400
     * @tc.desc Verify 嵌套try-catch中的赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerResult: number = 0
      let innerResult: number = 0
      try {
        try {
          throw new Error("inner")
        } catch (e) {
          innerResult = 1
          throw new Error("outer")
        }
      } catch (e) {
        outerResult = 2
      }
      expect(innerResult).assertEqual(1)
      expect(outerResult).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4110
     * @tc.name testAssignmentOperator401
     * @tc.desc Verify catch后重新赋值恢复状态
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state: string = "initial"
      try {
        state = "processing"
        throw new Error("fail")
      } catch (e) {
        state = "error"
      }
      expect(state).assertEqual("error")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4130
     * @tc.name testAssignmentOperator403
     * @tc.desc Verify 赋值表达式作为函数参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let result = double403(x = 5)
      expect(result).assertEqual(10)
      expect(x).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4140
     * @tc.name testAssignmentOperator404
     * @tc.desc Verify 复合赋值表达式作为函数参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10
      let result = passthrough404(x += 5)
      expect(result).assertEqual(15)
      expect(x).assertEqual(15)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ASSIGNMENT_OPERATOR_4150
     * @tc.name testAssignmentOperator405
     * @tc.desc Verify 多个赋值表达式作为参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAssignmentOperator405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 0, b: number = 0
      let result = add405(a = 3, b = 4)
      expect(result).assertEqual(7)
      expect(a).assertEqual(3)
      expect(b).assertEqual(4)
    });

  });
}

function double403(n: number): number {
  return n * 2
}

function passthrough404(n: number): number {
  return n
}

function add405(x: number, y: number): number {
  return x + y
}

class Temperature270 {
  private _celsius: number = 0

  get celsius(): number {
    return this._celsius
  }

  set celsius(v: number) {
    this._celsius = v
  }
}

class Temperature271 {
  private _celsius: number = 0

  get fahrenheit(): number {
    return this._celsius * 9 / 5 + 32
  }

  set fahrenheit(v: number) {
    this._celsius = (v - 32) * 5 / 9
  }
}

class Counter272 {
  private _val: number = 0

  get value(): number {
    return this._val
  }

  set value(v: number) {
    this._val = v
  }
}

class Config333 {
  static version: string = "1.0"
}

class Counter334 {
  static count: number = 0
}

class Instance335 {
  static total: number = 0

  constructor() {
    Instance335.total += 1
  }
}

class Point336 {
  x: number
  y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}

class Bank337 {
  balance: number = 0
}

class Logger338 {
  log: string = ""
}