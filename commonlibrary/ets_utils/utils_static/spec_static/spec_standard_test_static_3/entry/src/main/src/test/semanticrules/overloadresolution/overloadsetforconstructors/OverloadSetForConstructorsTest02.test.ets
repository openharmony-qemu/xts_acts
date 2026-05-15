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

export default function OverloadSetForConstructorsTest02():void {
  describe('OverloadSetForConstructorsTest02', () => {
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
    // ==================== Numeric Tests ====================

    // c_numeric_parameters_0: new A_num1(b=1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0100
     * @tc.name      testOverloadSetForConstructorsNumeric0001
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 1;
      let a: A_num1 = new A_num1(b);
      expect('fB').assertEqual(a.foo);
    });

    // c_numeric_parameters_1: new A_num1(s=2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0200
     * @tc.name      testOverloadSetForConstructorsNumeric0002
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 2;
      let a: A_num1 = new A_num1(s);
      expect('fB').assertEqual(a.foo);
    });

    // c_numeric_parameters_2: new A_num1(i=3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0300
     * @tc.name      testOverloadSetForConstructorsNumeric0003
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num1 = new A_num1(i);
      expect('fB').assertEqual(a.foo);
    });

    // c_numeric_parameters_3: new A_num1(l=4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0400
     * @tc.name      testOverloadSetForConstructorsNumeric0004
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: number = 4;
      let a: A_num1 = new A_num1(l);
      expect('fB').assertEqual(a.foo);
    });

    // c_numeric_parameters_4: new A_num1(f=5.1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0500
     * @tc.name      testOverloadSetForConstructorsNumeric0005
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: number = 5.1;
      let a: A_num1 = new A_num1(f);
      expect('fB').assertEqual(a.foo);
    });

    // c_numeric_parameters_5: new A_num1(n=6.2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0600
     * @tc.name      testOverloadSetForConstructorsNumeric0006
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num1 = new A_num1(n);
      expect('fB').assertEqual(a.foo);
    });

    // c_numeric_parameters_6: new A_num2(b=1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0700
     * @tc.name      testOverloadSetForConstructorsNumeric0007
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 1;
      let a: A_num2 = new A_num2(b);
      expect('fS').assertEqual(a.foo);
    });

    // c_numeric_parameters_7: new A_num2(s=2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0800
     * @tc.name      testOverloadSetForConstructorsNumeric0008
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 2;
      let a: A_num2 = new A_num2(s);
      expect('fS').assertEqual(a.foo);
    });

    // c_numeric_parameters_8: new A_num2(i=3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_0900
     * @tc.name      testOverloadSetForConstructorsNumeric0009
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num2 = new A_num2(i);
      expect('fS').assertEqual(a.foo);
    });

    // c_numeric_parameters_9: new A_num2(l=4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1000
     * @tc.name      testOverloadSetForConstructorsNumeric0010
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: number = 4;
      let a: A_num2 = new A_num2(l);
      expect('fS').assertEqual(a.foo);
    });

    // c_numeric_parameters_10: new A_num2(f=5.1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1100
     * @tc.name      testOverloadSetForConstructorsNumeric0011
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: number = 5.1;
      let a: A_num2 = new A_num2(f);
      expect('fS').assertEqual(a.foo);
    });

    // c_numeric_parameters_11: new A_num2(n=6.2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1200
     * @tc.name      testOverloadSetForConstructorsNumeric0012
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num2 = new A_num2(n);
      expect('fS').assertEqual(a.foo);
    });

    // c_numeric_parameters_12: new A_num3(b=1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1300
     * @tc.name      testOverloadSetForConstructorsNumeric0013
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 1;
      let a: A_num3 = new A_num3(b);
      expect('fI').assertEqual(a.foo);
    });

    // c_numeric_parameters_13: new A_num3(s=2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1400
     * @tc.name      testOverloadSetForConstructorsNumeric0014
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 2;
      let a: A_num3 = new A_num3(s);
      expect('fI').assertEqual(a.foo);
    });

    // c_numeric_parameters_14: new A_num3(i=3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1500
     * @tc.name      testOverloadSetForConstructorsNumeric0015
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num3 = new A_num3(i);
      expect('fI').assertEqual(a.foo);
    });

    // c_numeric_parameters_15: new A_num3(l=4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1600
     * @tc.name      testOverloadSetForConstructorsNumeric0016
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: number = 4;
      let a: A_num3 = new A_num3(l);
      expect('fI').assertEqual(a.foo);
    });

    // c_numeric_parameters_16: new A_num3(f=5.1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1700
     * @tc.name      testOverloadSetForConstructorsNumeric0017
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: number = 5.1;
      let a: A_num3 = new A_num3(f);
      expect('fI').assertEqual(a.foo);
    });

    // c_numeric_parameters_17: new A_num3(n=6.2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1800
     * @tc.name      testOverloadSetForConstructorsNumeric0018
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num3 = new A_num3(n);
      expect('fI').assertEqual(a.foo);
    });

    // c_numeric_parameters_18: new A_num4(b=1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_1900
     * @tc.name      testOverloadSetForConstructorsNumeric0019
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 1;
      let a: A_num4 = new A_num4(b);
      expect('fL').assertEqual(a.foo);
    });

    // c_numeric_parameters_19: new A_num4(s=2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2000
     * @tc.name      testOverloadSetForConstructorsNumeric0020
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 2;
      let a: A_num4 = new A_num4(s);
      expect('fL').assertEqual(a.foo);
    });

    // c_numeric_parameters_20: new A_num4(i=3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2100
     * @tc.name      testOverloadSetForConstructorsNumeric0021
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num4 = new A_num4(i);
      expect('fL').assertEqual(a.foo);
    });

    // c_numeric_parameters_21: new A_num4(l=4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2200
     * @tc.name      testOverloadSetForConstructorsNumeric0022
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: number = 4;
      let a: A_num4 = new A_num4(l);
      expect('fL').assertEqual(a.foo);
    });

    // c_numeric_parameters_22: new A_num4(f=5.1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2300
     * @tc.name      testOverloadSetForConstructorsNumeric0023
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: number = 5.1;
      let a: A_num4 = new A_num4(f);
      expect('fL').assertEqual(a.foo);
    });

    // c_numeric_parameters_23: new A_num4(n=6.2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2400
     * @tc.name      testOverloadSetForConstructorsNumeric0024
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num4 = new A_num4(n);
      expect('fL').assertEqual(a.foo);
    });

    // c_numeric_parameters_24: new A_num5(b=1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2500
     * @tc.name      testOverloadSetForConstructorsNumeric0025
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 1;
      let a: A_num5 = new A_num5(b);
      expect('fF').assertEqual(a.foo);
    });

    // c_numeric_parameters_25: new A_num5(s=2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2600
     * @tc.name      testOverloadSetForConstructorsNumeric0026
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 2;
      let a: A_num5 = new A_num5(s);
      expect('fF').assertEqual(a.foo);
    });

    // c_numeric_parameters_26: new A_num5(i=3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2700
     * @tc.name      testOverloadSetForConstructorsNumeric0027
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num5 = new A_num5(i);
      expect('fF').assertEqual(a.foo);
    });

    // c_numeric_parameters_27: new A_num5(l=4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2800
     * @tc.name      testOverloadSetForConstructorsNumeric0028
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: number = 4;
      let a: A_num5 = new A_num5(l);
      expect('fF').assertEqual(a.foo);
    });

    // c_numeric_parameters_28: new A_num5(f=5.1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_2900
     * @tc.name      testOverloadSetForConstructorsNumeric0029
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: number = 5.1;
      let a: A_num5 = new A_num5(f);
      expect('fF').assertEqual(a.foo);
    });

    // c_numeric_parameters_29: new A_num5(n=6.2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3000
     * @tc.name      testOverloadSetForConstructorsNumeric0030
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num5 = new A_num5(n);
      expect('fF').assertEqual(a.foo);
    });

    // c_numeric_parameters_30: new A_num6(b=1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3100
     * @tc.name      testOverloadSetForConstructorsNumeric0031
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: number = 1;
      let a: A_num6 = new A_num6(b);
      expect('fN').assertEqual(a.foo);
    });

    // c_numeric_parameters_31: new A_num6(s=2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3200
     * @tc.name      testOverloadSetForConstructorsNumeric0032
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: number = 2;
      let a: A_num6 = new A_num6(s);
      expect('fN').assertEqual(a.foo);
    });

    // c_numeric_parameters_32: new A_num6(i=3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3300
     * @tc.name      testOverloadSetForConstructorsNumeric0033
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = 3;
      let a: A_num6 = new A_num6(i);
      expect('fN').assertEqual(a.foo);
    });

    // c_numeric_parameters_33: new A_num6(l=4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3400
     * @tc.name      testOverloadSetForConstructorsNumeric0034
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l: number = 4;
      let a: A_num6 = new A_num6(l);
      expect('fN').assertEqual(a.foo);
    });

    // c_numeric_parameters_34: new A_num6(f=5.1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3500
     * @tc.name      testOverloadSetForConstructorsNumeric0035
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: number = 5.1;
      let a: A_num6 = new A_num6(f);
      expect('fN').assertEqual(a.foo);
    });

    // c_numeric_parameters_35: new A_num6(n=6.2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_NUMERIC_TEST_3600
     * @tc.name      testOverloadSetForConstructorsNumeric0036
     * @tc.desc      Test overload set for constructors with numeric parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsNumeric0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: number = 6.2;
      let a: A_num6 = new A_num6(n);
      expect('fN').assertEqual(a.foo);
    });

    // ==================== OptionalRest Tests ====================

    // c_optional_and_rest_parameters_0: new A_opt1("a")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0100
     * @tc.name      testOverloadSetForConstructorsOptionalRest0001
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("a");
      expect('foo1').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_1: new A_opt1("b")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0200
     * @tc.name      testOverloadSetForConstructorsOptionalRest0002
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("b");
      expect('foo1').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_2: new A_opt1("c")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0300
     * @tc.name      testOverloadSetForConstructorsOptionalRest0003
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("c");
      expect('foo2').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_3: new A_opt1("a", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0400
     * @tc.name      testOverloadSetForConstructorsOptionalRest0004
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("a", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_4: new A_opt1("b", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0500
     * @tc.name      testOverloadSetForConstructorsOptionalRest0005
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("b", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_5: new A_opt1("c", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0600
     * @tc.name      testOverloadSetForConstructorsOptionalRest0006
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("c", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_6: new A_opt1("a", 1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0700
     * @tc.name      testOverloadSetForConstructorsOptionalRest0007
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("a", 1);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_7: new A_opt1("b", 2)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0800
     * @tc.name      testOverloadSetForConstructorsOptionalRest0008
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("b", 2);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_8: new A_opt1("c", 3)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_0900
     * @tc.name      testOverloadSetForConstructorsOptionalRest0009
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("c", 3);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_9: new A_opt1("a", 1.4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1000
     * @tc.name      testOverloadSetForConstructorsOptionalRest0010
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("a", 1, 4);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_10: new A_opt1("b", 2.5)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1100
     * @tc.name      testOverloadSetForConstructorsOptionalRest0011
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("b", 2, 5);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_11: new A_opt1("c", 3.6)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1200
     * @tc.name      testOverloadSetForConstructorsOptionalRest0012
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("c", 3, 6);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_12: new A_opt1("a", 1, 4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1300
     * @tc.name      testOverloadSetForConstructorsOptionalRest0013
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("a", 1, 4);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_13: new A_opt1("b", 2, 5)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1400
     * @tc.name      testOverloadSetForConstructorsOptionalRest0014
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("b", 2, 5);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_14: new A_opt1("c", 3, 6)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1500
     * @tc.name      testOverloadSetForConstructorsOptionalRest0015
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt1 = new A_opt1("c", 3, 6);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_15: new A_opt2("a")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1600
     * @tc.name      testOverloadSetForConstructorsOptionalRest0016
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt2 = new A_opt2("a");
      expect('foo2').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_16: new A_opt2("c")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1700
     * @tc.name      testOverloadSetForConstructorsOptionalRest0017
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt2 = new A_opt2("c");
      expect('foo2').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_17: new A_opt2("b", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1800
     * @tc.name      testOverloadSetForConstructorsOptionalRest0018
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt2 = new A_opt2("b", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_18: new A_opt2("c", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_1900
     * @tc.name      testOverloadSetForConstructorsOptionalRest0019
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt2 = new A_opt2("c", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_19: new A_opt3("a")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2000
     * @tc.name      testOverloadSetForConstructorsOptionalRest0020
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt3 = new A_opt3("a");
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_20: new A_opt3("b", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2100
     * @tc.name      testOverloadSetForConstructorsOptionalRest0021
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt3 = new A_opt3("b", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_21: new A_opt3("a", 1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2200
     * @tc.name      testOverloadSetForConstructorsOptionalRest0022
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt3 = new A_opt3("a", 1);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_22: new A_opt3("b", 3.6)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2300
     * @tc.name      testOverloadSetForConstructorsOptionalRest0023
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt3 = new A_opt3("b", 3, 6);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_23: new A_opt3("c", 1, 4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2400
     * @tc.name      testOverloadSetForConstructorsOptionalRest0024
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt3 = new A_opt3("c", 1, 4);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_24: new A_opt4("a")
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2500
     * @tc.name      testOverloadSetForConstructorsOptionalRest0025
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt4 = new A_opt4("a", 1);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_25: new A_opt4("b", undefined)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2600
     * @tc.name      testOverloadSetForConstructorsOptionalRest0026
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt4 = new A_opt4("b", undefined);
      expect('foo3').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_26: new A_opt4("a", 1)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2700
     * @tc.name      testOverloadSetForConstructorsOptionalRest0027
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt4 = new A_opt4("a", 1, 2);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_27: new A_opt4("b", 1.4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2800
     * @tc.name      testOverloadSetForConstructorsOptionalRest0028
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt4 = new A_opt4("b", 1, 4);
      expect('foo4').assertEqual(a.foo);
    });

    // c_optional_and_rest_parameters_28: new A_opt4("c", 1, 4)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_OPTIONAL_REST_TEST_2900
     * @tc.name      testOverloadSetForConstructorsOptionalRest0029
     * @tc.desc      Test overload set for constructors with optional and rest parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsOptionalRest0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_opt4 = new A_opt4("c", 1, 4);
      expect('foo4').assertEqual(a.foo);
    });

    // ==================== Subtyping Tests ====================

    // c_subtyping_params_0: new C_sub1(a)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0100
     * @tc.name      testOverloadSetForConstructorsSubtyping0001
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let c: C_sub1 = new C_sub1(a);
      expect('foo1').assertEqual(c.foo);
    });

    // c_subtyping_params_1: new C_sub1(b)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0200
     * @tc.name      testOverloadSetForConstructorsSubtyping0002
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_sub = new B_sub();
      let c: C_sub1 = new C_sub1(b);
      expect('foo1').assertEqual(c.foo);
    });

    // c_subtyping_params_2: new C_sub2(b)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0300
     * @tc.name      testOverloadSetForConstructorsSubtyping0003
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_sub = new B_sub();
      let c: C_sub2 = new C_sub2(b);
      expect('foo2').assertEqual(c.foo);
    });

    // c_subtyping_params_3: new C_sub3(new B_sub())
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0400
     * @tc.name      testOverloadSetForConstructorsSubtyping0004
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_sub3 = new C_sub3(new B_sub());
      expect('foo1').assertEqual(c.foo);
    });

    // c_subtyping_params_4: new C_sub4(a)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0500
     * @tc.name      testOverloadSetForConstructorsSubtyping0005
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_sub = new A_sub();
      let c: C_sub4 = new C_sub4(a);
      expect('foo1').assertEqual(c.foo);
    });

    // c_subtyping_params_5: new C_sub5(b)
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0600
     * @tc.name      testOverloadSetForConstructorsSubtyping0006
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: B_sub = new B_sub();
      let c: C_sub5 = new C_sub5(b);
      expect('foo2').assertEqual(c.foo);
    });

    // c_subtyping_params_6: new C_sub6(new A_sub())
    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0700
     * @tc.name      testOverloadSetForConstructorsSubtyping0007
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_sub6 = new C_sub6(new A_sub());
      expect('foo1').assertEqual(c.foo);
    });

    /**
     * @tc.number    SUB_OVERLOAD_SET_FOR_CONSTRUCTORS_SUBTYPING_TEST_0800
     * @tc.name      testOverloadSetForConstructorsSubtyping0008
     * @tc.desc      Test overload set for constructors with subtyping parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSetForConstructorsSubtyping0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: C_sub7 = new C_sub7(new B_sub());
      expect('foo2').assertEqual(c.foo);
    });

  })

}
