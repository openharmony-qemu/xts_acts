/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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

// c_array_and_tuple_parameters_0: overload constructor { foo1, foo2, foo3, foo4 }
class A_arr1 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo1, foo2, foo3, foo4 };
}

// c_array_and_tuple_parameters_2: overload constructor { foo1, foo2, foo3, foo4 }
class A_arr2 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo1, foo2, foo3, foo4 };
}

// c_array_and_tuple_parameters_3: overload constructor { foo2, foo3, foo4, foo1 }
class A_arr3 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo3, foo4, foo1 };
}

// c_array_and_tuple_parameters_4: overload constructor { foo2, foo3, foo4, foo1 }
class A_arr4 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo3, foo4, foo1 };
}

// c_array_and_tuple_parameters_5: overload constructor { foo2, foo3, foo4, foo1 }
class A_arr5 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo3, foo4, foo1 };
}

// c_array_and_tuple_parameters_6: overload constructor { foo3, foo4, foo1, foo2 }
class A_arr6 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo4, foo1, foo2 };
}

// c_array_and_tuple_parameters_7: overload constructor { foo3, foo4, foo1, foo2 }
class A_arr7 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo4, foo1, foo2 };
}

// c_array_and_tuple_parameters_8: overload constructor { foo3, foo4, foo1, foo2 }
class A_arr8 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo4, foo1, foo2 };
}

// c_array_and_tuple_parameters_9: overload constructor { foo4, foo1, foo2, foo3 }
class A_arr9 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo4, foo1, foo2, foo3 };
}

// c_array_and_tuple_parameters_10: overload constructor { foo4, foo1, foo2, foo3 }
class A_arr10 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo4, foo1, foo2, foo3 };
}

// c_array_and_tuple_parameters_11: overload constructor { foo4, foo1, foo2, foo3 }
class A_arr11 {
  foo: string = '';
  constructor foo1(a: [number, number]) { this.foo = 'foo1'; }
  constructor foo2(a: [number, number]) { this.foo = 'foo2'; }
  constructor foo3(a: number[]) { this.foo = 'foo3'; }
  constructor foo4(a: number[]) { this.foo = 'foo4'; }
  overload constructor { foo4, foo1, foo2, foo3 };
}

// ============================================================
// OverloadSetForConstructorsNumericTest - Numeric Classes
// ============================================================

// c_numeric_parameters_0: overload constructor { fB, fS, fI, fL, fF, fN }
class A_num1 {
  foo: string = '';
  constructor fB(a: number) { this.foo = 'fB'; }
  constructor fS(a: number) { this.foo = 'fS'; }
  constructor fI(a: number) { this.foo = 'fI'; }
  constructor fL(a: number) { this.foo = 'fL'; }
  constructor fF(a: number) { this.foo = 'fF'; }
  constructor fN(a: number) { this.foo = 'fN'; }
  overload constructor { fB, fS, fI, fL, fF, fN };
}

// c_numeric_parameters_6: overload constructor { fS, fI, fL, fF, fN, fB }
class A_num2 {
  foo: string = '';
  constructor fB(a: number) { this.foo = 'fB'; }
  constructor fS(a: number) { this.foo = 'fS'; }
  constructor fI(a: number) { this.foo = 'fI'; }
  constructor fL(a: number) { this.foo = 'fL'; }
  constructor fF(a: number) { this.foo = 'fF'; }
  constructor fN(a: number) { this.foo = 'fN'; }
  overload constructor { fS, fI, fL, fF, fN, fB };
}

// c_numeric_parameters_12: overload constructor { fI, fL, fF, fN, fB, fS }
class A_num3 {
  foo: string = '';
  constructor fB(a: number) { this.foo = 'fB'; }
  constructor fS(a: number) { this.foo = 'fS'; }
  constructor fI(a: number) { this.foo = 'fI'; }
  constructor fL(a: number) { this.foo = 'fL'; }
  constructor fF(a: number) { this.foo = 'fF'; }
  constructor fN(a: number) { this.foo = 'fN'; }
  overload constructor { fI, fL, fF, fN, fB, fS };
}

// c_numeric_parameters_18: overload constructor { fL, fF, fN, fB, fS, fI }
class A_num4 {
  foo: string = '';
  constructor fB(a: number) { this.foo = 'fB'; }
  constructor fS(a: number) { this.foo = 'fS'; }
  constructor fI(a: number) { this.foo = 'fI'; }
  constructor fL(a: number) { this.foo = 'fL'; }
  constructor fF(a: number) { this.foo = 'fF'; }
  constructor fN(a: number) { this.foo = 'fN'; }
  overload constructor { fL, fF, fN, fB, fS, fI };
}

// c_numeric_parameters_24: overload constructor { fF, fN, fB, fS, fI, fL }
class A_num5 {
  foo: string = '';
  constructor fB(a: number) { this.foo = 'fB'; }
  constructor fS(a: number) { this.foo = 'fS'; }
  constructor fI(a: number) { this.foo = 'fI'; }
  constructor fL(a: number) { this.foo = 'fL'; }
  constructor fF(a: number) { this.foo = 'fF'; }
  constructor fN(a: number) { this.foo = 'fN'; }
  overload constructor { fF, fN, fB, fS, fI, fL };
}

// c_numeric_parameters_30: overload constructor { fN, fB, fS, fI, fL, fF }
class A_num6 {
  foo: string = '';
  constructor fB(a: number) { this.foo = 'fB'; }
  constructor fS(a: number) { this.foo = 'fS'; }
  constructor fI(a: number) { this.foo = 'fI'; }
  constructor fL(a: number) { this.foo = 'fL'; }
  constructor fF(a: number) { this.foo = 'fF'; }
  constructor fN(a: number) { this.foo = 'fN'; }
  overload constructor { fN, fB, fS, fI, fL, fF };
}

// ============================================================
// OverloadSetForConstructorsEnumTest - Enums and Classes
// ============================================================

enum Color { Red, Green, Blue }
enum SizeEnum { S = 'S', M = 'M', L = 'L' }

// c_enum_parameters_0-4: overload constructor { foo1, foo2, foo3, foo4, foo5 }
class A_enum1 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo1, foo2, foo3, foo4, foo5 };
}

// c_enum_parameters_5: overload constructor { foo2, foo3, foo4, foo5, foo1 }
class A_enum2 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo2, foo3, foo4, foo5, foo1 };
}

// c_enum_parameters_6-7: overload constructor { foo2, foo3, foo4, foo5, foo1 }
class A_enum3 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo2, foo3, foo4, foo5, foo1 };
}

// c_enum_parameters_8-9: overload constructor { foo3, foo4, foo5, foo1, foo2 }
class A_enum4 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo3, foo4, foo5, foo1, foo2 };
}

// c_enum_parameters_10-11: overload constructor { foo3, foo4, foo5, foo1, foo2 }
class A_enum5 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo3, foo4, foo5, foo1, foo2 };
}

// c_enum_parameters_12-14: overload constructor { foo4, foo5, foo1, foo2, foo3 }
class A_enum6 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo4, foo5, foo1, foo2, foo3 };
}

// c_enum_parameters_15: overload constructor { foo4, foo5, foo1, foo2, foo3 }
class A_enum7 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo4, foo5, foo1, foo2, foo3 };
}

// c_enum_parameters_16-17: overload constructor { foo5, foo1, foo2, foo3, foo4 }
class A_enum8 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo5, foo1, foo2, foo3, foo4 };
}

// c_enum_parameters_18-19: overload constructor { foo5, foo1, foo2, foo3, foo4 }
class A_enum9 {
  foo: string = '';
  constructor foo1(a: number) { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: Color) { this.foo = 'foo3'; }
  constructor foo4(a: SizeEnum) { this.foo = 'foo4'; }
  constructor foo5(a: Color|SizeEnum) { this.foo = 'foo5'; }
  overload constructor { foo5, foo1, foo2, foo3, foo4 };
}

// ============================================================
// OverloadSetForConstructorsOptionalRestTest - Optional and Rest Classes
// ============================================================

// overload constructor { foo1, foo2, foo3, foo4 }
class A_opt1 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo1, foo2, foo3, foo4 };
}

// overload constructor { foo2, foo1, foo3, foo4 }
class A_opt2 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo1, foo3, foo4 };
}

// overload constructor { foo3, foo1, foo2, foo4 }
class A_opt3 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo1, foo2, foo4 };
}

// overload constructor { foo3, foo2, foo1, foo4 }
class A_opt4 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo2, foo1, foo4 };
}

// overload constructor { foo4, foo1, foo2, foo3 }
class A_opt5 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo4, foo1, foo2, foo3 };
}

// overload constructor { foo4, foo2, foo1, foo3 }
class A_opt6 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo4, foo2, foo1, foo3 };
}

// overload constructor { foo4, foo2, foo3, foo1 }
class A_opt7 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo4, foo2, foo3, foo1 };
}

// overload constructor { foo1, foo3, foo2, foo4 }
class A_opt8 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo1, foo3, foo2, foo4 };
}

// overload constructor { foo2, foo4, foo1, foo3 }
class A_opt9 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo4, foo1, foo3 };
}

// overload constructor { foo2, foo3, foo4, foo1 }
class A_opt10 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo3, foo4, foo1 };
}

// overload constructor { foo2, foo1, foo4, foo3 }
class A_opt11 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo2, foo1, foo4, foo3 };
}

// overload constructor { foo3, foo4, foo1, foo2 }
class A_opt12 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo4, foo1, foo2 };
}

// overload constructor { foo3, foo1, foo4, foo2 }
class A_opt13 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo3, foo1, foo4, foo2 };
}

// overload constructor { foo1, foo2, foo4, foo3 }
class A_opt14 {
  foo: string = '';
  constructor foo1(a: 'a'|'b') { this.foo = 'foo1'; }
  constructor foo2(a: string) { this.foo = 'foo2'; }
  constructor foo3(a: string, b?: number) { this.foo = 'foo3'; }
  constructor foo4(a: string, ...b: number[]) { this.foo = 'foo4'; }
  overload constructor { foo1, foo2, foo4, foo3 };
}

// ============================================================
// OverloadSetForConstructorsSubtypingTest - Subtyping Classes
// ============================================================

class A_sub {}
class B_sub extends A_sub {}

// c_subtyping_params_0-1: overload constructor { foo1, foo2 }
class C_sub1 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo1, foo2 };
}

// c_subtyping_params_2: overload constructor { foo2, foo1 }
class C_sub2 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo2, foo1 };
}

// c_subtyping_params_3: overload constructor { foo1, foo2 }
class C_sub3 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo1, foo2 };
}

// c_subtyping_params_4: overload constructor { foo2, foo1 }
class C_sub4 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo2, foo1 };
}

// c_subtyping_params_5: overload constructor { foo2, foo1 }
class C_sub5 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo2, foo1 };
}

// c_subtyping_params_6: overload constructor { foo2, foo1 }
class C_sub6 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo2, foo1 };
}

// c_subtyping_params_7: overload constructor { foo2, foo1 }
class C_sub7 {
  foo: string = '';
  constructor foo1(a: A_sub) { this.foo = 'foo1'; }
  constructor foo2(b: B_sub) { this.foo = 'foo2'; }
  overload constructor { foo2, foo1 };
}

export default function OverloadSetForConstructorsTest01():void {
  describe('OverloadSetForConstructorsTest01', () => {
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
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0100
     * @tc.name      testOverloadSetForConstructorsArrayTuple0001
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr1 = new A_arr1([1, 2]);
      expect('foo1').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_1: new A_arr1([2, 3.4])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0200
     * @tc.name      testOverloadSetForConstructorsArrayTuple0002
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr1 = new A_arr1([2, 3.4]);
      expect('foo1').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_2: new A_arr2([5.6, 7.8])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0300
     * @tc.name      testOverloadSetForConstructorsArrayTuple0003
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr2 = new A_arr2([5.6, 7.8]);
      expect('foo1').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_3: new A_arr3([1, 2])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0400
     * @tc.name      testOverloadSetForConstructorsArrayTuple0004
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr3 = new A_arr3([1, 2]);
      expect('foo2').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_4: new A_arr4([2, 3.4])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0500
     * @tc.name      testOverloadSetForConstructorsArrayTuple0005
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr4 = new A_arr4([2, 3.4]);
      expect('foo2').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_5: new A_arr5([5.6, 7.8])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0600
     * @tc.name      testOverloadSetForConstructorsArrayTuple0006
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr5 = new A_arr5([5.6, 7.8]);
      expect('foo2').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_6: new A_arr6([1, 2])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0700
     * @tc.name      testOverloadSetForConstructorsArrayTuple0007
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr6 = new A_arr6([1, 2]);
      expect('foo3').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_7: new A_arr7([2, 3.4])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0800
     * @tc.name      testOverloadSetForConstructorsArrayTuple0008
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr7 = new A_arr7([2, 3.4]);
      expect('foo3').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_8: new A_arr8([5.6, 7.8])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_0900
     * @tc.name      testOverloadSetForConstructorsArrayTuple0009
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr8 = new A_arr8([5.6, 7.8]);
      expect('foo3').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_9: new A_arr9([1, 2])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_1000
     * @tc.name      testOverloadSetForConstructorsArrayTuple0010
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr9 = new A_arr9([1, 2]);
      expect('foo4').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_10: new A_arr10([2, 3.4])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_1100
     * @tc.name      testOverloadSetForConstructorsArrayTuple0011
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr10 = new A_arr10([2, 3.4]);
      expect('foo4').assertEqual(a.foo);
    });

    // c_array_and_tuple_parameters_11: new A_arr11([5.6, 7.8])
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ARRAY_TUPLE_TEST_1200
     * @tc.name      testOverloadSetForConstructorsArrayTuple0012
     * @tc.desc      Test overload set for constructors with array and tuple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsArrayTuple0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_arr11 = new A_arr11([5.6, 7.8]);
      expect('foo4').assertEqual(a.foo);
    });

    // ==================== Enum Tests ====================

    // c_enum_parameters_0: new A_enum1(1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0100
     * @tc.name      testOverloadSetForConstructorsEnum0001
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum1 = new A_enum1(1);
      expect('foo1').assertEqual(a.foo);
    });

    // c_enum_parameters_1: new A_enum1("S")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0200
     * @tc.name      testOverloadSetForConstructorsEnum0002
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum1 = new A_enum1("S");
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_2: new A_enum1(Color.Red)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0300
     * @tc.name      testOverloadSetForConstructorsEnum0003
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum1 = new A_enum1(Color.Red);
      expect('foo1').assertEqual(a.foo);
    });

    // c_enum_parameters_3: new A_enum1(SizeEnum.M)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0400
     * @tc.name      testOverloadSetForConstructorsEnum0004
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum1 = new A_enum1(SizeEnum.M);
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_4: new A_enum1(Color.Green)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0500
     * @tc.name      testOverloadSetForConstructorsEnum0005
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum1 = new A_enum1(Color.Green);
      expect('foo1').assertEqual(a.foo);
    });

    // c_enum_parameters_5: new A_enum2("Red")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0600
     * @tc.name      testOverloadSetForConstructorsEnum0006
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum2 = new A_enum2("Red");
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_6: new A_enum3(Color.Red)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0700
     * @tc.name      testOverloadSetForConstructorsEnum0007
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum3 = new A_enum3(Color.Red);
      expect('foo3').assertEqual(a.foo);
    });

    // c_enum_parameters_7: new A_enum3(SizeEnum.M)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0800
     * @tc.name      testOverloadSetForConstructorsEnum0008
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum3 = new A_enum3(SizeEnum.M);
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_8: new A_enum4(1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_0900
     * @tc.name      testOverloadSetForConstructorsEnum0009
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum4 = new A_enum4(1);
      expect('foo1').assertEqual(a.foo);
    });

    // c_enum_parameters_9: new A_enum4("S")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1000
     * @tc.name      testOverloadSetForConstructorsEnum0010
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum4 = new A_enum4("S");
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_10: new A_enum5(Color.Red)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1100
     * @tc.name      testOverloadSetForConstructorsEnum0011
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum5 = new A_enum5(Color.Red);
      expect('foo3').assertEqual(a.foo);
    });

    // c_enum_parameters_11: new A_enum5(SizeEnum.S)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1200
     * @tc.name      testOverloadSetForConstructorsEnum0012
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum5 = new A_enum5(SizeEnum.S);
      expect('foo4').assertEqual(a.foo);
    });

    // c_enum_parameters_12: new A_enum6(2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1300
     * @tc.name      testOverloadSetForConstructorsEnum0013
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum6 = new A_enum6(2);
      expect('foo1').assertEqual(a.foo);
    });

    // c_enum_parameters_13: new A_enum6("Red")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1400
     * @tc.name      testOverloadSetForConstructorsEnum0014
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum6 = new A_enum6("Red");
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_14: new A_enum6(Color.Red)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1500
     * @tc.name      testOverloadSetForConstructorsEnum0015
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum6 = new A_enum6(Color.Red);
      expect('foo5').assertEqual(a.foo);
    });

    // c_enum_parameters_15: new A_enum7(SizeEnum.M)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1600
     * @tc.name      testOverloadSetForConstructorsEnum0016
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum7 = new A_enum7(SizeEnum.M);
      expect('foo4').assertEqual(a.foo);
    });

    // c_enum_parameters_16: new A_enum8(3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1700
     * @tc.name      testOverloadSetForConstructorsEnum0017
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum8 = new A_enum8(3);
      expect('foo1').assertEqual(a.foo);
    });

    // c_enum_parameters_17: new A_enum8("L")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1800
     * @tc.name      testOverloadSetForConstructorsEnum0018
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum8 = new A_enum8("L");
      expect('foo2').assertEqual(a.foo);
    });

    // c_enum_parameters_18: new A_enum9(Color.Red)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_1900
     * @tc.name      testOverloadSetForConstructorsEnum0019
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum9 = new A_enum9(Color.Red);
      expect('foo5').assertEqual(a.foo);
    });

    // c_enum_parameters_19: new A_enum9(SizeEnum.L)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_ENUM_TEST_2000
     * @tc.name      testOverloadSetForConstructorsEnum0020
     * @tc.desc      Test overload set for constructors with enum parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsEnum0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_enum9 = new A_enum9(SizeEnum.L);
      expect('foo5').assertEqual(a.foo);
    });

  })

}
