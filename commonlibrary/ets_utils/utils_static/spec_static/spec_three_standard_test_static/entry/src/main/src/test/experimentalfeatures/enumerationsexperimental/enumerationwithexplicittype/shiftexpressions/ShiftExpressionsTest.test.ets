'use static'
/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../../../Util.test'

enum TypedEnum: byte { A = -4, B = 1, C = -8}

enum TypedEnum1: short { A = -4, B = 1, C = -8}

enum TypedEnum2: int { A = -4, B = 1, C = -8}

enum TypedEnum3: long { A = -4, B = 1, C = -8}

enum TypedEnum4: float { A = -4.0f, B = 1.0f, C = -8.0f}

enum TypedEnum5: double { A = -4.0, B = 1.0, C = -8.0}

export default function ShiftExpressionsTest(): void {
  describe('ShiftExpressionsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0100
     * @tc.name      testShiftExpressions0001
     * @tc.desc      desc: Shift left expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum.A << TypedEnum.B
      expect(res).assertEqual(TypedEnum.C)
    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0200
     * @tc.name      testShiftExpressions0002
     * @tc.desc      desc: Shift left expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum1.A << TypedEnum1.B
      expect(res).assertEqual(TypedEnum1.C)
    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0300
     * @tc.name      testShiftExpressions0003
     * @tc.desc      desc: Shift left expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum2.A << TypedEnum2.B
      expect(res).assertEqual(TypedEnum2.C)
    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0400
     * @tc.name      testShiftExpressions0004
     * @tc.desc      desc: Shift left expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum3.A << TypedEnum3.B
      expect(res).assertEqual(TypedEnum3.C)
    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0500
     * @tc.name      testShiftExpressions0005
     * @tc.desc      desc: Shift left expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum4.A << TypedEnum4.B
      expect(res).assertEqual(TypedEnum4.C)
    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0600
     * @tc.name      testShiftExpressions0006
     * @tc.desc      desc: Shift left expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum5.A << TypedEnum5.B
      expect(res).assertEqual(TypedEnum5.C)
    });
  })
}