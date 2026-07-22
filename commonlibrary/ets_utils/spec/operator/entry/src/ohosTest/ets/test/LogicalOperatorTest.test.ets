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

let cache: number = 0
let cachedData: ESObject = null
let initCount: number = 0

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function LogicalOperatorTest() {
  describe('LogicalOperatorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0120
     * @tc.name testLogicalOperator002
     * @tc.desc Verify true && false 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0130
     * @tc.name testLogicalOperator003
     * @tc.desc Verify false && true 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false && true).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0140
     * @tc.name testLogicalOperator004
     * @tc.desc Verify false && false 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0150
     * @tc.name testLogicalOperator005
     * @tc.desc Verify 比较表达式与逻辑与
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((3 > 2) && (5 > 3)).assertTrue()
      expect((3 > 2) && (5 < 3)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0160
     * @tc.name testLogicalOperator006
     * @tc.desc Verify false && (3 == 4) 返回 false（短路）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 3
      let b = 4
      expect(false && (a == b)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0170
     * @tc.name testLogicalOperator007
     * @tc.desc Verify false && "Cat" 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) && "Cat").assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0180
     * @tc.name testLogicalOperator008
     * @tc.desc Verify 0 && "Cat" 返回 0（不是false）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) && "Cat").assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0190
     * @tc.name testLogicalOperator009
     * @tc.desc Verify "" && "Cat" 返回 ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) && "Cat").assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0200
     * @tc.name testLogicalOperator010
     * @tc.desc Verify null && "Cat" 返回 null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) && "Cat").assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0210
     * @tc.name testLogicalOperator011
     * @tc.desc Verify undefined && "Cat" 返回 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) && "Cat").assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0220
     * @tc.name testLogicalOperator012
     * @tc.desc Verify NaN && "Cat" 返回 NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Number.isNaN((NaN as ESObject) && "Cat")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0230
     * @tc.name testLogicalOperator013
     * @tc.desc Verify true && true 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true && true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0240
     * @tc.name testLogicalOperator014
     * @tc.desc Verify "Cat" && "Dog" 返回 "Dog"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("Cat" as ESObject) && "Dog").assertEqual("Dog")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0250
     * @tc.name testLogicalOperator015
     * @tc.desc Verify "Cat" && false 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("Cat" as ESObject) && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0260
     * @tc.name testLogicalOperator016
     * @tc.desc Verify 1 && 0 返回 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) && 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0270
     * @tc.name testLogicalOperator017
     * @tc.desc Verify 1 && 2 返回 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) && 2).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0280
     * @tc.name testLogicalOperator018
     * @tc.desc Verify {} && "val" 返回 "val"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(({} as ESObject) && "val").assertEqual("val")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0290
     * @tc.name testLogicalOperator019
     * @tc.desc Verify [] && "val" 返回 "val"（空数组是truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(([] as ESObject) && "val").assertEqual("val")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0350
     * @tc.name testLogicalOperator025
     * @tc.desc Verify 全truthy链式返回最后一个
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) && (2 as ESObject) && (3 as ESObject)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0360
     * @tc.name testLogicalOperator026
     * @tc.desc Verify 链式中第一个falsy被返回
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) && (0 as ESObject) && (3 as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0380
     * @tc.name testLogicalOperator028
     * @tc.desc Verify true && true && false 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true && true && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0390
     * @tc.name testLogicalOperator029
     * @tc.desc Verify true && false && true 返回 false（短路）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true && false && true).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0400
     * @tc.name testLogicalOperator030
     * @tc.desc Verify 使用&&守卫null/undefined访问
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = null
      let result: ESObject = obj && obj.property
      expect(result).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0410
     * @tc.name testLogicalOperator031
     * @tc.desc Verify 对象存在时守卫通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { property: "value" }
      let result: ESObject = obj && obj.property
      expect(result).assertEqual("value")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0420
     * @tc.name testLogicalOperator032
     * @tc.desc Verify 使用&&作为简短if
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false
      let condition: boolean = true
      condition && (() => {
        executed = true
      })()
      expect(executed).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0430
     * @tc.name testLogicalOperator033
     * @tc.desc Verify 条件为false时不执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false
      let condition: boolean = false
      condition && (() => {
        executed = true
      })()
      expect(executed).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0440
     * @tc.name testLogicalOperator034
     * @tc.desc Verify true || true 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true || true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0450
     * @tc.name testLogicalOperator035
     * @tc.desc Verify false || true 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false || true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0460
     * @tc.name testLogicalOperator036
     * @tc.desc Verify true || false 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true || false).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0480
     * @tc.name testLogicalOperator038
     * @tc.desc Verify false || (3 == 4) 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 3
      let b = 4
      expect(false && (a == b)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0490
     * @tc.name testLogicalOperator039
     * @tc.desc Verify "Cat" || "Dog" 返回 "Cat"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("Cat" as ESObject) || "Dog").assertEqual("Cat")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0500
     * @tc.name testLogicalOperator040
     * @tc.desc Verify 1 || 0 返回 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) || 0).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0510
     * @tc.name testLogicalOperator041
     * @tc.desc Verify true || "fallback" 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) || "fallback").assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0520
     * @tc.name testLogicalOperator042
     * @tc.desc Verify {} || "fallback" 返回对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { a: 1 }
      expect((obj as ESObject) || "fallback").assertEqual(obj)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0530
     * @tc.name testLogicalOperator043
     * @tc.desc Verify [] || "fallback" 返回数组（空数组是truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ESObject = []
      expect((arr as ESObject) || "fallback").assertEqual(arr)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0540
     * @tc.name testLogicalOperator044
     * @tc.desc Verify false || "Cat" 返回 "Cat"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) || "Cat").assertEqual("Cat")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0550
     * @tc.name testLogicalOperator045
     * @tc.desc Verify 0 || "fallback" 返回 "fallback"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) || "fallback").assertEqual("fallback")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0560
     * @tc.name testLogicalOperator046
     * @tc.desc Verify "" || "fallback" 返回 "fallback"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("" as ESObject) || "fallback").assertEqual("fallback")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0570
     * @tc.name testLogicalOperator047
     * @tc.desc Verify null || "fallback" 返回 "fallback"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null as ESObject) || "fallback").assertEqual("fallback")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0580
     * @tc.name testLogicalOperator048
     * @tc.desc Verify undefined || "fallback" 返回 "fallback"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((undefined as ESObject) || "fallback").assertEqual("fallback")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0590
     * @tc.name testLogicalOperator049
     * @tc.desc Verify NaN || "fallback" 返回 "fallback"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((NaN as ESObject) || "fallback").assertEqual("fallback")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0600
     * @tc.name testLogicalOperator050
     * @tc.desc Verify 0 || 0 返回 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) || 0).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0610
     * @tc.name testLogicalOperator051
     * @tc.desc Verify false || false 返回 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false || false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0670
     * @tc.name testLogicalOperator057
     * @tc.desc Verify 全falsy链式返回最后一个
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) || ("" as ESObject) || (null as ESObject)).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0680
     * @tc.name testLogicalOperator058
     * @tc.desc Verify 链式中第一个truthy被返回
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) || ("" as ESObject) || ("found" as ESObject)).assertEqual("found")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0700
     * @tc.name testLogicalOperator060
     * @tc.desc Verify false || false || true 返回 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(false || false || true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0710
     * @tc.name testLogicalOperator061
     * @tc.desc Verify undefined时使用默认值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string | undefined = undefined
      let name: string = (input as ESObject) || "default"
      expect(name).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0720
     * @tc.name testLogicalOperator062
     * @tc.desc Verify 有值时不使用默认值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello"
      let name: string = (input as ESObject) || "default"
      expect(name).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0730
     * @tc.name testLogicalOperator063
     * @tc.desc Verify 空字符串时使用默认值（||的陷阱）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = ""
      let name: string = (input as ESObject) || "default"
      expect(name).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0740
     * @tc.name testLogicalOperator064
     * @tc.desc Verify 0时使用默认值（||的陷阱）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: number = 0
      let val: number = (input as ESObject) || 100
      expect(val).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0750
     * @tc.name testLogicalOperator065
     * @tc.desc Verify 多级fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let primary: ESObject = null
      let secondary: ESObject = undefined
      let tertiary: ESObject = "tertiary value"
      let result: ESObject = primary || secondary || tertiary
      expect(result).assertEqual("tertiary value")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0760
     * @tc.name testLogicalOperator066
     * @tc.desc Verify !true 等于 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!true).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0780
     * @tc.name testLogicalOperator068
     * @tc.desc Verify !0 等于 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(0 as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0790
     * @tc.name testLogicalOperator069
     * @tc.desc Verify !"" 等于 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!("" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0800
     * @tc.name testLogicalOperator070
     * @tc.desc Verify !null 等于 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(null as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0810
     * @tc.name testLogicalOperator071
     * @tc.desc Verify !undefined 等于 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(undefined as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0820
     * @tc.name testLogicalOperator072
     * @tc.desc Verify !NaN 等于 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(NaN as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0830
     * @tc.name testLogicalOperator073
     * @tc.desc Verify !false 等于 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!false).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0840
     * @tc.name testLogicalOperator074
     * @tc.desc Verify !1 等于 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(1 as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0850
     * @tc.name testLogicalOperator075
     * @tc.desc Verify !"Cat" 等于 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!("Cat" as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0860
     * @tc.name testLogicalOperator076
     * @tc.desc Verify !{} 等于 false（空对象是truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!({} as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0870
     * @tc.name testLogicalOperator077
     * @tc.desc Verify ![] 等于 false（空数组是truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!([] as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0880
     * @tc.name testLogicalOperator078
     * @tc.desc Verify !-1 等于 false（负数是truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(-1 as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0900
     * @tc.name testLogicalOperator080
     * @tc.desc Verify !Infinity 等于 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(Infinity as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0910
     * @tc.name testLogicalOperator081
     * @tc.desc Verify !"false" 等于 false（非空字符串"false"是truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!("false" as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0920
     * @tc.name testLogicalOperator082
     * @tc.desc Verify !对number返回boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (!(0 as ESObject))).assertEqual("boolean")
      expect(typeof (!(1 as ESObject))).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0930
     * @tc.name testLogicalOperator083
     * @tc.desc Verify !对string返回boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (!("" as ESObject))).assertEqual("boolean")
      expect(typeof (!("a" as ESObject))).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0940
     * @tc.name testLogicalOperator084
     * @tc.desc Verify !对object返回boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof (!({} as ESObject))).assertEqual("boolean")
      expect(typeof (!(null as ESObject))).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0950
     * @tc.name testLogicalOperator085
     * @tc.desc Verify !与&&/||返回类型的对比
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ((0 as ESObject) && "x")).assertEqual("number")
      expect(typeof ((false as ESObject) || "x")).assertEqual("string")
      expect(typeof (!(0 as ESObject))).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0960
     * @tc.name testLogicalOperator086
     * @tc.desc Verify !!truthy值为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(1 as ESObject)).assertTrue()
      expect(!!("hello" as ESObject)).assertTrue()
      expect(!!({} as ESObject)).assertTrue()
      expect(!!([] as ESObject)).assertTrue()
      expect(!!(-1 as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0970
     * @tc.name testLogicalOperator087
     * @tc.desc Verify !!falsy值为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(0 as ESObject)).assertFalse()
      expect(!!("" as ESObject)).assertFalse()
      expect(!!(null as ESObject)).assertFalse()
      expect(!!(undefined as ESObject)).assertFalse()
      expect(!!(NaN as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_0990
     * @tc.name testLogicalOperator089
     * @tc.desc Verify 使用!!确保条件为布尔值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: ESObject = "text"
      if (!!value) {
        expect(true).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1010
     * @tc.name testLogicalOperator091
     * @tc.desc Verify &&左侧falsy时右侧赋值不执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let condition: boolean = false
      let result = condition && ((x = 10) > 5)
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1020
     * @tc.name testLogicalOperator092
     * @tc.desc Verify &&左侧falsy时右侧属性访问不执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = null
      let result: ESObject = obj && obj.deep.property
      expect(result).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1030
     * @tc.name testLogicalOperator093
     * @tc.desc Verify &&左侧truthy时右侧执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 0
      let condition: boolean = true
      let result = condition && ((x = 10) > 5)
      expect(x).assertEqual(10)
      expect(result).assertTrue()
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1050
     * @tc.name testLogicalOperator095
     * @tc.desc Verify ||左侧truthy时右侧函数不调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0
      let cached: string = "cached_value"
      let result: string = (cached as ESObject) || (() => {
        callCount++;
        return "computed"
      })()
      expect(callCount).assertEqual(0)
      expect(result).assertEqual("cached_value")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1060
     * @tc.name testLogicalOperator096
     * @tc.desc Verify ||左侧falsy时右侧执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount: number = 0
      let cached: string = ""
      let result: string = (cached as ESObject) || (() => {
        callCount++;
        return "computed"
      })()
      expect(callCount).assertEqual(1)
      expect(result).assertEqual("computed")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1070
     * @tc.name testLogicalOperator097
     * @tc.desc Verify 使用||实现简单缓存
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: number = cache || expensiveCompute97()
      expect(result1).assertEqual(42)
      let result2: number = cache || expensiveCompute97()
      expect(result2).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1080
     * @tc.name testLogicalOperator098
     * @tc.desc Verify true && false || "result" 返回 "result"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((true as ESObject) && false) || "result").assertEqual("result")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1090
     * @tc.name testLogicalOperator099
     * @tc.desc Verify false || true && "result" 返回 "result"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) || ((true as ESObject) && "result")).assertEqual("result")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1110
     * @tc.name testLogicalOperator101
     * @tc.desc Verify false是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!false).assertFalse()
      expect(Boolean(false as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1120
     * @tc.name testLogicalOperator102
     * @tc.desc Verify 0是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(0 as ESObject)).assertFalse()
      expect(Boolean(0 as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1130
     * @tc.name testLogicalOperator103
     * @tc.desc Verify -0是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(-0 as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1140
     * @tc.name testLogicalOperator104
     * @tc.desc Verify 0n是falsy（BigInt零）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(0n as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1150
     * @tc.name testLogicalOperator105
     * @tc.desc Verify ""空字符串是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!("" as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1160
     * @tc.name testLogicalOperator106
     * @tc.desc Verify null是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(null as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1170
     * @tc.name testLogicalOperator107
     * @tc.desc Verify undefined是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(undefined as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1180
     * @tc.name testLogicalOperator108
     * @tc.desc Verify NaN是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(NaN as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1210
     * @tc.name testLogicalOperator111
     * @tc.desc Verify "0"字符串是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!("0" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1220
     * @tc.name testLogicalOperator112
     * @tc.desc Verify "false"字符串是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!("false" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1230
     * @tc.name testLogicalOperator113
     * @tc.desc Verify "null"字符串是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!("null" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1240
     * @tc.name testLogicalOperator114
     * @tc.desc Verify "undefined"字符串是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!("undefined" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1250
     * @tc.name testLogicalOperator115
     * @tc.desc Verify " "含空格字符串是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(" " as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1260
     * @tc.name testLogicalOperator116
     * @tc.desc Verify "0"在||中不被替换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(("0" as ESObject) || "default").assertEqual("0")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1270
     * @tc.name testLogicalOperator117
     * @tc.desc Verify 空对象{}是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!({} as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1280
     * @tc.name testLogicalOperator118
     * @tc.desc Verify 空数组[]是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!([] as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1300
     * @tc.name testLogicalOperator120
     * @tc.desc Verify 函数是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!((() => {
      }) as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1310
     * @tc.name testLogicalOperator121
     * @tc.desc Verify new Boolean(false)是truthy（对象）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(new Boolean(false) as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1320
     * @tc.name testLogicalOperator122
     * @tc.desc Verify new Number(0)是truthy（对象）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(new Number(0) as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1330
     * @tc.name testLogicalOperator123
     * @tc.desc Verify new String("")是truthy（对象）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(new String("") as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1340
     * @tc.name testLogicalOperator124
     * @tc.desc Verify Infinity是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(Infinity as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1350
     * @tc.name testLogicalOperator125
     * @tc.desc Verify -Infinity是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(-Infinity as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1360
     * @tc.name testLogicalOperator126
     * @tc.desc Verify 0在if中为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entered: boolean = false
      if (0 as ESObject) {
        entered = true
      }
      expect(entered).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1370
     * @tc.name testLogicalOperator127
     * @tc.desc Verify "0"在if中为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entered: boolean = false
      if ("0" as ESObject) {
        entered = true
      }
      expect(entered).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1380
     * @tc.name testLogicalOperator128
     * @tc.desc Verify []在if中为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entered: boolean = false
      if ([] as ESObject) {
        entered = true
      }
      expect(entered).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1390
     * @tc.name testLogicalOperator129
     * @tc.desc Verify {}在if中为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let entered: boolean = false
      if ({} as ESObject) {
        entered = true
      }
      expect(entered).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1410
     * @tc.name testLogicalOperator131
     * @tc.desc Verify Boolean对数值转换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean(0 as ESObject)).assertFalse()
      expect(Boolean(-0 as ESObject)).assertFalse()
      expect(Boolean(NaN as ESObject)).assertFalse()
      expect(Boolean(Infinity as ESObject)).assertTrue()
      expect(Boolean(-Infinity as ESObject)).assertTrue()
      expect(Boolean(0.1 as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1420
     * @tc.name testLogicalOperator132
     * @tc.desc Verify Boolean对字符串转换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Boolean("" as ESObject)).assertFalse()
      expect(Boolean(" " as ESObject)).assertTrue()
      expect(Boolean("0" as ESObject)).assertTrue()
      expect(Boolean("false" as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1430
     * @tc.name testLogicalOperator133
     * @tc.desc Verify &&返回falsy操作数时保持原类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ((0 as ESObject) && "x")).assertEqual("number")
      expect(typeof (("" as ESObject) && "x")).assertEqual("string")
      expect(typeof ((null as ESObject) && "x")).assertEqual("object")
      expect(typeof ((undefined as ESObject) && "x")).assertEqual("undefined")
      expect(typeof ((NaN as ESObject) && "x")).assertEqual("number")
      expect(typeof ((false as ESObject) && "x")).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1440
     * @tc.name testLogicalOperator134
     * @tc.desc Verify &&返回第二个操作数时保持第二个类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ((1 as ESObject) && "x")).assertEqual("string")
      expect(typeof (("a" as ESObject) && 42)).assertEqual("number")
      expect(typeof ((true as ESObject) && false)).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1450
     * @tc.name testLogicalOperator135
     * @tc.desc Verify ||返回truthy操作数时保持原类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ((1 as ESObject) || "x")).assertEqual("number")
      expect(typeof (("a" as ESObject) || 0)).assertEqual("string")
      expect(typeof ((true as ESObject) || false)).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1460
     * @tc.name testLogicalOperator136
     * @tc.desc Verify ||返回第二个操作数时保持第二个类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ((0 as ESObject) || "x")).assertEqual("string")
      expect(typeof (("" as ESObject) || 42)).assertEqual("number")
      expect(typeof ((null as ESObject) || false)).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1470
     * @tc.name testLogicalOperator137
     * @tc.desc Verify !先于&&执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!false && true).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1480
     * @tc.name testLogicalOperator138
     * @tc.desc Verify !a && b 先执行!a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(0 as ESObject) && (1 as ESObject)).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1490
     * @tc.name testLogicalOperator139
     * @tc.desc Verify 需要括号改变优先级
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(true && false)).assertTrue()
      expect(!true && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1500
     * @tc.name testLogicalOperator140
     * @tc.desc Verify !先于||执行
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!false || false).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1510
     * @tc.name testLogicalOperator141
     * @tc.desc Verify !a || b 先执行!a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(0 as ESObject) || (0 as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1520
     * @tc.name testLogicalOperator142
     * @tc.desc Verify a || b && c 先执行b && c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) || ((true as ESObject) && false)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1530
     * @tc.name testLogicalOperator143
     * @tc.desc Verify true || false && false 先执行&&
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) || ((false as ESObject) && false)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1540
     * @tc.name testLogicalOperator144
     * @tc.desc Verify 使用括号改变优先级
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((true as ESObject) || false) && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1550
     * @tc.name testLogicalOperator145
     * @tc.desc Verify 比较运算先于&&和||
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(3 > 2 && 5 > 3).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1560
     * @tc.name testLogicalOperator146
     * @tc.desc Verify 比较运算先于||
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(1 < 0 || 2 > 1).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1570
     * @tc.name testLogicalOperator147
     * @tc.desc Verify 算术先于&&
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 + 1 as ESObject) && (2 * 2 as ESObject)).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1590
     * @tc.name testLogicalOperator149
     * @tc.desc Verify 文档所有&&示例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true && true)).assertTrue()
      expect((true && false)).assertFalse()
      expect((false && true)).assertFalse()
      expect(("Cat" as ESObject) && "Dog").assertEqual("Dog")
      expect((false as ESObject) && "Cat").assertEqual(false)
      expect(("Cat" as ESObject) && false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1600
     * @tc.name testLogicalOperator150
     * @tc.desc Verify 文档所有||示例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(true || true).assertTrue()
      expect(false || true).assertTrue()
      expect(true || false).assertTrue()
      expect(("Cat" as ESObject) || "Dog").assertEqual("Cat")
      expect((false as ESObject) || "Cat").assertEqual("Cat")
      expect(("Cat" as ESObject) || false).assertEqual("Cat")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1610
     * @tc.name testLogicalOperator151
     * @tc.desc Verify 文档所有!示例
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!true).assertFalse()
      expect(!false).assertTrue()
      expect(!("Cat" as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1620
     * @tc.name testLogicalOperator152
     * @tc.desc Verify &&在if条件中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let age: number = 20, hasLicense: boolean = true
      if (age >= 18 && hasLicense) {
        expect(true).assertTrue()
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1630
     * @tc.name testLogicalOperator153
     * @tc.desc Verify ||在if条件中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isVip: boolean = false, hasCoupon: boolean = true
      if (isVip || hasCoupon) {
        expect(true).assertTrue()
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1640
     * @tc.name testLogicalOperator154
     * @tc.desc Verify !在if条件中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isBlocked: boolean = false
      if (!isBlocked) {
        expect(true).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1650
     * @tc.name testLogicalOperator155
     * @tc.desc Verify &&和||在三元表达式中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isLoggedIn: boolean = true
      let isAdmin: boolean = false
      let page: string = (isLoggedIn && isAdmin) ? "admin" : "user"
      expect(page).assertEqual("user")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1660
     * @tc.name testLogicalOperator156
     * @tc.desc Verify &&作为while循环条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 0
      let found: boolean = false
      let arr: number[] = [1, 3, 5, 7, 9]
      while (i < arr.length && !found) {
        if (arr[i] === 5) {
          found = true
        }
        i++
      }
      expect(found).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1670
     * @tc.name testLogicalOperator157
     * @tc.desc Verify ||作为while循环条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let retries: number = 0
      let success: boolean = false
      while (retries < 3 || success) {
        success = retries === 2
        retries++
        if (success) {
          break
        }
      }
      expect(success).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1690
     * @tc.name testLogicalOperator159
     * @tc.desc Verify ||在filter回调中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [1, 2, 3, 4, 5, 6]
      let result: number[] = nums.filter(n => n < 3 || n > 4)
      expect(result.length).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1700
     * @tc.name testLogicalOperator160
     * @tc.desc Verify &&在every回调中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [2, 4, 6, 8]
      let allEvenAndPositive: boolean = arr.every(n => n > 0 && n % 2 === 0)
      expect(allEvenAndPositive).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1710
     * @tc.name testLogicalOperator161
     * @tc.desc Verify ||在some回调中
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 3, 5, 6]
      let hasEvenOrLarge: boolean = arr.some(n => n % 2 === 0 || n > 10)
      expect(hasEvenOrLarge).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1720
     * @tc.name testLogicalOperator162
     * @tc.desc Verify 使用||设置默认值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(greet162()).assertEqual("Hello, Guest")
      expect(greet162("Alice")).assertEqual("Hello, Alice")
      expect(greet162("")).assertEqual("Hello, Guest")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1730
     * @tc.name testLogicalOperator163
     * @tc.desc Verify ES6默认参数对undefined生效
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(greet163()).assertEqual("Hello, Guest")
      expect(greet163("Alice")).assertEqual("Hello, Alice")
      expect(greet163("")).assertEqual("Hello, ")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1740
     * @tc.name testLogicalOperator164
     * @tc.desc Verify ||对0的陷阱
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(process164()).assertEqual(10)
      expect(process164(0)).assertEqual(10)
      expect(process164(5)).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1750
     * @tc.name testLogicalOperator165
     * @tc.desc Verify &&守卫访问属性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = null
      let result1: ESObject = obj && obj.prop
      let result2: ESObject = obj?.prop
      expect(result1).assertNull()
      expect(result2).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1760
     * @tc.name testLogicalOperator166
     * @tc.desc Verify &&守卫与?.对undefined的行为差异
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = undefined
      let result1: ESObject = obj && obj.prop
      let result2: ESObject = obj?.prop
      expect(result1).assertUndefined()
      expect(result2).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1790
     * @tc.name testLogicalOperator169
     * @tc.desc Verify De Morgan定律——与的非等于非的或
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: boolean = true, b: boolean = false
      expect(!(a && b)).assertEqual(!a || !b)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1820
     * @tc.name testLogicalOperator172
     * @tc.desc Verify &&结果赋值给变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: ESObject = (5 as ESObject) && "result"
      expect(x).assertEqual("result")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1830
     * @tc.name testLogicalOperator173
     * @tc.desc Verify &&falsy结果赋值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: ESObject = (0 as ESObject) && "result"
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1840
     * @tc.name testLogicalOperator174
     * @tc.desc Verify ||结果赋值给变量
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = (("" as ESObject) || "default") as string
      expect(x).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1850
     * @tc.name testLogicalOperator175
     * @tc.desc Verify &&结果类型为联合类型（TS推断）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | null = 42
      if (val !== null && val > 0) {
        expect(val).assertEqual(42)
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1860
     * @tc.name testLogicalOperator176
     * @tc.desc Verify ||结果类型推断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string | undefined = undefined
      let result: string = val || "default"
      expect(result).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1870
     * @tc.name testLogicalOperator177
     * @tc.desc Verify !用于反向类型守卫
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string | null = "hello"
      if (val !== null) {
        expect(val.length).assertEqual(5)
      }
    });
