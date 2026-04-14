/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";

let u_21: undefined = undefined;
let n_21: null = null;
let o_21: Object = {};
let e_25 = new Error();

class A_15<T> {}
let v_15 = new A_15<number>();
let q_15 = new A_15<number>();

enum Color_18 { Red, Green, Blue }

type F_19 = (p: Color_18) => number;
type F_20 = (p: Color_18) => number;

let arr4_a_28: (boolean|number|string|null)[][] = [];
let arr4_a_29: (boolean|number|string|null)[][] = [];
let arr4_a_30: ((boolean|number|string|null)[][]) = [];
let arr4_a_31: ((boolean|number|string|null)[][]) = [];
let arr4_e_32 = new Error();
let arr4_a_32: ((number|Error|((p: string)=>string)|boolean)[][]) = [];
let arr4_e_33 = new Error();
let arr4_a_33: ((number|Error|((p: string)=>string)|boolean)[][]) = [];
let arr4_e_34 = new Error();
let arr4_a_34: ((number|Error|((p: string)=>string)|boolean)[][]) = [];
let arr4_e_35 = new Error();
let arr4_a_35: ((number|Error|((p: string)=>string)|boolean)[][]) = [];
let arr4_a_36: (number[]|string[]|boolean[]|null) = null;
let arr4_a_37: (number[]|string[]|boolean[]|null) = null;
let arr4_a_38: (number[]|string[]|boolean[]|null) = null;
let arr4_a_39: (number[]|string[]|boolean[]|null) = null;
let arr4_s_40 = '4';
let arr4_a_40: (number[]|string[]|boolean[]|null) = null;
let arr4_s_41 = '4';
let arr4_a_41: (number[]|string[]|boolean[]|null) = null;
let arr4_s_42 = '4';
let arr4_a_42: (string[]|boolean[]|null) = null;
let arr4_a_43: (boolean[]|string|string[]|null) = null;

enum arr4_Color_18 { Red, Green, Blue }
enum arr4_Color_21 { Red, Green, Blue }
enum arr4_Color_22 { Red, Green, Blue }
enum arr4_Color_23 { Red, Green, Blue }
enum arr4_Color_24 { Red, Green, Blue }
enum arr4_Color_25 { Red, Green, Blue }
enum arr4_Color_26 { Red, Green, Blue }
enum arr4_Color_27 { Red, Green, Blue }

type arr4_F_24 = (p: arr4_Color_24) => number;
type arr4_F_25 = (p: arr4_Color_25) => number;
type arr4_F_26 = (p: arr4_Color_26) => number;
type arr4_F_27 = (p: arr4_Color_27) => number;


enum arr4_foo_Color_27 { Red, Green, Blue }
type arr4_foo_F_27 = (p: arr4_foo_Color_27) => number;
function arr4_foo_55(a: string[]|number[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

function arr4_foo_56(a: string[]|number[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

function arr4_foo_57(a: string[]|number[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

function arr4_foo_58(a: number[]|string[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

function arr4_foo_59(a: number[]|string[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

function arr4_foo_60(a: number[]|string[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

function arr4_foo_61(a: number[]|string[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}
let arr4_decl_a0: number[][] = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];
let arr4_decl_a1: number[][] = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];
let arr4_decl_a2: number[][] = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];

function test_arr4_inf_decl_0(): void {
  expect(arr4_decl_a0.length).assertEqual(4);
  expect(arr4_decl_a0[0][0]).assertEqual(-2147483647);
  expect(arr4_decl_a0[2][2]).assertEqual(2147483647);
}

function test_arr4_inf_decl_1(): void {
  expect(arr4_decl_a1.length).assertEqual(4);
  expect(arr4_decl_a1[0][0]).assertEqual(-2147483647);
  expect(arr4_decl_a1[2][2]).assertEqual(2147483647);
}

function test_arr4_inf_decl_2(): void {
  expect(arr4_decl_a2.length).assertEqual(4);
  expect(arr4_decl_a2[0][0]).assertEqual(-2147483647);
  expect(arr4_decl_a2[2][2]).assertEqual(2147483647);
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsContestInferenceOneTest() {
  describe("ExpressionsContestInferenceOneTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0100
     * @tc.name      testExpressionsContestInferenceOne0001
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_55(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0200
     * @tc.name      testExpressionsContestInferenceOne0002
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_56(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0300
     * @tc.name      testExpressionsContestInferenceOne0003
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_57(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0400
     * @tc.name      testExpressionsContestInferenceOne0004
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_58(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0500
     * @tc.name      testExpressionsContestInferenceOne0005
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_59(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0600
     * @tc.name      testExpressionsContestInferenceOne0006
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_60(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0700
     * @tc.name      testExpressionsContestInferenceOne0007
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_61(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0800
     * @tc.name      testExpressionsContestInferenceOne0008
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_0();
      expect(arr4_decl_a0.length).assertEqual(4);
      expect(arr4_decl_a0[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_0900
     * @tc.name      testExpressionsContestInferenceOne0009
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_1();
      expect(arr4_decl_a1.length).assertEqual(4);
      expect(arr4_decl_a1[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1000
     * @tc.name      testExpressionsContestInferenceOne0010
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_2();
      expect(arr4_decl_a2.length).assertEqual(4);
      expect(arr4_decl_a2[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1100
     * @tc.name      testExpressionsContestInferenceOne0011
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [!true, true, true] as boolean[];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1200
     * @tc.name      testExpressionsContestInferenceOne0012
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []] as number[][];
      expect(a.length).assertEqual(4);
      expect(a[0][0]).assertEqual(-2147483647);
      expect(a[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1300
     * @tc.name      testExpressionsContestInferenceOne0013
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [false, true, true] as boolean[];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1400
     * @tc.name      testExpressionsContestInferenceOne0014
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [Number.NaN, 0, 3.14, 1.7976931348623157e+308] as number[];
      expect(Number.isNaN(a[0])).assertTrue();
      expect(a[3]).assertEqual(1.7976931348623157e+308);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1500
     * @tc.name      testExpressionsContestInferenceOne0015
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[1.7976931348623157e+308, 2], [3], [4, 5, 6], []] as number[][];
      expect(a.length).assertEqual(4);
      expect(a[0][0]).assertEqual(1.7976931348623157e+308);
      expect(a[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1600
     * @tc.name      testExpressionsContestInferenceOne0016
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ['1', '2', '', '-9223372036854775808'] as string[];
      expect(a[3]).assertEqual('-9223372036854775808');
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1700
     * @tc.name      testExpressionsContestInferenceOne0017
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ['x', 'x' + '1', 'x' + '2', 'x' + '3'] as string[];
      expect(a[0]).assertEqual('x');
      expect(a[1]).assertEqual('x1');
      expect(a[2]).assertEqual('x2');
      expect(a[3]).assertEqual('x3');
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1800
     * @tc.name      testExpressionsContestInferenceOne0018
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = '1';
      let a = [[s, s + s], ['', '-9223372036854775808']] as string[][];
      expect(a[0][0]).assertEqual('1');
      expect(a[0][1]).assertEqual('11');
      expect(a[1][0]).assertEqual('');
      expect(a[1][1]).assertEqual('-9223372036854775808');
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_1900
     * @tc.name      testExpressionsContestInferenceOne0019
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1n, 2n, 33333333333333333333333333333333333333333333333333n] as bigint[];
      expect(a[1]).assertEqual(2n);
      expect(a[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2000
     * @tc.name      testExpressionsContestInferenceOne0020
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[11111111111111111111111111111111111111111111111n], [2n], [33333333333333333333333333333333333333333333333333n]] as bigint[][];
      expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2100
     * @tc.name      testExpressionsContestInferenceOne0021
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [v_15, q_15] as A_15<number>[];
      expect(a[0]).assertEqual(v_15);
      expect(a[1]).assertEqual(q_15);
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2200
     * @tc.name      testExpressionsContestInferenceOne0022
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<Array<string | number | boolean | bigint>> = [["a", 1, true, 2n]];
      expect(a[0][0] as string).assertEqual("a");
      expect(a[0][1] as number).assertEqual(1);
      expect(a[0][2] as boolean).assertTrue();
      expect(a[0][3] as bigint).assertEqual(2n);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2300
     * @tc.name      testExpressionsContestInferenceOne0023
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [Color_18.Red, Color_18.Blue] as Color_18[];
      expect(a[0]).assertEqual(Color_18.Red);
      expect(a[1]).assertEqual(Color_18.Blue);
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2400
     * @tc.name      testExpressionsContestInferenceOne0024
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[Color_18.Red, Color_18.Blue]] as Color_18[][];
      expect(a[0][0]).assertEqual(Color_18.Red);
      expect(a[0][1]).assertEqual(Color_18.Blue);
      expect(a.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2500
     * @tc.name      testExpressionsContestInferenceOne0025
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [(p: Color_18): number => p.valueOf(), (p: Color_18): number => p.valueOf() + 1, (p: Color_18): number => p.valueOf() + 2] as F_19[];
      expect(a[0](Color_18.Red)).assertEqual(0);
      expect(a[1](Color_18.Red)).assertEqual(1);
      expect(a[2](Color_18.Blue)).assertEqual(4);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2600
     * @tc.name      testExpressionsContestInferenceOne0026
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[(p: Color_18): number => p.valueOf()], [(p: Color_18): number => p.valueOf() + 1], [(p: Color_18): number => p.valueOf() + 2]] as F_20[][];
      expect(a[0][0](Color_18.Red)).assertEqual(0);
      expect(a[1][0](Color_18.Red)).assertEqual(1);
      expect(a[2][0](Color_18.Blue)).assertEqual(4);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2700
     * @tc.name      testExpressionsContestInferenceOne0027
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [n_21, o_21, o_21, u_21] as (null|undefined|Object)[];
      expect(a[0]).assertEqual(null);
      expect(a[1] as Object).assertEqual(o_21);
      expect(a[2] as Object).assertEqual(o_21);
      expect(a[3]).assertEqual(undefined);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2800
     * @tc.name      testExpressionsContestInferenceOne0028
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [true, 1, 'a', null] as (boolean|number|string|null)[];
      expect(a[0] as boolean).assertTrue();
      expect(a[1] as number).assertEqual(1);
      expect(a[2] as string).assertEqual('a');
      expect(a[3]).assertEqual(null);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_2900
     * @tc.name      testExpressionsContestInferenceOne0029
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[true, 1, 'a', null]] as (boolean|number|string|null)[][];
      expect(a[0][0] as boolean).assertTrue();
      expect(a[0][1] as number).assertEqual(1);
      expect(a[0][2] as string).assertEqual('a');
      expect(a[0][3]).assertEqual(null);
      expect(a.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3000
     * @tc.name      testExpressionsContestInferenceOne0030
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[e_25], [false], [(p: string): string => p + p], [42]] as (number|Error|((p: string)=>string)|boolean)[][];
      expect(a[0][0] as Error).assertEqual(e_25);
      expect(a[1][0] as boolean).assertFalse();
      expect((a[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(a[3][0] as number).assertEqual(42);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3100
     * @tc.name      testExpressionsContestInferenceOne0031
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<boolean> = [false, true, false];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertFalse();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3200
     * @tc.name      testExpressionsContestInferenceOne0032
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 43];
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(43);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3300
     * @tc.name      testExpressionsContestInferenceOne0033
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<string> = ['1', '2', '43'];
      expect(a[0]).assertEqual('1');
      expect(a[1]).assertEqual('2');
      expect(a[2]).assertEqual('43');
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3400
     * @tc.name      testExpressionsContestInferenceOne0034
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_0: Array<Array<number>> = [
        [-2147483647, 2],
        [3],
        [2 + 2, 5, 2147483646 + 1],
        [],
      ];
      expect(arr4_a_0.length).assertEqual(4);
      expect(arr4_a_0[0][0]).assertEqual(-2147483647);
      expect(arr4_a_0[2][2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3500
     * @tc.name      testExpressionsContestInferenceOne0035
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_1: Array<Array<number>> = [
        [-2147483647, 2],
        [3],
        [2 + 2, 5, 2147483646 + 1],
        [],
      ];
      expect(arr4_a_1.length).assertEqual(4);
      expect(arr4_a_1[0][0]).assertEqual(-2147483647);
      expect(arr4_a_1[2][2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3600
     * @tc.name      testExpressionsContestInferenceOne0036
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_2: Array<Array<number>> = [
        [-2147483647, 2],
        [3],
        [2 + 2, 5, 2147483646 + 1],
        [],
      ];
      expect(arr4_a_2.length).assertEqual(4);
      expect(arr4_a_2[0][0]).assertEqual(-2147483647);
      expect(arr4_a_2[2][2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3700
     * @tc.name      testExpressionsContestInferenceOne0037
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_3: Array<Array<number>> = [
        [-2147483647, 2],
        [3],
        [2 + 2, 5, 2147483646 + 1],
        [],
      ];
      expect(arr4_a_3.length).assertEqual(4);
      expect(arr4_a_3[0][0]).assertEqual(-2147483647);
      expect(arr4_a_3[2][2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3800
     * @tc.name      testExpressionsContestInferenceOne0038
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_4: Array<Array<number>> = [
        [1.7976931348623157e+308, 2],
        [3],
        [4, 5, 6],
        [],
      ];
      expect(arr4_a_4.length).assertEqual(4);
      expect(arr4_a_4[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr4_a_4[2][2]).assertEqual(6.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_3900
     * @tc.name      testExpressionsContestInferenceOne0039
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_5: Array<Array<number>> = [
        [1.7976931348623157e+308, 2],
        [3],
        [4, 5, 6],
        [],
      ];
      expect(arr4_a_5.length).assertEqual(4);
      expect(arr4_a_5[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr4_a_5[2][2]).assertEqual(6.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4000
     * @tc.name      testExpressionsContestInferenceOne0040
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_6: Array<Array<number>> = [
        [1.7976931348623157e+308, 2],
        [3],
        [4, 5, 6],
        [],
      ];
      expect(arr4_a_6.length).assertEqual(4);
      expect(arr4_a_6[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr4_a_6[2][2]).assertEqual(6.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4100
     * @tc.name      testExpressionsContestInferenceOne0041
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_7: Array<Array<number>> = [
        [1.7976931348623157e+308, 2],
        [3],
        [4, 5, 6],
        [],
      ];
      expect(arr4_a_7.length).assertEqual(4);
      expect(arr4_a_7[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr4_a_7[2][2]).assertEqual(6.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4200
     * @tc.name      testExpressionsContestInferenceOne0042
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '1';
      const arr4_a_8: Array<Array<string>> = [
        [s, s + s],
        ['', '-9223372036854775808'],
      ];
      expect(arr4_a_8[0][0]).assertEqual('1');
      expect(arr4_a_8[0][1]).assertEqual('11');
      expect(arr4_a_8[1][0]).assertEqual('');
      expect(arr4_a_8[1][1]).assertEqual('-9223372036854775808');
      expect(arr4_a_8.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4300
     * @tc.name      testExpressionsContestInferenceOne0043
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '1';
      const arr4_a_9: Array<Array<string>> = [
        [s, s + s],
        ['', '-9223372036854775808'],
      ];
      expect(arr4_a_9[0][0]).assertEqual('1');
      expect(arr4_a_9[0][1]).assertEqual('11');
      expect(arr4_a_9[1][0]).assertEqual('');
      expect(arr4_a_9[1][1]).assertEqual('-9223372036854775808');
      expect(arr4_a_9.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4400
     * @tc.name      testExpressionsContestInferenceOne0044
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '1';
      const arr4_a_10: Array<Array<string>> = [
        [s, s + s],
        ['', '-9223372036854775808'],
      ];
      expect(arr4_a_10[0][0]).assertEqual('1');
      expect(arr4_a_10[0][1]).assertEqual('11');
      expect(arr4_a_10[1][0]).assertEqual('');
      expect(arr4_a_10[1][1]).assertEqual('-9223372036854775808');
      expect(arr4_a_10.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4500
     * @tc.name      testExpressionsContestInferenceOne0045
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '1';
      const arr4_a_11: Array<Array<string>> = [
        [s, s + s],
        ['', '-9223372036854775808'],
      ];
      expect(arr4_a_11[0][0]).assertEqual('1');
      expect(arr4_a_11[0][1]).assertEqual('11');
      expect(arr4_a_11[1][0]).assertEqual('');
      expect(arr4_a_11[1][1]).assertEqual('-9223372036854775808');
      expect(arr4_a_11.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4600
     * @tc.name      testExpressionsContestInferenceOne0046
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_12: Array<Array<bigint>> = [
        [11111111111111111111111111111111111111111111111n],
        [2n],
        [33333333333333333333333333333333333333333333333333n],
      ];
      expect(arr4_a_12[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(arr4_a_12[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr4_a_12.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4700
     * @tc.name      testExpressionsContestInferenceOne0047
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_13: Array<Array<bigint>> = [
        [11111111111111111111111111111111111111111111111n],
        [2n],
        [33333333333333333333333333333333333333333333333333n],
      ];
      expect(arr4_a_13[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(arr4_a_13[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr4_a_13.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4800
     * @tc.name      testExpressionsContestInferenceOne0048
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_14: Array<Array<bigint>> = [
        [11111111111111111111111111111111111111111111111n],
        [2n],
        [33333333333333333333333333333333333333333333333333n],
      ];
      expect(arr4_a_14[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(arr4_a_14[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr4_a_14.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_4900
     * @tc.name      testExpressionsContestInferenceOne0049
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_15: Array<Array<bigint>> = [
        [11111111111111111111111111111111111111111111111n],
        [2n],
        [33333333333333333333333333333333333333333333333333n],
      ];
      expect(arr4_a_15[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(arr4_a_15[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr4_a_15.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5000
     * @tc.name      testExpressionsContestInferenceOne0050
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_16: Array<Array<string | number | boolean | bigint | null | undefined>> = [
        ["a", 1, true, 2n, null, undefined],
      ];
      expect(arr4_a_16[0][0] as string).assertEqual("a");
      expect(arr4_a_16[0][1] as number).assertEqual(1);
      expect(arr4_a_16[0][2] as boolean).assertTrue();
      expect(arr4_a_16[0][3] as bigint).assertEqual(2n);
      expect(arr4_a_16[0][4]).assertEqual(null);
      expect(arr4_a_16[0][5]).assertEqual(undefined);
      expect(arr4_a_16.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5100
     * @tc.name      testExpressionsContestInferenceOne0051
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_17: Array<Array<string | number | boolean | bigint | null | undefined>> = [
        ["a", 1, true, 2n, null, undefined],
      ];
      expect(arr4_a_17[0][0] as string).assertEqual("a");
      expect(arr4_a_17[0][1] as number).assertEqual(1);
      expect(arr4_a_17[0][2] as boolean).assertTrue();
      expect(arr4_a_17[0][3] as bigint).assertEqual(2n);
      expect(arr4_a_17[0][4]).assertEqual(null);
      expect(arr4_a_17[0][5]).assertEqual(undefined);
      expect(arr4_a_17.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5200
     * @tc.name      testExpressionsContestInferenceOne0052
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_18: Array<Array<string | number | boolean | bigint | null | undefined>> = [
        ["a", 1, true, 2n, null, undefined],
      ];
      expect(arr4_a_18[0][0] as string).assertEqual("a");
      expect(arr4_a_18[0][1] as number).assertEqual(1);
      expect(arr4_a_18[0][2] as boolean).assertTrue();
      expect(arr4_a_18[0][3] as bigint).assertEqual(2n);
      expect(arr4_a_18[0][4]).assertEqual(null);
      expect(arr4_a_18[0][5]).assertEqual(undefined);
      expect(arr4_a_18.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5300
     * @tc.name      testExpressionsContestInferenceOne0053
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_19: Array<Array<string | number | boolean | bigint | null | undefined>> = [
        ["a", 1, true, 2n, null, undefined],
      ];
      expect(arr4_a_19[0][0] as string).assertEqual("a");
      expect(arr4_a_19[0][1] as number).assertEqual(1);
      expect(arr4_a_19[0][2] as boolean).assertTrue();
      expect(arr4_a_19[0][3] as bigint).assertEqual(2n);
      expect(arr4_a_19[0][4]).assertEqual(null);
      expect(arr4_a_19[0][5]).assertEqual(undefined);
      expect(arr4_a_19.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5400
     * @tc.name      testExpressionsContestInferenceOne0054
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_20: Array<Array<arr4_Color_18>> = [[arr4_Color_18.Red, arr4_Color_18.Blue]];
      expect(arr4_a_20[0][0]).assertEqual(arr4_Color_18.Red);
      expect(arr4_a_20[0][1]).assertEqual(arr4_Color_18.Blue);
      expect(arr4_a_20.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5500
     * @tc.name      testExpressionsContestInferenceOne0055
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_21: Array<Array<arr4_Color_21>> = [[arr4_Color_21.Red, arr4_Color_21.Blue]];
      expect(arr4_a_21[0][0]).assertEqual(arr4_Color_21.Red);
      expect(arr4_a_21[0][1]).assertEqual(arr4_Color_21.Blue);
      expect(arr4_a_21.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5600
     * @tc.name      testExpressionsContestInferenceOne0056
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_22: Array<Array<arr4_Color_22>> = [[arr4_Color_22.Red, arr4_Color_22.Blue]];
      expect(arr4_a_22[0][0]).assertEqual(arr4_Color_22.Red);
      expect(arr4_a_22[0][1]).assertEqual(arr4_Color_22.Blue);
      expect(arr4_a_22.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5700
     * @tc.name      testExpressionsContestInferenceOne0057
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_23: Array<Array<arr4_Color_23>> = [[arr4_Color_23.Red, arr4_Color_23.Blue]];
      expect(arr4_a_23[0][0]).assertEqual(arr4_Color_23.Red);
      expect(arr4_a_23[0][1]).assertEqual(arr4_Color_23.Blue);
      expect(arr4_a_23.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5800
     * @tc.name      testExpressionsContestInferenceOne0058
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_24: Array<Array<(p: arr4_Color_24) => number>> = [
        [(p: arr4_Color_24) => p],
        [(p: arr4_Color_24) => p + 1],
        [(p: arr4_Color_24) => p + 2],
      ];
      expect(arr4_a_24[0][0](arr4_Color_24.Red)).assertEqual(0);
      expect(arr4_a_24[1][0](arr4_Color_24.Red)).assertEqual(1);
      expect(arr4_a_24[2][0](arr4_Color_24.Blue)).assertEqual(4);
      expect(arr4_a_24.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_5900
     * @tc.name      testExpressionsContestInferenceOne0059
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_25: Array<Array<(p: arr4_Color_25) => number>> = [
        [(p: arr4_Color_25) => p],
        [(p: arr4_Color_25) => p + 1],
        [(p: arr4_Color_25) => p + 2],
      ];
      expect(arr4_a_25[0][0](arr4_Color_25.Red)).assertEqual(0);
      expect(arr4_a_25[1][0](arr4_Color_25.Red)).assertEqual(1);
      expect(arr4_a_25[2][0](arr4_Color_25.Blue)).assertEqual(4);
      expect(arr4_a_25.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6000
     * @tc.name      testExpressionsContestInferenceOne0060
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_26: Array<Array<(p: arr4_Color_26) => number>> = [
        [(p: arr4_Color_26) => p],
        [(p: arr4_Color_26) => p + 1],
        [(p: arr4_Color_26) => p + 2],
      ];
      expect(arr4_a_26[0][0](arr4_Color_26.Red)).assertEqual(0);
      expect(arr4_a_26[1][0](arr4_Color_26.Red)).assertEqual(1);
      expect(arr4_a_26[2][0](arr4_Color_26.Blue)).assertEqual(4);
      expect(arr4_a_26.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6100
     * @tc.name      testExpressionsContestInferenceOne0061
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_27: Array<Array<(p: arr4_Color_27) => number>> = [
        [(p: arr4_Color_27) => p],
        [(p: arr4_Color_27) => p + 1],
        [(p: arr4_Color_27) => p + 2],
      ];
      expect(arr4_a_27[0][0](arr4_Color_27.Red)).assertEqual(0);
      expect(arr4_a_27[1][0](arr4_Color_27.Red)).assertEqual(1);
      expect(arr4_a_27[2][0](arr4_Color_27.Blue)).assertEqual(4);
      expect(arr4_a_27.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6200
     * @tc.name      testExpressionsContestInferenceOne0062
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_28 = [[true, 1, 'a', null]];
      expect(arr4_a_28[0][0] as boolean).assertTrue();
      expect(arr4_a_28[0][1] as number).assertEqual(1);
      expect(arr4_a_28[0][2] as string).assertEqual('a');
      expect(arr4_a_28[0][3]).assertEqual(null);
      expect(arr4_a_28.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6300
     * @tc.name      testExpressionsContestInferenceOne0063
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_29 = [[true, 1, 'a', null]];
      expect(arr4_a_29[0][0] as boolean).assertTrue();
      expect(arr4_a_29[0][1] as number).assertEqual(1);
      expect(arr4_a_29[0][2] as string).assertEqual('a');
      expect(arr4_a_29[0][3]).assertEqual(null);
      expect(arr4_a_29.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6400
     * @tc.name      testExpressionsContestInferenceOne0064
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_30 = [[true, 1, 'a', null]];
      expect(arr4_a_30[0][0] as boolean).assertTrue();
      expect(arr4_a_30[0][1] as number).assertEqual(1);
      expect(arr4_a_30[0][2] as string).assertEqual('a');
      expect(arr4_a_30[0][3]).assertEqual(null);
      expect(arr4_a_30.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6500
     * @tc.name      testExpressionsContestInferenceOne0065
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_31 = [[true, 1, 'a', null]];
      expect(arr4_a_31[0][0] as boolean).assertTrue();
      expect(arr4_a_31[0][1] as number).assertEqual(1);
      expect(arr4_a_31[0][2] as string).assertEqual('a');
      expect(arr4_a_31[0][3]).assertEqual(null);
      expect(arr4_a_31.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6600
     * @tc.name      testExpressionsContestInferenceOne0066
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_32 = [[arr4_e_32], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_32[0][0] as Error).assertEqual(arr4_e_32);
      expect(arr4_a_32[1][0] as boolean).assertFalse();
      expect((arr4_a_32[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_32[3][0] as number).assertEqual(42);
      expect(arr4_a_32.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6700
     * @tc.name      testExpressionsContestInferenceOne0067
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_33 = [[arr4_e_33], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_33[0][0] as Error).assertEqual(arr4_e_33);
      expect(arr4_a_33[1][0] as boolean).assertFalse();
      expect((arr4_a_33[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_33[3][0] as number).assertEqual(42);
      expect(arr4_a_33.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6800
     * @tc.name      testExpressionsContestInferenceOne0068
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_34 = [[arr4_e_34], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_34[0][0] as Error).assertEqual(arr4_e_34);
      expect(arr4_a_34[1][0] as boolean).assertFalse();
      expect((arr4_a_34[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_34[3][0] as number).assertEqual(42);
      expect(arr4_a_34.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_6900
     * @tc.name      testExpressionsContestInferenceOne0069
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_35 = [[arr4_e_35], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_35[0][0] as Error).assertEqual(arr4_e_35);
      expect(arr4_a_35[1][0] as boolean).assertFalse();
      expect((arr4_a_35[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_35[3][0] as number).assertEqual(42);
      expect(arr4_a_35.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7000
     * @tc.name      testExpressionsContestInferenceOne0070
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_36 = [false, true, false];
      expect((arr4_a_36 as boolean[])[0]).assertFalse();
      expect((arr4_a_36 as boolean[])[1]).assertTrue();
      expect((arr4_a_36 as boolean[])[2]).assertFalse();
      expect((arr4_a_36 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7100
     * @tc.name      testExpressionsContestInferenceOne0071
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_37 = [false, true, false];
      expect((arr4_a_37 as boolean[])[0]).assertFalse();
      expect((arr4_a_37 as boolean[])[1]).assertTrue();
      expect((arr4_a_37 as boolean[])[2]).assertFalse();
      expect((arr4_a_37 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7200
     * @tc.name      testExpressionsContestInferenceOne0072
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_38 = [1, 2, 43];
      expect((arr4_a_38 as number[])[0]).assertEqual(1);
      expect((arr4_a_38 as number[])[1]).assertEqual(2);
      expect((arr4_a_38 as number[])[2]).assertEqual(43);
      expect((arr4_a_38 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7300
     * @tc.name      testExpressionsContestInferenceOne0073
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_39 = [1, 2, 43];
      expect((arr4_a_39 as number[])[0]).assertEqual(1);
      expect((arr4_a_39 as number[])[1]).assertEqual(2);
      expect((arr4_a_39 as number[])[2]).assertEqual(43);
      expect((arr4_a_39 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7400
     * @tc.name      testExpressionsContestInferenceOne0074
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_40 = ['1', '2', arr4_s_40 + '3'];
      expect((arr4_a_40 as string[])[0]).assertEqual('1');
      expect((arr4_a_40 as string[])[1]).assertEqual('2');
      expect((arr4_a_40 as string[])[2]).assertEqual('43');
      expect((arr4_a_40 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7500
     * @tc.name      testExpressionsContestInferenceOne0075
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_41 = ['1', '2', arr4_s_41 + '3'];
      expect((arr4_a_41 as string[])[0]).assertEqual('1');
      expect((arr4_a_41 as string[])[1]).assertEqual('2');
      expect((arr4_a_41 as string[])[2]).assertEqual('43');
      expect((arr4_a_41 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7600
     * @tc.name      testExpressionsContestInferenceOne0076
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_42 = ['1', '2', arr4_s_42 + '3'];
      expect((arr4_a_42 as string[])[0]).assertEqual('1');
      expect((arr4_a_42 as string[])[1]).assertEqual('2');
      expect((arr4_a_42 as string[])[2]).assertEqual('43');
      expect((arr4_a_42 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7700
     * @tc.name      testExpressionsContestInferenceOne0077
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_43 = ['1', '2', '43'];
      expect((arr4_a_43 as string[])[0]).assertEqual('1');
      expect((arr4_a_43 as string[])[1]).assertEqual('2');
      expect((arr4_a_43 as string[])[2]).assertEqual('43');
      expect((arr4_a_43 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7800
     * @tc.name      testExpressionsContestInferenceOne0078
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_44: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_44) && typeof arr4_a_44[0] === 'number') {
        expect(arr4_a_44[0]).assertEqual(1);
        expect(arr4_a_44[1]).assertEqual(2);
        expect(arr4_a_44[2]).assertEqual(3);
        expect(arr4_a_44.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_7900
     * @tc.name      testExpressionsContestInferenceOne0079
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_45: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_45) && typeof arr4_a_45[0] === 'number') {
        expect(arr4_a_45[0]).assertEqual(1);
        expect(arr4_a_45[1]).assertEqual(2);
        expect(arr4_a_45[2]).assertEqual(3);
        expect(arr4_a_45.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8000
     * @tc.name      testExpressionsContestInferenceOne0080
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_46: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_46) && typeof arr4_a_46[0] === 'number') {
        expect(arr4_a_46[0]).assertEqual(1);
        expect(arr4_a_46[1]).assertEqual(2);
        expect(arr4_a_46[2]).assertEqual(3);
        expect(arr4_a_46.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8100
     * @tc.name      testExpressionsContestInferenceOne0081
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_47: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_47) && typeof arr4_a_47[0] === 'number') {
        expect(arr4_a_47[0]).assertEqual(1);
        expect(arr4_a_47[1]).assertEqual(2);
        expect(arr4_a_47[2]).assertEqual(3);
        expect(arr4_a_47.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8200
     * @tc.name      testExpressionsContestInferenceOne0082
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_48: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_48) && typeof arr4_a_48[0] === 'string') {
        expect(arr4_a_48[0]).assertEqual('1');
        expect(arr4_a_48[1]).assertEqual('2');
        expect(arr4_a_48[2]).assertEqual('3');
        expect(arr4_a_48.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8300
     * @tc.name      testExpressionsContestInferenceOne0083
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_49: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_49) && typeof arr4_a_49[0] === 'string') {
        expect(arr4_a_49[0]).assertEqual('1');
        expect(arr4_a_49[1]).assertEqual('2');
        expect(arr4_a_49[2]).assertEqual('3');
        expect(arr4_a_49.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8400
     * @tc.name      testExpressionsContestInferenceOne0084
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_50: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_50) && typeof arr4_a_50[0] === 'string') {
        expect(arr4_a_50[0]).assertEqual('1');
        expect(arr4_a_50[1]).assertEqual('2');
        expect(arr4_a_50[2]).assertEqual('3');
        expect(arr4_a_50.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8500
     * @tc.name      testExpressionsContestInferenceOne0085
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_51: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_51) && typeof arr4_a_51[0] === 'string') {
        expect(arr4_a_51[0]).assertEqual('1');
        expect(arr4_a_51[1]).assertEqual('2');
        expect(arr4_a_51[2]).assertEqual('3');
        expect(arr4_a_51.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8600
     * @tc.name      testExpressionsContestInferenceOne0086
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_52: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_52) && typeof arr4_a_52[0] === 'number') {
        expect(arr4_a_52[0]).assertEqual(1);
        expect(arr4_a_52[1]).assertEqual(2);
        expect(arr4_a_52[2]).assertEqual(3);
        expect(arr4_a_52.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8700
     * @tc.name      testExpressionsContestInferenceOne0087
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_53: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_53) && typeof arr4_a_53[0] === 'number') {
        expect(arr4_a_53[0]).assertEqual(1);
        expect(arr4_a_53[1]).assertEqual(2);
        expect(arr4_a_53[2]).assertEqual(3);
        expect(arr4_a_53.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8800
     * @tc.name      testExpressionsContestInferenceOne0088
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_54: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_54) && typeof arr4_a_54[0] === 'number') {
        expect(arr4_a_54[0]).assertEqual(1);
        expect(arr4_a_54[1]).assertEqual(2);
        expect(arr4_a_54[2]).assertEqual(3);
        expect(arr4_a_54.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_8900
     * @tc.name      testExpressionsContestInferenceOne0089
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_55: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_55) && typeof arr4_a_55[0] === 'number') {
        expect(arr4_a_55[0]).assertEqual(1);
        expect(arr4_a_55[1]).assertEqual(2);
        expect(arr4_a_55[2]).assertEqual(3);
        expect(arr4_a_55.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_9000
     * @tc.name      testExpressionsContestInferenceOne0090
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_56: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_56) && typeof arr4_a_56[0] === 'string') {
        expect(arr4_a_56[0]).assertEqual('1');
        expect(arr4_a_56[1]).assertEqual('2');
        expect(arr4_a_56[2]).assertEqual('3');
        expect(arr4_a_56.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_9100
     * @tc.name      testExpressionsContestInferenceOne0091
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_57: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_57) && typeof arr4_a_57[0] === 'string') {
        expect(arr4_a_57[0]).assertEqual('1');
        expect(arr4_a_57[1]).assertEqual('2');
        expect(arr4_a_57[2]).assertEqual('3');
        expect(arr4_a_57.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_9200
     * @tc.name      testExpressionsContestInferenceOne0092
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_58: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_58) && typeof arr4_a_58[0] === 'string') {
        expect(arr4_a_58[0]).assertEqual('1');
        expect(arr4_a_58[1]).assertEqual('2');
        expect(arr4_a_58[2]).assertEqual('3');
        expect(arr4_a_58.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_ONE_9300
     * @tc.name      testExpressionsContestInferenceOne0093
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInferenceOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_59: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_59) && typeof arr4_a_59[0] === 'string') {
        expect(arr4_a_59[0]).assertEqual('1');
        expect(arr4_a_59[1]).assertEqual('2');
        expect(arr4_a_59[2]).assertEqual('3');
        expect(arr4_a_59.length).assertEqual(3);
      }
    });
  })
}