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

let a_0: boolean[] = [true, true, true, true, true, true];
let a_1: number[] = [];
let a_2: number[][] = [];
let a_3: number[] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
let a_4: boolean[] = [];
let a_5: number[] = [];
let a_6: number[] = [];
let a_7: number[][] = [];
let a_8: string[] = [];
let a_9: string[] = ['','','','','','','','','','','','','','',''];
let a_11: string[][] = [];
let a_12: bigint[] = [];
let a_13: bigint[][] = [];
let a_15: A_15<number>[] = [];
let a_17: Color_18[] = [];
let a_18: Color_18[][] = [];
let a_19: F_19[] = [];
let a_20: F_20[][] = [];
let a_21: (null|undefined|Object)[] = [];
let a_22: number[] = [0];
let a_23: (boolean|number|string|null)[] = [];
let a_24: (boolean|number|string|null)[][] = [];
let a_27: number[]|string[]|boolean[]|null = null;
let a_28: number[]|string[]|boolean[]|null = null;
let a_29: number[]|string[]|boolean[]|null = null;
let a_30: (Color_18|Size_30)[] = [];
let u_21: undefined = undefined;
let n_21: null = null;
let o_21: Object = {};
let e_25 = new Error();

class A_15<T> {}
let v_15 = new A_15<number>();
let q_15 = new A_15<number>();

enum Color_18 { Red, Green, Blue }
enum Size_30 { S, M, L, XL }

type F_19 = (p: Color_18) => number;
type F_20 = (p: Color_18) => number;

function sum_22(p: number[]): number {
  let s: number = 0;
  for (let v of p)
    s += v;
  return s;
}

let arr3_a_0: boolean[] = [true, true, true, true, true, true];
let arr3_a_1: number[] = [];
let arr3_a_2: number[][] = [];
let arr3_a_3: number[] = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,];
let arr3_a_4: boolean[] = [];
let arr3_a_5: number[] = [];
let arr3_a_6: number[] = [];
let arr3_a_7: number[][] = [];
let arr3_a_8: string[] = [];
let arr3_a_9: string[] = ['','','','','','','','','','','','','','','',];
let arr3_a_11: string[][] = [];
let arr3_a_12: bigint[] = [];
let arr3_a_31: number[]|string[]|boolean[]|null = null;

function arr3_sum_23(p: number[]): number {
  let s: number = 0;
  for (let v of p)
    s += v;
  return s;
}

function arr3_sum_24(p: number[]): number {
  let s: number = 0;
  for (let v of p) {
    expect(typeof v === 'number').assertTrue();
    s += v;
  }
  return s;
}

function arr3_sum_25(p: number[]): number {
  let s: number = 0;
  for (let v of p)
    s += v;
  return s;
}

function foo_0(a: boolean[]): void {
  expect(a[0]).assertFalse();
  expect(a[1]).assertTrue();
  expect(a[2]).assertTrue();
  expect(a.length).assertEqual(3);
}

function foo_3(a: number[]): void {
  expect(Number.isNaN(a[0])).assertTrue();
  expect(a[3]).assertEqual(1.7976931348623157e+308);
  expect(a.length).assertEqual(4);
}

function foo_4(a: number[]): void {
  expect(Number.isNaN(a[0])).assertTrue();
  expect(a[3]).assertEqual(1.7976931348623157e+308);
  expect(a.length).assertEqual(4);
}

function foo_5(a: boolean[]): void {
  expect(a[0]).assertFalse();
  expect(a[1]).assertTrue();
  expect(a[2]).assertTrue();
  expect(a.length).assertEqual(3);
}

function foo_6(a: number[]): void {
  expect(a[3]).assertEqual(-9223372036854775808);
  expect(a.length).assertEqual(4);
}

function foo_7(a: string[]): void {
  expect(a[3]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(4);
}

function foo_8(a: string[]): void {
  expect(a[0]).assertEqual('x');
  expect(a[1]).assertEqual('x1');
  expect(a[2]).assertEqual('x2');
  expect(a[3]).assertEqual('x3');
  expect(a.length).assertEqual(4);
}

function foo_10(a: string[][]): void {
  expect(a[0][0]).assertEqual('1');
  expect(a[0][1]).assertEqual('11');
  expect(a[1][0]).assertEqual('');
  expect(a[1][1]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(2);
}

function foo_11(a: bigint[]): void {
  expect(a[1]).assertEqual(2n);
  expect(a[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

function foo_12(a: bigint[][]): void {
  expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
  expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

class A_13 {}
function foo_13(a: A_13[]): void {
  expect(a[0] instanceof A_13).assertTrue();
  expect(a.length).assertEqual(1);
}

class A_14<T> {}
let v_14 = new A_14<number>();
let q_14 = new A_14<number>();
function foo_14<T>(a: A_14<T>[]): void {
  expect(a[0]).assertEqual(v_14);
  expect(a[1]).assertEqual(q_14);
  expect(a.length).assertEqual(2);
}

function foo_16(a: Array<[string, number, boolean, bigint]>): void {
  expect(a[0][0]).assertEqual("a");
  expect(a[0][1]).assertEqual(1);
  expect(a[0][2]).assertTrue();
  expect(a[0][3]).assertEqual(2n);
  expect(a.length).assertEqual(1);
}

class A_18 {
  foo(p: Object[]): number {
    let s = p.length;
    for (let v of p) {
      s += v instanceof A_18 ? 1 : 0;
    }
    return s;
  }
}

function foo_19(a: Color_18[]): void {
  expect(a[0]).assertEqual(Color_18.Red);
  expect(a[1]).assertEqual(Color_18.Blue);
  expect(a.length).assertEqual(2);
}

function foo_20(a: Color_18[][]): void {
  expect(a[0][0]).assertEqual(Color_18.Red);
  expect(a[0][1]).assertEqual(Color_18.Blue);
  expect(a.length).assertEqual(1);
}
let u_23: undefined = undefined;
let n_23: null = null;
let o_23: Object = {};
function foo_23(a: (null|undefined|Object)[]): void {
  expect(a[0]).assertEqual(null);
  expect(a[1] as Object).assertEqual(o_23);
  expect(a[2] as Object).assertEqual(o_23);
  expect(a[3]).assertEqual(undefined);
  expect(a.length).assertEqual(4);
}

function foo_28(a: number[]|string[]|boolean[]): void {
  expect((a as boolean[])[0]).assertFalse();
  expect((a as boolean[])[1]).assertTrue();
  expect((a as boolean[])[2]).assertFalse();
  expect((a as boolean[]).length).assertEqual(3);
}

function foo_30(a: number[]|string[]|boolean[]): void {
  expect((a as string[])[0]).assertEqual('1');
  expect((a as string[])[1]).assertEqual('2');
  expect((a as string[])[2]).assertEqual('43');
  expect((a as string[]).length).assertEqual(3);
}

enum Color_31 { Red, Green, Blue }
enum Size_31 { S, M, L, XL }
function foo_31(a: (Color_31|Size_31)[]): void {
  expect(a[0] as Color_31).assertEqual(Color_31.Red);
  expect(a[1] as Color_31).assertEqual(Color_31.Green);
  expect(a[2] as Size_31).assertEqual(Size_31.XL);
  expect(a.length).assertEqual(3);
}

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
let arr4_s_38 = '4';
let arr4_a_38: (number[]|string[]|boolean[]|null) = null;
let arr4_s_39 = '4';
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

function arr4_foo_8(a: string[][]): void {
  expect(a[0][0]).assertEqual('1');
  expect(a[0][1]).assertEqual('11');
  expect(a[1][0]).assertEqual('');
  expect(a[1][1]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(2);
}

function arr4_foo_9(a: string[][]): void {
  expect(a[0][0]).assertEqual('1');
  expect(a[0][1]).assertEqual('11');
  expect(a[1][0]).assertEqual('');
  expect(a[1][1]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(2);
}

function arr4_foo_10(a: string[][]): void {
  expect(a[0][0]).assertEqual('1');
  expect(a[0][1]).assertEqual('11');
  expect(a[1][0]).assertEqual('');
  expect(a[1][1]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(2);
}

function arr4_foo_11(a: string[][]): void {
  expect(a[0][0]).assertEqual('1');
  expect(a[0][1]).assertEqual('11');
  expect(a[1][0]).assertEqual('');
  expect(a[1][1]).assertEqual('-9223372036854775808');
  expect(a.length).assertEqual(2);
}

function arr4_foo_12(a: bigint[][]): void {
  expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
  expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

function arr4_foo_13(a: bigint[][]): void {
  expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
  expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

function arr4_foo_14(a: bigint[][]): void {
  expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
  expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

function arr4_foo_15(a: bigint[][]): void {
  expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
  expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
  expect(a.length).assertEqual(3);
}

function arr4_foo_16(a: Array<[string, number, boolean, bigint, null, undefined]>): void {
  const innerArray = a[0];
  expect(innerArray[0]).assertEqual("a");
  expect(innerArray[1]).assertEqual(1);
  expect(innerArray[2]).assertTrue();
  expect(innerArray[3]).assertEqual(2n);
  expect(innerArray[4]).assertEqual(null);
  expect(innerArray[5]).assertEqual(undefined);
  expect(a.length).assertEqual(1);
}

function arr4_foo_17(a: Array<[string, number, boolean, bigint, null, undefined]>): void {
  const innerArray = a[0];
  expect(innerArray[0]).assertEqual("a");
  expect(innerArray[1]).assertEqual(1);
  expect(innerArray[2]).assertTrue();
  expect(innerArray[3]).assertEqual(2n);
  expect(innerArray[4]).assertEqual(null);
  expect(innerArray[5]).assertEqual(undefined);
  expect(a.length).assertEqual(1);
}

function arr4_foo_18(a: Array<[string, number, boolean, bigint, null, undefined]>): void {
  const innerArray = a[0];
  expect(innerArray[0]).assertEqual("a");
  expect(innerArray[1]).assertEqual(1);
  expect(innerArray[2]).assertTrue();
  expect(innerArray[3]).assertEqual(2n);
  expect(innerArray[4]).assertEqual(null);
  expect(innerArray[5]).assertEqual(undefined);
  expect(a.length).assertEqual(1);
}

function arr4_foo_19(a: Array<[string, number, boolean, bigint, null, undefined]>): void {
  const innerArray = a[0];
  expect(innerArray[0]).assertEqual("a");
  expect(innerArray[1]).assertEqual(1);
  expect(innerArray[2]).assertTrue();
  expect(innerArray[3]).assertEqual(2n);
  expect(innerArray[4]).assertEqual(null);
  expect(innerArray[5]).assertEqual(undefined);
  expect(a.length).assertEqual(1);
}

enum arr4_foo_Color_23 { Red, Green, Blue }
function arr4_foo_23(a: arr4_foo_Color_23[][]): void {
  expect(a[0][0]).assertEqual(arr4_foo_Color_23.Red);
  expect(a[0][1]).assertEqual(arr4_foo_Color_23.Blue);
  expect(a.length).assertEqual(1);
}

enum arr4_foo_Color_27 { Red, Green, Blue }
type arr4_foo_F_27 = (p: arr4_foo_Color_27) => number;
function arr4_foo_27(a: arr4_foo_F_27[][]): void {
  expect(a[0][0](arr4_foo_Color_27.Red)).assertEqual(0);
  expect(a[1][0](arr4_foo_Color_27.Red)).assertEqual(1);
  expect(a[2][0](arr4_foo_Color_27.Blue)).assertEqual(4);
  expect(a.length).assertEqual(3);
}

function arr4_foo_31(a: (boolean|number|string|null)[][]): void {
  expect(a[0][0] as boolean).assertTrue();
  expect(a[0][1] as number).assertEqual(1);
  expect(a[0][2] as string).assertEqual('a');
  expect(a[0][3]).assertEqual(null);
  expect(a.length).assertEqual(1);
}

let arr4_foo_e_35 = new Error();
function arr4_foo_35(a: (number|Error|((p: string) => string)|boolean)[][]): void {
  expect(a[0][0] as Error).assertEqual(arr4_foo_e_35);
  expect(a[1][0] as boolean).assertFalse();
  expect((a[2][0] as (p: string) => string)('a')).assertEqual('aa');
  expect(a[3][0] as number).assertEqual(42);
  expect(a.length).assertEqual(4);
}

function arr4_foo_36(a: number[]|string[]|boolean[]|null): void {
  let x = a as boolean[];
  expect(x[0]).assertFalse();
  expect(x[1]).assertTrue();
  expect(x[2]).assertFalse();
  expect(x.length).assertEqual(3);
}

function arr4_foo_37(a: number[]|string[]|boolean[]|null): void {
  let x = a as boolean[];
  expect(x[0]).assertFalse();
  expect(x[1]).assertTrue();
  expect(x[2]).assertFalse();
  expect(x.length).assertEqual(3);
}

function arr4_foo_42(a: number[]|string[]|boolean[]|null): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('43');
  expect(x.length).assertEqual(3);
}

function arr4_foo_43(a: number[]|string[]|boolean[]|null): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('43');
  expect(x.length).assertEqual(3);
}

function arr4_foo_44(a: string[]|boolean[]|null): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('43');
  expect(x.length).assertEqual(3);
}

function arr4_foo_45(a: boolean[]|string|string[]|null): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('43');
  expect(x.length).assertEqual(3);
}

function arr4_foo_46(a: string[]|number[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_47(a: string[]|number[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_48(a: string[]|number[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_49(a: string[]|number[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_50(a: number[]|string[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_51(a: number[]|string[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_52(a: number[]|string[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_53(a: number[]|string[]): void {
  let x = a as number[];
  expect(x[0]).assertEqual(1);
  expect(x[1]).assertEqual(2);
  expect(x[2]).assertEqual(3);
  expect(x.length).assertEqual(3);
}

function arr4_foo_54(a: string[]|number[]): void {
  let x = a as string[];
  expect(x[0]).assertEqual('1');
  expect(x[1]).assertEqual('2');
  expect(x[2]).assertEqual('3');
  expect(x.length).assertEqual(3);
}

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
let s = '';
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

export default function ExpressionsContestInferenceTest() {
  describe("ExpressionsContestInferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0100
     * @tc.name      testExpressionsContestInference0001
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_0 = [!true, true, false];
      expect(a_0[0]).assertFalse();
      expect(a_0[1]).assertTrue();
      expect(a_0[2]).assertFalse();
      expect(a_0.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0200
     * @tc.name      testExpressionsContestInference0002
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_1 = [1, 2, 3, -9223372036854775808];
      expect(a_1[3]).assertEqual(-9223372036854775808);
      expect(a_1.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0300
     * @tc.name      testExpressionsContestInference0003
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_2 = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];
      expect(a_2.length).assertEqual(4);
      expect(a_2[0][0]).assertEqual(-2147483647);
      expect(a_2[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0400
     * @tc.name      testExpressionsContestInference0004
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_3 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(a_3[0])).assertTrue();
      expect(a_3[3]).assertEqual(1.7976931348623157e+308);
      expect(a_3.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0500
     * @tc.name      testExpressionsContestInference0005
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_4 = [!true, true, true];
      expect(a_4[0]).assertFalse();
      expect(a_4[1]).assertTrue();
      expect(a_4[2]).assertTrue();
      expect(a_4.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0600
     * @tc.name      testExpressionsContestInference0006
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_5 = [1, 2, 3, -9223372036854775808];
      expect(a_5[3]).assertEqual(-9223372036854775808);
      expect(a_5.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0700
     * @tc.name      testExpressionsContestInference0007
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_6 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(a_6[0])).assertTrue();
      expect(a_6[3]).assertEqual(1.7976931348623157e+308);
      expect(a_6.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0800
     * @tc.name      testExpressionsContestInference0008
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_7 = [[1.7976931348623157e+308, 2], [3], [4, 5, 6.0], []];
      expect(a_7.length).assertEqual(4);
      expect(a_7[0][0]).assertEqual(1.7976931348623157e+308);
      expect(a_7[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_0900
     * @tc.name      testExpressionsContestInference0009
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_8 = ['1', '2', '3', '-9223372036854775808'];
      expect(a_8[3]).assertEqual('-9223372036854775808');
      expect(a_8.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1000
     * @tc.name      testExpressionsContestInference0010
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_9 = ['x', 'x1', 'x2', 'x3'];
      expect(a_9[0]).assertEqual('x');
      expect(a_9[1]).assertEqual('x1');
      expect(a_9[2]).assertEqual('x2');
      expect(a_9[3]).assertEqual('x3');
      expect(a_9.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1100
     * @tc.name      testExpressionsContestInference0011
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_11 = [['1', '11'], ['', '-9223372036854775808']];
      expect(a_11[0][0]).assertEqual('1');
      expect(a_11[0][1]).assertEqual('11');
      expect(a_11[1][0]).assertEqual('');
      expect(a_11[1][1]).assertEqual('-9223372036854775808');
      expect(a_11.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1200
     * @tc.name      testExpressionsContestInference0012
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_12 = [1n, 2n, 33333333333333333333333333333333333333333333333333n];
      expect(a_12[1]).assertEqual(2n);
      expect(a_12[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a_12.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1300
     * @tc.name      testExpressionsContestInference0013
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_13 = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      expect(a_13[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(a_13[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a_13.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1400
     * @tc.name      testExpressionsContestInference0014
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_15 = [v_15, q_15];
      expect(a_15[0]).assertEqual(v_15);
      expect(a_15[1]).assertEqual(q_15);
      expect(a_15.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1500
     * @tc.name      testExpressionsContestInference0015
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a_16: Array<[string, number, boolean, bigint]> = [["a", 1, true, 2n]];

      const element_0 = a_16[0];
      expect(element_0[0]).assertEqual("a");
      expect(element_0[1]).assertEqual(1);
      expect(element_0[2]).assertTrue();
      expect(element_0[3]).assertEqual(2n);
      expect(a_16.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1600
     * @tc.name      testExpressionsContestInference0016
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_17 = [Color_18.Red, Color_18.Blue];
      expect(a_17[0]).assertEqual(Color_18.Red);
      expect(a_17[1]).assertEqual(Color_18.Blue);
      expect(a_17.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1700
     * @tc.name      testExpressionsContestInference0017
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_18 = [[Color_18.Red, Color_18.Blue]];
      expect(a_18[0][0]).assertEqual(Color_18.Red);
      expect(a_18[0][1]).assertEqual(Color_18.Blue);
      expect(a_18.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1800
     * @tc.name      testExpressionsContestInference0018
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_19 = [(p: Color_18) => 0, (p: Color_18) => 1, (p: Color_18) => p === Color_18.Blue ? 4 : 0];
      expect(a_19[0](Color_18.Red)).assertEqual(0);
      expect(a_19[1](Color_18.Red)).assertEqual(1);
      expect(a_19[2](Color_18.Blue)).assertEqual(4);
      expect(a_19.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_1900
     * @tc.name      testExpressionsContestInference0019
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_20 = [
        [(p: Color_18) => 0],
        [(p: Color_18) => 1],
        [(p: Color_18) => p === Color_18.Blue ? 4 : 0]
      ];
      expect(a_20[0][0](Color_18.Red)).assertEqual(0);
      expect(a_20[1][0](Color_18.Red)).assertEqual(1);
      expect(a_20[2][0](Color_18.Blue)).assertEqual(4);
      expect(a_20.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2000
     * @tc.name      testExpressionsContestInference0020
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_21 = [null, o_21, o_21, u_21];
      expect(a_21[0]).assertEqual(null);
      expect(a_21[1]).assertEqual(o_21);
      expect(a_21[2]).assertEqual(o_21);
      expect(a_21[3]).assertEqual(undefined);
      expect(a_21.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2100
     * @tc.name      testExpressionsContestInference0021
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_22 = [sum_22([1, 2, 3])];
      expect(a_22[0]).assertEqual(6);
      expect(a_22.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2200
     * @tc.name      testExpressionsContestInference0022
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_23 = [true, 1, 'a', null];
      expect(a_23[0]).assertTrue();
      expect(a_23[1]).assertEqual(1);
      expect(a_23[2]).assertEqual('a');
      expect(a_23[3]).assertNull();
      expect(a_23.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2300
     * @tc.name      testExpressionsContestInference0023
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_24 = [[true, 1, 'a', null]];
      expect(a_24[0][0]).assertTrue();
      expect(a_24[0][1]).assertEqual(1);
      expect(a_24[0][2]).assertEqual('a');
      expect(a_24[0][3]).assertNull();
      expect(a_24.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2400
     * @tc.name      testExpressionsContestInference0024
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_27 = [false, true, false];
      expect((a_27 as boolean[])[0]).assertFalse();
      expect((a_27 as boolean[])[1]).assertTrue();
      expect((a_27 as boolean[])[2]).assertFalse();
      expect((a_27 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2500
     * @tc.name      testExpressionsContestInference0025
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_28 = [1, 2, 43];
      expect((a_28 as number[])[0]).assertEqual(1);
      expect((a_28 as number[])[1]).assertEqual(2);
      expect((a_28 as number[])[2]).assertEqual(43);
      expect((a_28 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2600
     * @tc.name      testExpressionsContestInference0026
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_29 = ['1', '2', '43'];
      expect((a_29 as string[])[0]).assertEqual('1');
      expect((a_29 as string[])[1]).assertEqual('2');
      expect((a_29 as string[])[2]).assertEqual('43');
      expect((a_29 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2700
     * @tc.name      testExpressionsContestInference0027
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      a_30 = [Color_18.Red, Color_18.Green, Size_30.XL];
      expect(a_30[0]).assertEqual(Color_18.Red);
      expect(a_30[1]).assertEqual(Color_18.Green);
      expect(a_30[2]).assertEqual(Size_30.XL);
      expect(a_30.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2800
     * @tc.name      testExpressionsContestInference0028
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_0 = [!true, true, false];
      expect(arr3_a_0[0]).assertFalse();
      expect(arr3_a_0[1]).assertTrue();
      expect(arr3_a_0[2]).assertFalse();
      expect(arr3_a_0.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_2900
     * @tc.name      testExpressionsContestInference0029
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_1 = [1, 2, 3, -9223372036854775808];
      expect(arr3_a_1[3]).assertEqual(-9223372036854775808);
      expect(arr3_a_1.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3000
     * @tc.name      testExpressionsContestInference0030
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_2 = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []];
      expect(arr3_a_2.length).assertEqual(4);
      expect(arr3_a_2[0][0]).assertEqual(-2147483647);
      expect(arr3_a_2[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3100
     * @tc.name      testExpressionsContestInference0031
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_3 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(arr3_a_3[0])).assertTrue();
      expect(arr3_a_3[3]).assertEqual(1.7976931348623157e+308);
      expect(arr3_a_3.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3200
     * @tc.name      testExpressionsContestInference0032
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_4 = [!true, true, true];
      expect(arr3_a_4[0]).assertFalse();
      expect(arr3_a_4[1]).assertTrue();
      expect(arr3_a_4[2]).assertTrue();
      expect(arr3_a_4.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3300
     * @tc.name      testExpressionsContestInference0033
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_5 = [1, 2, 3, -9223372036854775808];
      expect(arr3_a_5[3]).assertEqual(-9223372036854775808);
      expect(arr3_a_5.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3400
     * @tc.name      testExpressionsContestInference0034
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_6 = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      expect(Number.isNaN(arr3_a_6[0])).assertTrue();
      expect(arr3_a_6[3]).assertEqual(1.7976931348623157e+308);
      expect(arr3_a_6.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3500
     * @tc.name      testExpressionsContestInference0035
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_7 = [[1.7976931348623157e+308, 2], [3], [4, 5, 6.0], []];
      expect(arr3_a_7.length).assertEqual(4);
      expect(arr3_a_7[0][0]).assertEqual(1.7976931348623157e+308);
      expect(arr3_a_7[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3600
     * @tc.name      testExpressionsContestInference0036
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_8 = ['1', '2', '3', '-9223372036854775808'];
      expect(arr3_a_8[3]).assertEqual('-9223372036854775808');
      expect(arr3_a_8.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3700
     * @tc.name      testExpressionsContestInference0037
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_9 = ['x', 'x1', 'x2', 'x3'];
      expect(arr3_a_9[0]).assertEqual('x');
      expect(arr3_a_9[1]).assertEqual('x1');
      expect(arr3_a_9[2]).assertEqual('x2');
      expect(arr3_a_9[3]).assertEqual('x3');
      expect(arr3_a_9.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3800
     * @tc.name      testExpressionsContestInference0038
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_11 = [['1', '11'], ['', '-9223372036854775808']];
      expect(arr3_a_11[0][0]).assertEqual('1');
      expect(arr3_a_11[0][1]).assertEqual('11');
      expect(arr3_a_11[1][0]).assertEqual('');
      expect(arr3_a_11[1][1]).assertEqual('-9223372036854775808');
      expect(arr3_a_11.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_3900
     * @tc.name      testExpressionsContestInference0039
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_12 = [1n, 2n, 33333333333333333333333333333333333333333333333333n];
      expect(arr3_a_12[1]).assertEqual(2n);
      expect(arr3_a_12[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr3_a_12.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4000
     * @tc.name      testExpressionsContestInference0040
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_13 = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      const firstElement = arr3_a_13[0];
      const thirdElement = arr3_a_13[2];
      expect(firstElement[0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(thirdElement[0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(arr3_a_13.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4100
     * @tc.name      testExpressionsContestInference0041
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_16 = [["a", 1, true, 2n]];
      const element = arr3_a_16[0];
      expect(element[0]).assertEqual("a");
      expect(element[1]).assertEqual(1);
      expect(element[2]).assertTrue();
      expect(element[3]).assertEqual(2n);
      expect(arr3_a_16.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4200
     * @tc.name      testExpressionsContestInference0042
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_22: Array<number> = [arr3_sum_23([1, 2, 3])];
      expect(arr3_a_22[0]).assertEqual(6);
      expect(arr3_a_22.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4300
     * @tc.name      testExpressionsContestInference0043
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_23: Array<number> = [arr3_sum_24([1, 2, 3])];
      expect(arr3_a_23[0]).assertEqual(6);
      expect(arr3_a_23.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4400
     * @tc.name      testExpressionsContestInference0044
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_24: Array<number> = [arr3_sum_25([1, 2, 3])];
      expect(arr3_a_24[0]).assertEqual(6);
      expect(arr3_a_24.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4500
     * @tc.name      testExpressionsContestInference0045
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_25: Array<boolean | number | string | null> = [true, 1, 'a', null];
      expect(arr3_a_25[0]).assertTrue();
      expect(arr3_a_25[1]).assertEqual(1);
      expect(arr3_a_25[2]).assertEqual('a');
      expect(arr3_a_25[3]).assertNull();
      expect(arr3_a_25.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4600
     * @tc.name      testExpressionsContestInference0046
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_26: Array<Array<boolean | number | string | null>> = [
        [true, 1, 'a', null],
      ];
      expect(arr3_a_26[0][0]).assertTrue();
      expect(arr3_a_26[0][1]).assertEqual(1);
      expect(arr3_a_26[0][2]).assertEqual('a');
      expect(arr3_a_26[0][3]).assertNull();
      expect(arr3_a_26.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4700
     * @tc.name      testExpressionsContestInference0047
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr3_a_27: Array<Boolean | number | string | ((s: string) => string)> = [
        'arr3_e_28',
        false,
        (s: string): string => s + s,
        42
      ];
      expect(arr3_a_27[0]).assertEqual('arr3_e_28');
      expect(arr3_a_27[1]).assertFalse();
      expect((arr3_a_27[2] as (s: string) => string)('a')).assertEqual('aa');
      expect(arr3_a_27[3]).assertEqual(42);
      expect(arr3_a_27.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4800
     * @tc.name      testExpressionsContestInference0048
     * @tc.desc      arr3_inf_assn test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr3_a_31 = ['1', '2', '43'];
      expect((arr3_a_31 as string[])[0]).assertEqual('1');
      expect((arr3_a_31 as string[])[1]).assertEqual('2');
      expect((arr3_a_31 as string[])[2]).assertEqual('43');
      expect((arr3_a_31 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_4900
     * @tc.name      testExpressionsContestInference0049
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo_0([!true, true, true]);
      expect([!true, true, true][0]).assertFalse();
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5000
     * @tc.name      testExpressionsContestInference0050
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo_3([NaN, 1.0, -1.0, 1.7976931348623157e+308]);
      expect([NaN, 1.0, -1.0, 1.7976931348623157e+308].length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5100
     * @tc.name      testExpressionsContestInference0051
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [NaN, 1.0, -1.0, 1.7976931348623157e+308];
      foo_4(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5200
     * @tc.name      testExpressionsContestInference0052
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [!true, true, true];
      foo_5(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5300
     * @tc.name      testExpressionsContestInference0053
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [1, 2, 3, -9223372036854775808];
      foo_6(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5400
     * @tc.name      testExpressionsContestInference0054
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3', '-9223372036854775808'];
      foo_7(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5500
     * @tc.name      testExpressionsContestInference0055
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['x', 'x1', 'x2', 'x3'];
      foo_8(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5600
     * @tc.name      testExpressionsContestInference0056
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [['1', '11'], ['', '-9223372036854775808']];
      foo_10(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5700
     * @tc.name      testExpressionsContestInference0057
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [1n, 2n, 33333333333333333333333333333333333333333333333333n];
      foo_11(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5800
     * @tc.name      testExpressionsContestInference0058
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      foo_12(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_5900
     * @tc.name      testExpressionsContestInference0059
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [new A_13()];
      foo_13(a);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6000
     * @tc.name      testExpressionsContestInference0060
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [v_14, q_14];
      foo_14(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6100
     * @tc.name      testExpressionsContestInference0061
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      foo_16([["a", 1, true, 2n]]);
      expect([["a", 1, true, 2n]][0][0]).assertEqual("a");
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6200
     * @tc.name      testExpressionsContestInference0062
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new A_18();
      const result = instance.foo([new A_18(), new A_18()]);
      expect(result).assertEqual(4); // 2 (array length) + 2 (instances of A_18)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6300
     * @tc.name      testExpressionsContestInference0063
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [Color_18.Red, Color_18.Blue];
      foo_19(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6400
     * @tc.name      testExpressionsContestInference0064
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[Color_18.Red, Color_18.Blue]];
      foo_20(a);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6500
     * @tc.name      testExpressionsContestInference0065
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [null, o_23, o_23, u_23];
      foo_23(a);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6600
     * @tc.name      testExpressionsContestInference0066
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [false, true, false];
      foo_28(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6700
     * @tc.name      testExpressionsContestInference0067
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      foo_30(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6800
     * @tc.name      testExpressionsContestInference0068
     * @tc.desc      arr3_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [Color_31.Red, Color_31.Green, Size_31.XL];
      foo_31(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_6900
     * @tc.name      testExpressionsContestInference0069
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [['1', '11'], ['', '-9223372036854775808']];
      arr4_foo_8(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7000
     * @tc.name      testExpressionsContestInference0070
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [['1', '11'], ['', '-9223372036854775808']];
      arr4_foo_9(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7100
     * @tc.name      testExpressionsContestInference0071
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [['1', '11'], ['', '-9223372036854775808']];
      arr4_foo_10(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7200
     * @tc.name      testExpressionsContestInference0072
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [['1', '11'], ['', '-9223372036854775808']];
      arr4_foo_11(a);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7300
     * @tc.name      testExpressionsContestInference0073
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      arr4_foo_12(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7400
     * @tc.name      testExpressionsContestInference0074
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      arr4_foo_13(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7500
     * @tc.name      testExpressionsContestInference0075
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      arr4_foo_14(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7600
     * @tc.name      testExpressionsContestInference0076
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [11111111111111111111111111111111111111111111111n],
        [22222222222222222222222222222222222222222222222n],
        [33333333333333333333333333333333333333333333333333n]
      ];
      arr4_foo_15(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7700
     * @tc.name      testExpressionsContestInference0077
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_16([["a", 1, true, 2n, null, undefined]]);
      expect([["a", 1, true, 2n, null, undefined]].length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7800
     * @tc.name      testExpressionsContestInference0078
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [["a", 1, true, 2n, null, undefined]];
      arr4_foo_17([["a", 1, true, 2n, null, undefined]]);
      expect([["a", 1, true, 2n, null, undefined]].length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_7900
     * @tc.name      testExpressionsContestInference0079
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [["a", 1, true, 2n, null, undefined]];
      arr4_foo_18([["a", 1, true, 2n, null, undefined]]);
      expect([["a", 1, true, 2n, null, undefined]].length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8000
     * @tc.name      testExpressionsContestInference0080
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [["a", 1, true, 2n, null, undefined]];
      arr4_foo_19([["a", 1, true, 2n, null, undefined]]);
      expect([["a", 1, true, 2n, null, undefined]].length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8100
     * @tc.name      testExpressionsContestInference0081
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[arr4_foo_Color_23.Red, arr4_foo_Color_23.Blue]];
      arr4_foo_23([[arr4_foo_Color_23.Red, arr4_foo_Color_23.Blue]]);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8200
     * @tc.name      testExpressionsContestInference0082
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [
        [(p: arr4_foo_Color_27) => 0],
        [(p: arr4_foo_Color_27) => 1],
        [(p: arr4_foo_Color_27) => p === arr4_foo_Color_27.Blue ? 4 : 0],
      ];
      arr4_foo_27([
        [(p: arr4_foo_Color_27) => 0],
        [(p: arr4_foo_Color_27) => 1],
        [(p: arr4_foo_Color_27) => p === arr4_foo_Color_27.Blue ? 4 : 0],
      ]);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8300
     * @tc.name      testExpressionsContestInference0083
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[true, 1, 'a', null]];
      arr4_foo_31([[true, 1, 'a', null]]);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8400
     * @tc.name      testExpressionsContestInference0084
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [[arr4_foo_e_35], [false], [(s: string) => s + s], [42]];
      arr4_foo_35([[arr4_foo_e_35], [false], [(s: string) => s + s], [42]]);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8500
     * @tc.name      testExpressionsContestInference0085
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [false, true, false];
      arr4_foo_36(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8600
     * @tc.name      testExpressionsContestInference0086
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = [false, true, false];
      arr4_foo_37(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8700
     * @tc.name      testExpressionsContestInference0087
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      arr4_foo_42(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8800
     * @tc.name      testExpressionsContestInference0088
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      arr4_foo_43(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_8900
     * @tc.name      testExpressionsContestInference0089
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      arr4_foo_44(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9000
     * @tc.name      testExpressionsContestInference0090
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '43'];
      arr4_foo_45(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9100
     * @tc.name      testExpressionsContestInference0091
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_46([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9200
     * @tc.name      testExpressionsContestInference0092
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_47([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9300
     * @tc.name      testExpressionsContestInference0093
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_48([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9400
     * @tc.name      testExpressionsContestInference0094
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_49([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9500
     * @tc.name      testExpressionsContestInference0095
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_50([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9600
     * @tc.name      testExpressionsContestInference0096
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_51([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9700
     * @tc.name      testExpressionsContestInference0097
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_52([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9800
     * @tc.name      testExpressionsContestInference0098
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_foo_53([1, 2, 3]);
      expect([1, 2, 3].length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_9900
     * @tc.name      testExpressionsContestInference0099
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_54(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10000
     * @tc.name      testExpressionsContestInference0100
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_55(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10100
     * @tc.name      testExpressionsContestInference0101
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_56(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10200
     * @tc.name      testExpressionsContestInference0102
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_57(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10300
     * @tc.name      testExpressionsContestInference0103
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_58(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10400
     * @tc.name      testExpressionsContestInference0104
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_59(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10500
     * @tc.name      testExpressionsContestInference0105
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_60(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10600
     * @tc.name      testExpressionsContestInference0106
     * @tc.desc      arr4_inf_call test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = ['1', '2', '3'];
      arr4_foo_61(a);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10700
     * @tc.name      testExpressionsContestInference0107
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_0();
      expect(arr4_decl_a0.length).assertEqual(4);
      expect(arr4_decl_a0[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10800
     * @tc.name      testExpressionsContestInference0108
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_1();
      expect(arr4_decl_a1.length).assertEqual(4);
      expect(arr4_decl_a1[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_10900
     * @tc.name      testExpressionsContestInference0109
     * @tc.desc      arr4_inf_decl test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      test_arr4_inf_decl_2();
      expect(arr4_decl_a2.length).assertEqual(4);
      expect(arr4_decl_a2[0][0]).assertEqual(-2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11000
     * @tc.name      testExpressionsContestInference0110
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [!true, true, true] as boolean[];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11100
     * @tc.name      testExpressionsContestInference0111
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[-2147483647, 2], [3], [2 + 2, 5, 2147483646 + 1], []] as number[][];
      expect(a.length).assertEqual(4);
      expect(a[0][0]).assertEqual(-2147483647);
      expect(a[2][2]).assertEqual(2147483647);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11200
     * @tc.name      testExpressionsContestInference0112
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [false, true, true] as boolean[];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertTrue();
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11300
     * @tc.name      testExpressionsContestInference0113
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [Number.NaN, 0, 3.14, 1.7976931348623157e+308] as number[];
      expect(Number.isNaN(a[0])).assertTrue();
      expect(a[3]).assertEqual(1.7976931348623157e+308);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11400
     * @tc.name      testExpressionsContestInference0114
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[1.7976931348623157e+308, 2], [3], [4, 5, 6], []] as number[][];
      expect(a.length).assertEqual(4);
      expect(a[0][0]).assertEqual(1.7976931348623157e+308);
      expect(a[2][2]).assertEqual(6.0);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11500
     * @tc.name      testExpressionsContestInference0115
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ['1', '2', '', '-9223372036854775808'] as string[];
      expect(a[3]).assertEqual('-9223372036854775808');
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11600
     * @tc.name      testExpressionsContestInference0116
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ['x', 'x' + '1', 'x' + '2', 'x' + '3'] as string[];
      expect(a[0]).assertEqual('x');
      expect(a[1]).assertEqual('x1');
      expect(a[2]).assertEqual('x2');
      expect(a[3]).assertEqual('x3');
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11700
     * @tc.name      testExpressionsContestInference0117
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = '1';
      let a = [[s, s + s], ['', '-9223372036854775808']] as string[][];
      expect(a[0][0]).assertEqual('1');
      expect(a[0][1]).assertEqual('11');
      expect(a[1][0]).assertEqual('');
      expect(a[1][1]).assertEqual('-9223372036854775808');
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11800
     * @tc.name      testExpressionsContestInference0118
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1n, 2n, 33333333333333333333333333333333333333333333333333n] as bigint[];
      expect(a[1]).assertEqual(2n);
      expect(a[2]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_11900
     * @tc.name      testExpressionsContestInference0119
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[11111111111111111111111111111111111111111111111n], [2n], [33333333333333333333333333333333333333333333333333n]] as bigint[][];
      expect(a[0][0]).assertEqual(11111111111111111111111111111111111111111111111n);
      expect(a[2][0]).assertEqual(33333333333333333333333333333333333333333333333333n);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12000
     * @tc.name      testExpressionsContestInference0120
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [v_15, q_15] as A_15<number>[];
      expect(a[0]).assertEqual(v_15);
      expect(a[1]).assertEqual(q_15);
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12100
     * @tc.name      testExpressionsContestInference0121
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<Array<string | number | boolean | bigint>> = [["a", 1, true, 2n]];
      expect(a[0][0] as string).assertEqual("a");
      expect(a[0][1] as number).assertEqual(1);
      expect(a[0][2] as boolean).assertTrue();
      expect(a[0][3] as bigint).assertEqual(2n);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12200
     * @tc.name      testExpressionsContestInference0122
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [Color_18.Red, Color_18.Blue] as Color_18[];
      expect(a[0]).assertEqual(Color_18.Red);
      expect(a[1]).assertEqual(Color_18.Blue);
      expect(a.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12300
     * @tc.name      testExpressionsContestInference0123
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[Color_18.Red, Color_18.Blue]] as Color_18[][];
      expect(a[0][0]).assertEqual(Color_18.Red);
      expect(a[0][1]).assertEqual(Color_18.Blue);
      expect(a.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12400
     * @tc.name      testExpressionsContestInference0124
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [(p: Color_18): number => p.valueOf(), (p: Color_18): number => p.valueOf() + 1, (p: Color_18): number => p.valueOf() + 2] as F_19[];
      expect(a[0](Color_18.Red)).assertEqual(0);
      expect(a[1](Color_18.Red)).assertEqual(1);
      expect(a[2](Color_18.Blue)).assertEqual(4);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12500
     * @tc.name      testExpressionsContestInference0125
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[(p: Color_18): number => p.valueOf()], [(p: Color_18): number => p.valueOf() + 1], [(p: Color_18): number => p.valueOf() + 2]] as F_20[][];
      expect(a[0][0](Color_18.Red)).assertEqual(0);
      expect(a[1][0](Color_18.Red)).assertEqual(1);
      expect(a[2][0](Color_18.Blue)).assertEqual(4);
      expect(a.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12600
     * @tc.name      testExpressionsContestInference0126
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [n_21, o_21, o_21, u_21] as (null|undefined|Object)[];
      expect(a[0]).assertEqual(null);
      expect(a[1] as Object).assertEqual(o_21);
      expect(a[2] as Object).assertEqual(o_21);
      expect(a[3]).assertEqual(undefined);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12700
     * @tc.name      testExpressionsContestInference0127
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [true, 1, 'a', null] as (boolean|number|string|null)[];
      expect(a[0] as boolean).assertTrue();
      expect(a[1] as number).assertEqual(1);
      expect(a[2] as string).assertEqual('a');
      expect(a[3]).assertEqual(null);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12800
     * @tc.name      testExpressionsContestInference0128
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[true, 1, 'a', null]] as (boolean|number|string|null)[][];
      expect(a[0][0] as boolean).assertTrue();
      expect(a[0][1] as number).assertEqual(1);
      expect(a[0][2] as string).assertEqual('a');
      expect(a[0][3]).assertEqual(null);
      expect(a.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_12900
     * @tc.name      testExpressionsContestInference0129
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [[e_25], [false], [(p: string): string => p + p], [42]] as (number|Error|((p: string)=>string)|boolean)[][];
      expect(a[0][0] as Error).assertEqual(e_25);
      expect(a[1][0] as boolean).assertFalse();
      expect((a[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(a[3][0] as number).assertEqual(42);
      expect(a.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13000
     * @tc.name      testExpressionsContestInference0130
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<boolean> = [false, true, false];
      expect(a[0]).assertFalse();
      expect(a[1]).assertTrue();
      expect(a[2]).assertFalse();
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13100
     * @tc.name      testExpressionsContestInference0131
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<number> = [1, 2, 43];
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(43);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13200
     * @tc.name      testExpressionsContestInference0132
     * @tc.desc      The type of an array literal can be inferred from the casting context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Array<string> = ['1', '2', '43'];
      expect(a[0]).assertEqual('1');
      expect(a[1]).assertEqual('2');
      expect(a[2]).assertEqual('43');
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13300
     * @tc.name      testExpressionsContestInference0133
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13400
     * @tc.name      testExpressionsContestInference0134
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13500
     * @tc.name      testExpressionsContestInference0135
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13600
     * @tc.name      testExpressionsContestInference0136
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13700
     * @tc.name      testExpressionsContestInference0137
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13800
     * @tc.name      testExpressionsContestInference0138
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_13900
     * @tc.name      testExpressionsContestInference0139
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14000
     * @tc.name      testExpressionsContestInference0140
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14100
     * @tc.name      testExpressionsContestInference0141
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14200
     * @tc.name      testExpressionsContestInference0142
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14300
     * @tc.name      testExpressionsContestInference0143
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14400
     * @tc.name      testExpressionsContestInference0144
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14500
     * @tc.name      testExpressionsContestInference0145
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14600
     * @tc.name      testExpressionsContestInference0146
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14700
     * @tc.name      testExpressionsContestInference0147
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14800
     * @tc.name      testExpressionsContestInference0148
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_14900
     * @tc.name      testExpressionsContestInference0149
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15000
     * @tc.name      testExpressionsContestInference0150
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15100
     * @tc.name      testExpressionsContestInference0151
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15200
     * @tc.name      testExpressionsContestInference0152
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15300
     * @tc.name      testExpressionsContestInference0153
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_20: Array<Array<arr4_Color_18>> = [[arr4_Color_18.Red, arr4_Color_18.Blue]];
      expect(arr4_a_20[0][0]).assertEqual(arr4_Color_18.Red);
      expect(arr4_a_20[0][1]).assertEqual(arr4_Color_18.Blue);
      expect(arr4_a_20.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15400
     * @tc.name      testExpressionsContestInference0154
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_21: Array<Array<arr4_Color_21>> = [[arr4_Color_21.Red, arr4_Color_21.Blue]];
      expect(arr4_a_21[0][0]).assertEqual(arr4_Color_21.Red);
      expect(arr4_a_21[0][1]).assertEqual(arr4_Color_21.Blue);
      expect(arr4_a_21.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15500
     * @tc.name      testExpressionsContestInference0155
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_22: Array<Array<arr4_Color_22>> = [[arr4_Color_22.Red, arr4_Color_22.Blue]];
      expect(arr4_a_22[0][0]).assertEqual(arr4_Color_22.Red);
      expect(arr4_a_22[0][1]).assertEqual(arr4_Color_22.Blue);
      expect(arr4_a_22.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15600
     * @tc.name      testExpressionsContestInference0156
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr4_a_23: Array<Array<arr4_Color_23>> = [[arr4_Color_23.Red, arr4_Color_23.Blue]];
      expect(arr4_a_23[0][0]).assertEqual(arr4_Color_23.Red);
      expect(arr4_a_23[0][1]).assertEqual(arr4_Color_23.Blue);
      expect(arr4_a_23.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15700
     * @tc.name      testExpressionsContestInference0157
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15800
     * @tc.name      testExpressionsContestInference0158
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_15900
     * @tc.name      testExpressionsContestInference0159
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16000
     * @tc.name      testExpressionsContestInference0160
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16100
     * @tc.name      testExpressionsContestInference0161
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_28 = [[true, 1, 'a', null]];
      expect(arr4_a_28[0][0] as boolean).assertTrue();
      expect(arr4_a_28[0][1] as number).assertEqual(1);
      expect(arr4_a_28[0][2] as string).assertEqual('a');
      expect(arr4_a_28[0][3]).assertEqual(null);
      expect(arr4_a_28.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16200
     * @tc.name      testExpressionsContestInference0162
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_29 = [[true, 1, 'a', null]];
      expect(arr4_a_29[0][0] as boolean).assertTrue();
      expect(arr4_a_29[0][1] as number).assertEqual(1);
      expect(arr4_a_29[0][2] as string).assertEqual('a');
      expect(arr4_a_29[0][3]).assertEqual(null);
      expect(arr4_a_29.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16300
     * @tc.name      testExpressionsContestInference0163
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_30 = [[true, 1, 'a', null]];
      expect(arr4_a_30[0][0] as boolean).assertTrue();
      expect(arr4_a_30[0][1] as number).assertEqual(1);
      expect(arr4_a_30[0][2] as string).assertEqual('a');
      expect(arr4_a_30[0][3]).assertEqual(null);
      expect(arr4_a_30.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16400
     * @tc.name      testExpressionsContestInference0164
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_31 = [[true, 1, 'a', null]];
      expect(arr4_a_31[0][0] as boolean).assertTrue();
      expect(arr4_a_31[0][1] as number).assertEqual(1);
      expect(arr4_a_31[0][2] as string).assertEqual('a');
      expect(arr4_a_31[0][3]).assertEqual(null);
      expect(arr4_a_31.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16500
     * @tc.name      testExpressionsContestInference0165
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_32 = [[arr4_e_32], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_32[0][0] as Error).assertEqual(arr4_e_32);
      expect(arr4_a_32[1][0] as boolean).assertFalse();
      expect((arr4_a_32[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_32[3][0] as number).assertEqual(42);
      expect(arr4_a_32.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16600
     * @tc.name      testExpressionsContestInference0166
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_33 = [[arr4_e_33], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_33[0][0] as Error).assertEqual(arr4_e_33);
      expect(arr4_a_33[1][0] as boolean).assertFalse();
      expect((arr4_a_33[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_33[3][0] as number).assertEqual(42);
      expect(arr4_a_33.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16700
     * @tc.name      testExpressionsContestInference0167
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_34 = [[arr4_e_34], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_34[0][0] as Error).assertEqual(arr4_e_34);
      expect(arr4_a_34[1][0] as boolean).assertFalse();
      expect((arr4_a_34[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_34[3][0] as number).assertEqual(42);
      expect(arr4_a_34.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16800
     * @tc.name      testExpressionsContestInference0168
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_35 = [[arr4_e_35], [false], [(p: string) => p + p], [42]];
      expect(arr4_a_35[0][0] as Error).assertEqual(arr4_e_35);
      expect(arr4_a_35[1][0] as boolean).assertFalse();
      expect((arr4_a_35[2][0] as ((p: string) => string))('a')).assertEqual('aa');
      expect(arr4_a_35[3][0] as number).assertEqual(42);
      expect(arr4_a_35.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_16900
     * @tc.name      testExpressionsContestInference0169
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_36 = [false, true, false];
      expect((arr4_a_36 as boolean[])[0]).assertFalse();
      expect((arr4_a_36 as boolean[])[1]).assertTrue();
      expect((arr4_a_36 as boolean[])[2]).assertFalse();
      expect((arr4_a_36 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17000
     * @tc.name      testExpressionsContestInference0170
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_37 = [false, true, false];
      expect((arr4_a_37 as boolean[])[0]).assertFalse();
      expect((arr4_a_37 as boolean[])[1]).assertTrue();
      expect((arr4_a_37 as boolean[])[2]).assertFalse();
      expect((arr4_a_37 as boolean[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17100
     * @tc.name      testExpressionsContestInference0171
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_38 = [1, 2, 43];
      expect((arr4_a_38 as number[])[0]).assertEqual(1);
      expect((arr4_a_38 as number[])[1]).assertEqual(2);
      expect((arr4_a_38 as number[])[2]).assertEqual(43);
      expect((arr4_a_38 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17200
     * @tc.name      testExpressionsContestInference0172
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_39 = [1, 2, 43];
      expect((arr4_a_39 as number[])[0]).assertEqual(1);
      expect((arr4_a_39 as number[])[1]).assertEqual(2);
      expect((arr4_a_39 as number[])[2]).assertEqual(43);
      expect((arr4_a_39 as number[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17300
     * @tc.name      testExpressionsContestInference0173
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_40 = ['1', '2', arr4_s_40 + '3'];
      expect((arr4_a_40 as string[])[0]).assertEqual('1');
      expect((arr4_a_40 as string[])[1]).assertEqual('2');
      expect((arr4_a_40 as string[])[2]).assertEqual('43');
      expect((arr4_a_40 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17400
     * @tc.name      testExpressionsContestInference0174
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_41 = ['1', '2', arr4_s_41 + '3'];
      expect((arr4_a_41 as string[])[0]).assertEqual('1');
      expect((arr4_a_41 as string[])[1]).assertEqual('2');
      expect((arr4_a_41 as string[])[2]).assertEqual('43');
      expect((arr4_a_41 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17500
     * @tc.name      testExpressionsContestInference0175
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_42 = ['1', '2', arr4_s_42 + '3'];
      expect((arr4_a_42 as string[])[0]).assertEqual('1');
      expect((arr4_a_42 as string[])[1]).assertEqual('2');
      expect((arr4_a_42 as string[])[2]).assertEqual('43');
      expect((arr4_a_42 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17600
     * @tc.name      testExpressionsContestInference0176
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      arr4_a_43 = ['1', '2', '43'];
      expect((arr4_a_43 as string[])[0]).assertEqual('1');
      expect((arr4_a_43 as string[])[1]).assertEqual('2');
      expect((arr4_a_43 as string[])[2]).assertEqual('43');
      expect((arr4_a_43 as string[]).length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17700
     * @tc.name      testExpressionsContestInference0177
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_44: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_44) && typeof arr4_a_44[0] === 'number') {
        expect(arr4_a_44[0]).assertEqual(1);
        expect(arr4_a_44[1]).assertEqual(2);
        expect(arr4_a_44[2]).assertEqual(3);
        expect(arr4_a_44.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17800
     * @tc.name      testExpressionsContestInference0178
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_45: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_45) && typeof arr4_a_45[0] === 'number') {
        expect(arr4_a_45[0]).assertEqual(1);
        expect(arr4_a_45[1]).assertEqual(2);
        expect(arr4_a_45[2]).assertEqual(3);
        expect(arr4_a_45.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_17900
     * @tc.name      testExpressionsContestInference0179
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_46: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_46) && typeof arr4_a_46[0] === 'number') {
        expect(arr4_a_46[0]).assertEqual(1);
        expect(arr4_a_46[1]).assertEqual(2);
        expect(arr4_a_46[2]).assertEqual(3);
        expect(arr4_a_46.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18000
     * @tc.name      testExpressionsContestInference0180
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_47: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_47) && typeof arr4_a_47[0] === 'number') {
        expect(arr4_a_47[0]).assertEqual(1);
        expect(arr4_a_47[1]).assertEqual(2);
        expect(arr4_a_47[2]).assertEqual(3);
        expect(arr4_a_47.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18100
     * @tc.name      testExpressionsContestInference0181
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_48: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_48) && typeof arr4_a_48[0] === 'string') {
        expect(arr4_a_48[0]).assertEqual('1');
        expect(arr4_a_48[1]).assertEqual('2');
        expect(arr4_a_48[2]).assertEqual('3');
        expect(arr4_a_48.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18200
     * @tc.name      testExpressionsContestInference0182
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_49: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_49) && typeof arr4_a_49[0] === 'string') {
        expect(arr4_a_49[0]).assertEqual('1');
        expect(arr4_a_49[1]).assertEqual('2');
        expect(arr4_a_49[2]).assertEqual('3');
        expect(arr4_a_49.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18300
     * @tc.name      testExpressionsContestInference0183
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_50: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_50) && typeof arr4_a_50[0] === 'string') {
        expect(arr4_a_50[0]).assertEqual('1');
        expect(arr4_a_50[1]).assertEqual('2');
        expect(arr4_a_50[2]).assertEqual('3');
        expect(arr4_a_50.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18400
     * @tc.name      testExpressionsContestInference0184
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_51: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_51) && typeof arr4_a_51[0] === 'string') {
        expect(arr4_a_51[0]).assertEqual('1');
        expect(arr4_a_51[1]).assertEqual('2');
        expect(arr4_a_51[2]).assertEqual('3');
        expect(arr4_a_51.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18500
     * @tc.name      testExpressionsContestInference0185
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_52: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_52) && typeof arr4_a_52[0] === 'number') {
        expect(arr4_a_52[0]).assertEqual(1);
        expect(arr4_a_52[1]).assertEqual(2);
        expect(arr4_a_52[2]).assertEqual(3);
        expect(arr4_a_52.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18600
     * @tc.name      testExpressionsContestInference0186
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_53: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_53) && typeof arr4_a_53[0] === 'number') {
        expect(arr4_a_53[0]).assertEqual(1);
        expect(arr4_a_53[1]).assertEqual(2);
        expect(arr4_a_53[2]).assertEqual(3);
        expect(arr4_a_53.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18700
     * @tc.name      testExpressionsContestInference0187
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_54: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_54) && typeof arr4_a_54[0] === 'number') {
        expect(arr4_a_54[0]).assertEqual(1);
        expect(arr4_a_54[1]).assertEqual(2);
        expect(arr4_a_54[2]).assertEqual(3);
        expect(arr4_a_54.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18800
     * @tc.name      testExpressionsContestInference0188
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_55: Array<number> | Array<string> = [1, 2, 3];
      if (Array.isArray(arr4_a_55) && typeof arr4_a_55[0] === 'number') {
        expect(arr4_a_55[0]).assertEqual(1);
        expect(arr4_a_55[1]).assertEqual(2);
        expect(arr4_a_55[2]).assertEqual(3);
        expect(arr4_a_55.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_18900
     * @tc.name      testExpressionsContestInference0189
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_56: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_56) && typeof arr4_a_56[0] === 'string') {
        expect(arr4_a_56[0]).assertEqual('1');
        expect(arr4_a_56[1]).assertEqual('2');
        expect(arr4_a_56[2]).assertEqual('3');
        expect(arr4_a_56.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_19000
     * @tc.name      testExpressionsContestInference0190
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_57: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_57) && typeof arr4_a_57[0] === 'string') {
        expect(arr4_a_57[0]).assertEqual('1');
        expect(arr4_a_57[1]).assertEqual('2');
        expect(arr4_a_57[2]).assertEqual('3');
        expect(arr4_a_57.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_19100
     * @tc.name      testExpressionsContestInference0191
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr4_a_58: Array<number> | Array<string> = ['1', '2', '3'];
      if (Array.isArray(arr4_a_58) && typeof arr4_a_58[0] === 'string') {
        expect(arr4_a_58[0]).assertEqual('1');
        expect(arr4_a_58[1]).assertEqual('2');
        expect(arr4_a_58[2]).assertEqual('3');
        expect(arr4_a_58.length).assertEqual(3);
      }
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_CONTEST_INFERENCE_19200
     * @tc.name      testExpressionsContestInference0192
     * @tc.desc      The type of an array literal can be inferred from the assignment context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsContestInference0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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