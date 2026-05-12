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


enum TypedEnum: byte { First = -1, Second = 0, Third = 1}

enum TypedEnum1: short { First = -1, Second = 0, Third = 1}

enum TypedEnum2: int { First = -1, Second = 0, Third = 1}

enum TypedEnum3: long { First = -1, Second = 0, Third = 1}

enum TypedEnum4: float { First = -1.0f, Second = 0.0f, Third = 1.0f}

enum TypedEnum5: double { First = -1.0, Second = 0.0, Third = 1.0}

enum TypedEnum6: byte { First = -1, Second = 0, Third = 1}

enum TypedEnum7: short { First = -1, Second = 0, Third = 1}

enum TypedEnum8: int { First = -1, Second = 0, Third = 1}

enum TypedEnum9: long { First = -1, Second = 0, Third = 1}

enum TypedEnum10: float { First = -1.0f, Second = 0.0f, Third = 1.0f}

enum TypedEnum11: double { First = -1.0, Second = 0.0, Third = 1.0}

enum TypedEnum12: byte {
  Neg = -1,
  Pos = 1
}

enum TypedEnum13: short {
  Neg = -1,
  Pos = 1
}

enum TypedEnum14: int {
  Neg = -1,
  Pos = 1
}

enum TypedEnum15: long {
  Neg = -1,
  Pos = 1
}

enum TypedEnum16: float {
  Neg = -1.1f,
  Pos = 1.1f
}

enum TypedEnum17: double {
  Neg = -1.1,
  Pos = 1.1
}

enum TypedEnum18: byte {
  Neg = -1,
  Pos = 1
}

enum TypedEnum19: short {
  Neg = -1,
  Pos = 1
}

enum TypedEnum20: int {
  Neg = -1,
  Pos = 1
}

enum TypedEnum21: long {
  Neg = -1,
  Pos = 1
}

enum TypedEnum22: float {
  Neg = -1.1f,
  Pos = 1.1f
}

enum TypedEnum23: double {
  Neg = -1.1,
  Pos = 1.1
}






export default function UnaryExpressionsTest(): void {
  describe('UnaryExpressionsTest', () => {
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
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0100
     * @tc.name      testUnaryExpressions0001
     * @tc.desc      desc: Bitwise complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum.First
      let b = TypedEnum.Second
      let c = TypedEnum.Third

      expect(~a).assertEqual(0)
      expect(~b).assertEqual(-1)
      expect(~c).assertEqual(-2)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0200
     * @tc.name      testUnaryExpressions0002
     * @tc.desc      desc: Bitwise complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum1.First
      let b = TypedEnum1.Second
      let c = TypedEnum1.Third

      expect(~a).assertEqual(0)
      expect(~b).assertEqual(-1)
      expect(~c).assertEqual(-2)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0300
     * @tc.name      testUnaryExpressions0003
     * @tc.desc      desc: Bitwise complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum2.First
      let b = TypedEnum2.Second
      let c = TypedEnum2.Third

      expect(~a).assertEqual(0)
      expect(~b).assertEqual(-1)
      expect(~c).assertEqual(-2)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0400
     * @tc.name      testUnaryExpressions0004
     * @tc.desc      desc: Bitwise complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum3.First
      let b = TypedEnum3.Second
      let c = TypedEnum3.Third

      expect(~a).assertEqual(0)
      expect(~b).assertEqual(-1)
      expect(~c).assertEqual(-2)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0500
     * @tc.name      testUnaryExpressions0005
     * @tc.desc      desc: Bitwise complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum4.First
      let b = TypedEnum4.Second
      let c = TypedEnum4.Third

      expect(~a).assertEqual(0)
      expect(~b).assertEqual(-1)
      expect(~c).assertEqual(-2)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0600
     * @tc.name      testUnaryExpressions0006
     * @tc.desc      desc: Bitwise complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum5.First
      let b = TypedEnum5.Second
      let c = TypedEnum5.Third

      expect(~a).assertEqual(0)
      expect(~b).assertEqual(-1)
      expect(~c).assertEqual(-2)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0700
     * @tc.name      testUnaryExpressions0007
     * @tc.desc      desc: Logical complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum6.First
      let b = TypedEnum6.Second
      let c = TypedEnum6.Third

      expect(!a).assertEqual(false)
      expect(!b).assertEqual(true)
      expect(!c).assertEqual(false)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0800
     * @tc.name      testUnaryExpressions0008
     * @tc.desc      desc: Logical complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum7.First
      let b = TypedEnum7.Second
      let c = TypedEnum7.Third

      expect(!a).assertEqual(false)
      expect(!b).assertEqual(true)
      expect(!c).assertEqual(false)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_0900
     * @tc.name      testUnaryExpressions0009
     * @tc.desc      desc: Logical complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum8.First
      let b = TypedEnum8.Second
      let c = TypedEnum8.Third

      expect(!a).assertEqual(false)
      expect(!b).assertEqual(true)
      expect(!c).assertEqual(false)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1000
     * @tc.name      testUnaryExpressions0010
     * @tc.desc      desc: Logical complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum9.First
      let b = TypedEnum9.Second
      let c = TypedEnum9.Third

      expect(!a).assertEqual(false)
      expect(!b).assertEqual(true)
      expect(!c).assertEqual(false)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1100
     * @tc.name      testUnaryExpressions0011
     * @tc.desc      desc: Logical complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum10.First
      let b = TypedEnum10.Second
      let c = TypedEnum10.Third

      expect(!a).assertEqual(false)
      expect(!b).assertEqual(true)
      expect(!c).assertEqual(false)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1200
     * @tc.name      testUnaryExpressions0012
     * @tc.desc      desc: Logical complement expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = TypedEnum11.First
      let b = TypedEnum11.Second
      let c = TypedEnum11.Third

      expect(!a).assertEqual(false)
      expect(!b).assertEqual(true)
      expect(!c).assertEqual(false)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1300
     * @tc.name      testUnaryExpressions0013
     * @tc.desc      desc: Unary minus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = -TypedEnum12.Neg
      expect(n).assertEqual(TypedEnum12.Pos)
      expect(-n).assertEqual(TypedEnum12.Neg)

      let p = -TypedEnum12.Pos
      expect(p).assertEqual(TypedEnum12.Neg)
      expect(-p).assertEqual(TypedEnum12.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1400
     * @tc.name      testUnaryExpressions0014
     * @tc.desc      desc: Unary minus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = -TypedEnum13.Neg
      expect(n).assertEqual(TypedEnum13.Pos)
      expect(-n).assertEqual(TypedEnum13.Neg)

      let p = -TypedEnum13.Pos
      expect(p).assertEqual(TypedEnum13.Neg)
      expect(-p).assertEqual(TypedEnum13.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1500
     * @tc.name      testUnaryExpressions0015
     * @tc.desc      desc: Unary minus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = -TypedEnum14.Neg
      expect(n).assertEqual(TypedEnum14.Pos)
      expect(-n).assertEqual(TypedEnum14.Neg)

      let p = -TypedEnum14.Pos
      expect(p).assertEqual(TypedEnum14.Neg)
      expect(-p).assertEqual(TypedEnum14.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1600
     * @tc.name      testUnaryExpressions0016
     * @tc.desc      desc: Unary minus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = -TypedEnum15.Neg
      expect(n).assertEqual(TypedEnum15.Pos)
      expect(-n).assertEqual(TypedEnum15.Neg)

      let p = -TypedEnum15.Pos
      expect(p).assertEqual(TypedEnum15.Neg)
      expect(-p).assertEqual(TypedEnum15.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1700
     * @tc.name      testUnaryExpressions0017
     * @tc.desc      desc: Unary minus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = -TypedEnum16.Neg
      expect(n).assertEqual(TypedEnum16.Pos)
      expect(-n).assertEqual(TypedEnum16.Neg)

      let p = -TypedEnum16.Pos
      expect(p).assertEqual(TypedEnum16.Neg)
      expect(-p).assertEqual(TypedEnum16.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1800
     * @tc.name      testUnaryExpressions0018
     * @tc.desc      desc: Unary minus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = -TypedEnum17.Neg
      expect(n).assertEqual(TypedEnum17.Pos)
      expect(-n).assertEqual(TypedEnum17.Neg)

      let p = -TypedEnum17.Pos
      expect(p).assertEqual(TypedEnum17.Neg)
      expect(-p).assertEqual(TypedEnum17.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_1900
     * @tc.name      testUnaryExpressions0019
     * @tc.desc      desc: Unary plus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = +TypedEnum18.Neg
      expect(n).assertEqual(TypedEnum18.Neg)
      expect(+n).assertEqual(TypedEnum18.Neg)

      let p = +TypedEnum18.Pos
      expect(p).assertEqual(TypedEnum18.Pos)
      expect(+p).assertEqual(TypedEnum18.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_2000
     * @tc.name      testUnaryExpressions0020
     * @tc.desc      desc: Unary plus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = +TypedEnum19.Neg
      expect(n).assertEqual(TypedEnum19.Neg)
      expect(+n).assertEqual(TypedEnum19.Neg)

      let p = +TypedEnum19.Pos
      expect(p).assertEqual(TypedEnum19.Pos)
      expect(+p).assertEqual(TypedEnum19.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_2100
     * @tc.name      testUnaryExpressions0021
     * @tc.desc      desc: Unary plus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = +TypedEnum20.Neg
      expect(n).assertEqual(TypedEnum20.Neg)
      expect(+n).assertEqual(TypedEnum20.Neg)

      let p = +TypedEnum20.Pos
      expect(p).assertEqual(TypedEnum20.Pos)
      expect(+p).assertEqual(TypedEnum20.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_2200
     * @tc.name      testUnaryExpressions0022
     * @tc.desc      desc: Unary plus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = +TypedEnum21.Neg
      expect(n).assertEqual(TypedEnum21.Neg)
      expect(+n).assertEqual(TypedEnum21.Neg)

      let p = +TypedEnum21.Pos
      expect(p).assertEqual(TypedEnum21.Pos)
      expect(+p).assertEqual(TypedEnum21.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST2300
     * @tc.name      testUnaryExpressions0023
     * @tc.desc      desc: Unary plus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = +TypedEnum22.Neg
      expect(n).assertEqual(TypedEnum22.Neg)
      expect(+n).assertEqual(TypedEnum22.Neg)

      let p = +TypedEnum22.Pos
      expect(p).assertEqual(TypedEnum22.Pos)
      expect(+p).assertEqual(TypedEnum22.Pos)

    });

    /**
     * @tc.number    SUB_UNARY_EXPRESSIONS_XTSTEST_2400
     * @tc.name      testUnaryExpressions0024
     * @tc.desc      desc: Unary plus expression for enumeration with explicit type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnaryExpressions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n = +TypedEnum23.Neg
      expect(n).assertEqual(TypedEnum23.Neg)
      expect(+n).assertEqual(TypedEnum23.Neg)

      let p = +TypedEnum23.Pos
      expect(p).assertEqual(TypedEnum23.Pos)
      expect(+p).assertEqual(TypedEnum23.Pos)

    });
  })
}