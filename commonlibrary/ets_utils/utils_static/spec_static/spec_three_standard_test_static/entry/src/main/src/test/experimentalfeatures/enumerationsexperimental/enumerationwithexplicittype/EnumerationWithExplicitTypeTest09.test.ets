'use static';
/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum EnumByteA0: byte { A, B, C, D = B | C, E, F, G = D | F }
enum ConstEnumByteA0: byte { A, B, C, D = B | C, E, F, G = D | F }

enum EnumByteB0: byte { A = 2, B, C }
enum ConstEnumByteB0: byte { A = 2, B, C }

enum EnumByteC0: byte { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }
enum ConstEnumByteC0: byte { A = 0, B = 1 << 1, C = 1 << 2, D = (B | C), E = (B | C) << 1 }

enum EnumByteD0: byte {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 1) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum ConstEnumByteD0: byte {
  A = 5,
  B = (1 << 1) * 2,
  C = (1 << 3) * 3,
  D = (B | C),
  E = ((B | C) << 1) * 2,
  F = A % 4,
  G = (A + F) / 3,
  H = (G | (F & A)),
  I = F ^ A,
  J = ~A,
  K = -B,
  L = E >> 2,
  M = E >>> 2
}

enum EnumByteE0: byte { first = 123, second, third }
enum EnumByteE1: byte { first = EnumByteE0.first, second, third }

enum ConstEnumByteE0: byte { first = 123, second, third }
enum ConstEnumByteE1: byte { first = ConstEnumByteE0.first, second, third }

enum EnumByteE2: byte { first = 123, second, third }
enum ConstEnumByteE2: byte { first = EnumByteE2.first, second, third }

enum ConstEnumByteE3: byte { first = 123, second, third }
enum EnumByteE3: byte { first = ConstEnumByteE3.first, second, third }

enum EnumByteF0: byte { first = 127, second = 126, third = 125 }
enum ConstEnumByteF0: byte { first = 127, second = 126, third = 125 }

enum EnumByteG0: byte { A = 5, B = 5 }
enum ConstEnumByteG0: byte { A = 5, B = 5 }

enum EnumByteG1: byte { A = -12, B, C = -12 }
enum ConstEnumByteG1: byte { A = -12, B, C = -12 }

enum EnumByteG2: byte { first, second = -1, third }
enum ConstEnumByteG2: byte { first, second = -1, third }

enum EnumByteG3: byte { A, B, C, D, E = B | C }
enum ConstEnumByteG3: byte { A, B, C, D, E = B | C }

enum EnumByteH0: byte { first, second = -128, third }
enum ConstEnumByteH0: byte { first, second = -128, third }
enum EnumByteH1: byte { first = 127 - 2, second, third }
enum ConstEnumByteH1: byte { first = 127 - 2, second, third }

enum EnumByteI0: byte {
  first = 0b0011,
  second = 0o177,
  third = 0x7F,
  fourth = 123
}
enum ConstEnumByteI0: byte {
  first = 0b0011,
  second = 0o177,
  third = 0x7F,
  fourth = 123
}
enum EnumByteJ0: byte { first = -42, second, third = 17 }
enum ConstEnumByteJ0: byte { first = -42, second, third = 17 }
// byte: 合并 const / 非 const

enum EnumByteK0: byte { first = -1, second, third = -42 }

enum ColorByteD0: byte { Red = 5, Green = 7, Blue = -53 }

enum EnumByteL0: byte { first = -1, second = 27, third }
// byte 溢出类 enum 常量表达式在当前编译器下会报 ESE0342
/*enum EnumByteM0: byte { first = 127 - 1, second, third }
enum EnumByteM1: byte { first = 127 - 10, second, third = first + 110 }
enum EnumByteM2: byte { first, second = -128, third = second - 1 }
enum EnumByteM3: byte { first = -128 + 10, second, third = first - 110 }*/

export default function EnumerationWithExplicitTypeTest09(): void {
  describe('EnumerationWithExplicitTypeTest09', () => {
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
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0100
 * @tc.name      testEnumerationWithExplicitType0299
 * @tc.desc      Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteA0.A instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.B instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.C instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.D instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.E instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.F instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.G instanceof EnumByteA0).assertEqual(true);
  expect(EnumByteA0.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.C.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.D.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.E.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.F.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.G.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteA0.A).assertEqual(0);
  expect(EnumByteA0.B).assertEqual(1);
  expect(EnumByteA0.C).assertEqual(2);
  expect(EnumByteA0.D).assertEqual(3);
  expect(EnumByteA0.E).assertEqual(4);
  expect(EnumByteA0.F).assertEqual(5);
  expect(EnumByteA0.G).assertEqual(7);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0200
 * @tc.name      testEnumerationWithExplicitType0300
 * @tc.desc      Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteA0.A instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.B instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.C instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.D instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.E instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.F instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.G instanceof ConstEnumByteA0).assertEqual(true);
  expect(ConstEnumByteA0.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.C.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.D.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.E.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.F.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.G.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteA0.A).assertEqual(0);
  expect(ConstEnumByteA0.B).assertEqual(1);
  expect(ConstEnumByteA0.C).assertEqual(2);
  expect(ConstEnumByteA0.D).assertEqual(3);
  expect(ConstEnumByteA0.E).assertEqual(4);
  expect(ConstEnumByteA0.F).assertEqual(5);
  expect(ConstEnumByteA0.G).assertEqual(7);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0300
 * @tc.name      testEnumerationWithExplicitType0301
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteB0.A instanceof EnumByteB0).assertEqual(true);
  expect(EnumByteB0.B instanceof EnumByteB0).assertEqual(true);
  expect(EnumByteB0.C instanceof EnumByteB0).assertEqual(true);
  expect(EnumByteB0.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteB0.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteB0.C.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteB0.A).assertEqual(2);
  expect(EnumByteB0.B).assertEqual(3);
  expect(EnumByteB0.C).assertEqual(4);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0400
 * @tc.name      testEnumerationWithExplicitType0302
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteB0.A instanceof ConstEnumByteB0).assertEqual(true);
  expect(ConstEnumByteB0.B instanceof ConstEnumByteB0).assertEqual(true);
  expect(ConstEnumByteB0.C instanceof ConstEnumByteB0).assertEqual(true);
  expect(ConstEnumByteB0.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteB0.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteB0.C.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteB0.A).assertEqual(2);
  expect(ConstEnumByteB0.B).assertEqual(3);
  expect(ConstEnumByteB0.C).assertEqual(4);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0500
 * @tc.name      testEnumerationWithExplicitType0303
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteC0.A instanceof EnumByteC0).assertEqual(true);
  expect(EnumByteC0.B instanceof EnumByteC0).assertEqual(true);
  expect(EnumByteC0.C instanceof EnumByteC0).assertEqual(true);
  expect(EnumByteC0.D instanceof EnumByteC0).assertEqual(true);
  expect(EnumByteC0.E instanceof EnumByteC0).assertEqual(true);
  expect(EnumByteC0.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteC0.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteC0.C.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteC0.D.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteC0.E.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteC0.A).assertEqual(0);
  expect(EnumByteC0.B).assertEqual(2);
  expect(EnumByteC0.C).assertEqual(4);
  expect(EnumByteC0.D).assertEqual(6);
  expect(EnumByteC0.E).assertEqual(12);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0600
 * @tc.name      testEnumerationWithExplicitType0304
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteC0.A instanceof ConstEnumByteC0).assertEqual(true);
  expect(ConstEnumByteC0.B instanceof ConstEnumByteC0).assertEqual(true);
  expect(ConstEnumByteC0.C instanceof ConstEnumByteC0).assertEqual(true);
  expect(ConstEnumByteC0.D instanceof ConstEnumByteC0).assertEqual(true);
  expect(ConstEnumByteC0.E instanceof ConstEnumByteC0).assertEqual(true);
  expect(ConstEnumByteC0.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteC0.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteC0.C.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteC0.D.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteC0.E.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteC0.A).assertEqual(0);
  expect(ConstEnumByteC0.B).assertEqual(2);
  expect(ConstEnumByteC0.C).assertEqual(4);
  expect(ConstEnumByteC0.D).assertEqual(6);
  expect(ConstEnumByteC0.E).assertEqual(12);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0700
 * @tc.name      testEnumerationWithExplicitType0305
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const a: byte = 5
  const b: byte = (1 << 1) * 2
  const c: byte = (1 << 3) * 3
  const d: byte = (b | c)
  const e: byte = ((b | c) << 1) * 2
  const f: byte = a % 4
  const g: byte = (a + f) / 3
  const h: byte = (g | (f & a))
  const i: byte = f ^ a
  const j: byte = ~a
  const k: byte = -b
  const l: byte = e >> 2
  const m: byte = e >>> 2
  expect(EnumByteD0.A instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.B instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.C instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.D instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.E instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.F instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.G instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.H instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.I instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.J instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.K instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.L instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.M instanceof EnumByteD0).assertEqual(true);
  expect(EnumByteD0.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.C.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.D.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.E.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.F.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.G.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.H.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.I.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.J.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.K.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.L.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.M.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteD0.A).assertEqual(a);
  expect(EnumByteD0.B).assertEqual(b);
  expect(EnumByteD0.C).assertEqual(c);
  expect(EnumByteD0.D).assertEqual(d);
  expect(EnumByteD0.E).assertEqual(e);
  expect(EnumByteD0.F).assertEqual(f);
  expect(EnumByteD0.G).assertEqual(g);
  expect(EnumByteD0.H).assertEqual(h);
  expect(EnumByteD0.I).assertEqual(i);
  expect(EnumByteD0.J).assertEqual(j);
  expect(EnumByteD0.K).assertEqual(k);
  expect(EnumByteD0.L).assertEqual(l);
  expect(EnumByteD0.M).assertEqual(m);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0800
 * @tc.name      testEnumerationWithExplicitType0306
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression. Qualification by type is mandatory to access the enumeration constant, except enumeration constant initialization expressions.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const a: byte = 5
  const b: byte = (1 << 1) * 2
  const c: byte = (1 << 3) * 3
  const d: byte = (b | c)
  const e: byte = ((b | c) << 1) * 2
  const f: byte = a % 4
  const g: byte = (a + f) / 3
  const h: byte = (g | (f & a))
  const i: byte = f ^ a
  const j: byte = ~a
  const k: byte = -b
  const l: byte = e >> 2
  const m: byte = e >>> 2
  expect(ConstEnumByteD0.A instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.B instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.C instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.D instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.E instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.F instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.G instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.H instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.I instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.J instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.K instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.L instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.M instanceof ConstEnumByteD0).assertEqual(true);
  expect(ConstEnumByteD0.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.C.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.D.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.E.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.F.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.G.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.H.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.I.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.J.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.K.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.L.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.M.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteD0.A).assertEqual(a);
  expect(ConstEnumByteD0.B).assertEqual(b);
  expect(ConstEnumByteD0.C).assertEqual(c);
  expect(ConstEnumByteD0.D).assertEqual(d);
  expect(ConstEnumByteD0.E).assertEqual(e);
  expect(ConstEnumByteD0.F).assertEqual(f);
  expect(ConstEnumByteD0.G).assertEqual(g);
  expect(ConstEnumByteD0.H).assertEqual(h);
  expect(ConstEnumByteD0.I).assertEqual(i);
  expect(ConstEnumByteD0.J).assertEqual(j);
  expect(ConstEnumByteD0.K).assertEqual(k);
  expect(ConstEnumByteD0.L).assertEqual(l);
  expect(ConstEnumByteD0.M).assertEqual(m);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_0900
 * @tc.name      testEnumerationWithExplicitType0307
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteE0.first instanceof EnumByteE0).assertEqual(true);
  expect(EnumByteE0.second instanceof EnumByteE0).assertEqual(true);
  expect(EnumByteE0.third instanceof EnumByteE0).assertEqual(true);
  expect(EnumByteE0.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE0.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE0.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE0.first.valueOf()).assertEqual(123);
  expect(EnumByteE0.second.valueOf()).assertEqual(124);
  expect(EnumByteE0.third.valueOf()).assertEqual(125);
  expect(EnumByteE1.first instanceof EnumByteE1).assertEqual(true);
  expect(EnumByteE1.second instanceof EnumByteE1).assertEqual(true);
  expect(EnumByteE1.third instanceof EnumByteE1).assertEqual(true);
  expect(EnumByteE1.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE1.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE1.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE1.first.valueOf()).assertEqual(123);
  expect(EnumByteE1.second.valueOf()).assertEqual(124);
  expect(EnumByteE1.third.valueOf()).assertEqual(125);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1000
 * @tc.name      testEnumerationWithExplicitType0308
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteE0.first instanceof ConstEnumByteE0).assertEqual(true);
  expect(ConstEnumByteE0.second instanceof ConstEnumByteE0).assertEqual(true);
  expect(ConstEnumByteE0.third instanceof ConstEnumByteE0).assertEqual(true);
  expect(ConstEnumByteE0.first.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE0.second.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE0.third.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE0.first.valueOf()).assertEqual(123);
  expect(ConstEnumByteE0.second.valueOf()).assertEqual(124);
  expect(ConstEnumByteE0.third.valueOf()).assertEqual(125);
  expect(ConstEnumByteE1.first instanceof ConstEnumByteE1).assertEqual(true);
  expect(ConstEnumByteE1.second instanceof ConstEnumByteE1).assertEqual(true);
  expect(ConstEnumByteE1.third instanceof ConstEnumByteE1).assertEqual(true);
  expect(ConstEnumByteE1.first.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE1.second.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE1.third.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE1.first.valueOf()).assertEqual(123);
  expect(ConstEnumByteE1.second.valueOf()).assertEqual(124);
  expect(ConstEnumByteE1.third.valueOf()).assertEqual(125);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1100
 * @tc.name      testEnumerationWithExplicitType0309
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteE2.first instanceof EnumByteE2).assertEqual(true);
  expect(EnumByteE2.second instanceof EnumByteE2).assertEqual(true);
  expect(EnumByteE2.third instanceof EnumByteE2).assertEqual(true);
  expect(EnumByteE2.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE2.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE2.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE2.first.valueOf()).assertEqual(123);
  expect(EnumByteE2.second.valueOf()).assertEqual(124);
  expect(EnumByteE2.third.valueOf()).assertEqual(125);
  expect(ConstEnumByteE2.first instanceof ConstEnumByteE2).assertEqual(true);
  expect(ConstEnumByteE2.second instanceof ConstEnumByteE2).assertEqual(true);
  expect(ConstEnumByteE2.third instanceof ConstEnumByteE2).assertEqual(true);
  expect(ConstEnumByteE2.first.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE2.second.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE2.third.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE2.first.valueOf()).assertEqual(123);
  expect(ConstEnumByteE2.second.valueOf()).assertEqual(124);
  expect(ConstEnumByteE2.third.valueOf()).assertEqual(125);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1200
 * @tc.name      testEnumerationWithExplicitType0310
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteE3.first instanceof ConstEnumByteE3).assertEqual(true);
  expect(ConstEnumByteE3.second instanceof ConstEnumByteE3).assertEqual(true);
  expect(ConstEnumByteE3.third instanceof ConstEnumByteE3).assertEqual(true);
  expect(ConstEnumByteE3.first.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE3.second.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE3.third.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteE3.first.valueOf()).assertEqual(123);
  expect(ConstEnumByteE3.second.valueOf()).assertEqual(124);
  expect(ConstEnumByteE3.third.valueOf()).assertEqual(125);
  expect(EnumByteE3.first instanceof EnumByteE3).assertEqual(true);
  expect(EnumByteE3.second instanceof EnumByteE3).assertEqual(true);
  expect(EnumByteE3.third instanceof EnumByteE3).assertEqual(true);
  expect(EnumByteE3.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE3.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE3.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteE3.first.valueOf()).assertEqual(123);
  expect(EnumByteE3.second.valueOf()).assertEqual(124);
  expect(EnumByteE3.third.valueOf()).assertEqual(125);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1300
 * @tc.name      testEnumerationWithExplicitType0311
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 127;
  const v2: byte = 127 - 1;
  const v3: byte = 127 - 2;
  expect(EnumByteF0.first instanceof EnumByteF0).assertEqual(true);
  expect(EnumByteF0.second instanceof EnumByteF0).assertEqual(true);
  expect(EnumByteF0.third instanceof EnumByteF0).assertEqual(true);
  expect(EnumByteF0.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteF0.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteF0.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteF0.first.valueOf()).assertEqual(v1);
  expect(EnumByteF0.second.valueOf()).assertEqual(v2);
  expect(EnumByteF0.third.valueOf()).assertEqual(v3);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1400
 * @tc.name      testEnumerationWithExplicitType0312
 * @tc.desc      The value of an enum constant can be set as follows: * Explicitly to a numeric constant expression or to a constant expression of type string; or * Implicitly by omitting the constant expression.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 127;
  const v2: byte = 127 - 1;
  const v3: byte = 127 - 2;
  expect(ConstEnumByteF0.first instanceof ConstEnumByteF0).assertEqual(true);
  expect(ConstEnumByteF0.second instanceof ConstEnumByteF0).assertEqual(true);
  expect(ConstEnumByteF0.third instanceof ConstEnumByteF0).assertEqual(true);
  expect(ConstEnumByteF0.first.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteF0.second.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteF0.third.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteF0.first.valueOf()).assertEqual(v1);
  expect(ConstEnumByteF0.second.valueOf()).assertEqual(v2);
  expect(ConstEnumByteF0.third.valueOf()).assertEqual(v3);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1500
 * @tc.name      testEnumerationWithExplicitType0313
 * @tc.desc      Values can be the same
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteG0.A instanceof EnumByteG0).assertEqual(true);
  expect(EnumByteG0.B instanceof EnumByteG0).assertEqual(true);
  expect(EnumByteG0.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG0.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG0.A).assertEqual(5);
  expect(EnumByteG0.B).assertEqual(5);
  expect(EnumByteG0.A).assertEqual(EnumByteG0.B);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1600
 * @tc.name      testEnumerationWithExplicitType0314
 * @tc.desc      Values can be the same
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteG0.A instanceof ConstEnumByteG0).assertEqual(true);
  expect(ConstEnumByteG0.B instanceof ConstEnumByteG0).assertEqual(true);
  expect(ConstEnumByteG0.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG0.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG0.A).assertEqual(5);
  expect(ConstEnumByteG0.B).assertEqual(5);
  expect(ConstEnumByteG0.A).assertEqual(ConstEnumByteG0.B);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1700
 * @tc.name      testEnumerationWithExplicitType0315
 * @tc.desc      Values can be the same
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteG1.A instanceof EnumByteG1).assertEqual(true);
  expect(EnumByteG1.B instanceof EnumByteG1).assertEqual(true);
  expect(EnumByteG1.C instanceof EnumByteG1).assertEqual(true);
  expect(EnumByteG1.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG1.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG1.C.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG1.A).assertEqual(-12);
  expect(EnumByteG1.B).assertEqual(-11);
  expect(EnumByteG1.C).assertEqual(-12);
  expect(EnumByteG1.A).assertEqual(EnumByteG1.C);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1800
 * @tc.name      testEnumerationWithExplicitType0316
 * @tc.desc      Values can be the same
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteG1.A instanceof ConstEnumByteG1).assertEqual(true);
  expect(ConstEnumByteG1.B instanceof ConstEnumByteG1).assertEqual(true);
  expect(ConstEnumByteG1.C instanceof ConstEnumByteG1).assertEqual(true);
  expect(ConstEnumByteG1.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG1.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG1.C.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG1.A).assertEqual(-12);
  expect(ConstEnumByteG1.B).assertEqual(-11);
  expect(ConstEnumByteG1.C).assertEqual(-12);
  expect(ConstEnumByteG1.A).assertEqual(ConstEnumByteG1.C);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_1900
 * @tc.name      testEnumerationWithExplicitType0317
 * @tc.desc      Values can be the same
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteG2.first instanceof EnumByteG2).assertEqual(true);
  expect(EnumByteG2.second instanceof EnumByteG2).assertEqual(true);
  expect(EnumByteG2.third instanceof EnumByteG2).assertEqual(true);
  expect(EnumByteG2.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG2.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG2.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG2.first).assertEqual(0);
  expect(EnumByteG2.second).assertEqual(-1);
  expect(EnumByteG2.third).assertEqual(0);
  expect(EnumByteG2.third).assertEqual(EnumByteG2.first);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2000
 * @tc.name      testEnumerationWithExplicitType0318
 * @tc.desc      Values can be the same
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteG2.first instanceof ConstEnumByteG2).assertEqual(true);
  expect(ConstEnumByteG2.second instanceof ConstEnumByteG2).assertEqual(true);
  expect(ConstEnumByteG2.third instanceof ConstEnumByteG2).assertEqual(true);
  expect(ConstEnumByteG2.first.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG2.second.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG2.third.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG2.first).assertEqual(0);
  expect(ConstEnumByteG2.second).assertEqual(-1);
  expect(ConstEnumByteG2.third).assertEqual(0);
  expect(ConstEnumByteG2.third).assertEqual(ConstEnumByteG2.first);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2100
 * @tc.name      testEnumerationWithExplicitType0319
 * @tc.desc      Values can be the same. If constant expression is omitted, then the value of the enum constant is set implicitly to an integer value. The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteG3.A instanceof EnumByteG3).assertEqual(true);
  expect(EnumByteG3.B instanceof EnumByteG3).assertEqual(true);
  expect(EnumByteG3.C instanceof EnumByteG3).assertEqual(true);
  expect(EnumByteG3.D instanceof EnumByteG3).assertEqual(true);
  expect(EnumByteG3.E instanceof EnumByteG3).assertEqual(true);
  expect(EnumByteG3.A.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG3.B.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG3.C.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG3.D.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG3.E.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteG3.A).assertEqual(0);
  expect(EnumByteG3.B).assertEqual(1);
  expect(EnumByteG3.C).assertEqual(2);
  expect(EnumByteG3.D).assertEqual(3);
  expect(EnumByteG3.E).assertEqual(3);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2200
 * @tc.name      testEnumerationWithExplicitType0320
 * @tc.desc      Values can be the same. If constant expression is omitted, then the value of the enum constant is set implicitly to an integer value. The constant which is first and has no explicit value gets zero value. A constant that is not the first and has no explicit value takes the value of the immediately preceding constant plus one.
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteG3.A instanceof ConstEnumByteG3).assertEqual(true);
  expect(ConstEnumByteG3.B instanceof ConstEnumByteG3).assertEqual(true);
  expect(ConstEnumByteG3.C instanceof ConstEnumByteG3).assertEqual(true);
  expect(ConstEnumByteG3.D instanceof ConstEnumByteG3).assertEqual(true);
  expect(ConstEnumByteG3.E instanceof ConstEnumByteG3).assertEqual(true);
  expect(ConstEnumByteG3.A.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG3.B.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG3.C.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG3.D.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG3.E.valueOf() instanceof byte).assertEqual(true);
  expect(ConstEnumByteG3.A).assertEqual(0);
  expect(ConstEnumByteG3.B).assertEqual(1);
  expect(ConstEnumByteG3.C).assertEqual(2);
  expect(ConstEnumByteG3.D).assertEqual(3);
  expect(ConstEnumByteG3.E).assertEqual(3);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2300
 * @tc.name      testEnumerationWithExplicitType0321
 * @tc.desc      Checking for min value in enum
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 0
  const v2: byte = -128
  const v3: byte = -128 + 1
  expect(EnumByteH0.first instanceof EnumByteH0).assertEqual(true)
  expect(EnumByteH0.second instanceof EnumByteH0).assertEqual(true)
  expect(EnumByteH0.third instanceof EnumByteH0).assertEqual(true)
  expect(EnumByteH0.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteH0.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteH0.third.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteH0.first.valueOf()).assertEqual(v1)
  expect(EnumByteH0.second.valueOf()).assertEqual(v2)
  expect(EnumByteH0.third.valueOf()).assertEqual(v3)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2400
 * @tc.name      testEnumerationWithExplicitType0322
 * @tc.desc      Checking for min value in enum
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 0
  const v2: byte = -128
  const v3: byte = -128 + 1
  expect(ConstEnumByteH0.first instanceof ConstEnumByteH0).assertEqual(true)
  expect(ConstEnumByteH0.second instanceof ConstEnumByteH0).assertEqual(true)
  expect(ConstEnumByteH0.third instanceof ConstEnumByteH0).assertEqual(true)
  expect(ConstEnumByteH0.first.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteH0.second.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteH0.third.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteH0.first.valueOf()).assertEqual(v1)
  expect(ConstEnumByteH0.second.valueOf()).assertEqual(v2)
  expect(ConstEnumByteH0.third.valueOf()).assertEqual(v3)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2500
 * @tc.name      testEnumerationWithExplicitType0323
 * @tc.desc      Checking for max value in enum
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 127 - 2
  const v2: byte = 127 - 1
  const v3: byte = 127
  expect(EnumByteH1.first instanceof EnumByteH1).assertEqual(true)
  expect(EnumByteH1.second instanceof EnumByteH1).assertEqual(true)
  expect(EnumByteH1.third instanceof EnumByteH1).assertEqual(true)
  expect(EnumByteH1.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteH1.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteH1.third.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteH1.first.valueOf()).assertEqual(v1)
  expect(EnumByteH1.second.valueOf()).assertEqual(v2)
  expect(EnumByteH1.third.valueOf()).assertEqual(v3)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2600
 * @tc.name      testEnumerationWithExplicitType0324
 * @tc.desc      Checking for max value in enum
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 127 - 2
  const v2: byte = 127 - 1
  const v3: byte = 127
  expect(ConstEnumByteH1.first instanceof ConstEnumByteH1).assertEqual(true)
  expect(ConstEnumByteH1.second instanceof ConstEnumByteH1).assertEqual(true)
  expect(ConstEnumByteH1.third instanceof ConstEnumByteH1).assertEqual(true)
  expect(ConstEnumByteH1.first.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteH1.second.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteH1.third.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteH1.first.valueOf()).assertEqual(v1)
  expect(ConstEnumByteH1.second.valueOf()).assertEqual(v2)
  expect(ConstEnumByteH1.third.valueOf()).assertEqual(v3)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2700
 * @tc.name      testEnumerationWithExplicitType0325
 * @tc.desc      Using different integer literals
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 0b0011
  const v2: byte = 0o177
  const v3: byte = 0x7F
  const v4: byte = 123
  expect(EnumByteI0.first instanceof EnumByteI0).assertEqual(true)
  expect(EnumByteI0.second instanceof EnumByteI0).assertEqual(true)
  expect(EnumByteI0.third instanceof EnumByteI0).assertEqual(true)
  expect(EnumByteI0.fourth instanceof EnumByteI0).assertEqual(true)
  expect(EnumByteI0.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteI0.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteI0.third.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteI0.fourth.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteI0.first.valueOf()).assertEqual(v1)
  expect(EnumByteI0.second.valueOf()).assertEqual(v2)
  expect(EnumByteI0.third.valueOf()).assertEqual(v3)
  expect(EnumByteI0.fourth.valueOf()).assertEqual(v4)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2800
 * @tc.name      testEnumerationWithExplicitType0326
 * @tc.desc      Using different integer literals
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const v1: byte = 0b0011
  const v2: byte = 0o177
  const v3: byte = 0x7F
  const v4: byte = 123
  expect(ConstEnumByteI0.first instanceof ConstEnumByteI0).assertEqual(true)
  expect(ConstEnumByteI0.second instanceof ConstEnumByteI0).assertEqual(true)
  expect(ConstEnumByteI0.third instanceof ConstEnumByteI0).assertEqual(true)
  expect(ConstEnumByteI0.fourth instanceof ConstEnumByteI0).assertEqual(true)
  expect(ConstEnumByteI0.first.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteI0.second.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteI0.third.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteI0.fourth.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteI0.first.valueOf()).assertEqual(v1)
  expect(ConstEnumByteI0.second.valueOf()).assertEqual(v2)
  expect(ConstEnumByteI0.third.valueOf()).assertEqual(v3)
  expect(ConstEnumByteI0.fourth.valueOf()).assertEqual(v4)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_2900
 * @tc.name      testEnumerationWithExplicitType0327
 * @tc.desc      Using in string operator contexts
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteJ0.first instanceof EnumByteJ0).assertEqual(true)
  expect(EnumByteJ0.second instanceof EnumByteJ0).assertEqual(true)
  expect(EnumByteJ0.third instanceof EnumByteJ0).assertEqual(true)
  expect(EnumByteJ0.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteJ0.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteJ0.third.valueOf() instanceof byte).assertEqual(true)
  expect("_" + EnumByteJ0.first).assertEqual("_-42")
  expect("_" + EnumByteJ0.second).assertEqual("_-41")
  expect("_" + EnumByteJ0.third).assertEqual("_17")
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_3000
 * @tc.name      testEnumerationWithExplicitType0328
 * @tc.desc      Using in string operator contexts
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteJ0.first instanceof EnumByteJ0).assertEqual(true)
  expect(EnumByteJ0.second instanceof EnumByteJ0).assertEqual(true)
  expect(EnumByteJ0.third instanceof EnumByteJ0).assertEqual(true)
  expect(EnumByteJ0.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteJ0.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteJ0.third.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteJ0.first + "_").assertEqual("-42_")
  expect(EnumByteJ0.second + "_").assertEqual("-41_")
  expect(EnumByteJ0.third + "_").assertEqual("17_")
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_3100
 * @tc.name      testEnumerationWithExplicitType0329
 * @tc.desc      Using in string operator contexts
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteJ0.first instanceof ConstEnumByteJ0).assertEqual(true)
  expect(ConstEnumByteJ0.second instanceof ConstEnumByteJ0).assertEqual(true)
  expect(ConstEnumByteJ0.third instanceof ConstEnumByteJ0).assertEqual(true)
  expect(ConstEnumByteJ0.first.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteJ0.second.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteJ0.third.valueOf() instanceof byte).assertEqual(true)
  expect("_" + ConstEnumByteJ0.first).assertEqual("_-42")
  expect("_" + ConstEnumByteJ0.second).assertEqual("_-41")
  expect("_" + ConstEnumByteJ0.third).assertEqual("_17")
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_3200
 * @tc.name      testEnumerationWithExplicitType0330
 * @tc.desc      Using in string operator contexts
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(ConstEnumByteJ0.first instanceof ConstEnumByteJ0).assertEqual(true)
  expect(ConstEnumByteJ0.second instanceof ConstEnumByteJ0).assertEqual(true)
  expect(ConstEnumByteJ0.third instanceof ConstEnumByteJ0).assertEqual(true)
  expect(ConstEnumByteJ0.first.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteJ0.second.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteJ0.third.valueOf() instanceof byte).assertEqual(true)
  expect(ConstEnumByteJ0.first + "_").assertEqual("-42_")
  expect(ConstEnumByteJ0.second + "_").assertEqual("-41_")
  expect(ConstEnumByteJ0.third + "_").assertEqual("17_")
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_3300
 * @tc.name      testEnumerationWithExplicitType0331
 * @tc.desc      Using in numeric operator contexts
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteK0.first instanceof EnumByteK0).assertEqual(true)
  expect(EnumByteK0.second instanceof EnumByteK0).assertEqual(true)
  expect(EnumByteK0.third instanceof EnumByteK0).assertEqual(true)
  expect(EnumByteK0.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteK0.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteK0.third.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteK0.first).assertEqual(-1)
  expect(EnumByteK0.second).assertEqual(0)
  expect(EnumByteK0.third).assertEqual(-42)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_3400
 * @tc.name      testEnumerationWithExplicitType0332
 * @tc.desc      Using in numeric operator contexts
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteK0.first instanceof EnumByteK0).assertEqual(true)
  expect(EnumByteK0.second instanceof EnumByteK0).assertEqual(true)
  expect(EnumByteK0.third instanceof EnumByteK0).assertEqual(true)
  expect(EnumByteK0.first.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteK0.second.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteK0.third.valueOf() instanceof byte).assertEqual(true)
  expect(EnumByteK0.first + 1).assertEqual(0)
  expect(EnumByteK0.second + 1).assertEqual(1)
  expect(EnumByteK0.third + 1).assertEqual(-41)
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_4700
 * @tc.name      testEnumerationWithExplicitType0345
 * @tc.desc      Checking enumeration methods
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteL0.first instanceof EnumByteL0).assertEqual(true);
  expect(EnumByteL0.second instanceof EnumByteL0).assertEqual(true);
  expect(EnumByteL0.third instanceof EnumByteL0).assertEqual(true);
  expect(EnumByteL0.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteL0.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteL0.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteL0.first.valueOf()).assertEqual(-1);
  expect(EnumByteL0.second.valueOf()).assertEqual(27);
  expect(EnumByteL0.third.valueOf()).assertEqual(28);
});

/**
 * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_NINE_TEST_4800
 * @tc.name      testEnumerationWithExplicitType0346
 * @tc.desc      Checking enumeration methods
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it('testEnumerationWithExplicitType0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  expect(EnumByteL0.first instanceof EnumByteL0).assertEqual(true);
  expect(EnumByteL0.second instanceof EnumByteL0).assertEqual(true);
  expect(EnumByteL0.third instanceof EnumByteL0).assertEqual(true);
  expect(EnumByteL0.first.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteL0.second.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteL0.third.valueOf() instanceof byte).assertEqual(true);
  expect(EnumByteL0.first.toString()).assertEqual("-1");
  expect(EnumByteL0.second.toString()).assertEqual("27");
  expect(EnumByteL0.third.toString()).assertEqual("28");
});

  })
}
