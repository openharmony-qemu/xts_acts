/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// f_array_and_tuple_parameters: foo1-foo4
function foo1_arr(a: [int, int]): string {
  return 'foo1';
}

function foo2_arr(a: [number, number]): string {
  return 'foo2';
}

function foo3_arr(a: int[]): string {
  return 'foo3';
}

function foo4_arr(a: number[]): string {
  return 'foo4';
}

overload foo_arr0 { foo1_arr, foo2_arr, foo3_arr, foo4_arr };
overload foo_arr1 { foo2_arr, foo3_arr, foo4_arr, foo1_arr };
overload foo_arr2 { foo3_arr, foo4_arr, foo1_arr, foo2_arr };
overload foo_arr3 { foo4_arr, foo1_arr, foo2_arr, foo3_arr };

// f_enum_parameters: Color, SizeEnum, foo1-foo5
enum Color { Red, Green, Blue }
enum SizeEnum { S = 'S', M = 'M', L = 'L' }

function foo1_enum(a: int): string {
  return 'foo1';
}

function foo2_enum(a: string): string {
  return 'foo2';
}

function foo3_enum(a: Color): string {
  return 'foo3';
}

function foo4_enum(a: SizeEnum): string {
  return 'foo4';
}

function foo5_enum(a: Color|SizeEnum): string {
  return 'foo5';
}

overload foo_enum0 { foo1_enum, foo2_enum, foo3_enum, foo4_enum, foo5_enum };
overload foo_enum1 { foo2_enum, foo3_enum, foo4_enum, foo5_enum, foo1_enum };
overload foo_enum2 { foo3_enum, foo4_enum, foo5_enum, foo1_enum, foo2_enum };
overload foo_enum3 { foo4_enum, foo5_enum, foo1_enum, foo2_enum, foo3_enum };
overload foo_enum4 { foo5_enum, foo1_enum, foo2_enum, foo3_enum, foo4_enum };

// f_instance_function_overload: class A_inst, B_inst, foo1-foo2
class A_inst {}
class B_inst extends A_inst {}

function foo1_inst(x: A_inst): string {
  return 'foo1';
}

function foo2_inst(x: B_inst): string {
  return 'foo2';
}

overload foo_inst0 { foo1_inst, foo2_inst };
overload foo_inst1 { foo2_inst, foo1_inst };

// f_numeric_parameters: fB, fS, fI, fL, fF, fN
function fB(a: byte): string {
  return 'fB';
}

function fS(a: short): string {
  return 'fS';
}

function fI(a: int): string {
  return 'fI';
}

function fL(a: long): string {
  return 'fL';
}

function fF(a: float): string {
  return 'fF';
}

function fN(a: number): string {
  return 'fN';
}

overload foo_num0 { fB, fS, fI, fL, fF, fN };
overload foo_num1 { fS, fI, fL, fF, fN, fB };
overload foo_num2 { fI, fL, fF, fN, fB, fS };
overload foo_num3 { fL, fF, fN, fB, fS, fI };
overload foo_num4 { fF, fN, fB, fS, fI, fL };
overload foo_num5 { fN, fB, fS, fI, fL, fF };

// f_optional_and_rest_parameters: foo1-foo4
function foo1_opt(a: 'a'|'b'): string {
  return 'foo1';
}

function foo2_opt(a: string): string {
  return 'foo2';
}

function foo3_opt(a: string, b?: int): string {
  return 'foo3';
}

function foo4_opt(a: string, ...b: number[]): string {
  return 'foo4';
}

overload foo_opt0 { foo1_opt, foo2_opt, foo3_opt, foo4_opt };
overload foo_opt1 { foo2_opt, foo1_opt, foo3_opt, foo4_opt };
overload foo_opt2 { foo3_opt, foo1_opt, foo2_opt, foo4_opt };
overload foo_opt3 { foo4_opt, foo1_opt, foo2_opt, foo3_opt };

// f_subtyping_params: class A_sub, B_sub, foo1-foo2
class A_sub {}
class B_sub extends A_sub {}

function foo1_sub(a: A_sub): string {
  return 'foo1';
}

function foo2_sub(b: B_sub): string {
  return 'foo2';
}

overload foo_sub0 { foo1_sub, foo2_sub };
overload foo_sub1 { foo2_sub, foo1_sub };

// overload_function: max2i, max2d, maxN
function max2i(a: int, b: int): int {
  return 100 + (a > b ? a : b);
}

function max2d(a: double, b: double): double {
  return 200 + (a > b ? a : b);
}

function maxN(...a: double[]): double {
  let max: double = a[0];
  for (let x: number of a) {
    if (x > max) {
      max = x;
    }
  }
  return 300 + max;
}

overload maxFn0 { max2i, max2d, maxN };
overload maxFn1 { max2d, maxN, max2i };
overload maxFn2 { maxN, max2i, max2d };

export default function OverloadSetForFunctionsTest02():void {
  describe('OverloadSetForFunctionsTest02', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    // f_numeric_parameters_12-35
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5300
     * @tc.name      testOverloadSetForFunctions0053
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fI').assertEqual(foo_num2(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5400
     * @tc.name      testOverloadSetForFunctions0054
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fI').assertEqual(foo_num2(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5500
     * @tc.name      testOverloadSetForFunctions0055
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fI').assertEqual(foo_num2(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5600
     * @tc.name      testOverloadSetForFunctions0056
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num2(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5700
     * @tc.name      testOverloadSetForFunctions0057
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num2(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5800
     * @tc.name      testOverloadSetForFunctions0058
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num2(n));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5900
     * @tc.name      testOverloadSetForFunctions0059
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num3(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6000
     * @tc.name      testOverloadSetForFunctions0060
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num3(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6100
     * @tc.name      testOverloadSetForFunctions0061
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num3(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6200
     * @tc.name      testOverloadSetForFunctions0062
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num3(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6300
     * @tc.name      testOverloadSetForFunctions0063
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num3(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6400
     * @tc.name      testOverloadSetForFunctions0064
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num3(n));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6500
     * @tc.name      testOverloadSetForFunctions0065
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num4(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6600
     * @tc.name      testOverloadSetForFunctions0066
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num4(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6700
     * @tc.name      testOverloadSetForFunctions0067
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num4(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6800
     * @tc.name      testOverloadSetForFunctions0068
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num4(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_6900
     * @tc.name      testOverloadSetForFunctions0069
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num4(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7000
     * @tc.name      testOverloadSetForFunctions0070
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num4(n));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7100
     * @tc.name      testOverloadSetForFunctions0071
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num5(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7200
     * @tc.name      testOverloadSetForFunctions0072
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num5(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7300
     * @tc.name      testOverloadSetForFunctions0073
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num5(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7400
     * @tc.name      testOverloadSetForFunctions0074
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num5(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7500
     * @tc.name      testOverloadSetForFunctions0075
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num5(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7600
     * @tc.name      testOverloadSetForFunctions0076
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num5(n));
    });

    // f_optional_and_rest_parameters_0-28
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7700
     * @tc.name      testOverloadSetForFunctions0077
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_opt0("a"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7800
     * @tc.name      testOverloadSetForFunctions0078
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_opt0("b"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_7900
     * @tc.name      testOverloadSetForFunctions0079
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_opt0("c"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8000
     * @tc.name      testOverloadSetForFunctions0080
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt0("a", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8100
     * @tc.name      testOverloadSetForFunctions0081
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt0("b", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8200
     * @tc.name      testOverloadSetForFunctions0082
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt0("c", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8300
     * @tc.name      testOverloadSetForFunctions0083
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt0("a", 1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8400
     * @tc.name      testOverloadSetForFunctions0084
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt0("b", 2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8500
     * @tc.name      testOverloadSetForFunctions0085
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt0("c", 3));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8600
     * @tc.name      testOverloadSetForFunctions0086
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt0("a", 1.4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8700
     * @tc.name      testOverloadSetForFunctions0087
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt0("b", 2.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8800
     * @tc.name      testOverloadSetForFunctions0088
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt0("c", 3.6));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_8900
     * @tc.name      testOverloadSetForFunctions0089
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       expect('foo4').assertEqual(foo_opt0("a", 1, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9000
     * @tc.name      testOverloadSetForFunctions0090
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt0("b", 2, 5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9100
     * @tc.name      testOverloadSetForFunctions0091
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt0("c", 3, 6));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9200
     * @tc.name      testOverloadSetForFunctions0092
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_opt1("a"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9300
     * @tc.name      testOverloadSetForFunctions0093
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_opt1("c"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9400
     * @tc.name      testOverloadSetForFunctions0094
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt1("b", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9500
     * @tc.name      testOverloadSetForFunctions0095
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt1("c", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9600
     * @tc.name      testOverloadSetForFunctions0096
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt2("a"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9700
     * @tc.name      testOverloadSetForFunctions0097
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt2("b", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9800
     * @tc.name      testOverloadSetForFunctions0098
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt2("a", 1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_9900
     * @tc.name      testOverloadSetForFunctions0099
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt2("b", 3.6));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10000
     * @tc.name      testOverloadSetForFunctions0100
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt2("c", 1, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10100
     * @tc.name      testOverloadSetForFunctions0101
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt3("a"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10200
     * @tc.name      testOverloadSetForFunctions0102
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_opt3("b", undefined));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10300
     * @tc.name      testOverloadSetForFunctions0103
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt3("a", 1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10400
     * @tc.name      testOverloadSetForFunctions0104
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt3("b", 1.4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10500
     * @tc.name      testOverloadSetForFunctions0105
     * @tc.desc      Overload Declarations - optional and rest parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_opt3("c", 1, 4));
    });

    // f_subtyping_params_0-7
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10600
     * @tc.name      testOverloadSetForFunctions0106
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo1').assertEqual(foo_sub0(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10700
     * @tc.name      testOverloadSetForFunctions0107
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo1').assertEqual(foo_sub0(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10800
     * @tc.name      testOverloadSetForFunctions0108
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo1').assertEqual(foo_sub0(new A_sub()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_10900
     * @tc.name      testOverloadSetForFunctions0109
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo1').assertEqual(foo_sub0(new B_sub()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11000
     * @tc.name      testOverloadSetForFunctions0110
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo1').assertEqual(foo_sub1(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11100
     * @tc.name      testOverloadSetForFunctions0111
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo2').assertEqual(foo_sub1(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11200
     * @tc.name      testOverloadSetForFunctions0112
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo1').assertEqual(foo_sub1(new A_sub()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11300
     * @tc.name      testOverloadSetForFunctions0113
     * @tc.desc      Overload Declarations - subtyping parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let b: B_sub = new B_sub();
      expect('foo2').assertEqual(foo_sub1(new B_sub()));
    });

    // overload_function_0-32
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11400
     * @tc.name      testOverloadSetForFunctions0114
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(102).assertEqual(maxFn0(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11500
     * @tc.name      testOverloadSetForFunctions0115
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(203.14).assertEqual(maxFn0(i, pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11600
     * @tc.name      testOverloadSetForFunctions0116
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(203.14).assertEqual(maxFn0(pi, i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11700
     * @tc.name      testOverloadSetForFunctions0117
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(205.5).assertEqual(maxFn0(pi, 5.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11800
     * @tc.name      testOverloadSetForFunctions0118
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(304).assertEqual(maxFn0(i, pi, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_11900
     * @tc.name      testOverloadSetForFunctions0119
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(310).assertEqual(maxFn0(i, j, 10, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12000
     * @tc.name      testOverloadSetForFunctions0120
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(301).assertEqual(maxFn0(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12100
     * @tc.name      testOverloadSetForFunctions0121
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(303.14).assertEqual(maxFn0(pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12200
     * @tc.name      testOverloadSetForFunctions0122
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(202).assertEqual(maxFn1(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12300
     * @tc.name      testOverloadSetForFunctions0123
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(203.14).assertEqual(maxFn1(i, pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12400
     * @tc.name      testOverloadSetForFunctions0124
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(203.14).assertEqual(maxFn1(pi, i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12500
     * @tc.name      testOverloadSetForFunctions0125
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(205.5).assertEqual(maxFn1(pi, 5.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12600
     * @tc.name      testOverloadSetForFunctions0126
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(304).assertEqual(maxFn1(i, pi, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12700
     * @tc.name      testOverloadSetForFunctions0127
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(310).assertEqual(maxFn1(i, j, 10, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12800
     * @tc.name      testOverloadSetForFunctions0128
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(301).assertEqual(maxFn1(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_12900
     * @tc.name      testOverloadSetForFunctions0129
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(303.14).assertEqual(maxFn1(pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13000
     * @tc.name      testOverloadSetForFunctions0130
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(302).assertEqual(maxFn2(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13100
     * @tc.name      testOverloadSetForFunctions0131
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(303.14).assertEqual(maxFn2(i, pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13200
     * @tc.name      testOverloadSetForFunctions0132
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(303.14).assertEqual(maxFn2(pi, i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13300
     * @tc.name      testOverloadSetForFunctions0133
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(305.5).assertEqual(maxFn2(pi, 5.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13400
     * @tc.name      testOverloadSetForFunctions0134
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(304).assertEqual(maxFn2(i, pi, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13500
     * @tc.name      testOverloadSetForFunctions0135
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(310).assertEqual(maxFn2(i, j, 10, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13600
     * @tc.name      testOverloadSetForFunctions0136
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(301).assertEqual(maxFn2(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13700
     * @tc.name      testOverloadSetForFunctions0137
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(303.14).assertEqual(maxFn2(pi));
    });

    // overload_function_24-32: direct calls
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13800
     * @tc.name      testOverloadSetForFunctions0138
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(102).assertEqual(max2i(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_13900
     * @tc.name      testOverloadSetForFunctions0139
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(202).assertEqual(max2d(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14000
     * @tc.name      testOverloadSetForFunctions0140
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(302).assertEqual(maxN(i, j));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14100
     * @tc.name      testOverloadSetForFunctions0141
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(203.14).assertEqual(max2d(i, pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14200
     * @tc.name      testOverloadSetForFunctions0142
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(303.14).assertEqual(maxN(i, pi));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14300
     * @tc.name      testOverloadSetForFunctions0143
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(205.5).assertEqual(max2d(pi, 5.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14400
     * @tc.name      testOverloadSetForFunctions0144
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(305.5).assertEqual(maxN(pi, 5.5));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14500
     * @tc.name      testOverloadSetForFunctions0145
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(310).assertEqual(maxN(i, j, 10, 4));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_14600
     * @tc.name      testOverloadSetForFunctions0146
     * @tc.desc      Overload Resolution for Overload Declarations - function overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 1;
      let j: int = 2;
      let pi: number = 3.14;
      expect(301).assertEqual(maxN(i));
    });
  })
}
