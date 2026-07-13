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

enum TypedEnum: byte { A = -2, B = 3, C = 3}

enum TypedEnum1: short { A = -2, B = 3, C = 3}

enum TypedEnum2: int { A = -2, B = 3, C = 3}

enum TypedEnum3: long { A = -2, B = 3, C = 3}

enum TypedEnum4: float { A = -2.0f, B = 3.0f, C = 3.0f}

enum TypedEnum5: double { A = -2.0, B = 3.0, C = 3.0}

export default function EqualityExpressionsTest(): void {
  describe('EqualityExpressionsTest', () => {
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
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_XTSTEST_0100
     * @tc.name      testEqualityExpressions0001
     * @tc.desc      desc: Numeric equality expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum.A == TypedEnum.B).assertEqual(false)
      expect(TypedEnum.B === TypedEnum.C).assertEqual(true)
      expect(TypedEnum.A != TypedEnum.B).assertEqual(true)
      expect(TypedEnum.B !== TypedEnum.C).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_XTSTEST_0200
     * @tc.name      testEqualityExpressions0002
     * @tc.desc      desc: Numeric equality expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum1.A == TypedEnum1.B).assertEqual(false)
      expect(TypedEnum1.B === TypedEnum1.C).assertEqual(true)
      expect(TypedEnum1.A != TypedEnum1.B).assertEqual(true)
      expect(TypedEnum1.B !== TypedEnum1.C).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_XTSTEST_0300
     * @tc.name      testEqualityExpressions0003
     * @tc.desc      desc: Numeric equality expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum2.A == TypedEnum2.B).assertEqual(false)
      expect(TypedEnum2.B === TypedEnum2.C).assertEqual(true)
      expect(TypedEnum2.A != TypedEnum2.B).assertEqual(true)
      expect(TypedEnum2.B !== TypedEnum2.C).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_XTSTEST_0400
     * @tc.name      testEqualityExpressions0004
     * @tc.desc      desc: Numeric equality expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum3.A == TypedEnum3.B).assertEqual(false)
      expect(TypedEnum3.B === TypedEnum3.C).assertEqual(true)

      expect(TypedEnum3.A != TypedEnum3.B).assertEqual(true)
      expect(TypedEnum3.B !== TypedEnum3.C).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_XTSTEST_0500
     * @tc.name      testEqualityExpressions0005
     * @tc.desc      desc: Numeric equality expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum4.A == TypedEnum4.B).assertEqual(false)
      expect(TypedEnum4.B === TypedEnum4.C).assertEqual(true)
      expect(TypedEnum4.A != TypedEnum4.B).assertEqual(true)
      expect(TypedEnum4.B !== TypedEnum4.C).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EQUALITY_EXPRESSIONS_XTSTEST_0600
     * @tc.name      testEqualityExpressions0006
     * @tc.desc      desc: Numeric equality expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testEqualityExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum5.A == TypedEnum5.B).assertEqual(false)
      expect(TypedEnum5.B === TypedEnum5.C).assertEqual(true)
      expect(TypedEnum5.A != TypedEnum5.B).assertEqual(true)
      expect(TypedEnum5.B !== TypedEnum5.C).assertEqual(false)
    });
  })
}
