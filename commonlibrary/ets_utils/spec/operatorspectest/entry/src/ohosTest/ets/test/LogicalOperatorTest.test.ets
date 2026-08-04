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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1880
     * @tc.name testLogicalOperator178
     * @tc.desc Verify !!用于将联合类型收窄为boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number | null = 42
      let isPresent: boolean = val !== null
      expect(isPresent).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1890
     * @tc.name testLogicalOperator179
     * @tc.desc Verify ||对合法的0值产生误替换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let price: number = 0
      let displayPrice: number = (price as ESObject) || 99
      expect(displayPrice).assertEqual(99)
      let correctPrice: number = price !== undefined ? price : 99
      expect(correctPrice).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1900
     * @tc.name testLogicalOperator180
     * @tc.desc Verify ??避免对0和空字符串的误替换
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0
      let result: number = (val as ESObject) ?? 99
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1910
     * @tc.name testLogicalOperator181
     * @tc.desc Verify &&返回值在布尔上下文外的行为
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = ("a" as ESObject) && ("b" as ESObject)
      expect(result).assertEqual("b")
      expect(typeof result).assertEqual("string")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1920
     * @tc.name testLogicalOperator182
     * @tc.desc Verify []在条件中为truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      if (arr as ESObject) {
        expect(true).assertTrue()
      }
      if (arr.length > 0) {
        expect().assertFail()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1930
     * @tc.name testLogicalOperator183
     * @tc.desc Verify &&和||返回操作数值，!返回boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof ((1 as ESObject) && (2 as ESObject))).assertEqual("number")
      expect(typeof ((0 as ESObject) || (1 as ESObject))).assertEqual("number")
      expect(typeof (!(0 as ESObject))).assertEqual("boolean")
      expect(typeof (!!(1 as ESObject))).assertEqual("boolean")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1940
     * @tc.name testLogicalOperator184
     * @tc.desc Verify &&和||结果在if中自动转布尔
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: ESObject = ("a" as ESObject) && (0 as ESObject)
      if (x) {
        expect().assertFail()
      } else {
        expect(true).assertTrue()
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1950
     * @tc.name testLogicalOperator185
     * @tc.desc Verify truthy对象 && 值——返回第二个
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { x: 1 }
      expect((obj as ESObject) && 42).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1960
     * @tc.name testLogicalOperator186
     * @tc.desc Verify 对象 && 对象——返回第二个对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = { x: 1 }
      let b: ESObject = { y: 2 }
      expect(((a as ESObject) && (b as ESObject))).assertEqual(b)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1970
     * @tc.name testLogicalOperator187
     * @tc.desc Verify 对象 && null——返回null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { x: 1 }
      expect(((obj as ESObject) && null)).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1980
     * @tc.name testLogicalOperator188
     * @tc.desc Verify 对象 || 值——返回对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { x: 1 }
      expect((obj as ESObject) || "fallback").assertEqual(obj)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_1990
     * @tc.name testLogicalOperator189
     * @tc.desc Verify null || 对象——返回对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = { x: 1 }
      expect((null as ESObject) || obj).assertEqual(obj)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2000
     * @tc.name testLogicalOperator190
     * @tc.desc Verify !对象——false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: ESObject = {}
      expect(!(obj as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2010
     * @tc.name testLogicalOperator191
     * @tc.desc Verify !null——true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(null as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2020
     * @tc.name testLogicalOperator192
     * @tc.desc Verify [] && 1 返回1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(([] as ESObject) && 1).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2030
     * @tc.name testLogicalOperator193
     * @tc.desc Verify [] || "fallback" 返回数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = ([] as ESObject) || "fallback"
      expect(Array.isArray(result)).assertTrue()
      expect(result.length).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2040
     * @tc.name testLogicalOperator194
     * @tc.desc Verify ![] 等于 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!([] as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2050
     * @tc.name testLogicalOperator195
     * @tc.desc Verify [0] && 1 返回1（含0的数组仍truthy）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(([0] as ESObject) && 1).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2060
     * @tc.name testLogicalOperator196
     * @tc.desc Verify [null] || "fallback" 返回数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = ([null] as ESObject) || "fallback"
      expect(Array.isArray(result)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2070
     * @tc.name testLogicalOperator197
     * @tc.desc Verify 函数 && 值——返回值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = () => 42
      expect((fn as ESObject) && "called").assertEqual("called")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2080
     * @tc.name testLogicalOperator198
     * @tc.desc Verify 函数 || "fallback"——返回函数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = () => 42
      let result: ESObject = (fn as ESObject) || (() => 0)
      expect(result).assertEqual(fn)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2090
     * @tc.name testLogicalOperator199
     * @tc.desc Verify !函数——false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = () => 42
      expect(!(fn as ESObject)).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2100
     * @tc.name testLogicalOperator200
     * @tc.desc Verify 条件 && 函数调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let condition: boolean = true
      let result: number = condition ? (() => 42)() : 0
      expect(result).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2140
     * @tc.name testLogicalOperator204
     * @tc.desc Verify 0n是falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(0n as ESObject)).assertFalse()
      expect((0n as ESObject) && "right").assertEqual(0n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2150
     * @tc.name testLogicalOperator205
     * @tc.desc Verify 非0 BigInt是truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!(1n as ESObject)).assertTrue()
      expect(!!(-1n as ESObject)).assertTrue()
      expect(!!(999n as ESObject)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2160
     * @tc.name testLogicalOperator206
     * @tc.desc Verify 非0 BigInt || "fallback"返回BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1n as ESObject) || "fallback").assertEqual(1n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2170
     * @tc.name testLogicalOperator207
     * @tc.desc Verify a && b || c（如果a且b为truthy返回b，否则返回c）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { name: "Alice", role: "admin" }
      let result: string = (user && user.role) || "guest"
      expect(result).assertEqual("admin")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2180
     * @tc.name testLogicalOperator208
     * @tc.desc Verify a && b || c——a为falsy时返回c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = null
      let result: string = ((user as ESObject) && user.role) || "guest"
      expect(result).assertEqual("guest")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2190
     * @tc.name testLogicalOperator209
     * @tc.desc Verify a || b && c（||优先级低，先算b && c）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false as ESObject) || ((true as ESObject) && "result")).assertEqual("result")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2210
     * @tc.name testLogicalOperator211
     * @tc.desc Verify 多层&&守卫中间为null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: ESObject = { user: null }
      let name: ESObject = data && data.user && data.user.profile && data.user.profile.name
      expect(name).assertNull()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2220
     * @tc.name testLogicalOperator212
     * @tc.desc Verify 多层||回退
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let config: ESObject = {}
      let timeout: number =
        (config.fast as ESObject) || (config.normal as ESObject) || (config.slow as ESObject) || 3000
      expect(timeout).assertEqual(3000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2230
     * @tc.name testLogicalOperator213
     * @tc.desc Verify !(a == b) 等价于 a != b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!(1 == 1)).assertEqual(1 != 1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2250
     * @tc.name testLogicalOperator215
     * @tc.desc Verify !(typeof x === "undefined") 判断已定义
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 42
      expect(!(typeof x === "undefined")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2260
     * @tc.name testLogicalOperator216
     * @tc.desc Verify !!!true 等价于 !true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!!true).assertEqual(!true)
      expect(!!!true).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2270
     * @tc.name testLogicalOperator217
     * @tc.desc Verify !!!!false 等价于 !!false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(!!!!false).assertEqual(!!false)
      expect(!!!!false).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2280
     * @tc.name testLogicalOperator218
     * @tc.desc Verify a && b 等价于 a ? b : a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = "hello"
      let b: ESObject = "world"
      expect((a && b)).assertEqual(a ? b : a)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2290
     * @tc.name testLogicalOperator219
     * @tc.desc Verify falsy值时 a && b 等价于 a ? b : a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = 0
      let b: ESObject = "right"
      expect((a && b)).assertEqual(a ? b : a)
      expect((a && b)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2300
     * @tc.name testLogicalOperator220
     * @tc.desc Verify a || b 等价于 a ? a : b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = "hello"
      let b: ESObject = "world"
      expect((a || b)).assertEqual(a ? a : b)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2310
     * @tc.name testLogicalOperator221
     * @tc.desc Verify falsy值时 a || b 等价于 a ? a : b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ESObject = ""
      let b: ESObject = "fallback"
      expect((a || b)).assertEqual(a ? a : b)
      expect((a || b)).assertEqual("fallback")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2320
     * @tc.name testLogicalOperator222
     * @tc.desc Verify &&返回操作数值，&返回数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true as ESObject) && (2 as ESObject)).assertEqual(2)
      expect((true as ESObject) & (2 as ESObject)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2340
     * @tc.name testLogicalOperator224
     * @tc.desc Verify ||返回操作数值，|返回数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((0 as ESObject) || (2 as ESObject)).assertEqual(2)
      expect((0 as ESObject) | (2 as ESObject)).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2350
     * @tc.name testLogicalOperator225
     * @tc.desc Verify 不同结果的场景
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((1 as ESObject) || (2 as ESObject)).assertEqual(1)
      expect((1 as ESObject) | (2 as ESObject)).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2360
     * @tc.name testLogicalOperator226
     * @tc.desc Verify 使用&&验证多个字段
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(validateForm226({ name: "Alice", email: "a@b.com", age: 20 })).assertTrue()
      expect(validateForm226({ name: "", email: "a@b.com", age: 20 })).assertFalse()
      expect(validateForm226({ name: "Alice", email: "a@b.com", age: 15 })).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2370
     * @tc.name testLogicalOperator227
     * @tc.desc Verify 使用||返回第一个错误消息
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getError227({ name: "", email: "a@b.com", age: 20 })).assertEqual("Name required")
      expect(getError227({ name: "A", email: "", age: 20 })).assertEqual("Email required")
      expect(getError227({ name: "A", email: "a@b.com", age: 20 })).assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2380
     * @tc.name testLogicalOperator228
     * @tc.desc Verify 使用||合并多级配置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let defaults: ESObject = { timeout: 3000, retries: 3 }
      let userConfig: ESObject = { timeout: 5000 }
      let envConfig: ESObject = {}
      let finalTimeout: number =
        (envConfig.timeout as ESObject) ||
          (userConfig.timeout as ESObject) ||
          defaults.timeout
      expect(finalTimeout).assertEqual(5000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2410
     * @tc.name testLogicalOperator231
     * @tc.desc Verify &&守卫链中间为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let response: ESObject = { data: undefined }
      let firstItem: ESObject = response && response.data && response.data.items && response.data.items[0]
      expect(firstItem).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2420
     * @tc.name testLogicalOperator232
     * @tc.desc Verify response为null时使用默认值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let response: ESObject = null
      let items: ESObject[] = (response && response.items) || []
      expect(items.length).assertEqual(0)
      expect(Array.isArray(items)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2430
     * @tc.name testLogicalOperator233
     * @tc.desc Verify 使用||实现惰性初始化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r2: ESObject = getData233()
      expect(initCount).assertEqual(1)
      expect(r2.value).assertEqual(42)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2440
     * @tc.name testLogicalOperator234
     * @tc.desc Verify 使用&&条件执行初始化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initialized: boolean = false
      let data: ESObject = null
      let needsInit: boolean = true
      needsInit && (() => {
        data = { ready: true };
        initialized = true
      })()
      expect(initialized).assertTrue()
      expect(data.ready).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2450
     * @tc.name testLogicalOperator235
     * @tc.desc Verify &&检查用户是否有所有必要权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { permissions: ["read", "write"] }
      let canEdit: boolean =
        user.permissions.includes("read") &&
          user.permissions.includes("write")
      expect(canEdit).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2460
     * @tc.name testLogicalOperator236
     * @tc.desc Verify ||检查用户是否有任一权限
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { permissions: ["read"] }
      let canAccess: boolean =
        user.permissions.includes("read") ||
          user.permissions.includes("admin")
      expect(canAccess).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2470
     * @tc.name testLogicalOperator237
     * @tc.desc Verify &&条件触发回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callbackCalled: boolean = false
      let callback: (() => void) | null = () => {
        callbackCalled = true
      }
      let condition: boolean = true
      condition && callback && callback()
      expect(callbackCalled).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2490
     * @tc.name testLogicalOperator239
     * @tc.desc Verify 10个&&全truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = (1 as ESObject) && (2 as ESObject) && (3 as ESObject) && (4 as ESObject) &&
        (5 as ESObject) && (6 as ESObject) && (7 as ESObject) && (8 as ESObject) &&
        (9 as ESObject) && (10 as ESObject)
      expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2500
     * @tc.name testLogicalOperator240
     * @tc.desc Verify 10个&&中第5个为falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = (1 as ESObject) && (2 as ESObject) && (3 as ESObject) && (4 as ESObject) &&
        (0 as ESObject) && (6 as ESObject) && (7 as ESObject)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2510
     * @tc.name testLogicalOperator241
     * @tc.desc Verify 10个||全falsy返回最后一个
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = (0 as ESObject) || ("" as ESObject) || (null as ESObject) ||
        (false as ESObject) || (undefined as ESObject) || (NaN as ESObject) ||
        (0 as ESObject) || ("" as ESObject) || (null as ESObject) || (0 as ESObject)
      expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2520
     * @tc.name testLogicalOperator242
     * @tc.desc Verify 10个||中第5个为truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: ESObject = (0 as ESObject) || ("" as ESObject) || (null as ESObject) ||
        (false as ESObject) || ("found" as ESObject) || ("skip" as ESObject)
      expect(result).assertEqual("found")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2540
     * @tc.name testLogicalOperator244
     * @tc.desc Verify &&短路时不触发getter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let getCount = 0
      let obj: ESObject = {
        get count(): number {
          getCount++;
          return 5
        }
      }
      let condition: boolean = false
      let result = condition && obj.count
      expect(getCount).assertEqual(0)
      expect(result).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2610
     * @tc.name testLogicalOperator251
     * @tc.desc Verify &&控制递归深度
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(countdown251(3)).assertEqual("3, 2, 1, Liftoff!")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2650
     * @tc.name testLogicalOperator255
     * @tc.desc Verify ||对0返回fallback，??对0返回0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = 0
      expect((val as ESObject) || 100).assertEqual(100)
      expect((val as ESObject) ?? 100).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2660
     * @tc.name testLogicalOperator256
     * @tc.desc Verify ||对""返回fallback，??对""返回""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = ""
      expect((val as ESObject) || "default").assertEqual("default")
      expect((val as ESObject) ?? "default").assertEqual("")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2670
     * @tc.name testLogicalOperator257
     * @tc.desc Verify ||对false返回fallback，??对false返回false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: boolean = false
      expect((val as ESObject) || true).assertTrue()
      expect((val as ESObject) ?? true).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2680
     * @tc.name testLogicalOperator258
     * @tc.desc Verify ||对NaN返回fallback，??对NaN返回NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = NaN
      expect((val as ESObject) || 100).assertEqual(100)
      expect(Number.isNaN((val as ESObject) ?? 100)).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2690
     * @tc.name testLogicalOperator259
     * @tc.desc Verify ||与??对null都返回fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = null
      expect((val as ESObject) || "fb").assertEqual("fb")
      expect((val as ESObject) ?? "fb").assertEqual("fb")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2700
     * @tc.name testLogicalOperator260
     * @tc.desc Verify ||与??对undefined都返回fallback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: ESObject = undefined
      expect((val as ESObject) || "fb").assertEqual("fb")
      expect((val as ESObject) ?? "fb").assertEqual("fb")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2710
     * @tc.name testLogicalOperator261
     * @tc.desc Verify x = x && y 等价于 x &&= y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number | null = 5
      let b: number | null = 5
      a = a && (a + 1)
      b &&= (b + 1)
      expect(a).assertEqual(b)
      expect(a).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2720
     * @tc.name testLogicalOperator262
     * @tc.desc Verify &&=短路（x为falsy时不赋值）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number | null = 0
      x &&= 42
      expect(x).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2730
     * @tc.name testLogicalOperator263
     * @tc.desc Verify x = x || y 等价于 x ||= y
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = ""
      let b: string = ""
      a = a || "default"
      b ||= "default"
      expect(a).assertEqual(b)
      expect(a).assertEqual("default")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2740
     * @tc.name testLogicalOperator264
     * @tc.desc Verify ||=短路（x为truthy时不赋值）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: string = "exists"
      x ||= "default"
      expect(x).assertEqual("exists")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2750
     * @tc.name testLogicalOperator265
     * @tc.desc Verify 使用&&链模拟多分支
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(classify265(95)).assertEqual("A")
      expect(classify265(85)).assertEqual("B")
      expect(classify265(75)).assertEqual("C")
      expect(classify265(65)).assertEqual("D")
      expect(classify265(55)).assertEqual("F")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2760
     * @tc.name testLogicalOperator266
     * @tc.desc Verify 使用&&链处理null检查
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getLabel266(null)).assertEqual("No data")
      expect(getLabel266({})).assertEqual("No items")
      expect(getLabel266({ items: [] })).assertEqual("Empty")
      expect(getLabel266({ items: [1] })).assertEqual("Has items")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2770
     * @tc.name testLogicalOperator267
     * @tc.desc Verify &&用于条件执行链
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(pipeline267(3)).assertEqual(6)
      expect(pipeline267(8)).assertEqual(11)
      expect(pipeline267(-1)).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2790
     * @tc.name testLogicalOperator269
     * @tc.desc Verify 使用!反转过滤条件
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: number[] = [1, 2, 3, 4, 5, 6]
      let isEven = (n: number): boolean => n % 2 === 0
      let odds: number[] = nums.filter(n => !isEven(n))
      expect(odds).assertDeepEquals([1, 3, 5])
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2820
     * @tc.name testLogicalOperator272
     * @tc.desc Verify ||在模板字符串中默认值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { name: "" }
      let label: string = `User: ${(user.name as ESObject) || "Anonymous"}`
      expect(label).assertEqual("User: Anonymous")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2830
     * @tc.name testLogicalOperator273
     * @tc.desc Verify &&结果为false时的模板渲染
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { name: "Bob", vip: false }
      let label: string = `User: ${user.name}${user.vip && " (VIP)"}`
      expect(label).assertEqual("User: Bobfalse")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LOGICAL_OPERATOR_2840
     * @tc.name testLogicalOperator274
     * @tc.desc Verify 使用三元替代&&避免false拼接
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLogicalOperator274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: ESObject = { name: "Bob", vip: false }
      let label: string = `User: ${user.name}${user.vip ? " (VIP)" : ""}`
      expect(label).assertEqual("User: Bob")
    });

  });
}


function expensiveCompute97(): number {
  cache = 42
  return cache
}

function greet162(name?: string): string {
  return "Hello, " + (name || "Guest")
}

function greet163(name: string = "Guest"): string {
  return "Hello, " + name
}

function process164(count?: number): number {
  return (count as ESObject) || 10
}

function validateForm226(data: ESObject): boolean {
  return !!data.name &&
    !!data.email &&
    data.age >= 18
}

function getError227(data: ESObject): string {
  return (!data.name && "Name required") ||
    (!data.email && "Email required") ||
    (data.age < 18 && "Must be 18+") ||
    ""
}

function getData233(): ESObject {
  return cachedData || (cachedData = (() => {
    initCount++;
    return { value: 42 }
  })())
}

function countdown251(n: number): string {
  return n > 0 && `${n}, ${countdown251(n - 1)}` || "Liftoff!"
}

function classify265(score: number): string {
  return (score >= 90 && "A") ||
    (score >= 80 && "B") ||
    (score >= 70 && "C") ||
    (score >= 60 && "D") ||
    "F"
}

function getLabel266(data: ESObject): string {
  return (data == null && "No data") ||
    (data.items == null && "No items") ||
    (data.items.length === 0 && "Empty") ||
    "Has items"
}

function pipeline267(val: number): number {
  let result: number = val
  result > 0 && (result = result * 2)
  result > 10 && (result = result - 5)
  return result
}