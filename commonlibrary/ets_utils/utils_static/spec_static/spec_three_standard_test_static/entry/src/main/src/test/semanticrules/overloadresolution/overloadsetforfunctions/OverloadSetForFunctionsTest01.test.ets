'use static'
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

import Utils from '../../../Util.test'

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

export default function OverloadSetForFunctionsTest01():void {
  describe('OverloadSetForFunctionsTest01', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    // f_array_and_tuple_parameters_0-11
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0100
     * @tc.name      testOverloadSetForFunctions0001
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_arr0([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0200
     * @tc.name      testOverloadSetForFunctions0002
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_arr0([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0300
     * @tc.name      testOverloadSetForFunctions0003
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_arr0([5.6, 7.8]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0400
     * @tc.name      testOverloadSetForFunctions0004
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_arr1([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0500
     * @tc.name      testOverloadSetForFunctions0005
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_arr1([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0600
     * @tc.name      testOverloadSetForFunctions0006
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_arr1([5.6, 7.8]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0700
     * @tc.name      testOverloadSetForFunctions0007
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_arr2([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0800
     * @tc.name      testOverloadSetForFunctions0008
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_arr2([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_0900
     * @tc.name      testOverloadSetForFunctions0009
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_arr2([5.6, 7.8]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1000
     * @tc.name      testOverloadSetForFunctions0010
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_arr3([1, 2]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1100
     * @tc.name      testOverloadSetForFunctions0011
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_arr3([2, 3.4]));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1200
     * @tc.name      testOverloadSetForFunctions0012
     * @tc.desc      Overload Declarations - array and tuple parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_arr3([5.6, 7.8]));
    });

    // f_enum_parameters_0-19
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1300
     * @tc.name      testOverloadSetForFunctions0013
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_enum0(1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1400
     * @tc.name      testOverloadSetForFunctions0014
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum0("S"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1500
     * @tc.name      testOverloadSetForFunctions0015
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_enum0(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1600
     * @tc.name      testOverloadSetForFunctions0016
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum0(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1700
     * @tc.name      testOverloadSetForFunctions0017
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_enum1(2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1800
     * @tc.name      testOverloadSetForFunctions0018
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum1("Red"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_1900
     * @tc.name      testOverloadSetForFunctions0019
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_enum1(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2000
     * @tc.name      testOverloadSetForFunctions0020
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum1(SizeEnum.M));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2100
     * @tc.name      testOverloadSetForFunctions0021
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_enum2(1));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2200
     * @tc.name      testOverloadSetForFunctions0022
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum2("S"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2300
     * @tc.name      testOverloadSetForFunctions0023
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo3').assertEqual(foo_enum2(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2400
     * @tc.name      testOverloadSetForFunctions0024
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_enum2(SizeEnum.S));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2500
     * @tc.name      testOverloadSetForFunctions0025
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_enum3(2));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2600
     * @tc.name      testOverloadSetForFunctions0026
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum3("Red"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2700
     * @tc.name      testOverloadSetForFunctions0027
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo5').assertEqual(foo_enum3(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2800
     * @tc.name      testOverloadSetForFunctions0028
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo4').assertEqual(foo_enum3(SizeEnum.M));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_2900
     * @tc.name      testOverloadSetForFunctions0029
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo1').assertEqual(foo_enum4(3));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3000
     * @tc.name      testOverloadSetForFunctions0030
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo2').assertEqual(foo_enum4("L"));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3100
     * @tc.name      testOverloadSetForFunctions0031
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo5').assertEqual(foo_enum4(Color.Red));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3200
     * @tc.name      testOverloadSetForFunctions0032
     * @tc.desc      Overload Declarations - enum parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('foo5').assertEqual(foo_enum4(SizeEnum.L));
    });

    // f_instance_function_overload_0-7
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3300
     * @tc.name      testOverloadSetForFunctions0033
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(foo_inst0(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3400
     * @tc.name      testOverloadSetForFunctions0034
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
       let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(foo_inst0(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3500
     * @tc.name      testOverloadSetForFunctions0035
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(foo_inst0(new A_inst()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3600
     * @tc.name      testOverloadSetForFunctions0036
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(foo_inst0(new B_inst()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3700
     * @tc.name      testOverloadSetForFunctions0037
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(foo_inst1(a));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3800
     * @tc.name      testOverloadSetForFunctions0038
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo2').assertEqual(foo_inst1(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_3900
     * @tc.name      testOverloadSetForFunctions0039
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo1').assertEqual(foo_inst1(new A_inst()));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4000
     * @tc.name      testOverloadSetForFunctions0040
     * @tc.desc      Overload resolution for an instance method overload always uses the type of the object reference known at compile time.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_inst = new A_inst();
      let b: B_inst = new B_inst();
      expect('foo2').assertEqual(foo_inst1(new B_inst()));
    });

    // f_numeric_parameters_0-11
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4100
     * @tc.name      testOverloadSetForFunctions0041
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fB').assertEqual(foo_num0(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4200
     * @tc.name      testOverloadSetForFunctions0042
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fS').assertEqual(foo_num0(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4300
     * @tc.name      testOverloadSetForFunctions0043
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fI').assertEqual(foo_num0(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4400
     * @tc.name      testOverloadSetForFunctions0044
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num0(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4500
     * @tc.name      testOverloadSetForFunctions0045
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num0(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4600
     * @tc.name      testOverloadSetForFunctions0046
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num0(n));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4700
     * @tc.name      testOverloadSetForFunctions0047
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fS').assertEqual(foo_num1(b));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4800
     * @tc.name      testOverloadSetForFunctions0048
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fS').assertEqual(foo_num1(s));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_4900
     * @tc.name      testOverloadSetForFunctions0049
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fI').assertEqual(foo_num1(i));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5000
     * @tc.name      testOverloadSetForFunctions0050
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fL').assertEqual(foo_num1(l));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5100
     * @tc.name      testOverloadSetForFunctions0051
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fF').assertEqual(foo_num1(f));
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_FUNCTIONS_TEST_5200
     * @tc.name      testOverloadSetForFunctions0052
     * @tc.desc      Overload Declarations - numeric parameters functions overload.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForFunctions0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 1;
      let s: short = 1;
      let i: int = 1;
      let l: long = 1;
      let f: float = 1.0f;
      let n: number = 1.0;
      expect('fN').assertEqual(foo_num1(n));
    });
  })
}
