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
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum TypedEnum: byte { A = -2, B = 3, C = -5}

enum TypedEnum1: short { A = -2, B = 3, C = -5}

enum TypedEnum2: int { A = -2, B = 3, C = -5}

enum TypedEnum3: long { A = -2, B = 3, C = -5}

enum TypedEnum4: float { A = -2.0f, B = 3.0f, C = -5.0f}

enum TypedEnum5: double { A = -2.0, B = 3.0, C = -5.0}

enum TypedEnum6: byte { A = -2, B = 3, C = 1}

enum TypedEnum7: short { A = -2, B = 3, C = 1}

enum TypedEnum8: int { A = -2, B = 3, C = 1}

enum TypedEnum9: long { A = -2, B = 3, C = 1}

enum TypedEnum10: float { A = -2.0f, B = 3.0f, C = 1.0f}

enum TypedEnum11: double { A = -2.0, B = 3.0, C = 1.0}



export default function AdditiveExpressionsTest(): void {
  describe('AdditiveExpressionsTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0100
     * @tc.name      testAdditiveExpressions0001
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum.A - TypedEnum.B).assertEqual(TypedEnum.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0200
     * @tc.name      testAdditiveExpressions0002
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum1.A - TypedEnum1.B).assertEqual(TypedEnum1.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0300
     * @tc.name      testAdditiveExpressions0003
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum2.A - TypedEnum2.B).assertEqual(TypedEnum2.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0400
     * @tc.name      testAdditiveExpressions0004
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum3.A - TypedEnum3.B).assertEqual(TypedEnum3.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0500
     * @tc.name      testAdditiveExpressions0005
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum4.A - TypedEnum4.B).assertEqual(TypedEnum4.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0600
     * @tc.name      testAdditiveExpressions0006
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum5.A - TypedEnum5.B).assertEqual(TypedEnum5.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0700
     * @tc.name      testAdditiveExpressions0007
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum6.A + TypedEnum6.B).assertEqual(TypedEnum6.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0800
     * @tc.name      testAdditiveExpressions0008
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum7.A + TypedEnum7.B).assertEqual(TypedEnum7.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_0900
     * @tc.name      testAdditiveExpressions0009
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum8.A + TypedEnum8.B).assertEqual(TypedEnum8.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_1000
     * @tc.name      testAdditiveExpressions0010
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum9.A + TypedEnum9.B).assertEqual(TypedEnum9.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_1100
     * @tc.name      testAdditiveExpressions0011
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum10.A + TypedEnum10.B).assertEqual(TypedEnum10.C)

    });

    /**
     * @tc.number    SUB_ADDITIVE_EXPRESSIONS_XTSTEST_1200
     * @tc.name      testAdditiveExpressions0012
     * @tc.desc      desc: Additive operator plus for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it(" testAdditiveExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(TypedEnum11.A + TypedEnum11.B).assertEqual(TypedEnum11.C)


    });
  })
}