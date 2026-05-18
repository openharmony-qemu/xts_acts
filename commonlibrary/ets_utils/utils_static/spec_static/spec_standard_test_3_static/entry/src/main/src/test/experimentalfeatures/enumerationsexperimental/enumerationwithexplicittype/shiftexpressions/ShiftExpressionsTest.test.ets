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


enum TypedEnum: byte { A = -4, B = 1, C = -8}

enum TypedEnum1: short { A = -4, B = 1, C = -8}

enum TypedEnum2: int { A = -4, B = 1, C = -8}

enum TypedEnum3: long { A = -4, B = 1, C = -8}

enum TypedEnum4: float { A = -4.0f, B = 1.0f, C = -8.0f}

enum TypedEnum5: double { A = -4.0, B = 1.0, C = -8.0}

enum TypedEnum6: byte { A = -4, B = 1, C = -2}

enum TypedEnum7: short { A = -4, B = 1, C = -2}

enum TypedEnum8: int { A = -4, B = 1, C = -2}

enum TypedEnum9: long { A = -4, B = 1, C = -2}

enum TypedEnum10: float { A = -4.0f, B = 1.0f, C = -2.0f}

enum TypedEnum11: double { A = -4.0, B = 1.0, C = -2.0}

enum TypedEnum12: byte {A = -4, B = 1,  C = 120}

enum TypedEnum13: short { A = -4, B = 1, C = 32760}

enum TypedEnum14: int { A = -4, B = 1, C = 2147483646}

enum TypedEnum15: long { A = -4, B = 1, C = 9223372036854775806}

enum TypedEnum16: float { A = -4.0f, B = 1.0f, C = 2147483646.0f}

enum TypedEnum17: double { A = -4.0, B = 1.0, C = 9223372036854775806.0}


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

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0700
     * @tc.name      testShiftExpressions0007
     * @tc.desc      desc: Signed right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum6.A >> TypedEnum6.B
      expect(res).assertEqual(TypedEnum6.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0800
     * @tc.name      testShiftExpressions0008
     * @tc.desc      desc: Signed right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum7.A >> TypedEnum7.B
      expect(res).assertEqual(TypedEnum7.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_0900
     * @tc.name      testShiftExpressions0009
     * @tc.desc      desc: Signed right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum8.A >> TypedEnum8.B
      expect(res).assertEqual(TypedEnum8.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1000
     * @tc.name      testShiftExpressions0010
     * @tc.desc      desc: Signed right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum9.A >> TypedEnum9.B
      expect(res).assertEqual(TypedEnum9.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1100
     * @tc.name      testShiftExpressions0011
     * @tc.desc      desc: Signed right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum10.A >> TypedEnum10.B
      expect(res).assertEqual(TypedEnum10.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1200
     * @tc.name      testShiftExpressions0012
     * @tc.desc      desc: Signed right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum11.A >> TypedEnum11.B
      expect(res).assertEqual(TypedEnum11.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1300
     * @tc.name      testShiftExpressions0013
     * @tc.desc      desc: Unsigned right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum12.A >>> TypedEnum12.B
      expect(res).assertEqual(2147483646)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1400
     * @tc.name      testShiftExpressions0014
     * @tc.desc      desc: Unsigned right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum13.A >>> TypedEnum13.B
      expect(res).assertEqual(2147483646)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1500
     * @tc.name      testShiftExpressions0015
     * @tc.desc      desc: Unsigned right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum14.A >>> TypedEnum14.B
      expect(res).assertEqual(TypedEnum14.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1600
     * @tc.name      testShiftExpressions0016
     * @tc.desc      desc: Unsigned right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum15.A >>> TypedEnum15.B
      expect(res).assertEqual(TypedEnum15.C)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1700
     * @tc.name      testShiftExpressions0017
     * @tc.desc      desc: Unsigned right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum16.A >>> TypedEnum16.B
        expect(res).assertEqual(2147483646)

    });

    /**
     * @tc.number    SUB_SHIFT_EXPRESSIONS_XTSTEST_1800
     * @tc.name      testShiftExpressions0018
     * @tc.desc      desc: Unsigned right shift expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testShiftExpressions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = TypedEnum17.A >>> TypedEnum17.B
      expect(res).assertEqual(TypedEnum17.C)

    });
  })
}