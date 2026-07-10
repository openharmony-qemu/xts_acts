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
  afterAll,
  afterEach,
  beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'

function foo1(x: boolean) { let v = x; const c = x; }
function foo2(x: number) { let v = x; const c = x; }
function foo4(x: string) { let v = x; const c = x; }
function foo5(x: bigint) { let v = x; const c = x; }
function foo7(x: null) { let v = x; const c = x; }
function foo8(x: undefined) { let v = x; const c = x; }
function foo9(x: Object) { let v = x; const c = x; }
function foo10(x: RegExp) { let v = x; const c = x; }
function foo11(x: number[]) { let v = x; const c = x; }
function foo12(x: number | null) { let v = x; const c = x; }

function testDeclarationTypeInference() {
  foo1(false);
  foo2(1);
  foo3(3.14);
  foo4("foo");
  foo5(42n);
  foo6(42n);
  foo7(null);
  foo8(undefined);
  foo9(new Object());
  foo10(new RegExp("ab"));
  foo11([3.14, 42]);
  foo12(13);
}

let va1 = 1;
const ca1 = va1;
const cb1 = 1;
let vb1 = cb1;
class C1 { fa = ca1; fb = vb1; }

let va2 = 3.14;
const ca2 = va2;
const cb2 = 3.14;
let vb2 = cb2;
class C2 { fa = ca2; fb = vb2; }

let va3 = "string";
const ca3 = va3;
const cb3 = "string";
let vb3 = cb3;
class C3 { fa = ca3; fb = vb3; }

function testExpressionTypeEvaluation1() {
  new C1().fa = va1;
  new C1().fb = cb1;
  new C2().fa = va2;
  new C2().fb = cb2;
  new C3().fa = va3;
  new C3().fb = cb3;
}

let va4 = 42n;
const ca4 = va4;
const cb4 = 42n;
let vb4 = cb4;
class C4 { fa = ca4; fb = vb4; }

let va5 = null;
const ca5 = va5;
const cb5 = null;
let vb5 = cb5;
class C5 { fa = ca5; fb = vb5; }

let va6 = undefined;
const ca6 = va6;
const cb6 = undefined;
let vb6 = cb6;
class C6 { fa = ca6; fb = vb6; }

let va7 = new Object();
const ca7 = va7;
const cb7 = new Object();
let vb7 = cb7;
class C7 { fa = ca7; fb = vb7; }

let va8 = [3.14, 42];
const ca8 = va8;
const cb8 = [3.14, 42];
let vb8 = cb8;
class C8 { fa = ca8; fb = vb8; }

function testExpressionTypeEvaluation2() {
  new C4().fa = va4;
  new C4().fb = cb4;
  new C5().fa = va5;
  new C5().fb = cb5;
  new C6().fa = va6;
  new C6().fb = cb6;
  new C7().fa = va7;
  new C7().fb = cb7;
  new C8().fa = va8;
  new C8().fb = cb8;
}

export default function SpecificsOfVariableInitializationContext(): void{
  describe('SpecificsOfVariableInitializationContext', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_SPECIFICS_OF_VARIABLE_INITIALIZATION_CONTEXT_0100
     * @tc.name      testDeclarationTypeInference0001
     * @tc.desc      The type of the right-hand-side expression is known from the expression itself, then this type
     * becomes the type of the variable as in the example below
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeclarationTypeInference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      testDeclarationTypeInference();
      expect(1 + 1).assertEqual(2);
    });

    /**
     * @tc.number    SUB_BASEDATE_SPECIFICS_OF_VARIABLE_INITIALIZATION_CONTEXT_0200
     * @tc.name      testExpressionTypeEvaluation0001
     * @tc.desc      Otherwise, the type of expr is evaluated as type of a standalone expression as in the example below
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionTypeEvaluation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      testExpressionTypeEvaluation1();
      testExpressionTypeEvaluation2();
      expect(va1).assertEqual(1);
      expect(va3).assertEqual("string");
      expect(va4).assertEqual(42n);
      expect(va8.length).assertEqual(2);
    });
  });
}