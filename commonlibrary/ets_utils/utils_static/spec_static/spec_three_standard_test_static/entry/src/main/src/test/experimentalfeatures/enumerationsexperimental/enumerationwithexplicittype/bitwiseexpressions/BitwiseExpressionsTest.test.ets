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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../../hypium/index';
import Utils from '../../../../Util.test'

enum TypedEnum: byte { A = 1, B = 4, C = 3, D = 6 }

enum TypedEnum1: short { A = 1, B = 4, C = 3, D = 6 }

enum TypedEnum2: int { A = 1, B = 4, C = 3, D = 6 }

enum TypedEnum3: long { A = 1, B = 4, C = 3, D = 6 }

enum TypedEnum4: float { A = 1.0f, B = 4.0f, C = 3.0f, D = 6.0f }

enum TypedEnum5: double { A = 1.0, B = 4.0, C = 3.0, D = 6.0 }

export default function BitwiseExpressionsTest(): void {
  describe('BitwiseExpressionsTest', () => {
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
     * @tc.number    SUB_BITWISE_EXPRESSIONS_XTSTEST_0100
     * @tc.name      testBitwiseExpressions0001
     * @tc.desc      desc: Bitwise expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBitwiseExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res_and_1 = TypedEnum.A & TypedEnum.B
      let res_and_2 = TypedEnum.C & TypedEnum.D
      expect(res_and_1).assertEqual(0)
      expect(res_and_2).assertEqual(2)

      let res_exc_or_1 = TypedEnum.A ^ TypedEnum.B
      let res_exc_or_2 = TypedEnum.C ^ TypedEnum.D
      expect(res_exc_or_1).assertEqual(5)
      expect(res_exc_or_2).assertEqual(5)

      let res_inc_or_1 = TypedEnum.A | TypedEnum.B
      let res_inc_or_2 = TypedEnum.C | TypedEnum.D
      expect(res_inc_or_1).assertEqual(5)
      expect(res_inc_or_2).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BITWISE_EXPRESSIONS_XTSTEST_0200
     * @tc.name      testBitwiseExpressions0002
     * @tc.desc      desc: Bitwise expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBitwiseExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res_and_1 = TypedEnum1.A & TypedEnum1.B
      let res_and_2 = TypedEnum1.C & TypedEnum1.D
      expect(res_and_1).assertEqual(0)
      expect(res_and_2).assertEqual(2)

      let res_exc_or_1 = TypedEnum1.A ^ TypedEnum1.B
      let res_exc_or_2 = TypedEnum1.C ^ TypedEnum1.D
      expect(res_exc_or_1).assertEqual(5)
      expect(res_exc_or_2).assertEqual(5)

      let res_inc_or_1 = TypedEnum1.A | TypedEnum1.B
      let res_inc_or_2 = TypedEnum1.C | TypedEnum1.D
      expect(res_inc_or_1).assertEqual(5)
      expect(res_inc_or_2).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BITWISE_EXPRESSIONS_XTSTEST_0300
     * @tc.name      testBitwiseExpressions0003
     * @tc.desc      desc: Bitwise expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBitwiseExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res_and_1 = TypedEnum2.A & TypedEnum2.B
      let res_and_2 = TypedEnum2.C & TypedEnum2.D
      expect(res_and_1).assertEqual(0)
      expect(res_and_2).assertEqual(2)

      let res_exc_or_1 = TypedEnum2.A ^ TypedEnum2.B
      let res_exc_or_2 = TypedEnum2.C ^ TypedEnum2.D
      expect(res_exc_or_1).assertEqual(5)
      expect(res_exc_or_2).assertEqual(5)

      let res_inc_or_1 = TypedEnum2.A | TypedEnum2.B
      let res_inc_or_2 = TypedEnum2.C | TypedEnum2.D
      expect(res_inc_or_1).assertEqual(5)
      expect(res_inc_or_2).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BITWISE_EXPRESSIONS_XTSTEST_0400
     * @tc.name      testBitwiseExpressions0004
     * @tc.desc      desc: Bitwise expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBitwiseExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res_and_1 = TypedEnum3.A & TypedEnum3.B
      let res_and_2 = TypedEnum3.C & TypedEnum3.D
      expect(res_and_1).assertEqual(0)
      expect(res_and_2).assertEqual(2)

      let res_exc_or_1 = TypedEnum3.A ^ TypedEnum3.B
      let res_exc_or_2 = TypedEnum3.C ^ TypedEnum3.D
      expect(res_exc_or_1).assertEqual(5)
      expect(res_exc_or_2).assertEqual(5)

      let res_inc_or_1 = TypedEnum3.A | TypedEnum3.B
      let res_inc_or_2 = TypedEnum3.C | TypedEnum3.D
      expect(res_inc_or_1).assertEqual(5)
      expect(res_inc_or_2).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BITWISE_EXPRESSIONS_XTSTEST_0500
     * @tc.name      testBitwiseExpressions0005
     * @tc.desc      desc: Bitwise expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBitwiseExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res_and_1 = TypedEnum4.A & TypedEnum4.B
      let res_and_2 = TypedEnum4.C & TypedEnum4.D
      expect(res_and_1).assertEqual(0)
      expect(res_and_2).assertEqual(2)

      let res_exc_or_1 = TypedEnum4.A ^ TypedEnum4.B
      let res_exc_or_2 = TypedEnum4.C ^ TypedEnum4.D
      expect(res_exc_or_1).assertEqual(5)
      expect(res_exc_or_2).assertEqual(5)

      let res_inc_or_1 = TypedEnum4.A | TypedEnum4.B
      let res_inc_or_2 = TypedEnum4.C | TypedEnum4.D
      expect(res_inc_or_1).assertEqual(5)
      expect(res_inc_or_2).assertEqual(7)
    });

    /**
     * @tc.number    SUB_BITWISE_EXPRESSIONS_XTSTEST_0600
     * @tc.name      testBitwiseExpressions0006
     * @tc.desc      desc: Bitwise expressions for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBitwiseExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res_and_1 = TypedEnum5.A & TypedEnum5.B
      let res_and_2 = TypedEnum5.C & TypedEnum5.D
      expect(res_and_1).assertEqual(0)
      expect(res_and_2).assertEqual(2)

      let res_exc_or_1 = TypedEnum5.A ^ TypedEnum5.B
      let res_exc_or_2 = TypedEnum5.C ^ TypedEnum5.D
      expect(res_exc_or_1).assertEqual(5)
      expect(res_exc_or_2).assertEqual(5)

      let res_inc_or_1 = TypedEnum5.A | TypedEnum5.B
      let res_inc_or_2 = TypedEnum5.C | TypedEnum5.D
      expect(res_inc_or_1).assertEqual(5)
      expect(res_inc_or_2).assertEqual(7)
    });
  })
}