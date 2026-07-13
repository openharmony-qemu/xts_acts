'use static'
/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,
  Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';

import Utils from '../../../Util.test'


class A {}
class B extends A {}
function f(this: B): number { return 2 }
function f(this: A): number { return 1 }

function f_a(this: Int): number { return 1 }
function f_b(this: Double): number { return 2 }
overload f1 { f_b, f_a }

class A1 {}
class B1 extends A1 {}
function f_a1(this: A1): number { return 1 }
function f_b1(this: B1): number { return 2 }
overload f2 { f_b1, f_a1 }

interface IReceiver {}
class A2 implements IReceiver {
  foo(): string { return 'Call A2: foo' }
}
class B2 extends A2 {}
function foo(this: IReceiver): string { return 'Call receiver' }

class DSL {
}
function run(this: DSL, call: (this: DSL) => string): string {
  return call(this) + '-' + call(this)
}

type TR = (this: DSL1) => string
class DSL1 {
}
function run1(this: DSL1, call1: (this: DSL1) => string): string {
  return call1(this) + '-' + call1(this)
}

export default function FunctionsWithReceiverTest():void{
  describe('FunctionsWithReceiverTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await Utils.msSleep(30);
    })

    afterEach(() => {})

    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTIONS_WITH_RECEIVERTEST_0100
     * @tc.name      testFunctionsWithReceiver0001
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first mandatory parameter uses keyword this as its name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsWithReceiver0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A()
      let b: B = new B()
      expect(a.f()).assertEqual(1);
      expect(b.f()).assertEqual(2);
      a = new B()
      expect(a.f()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FUNCTIONS_WITH_RECEIVERTEST_0200
     * @tc.name      testFunctionsWithReceiver0002
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first mandatory parameter uses keyword this as its name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsWithReceiver0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A = new A()
      let b: B = new B()
      expect(f(a)).assertEqual(1);
      expect(f(b)).assertEqual(2);
      a = new B()
      expect(f(a)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FUNCTIONS_WITH_RECEIVERTEST_0400
     * @tc.name      testFunctionsWithReceiver0004
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first mandatory parameter uses keyword this as its name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsWithReceiver0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: A1 = new A1()
      let b1: B1 = new B1()
      expect(f2(a1)).assertEqual(1);
      expect(f2(b1)).assertEqual(2);
      a1 = b1
      expect(f2(a1)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_FUNCTIONS_WITH_RECEIVERTEST_0600
     * @tc.name      testFunctionsWithReceiver0006
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first mandatory parameter uses keyword this as its name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsWithReceiver0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bb: B2 = new B2;
      expect('Call A2: foo').assertEqual(bb.foo());
    });

    /**
     * @tc.number    SUB_FUNCTIONS_WITH_RECEIVERTEST_0700
     * @tc.name      testFunctionsWithReceiver0007
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first mandatory parameter uses keyword this as its name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsWithReceiver0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dsl = new DSL
      expect('Call A: run-Call A: run').assertEqual(dsl.run((this: DSL) => 'Call A: run'));
    });

    /**
     * @tc.number    SUB_FUNCTIONS_WITH_RECEIVERTEST_0800
     * @tc.name      testFunctionsWithReceiver0008
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first mandatory parameter uses keyword this as its name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsWithReceiver0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dsl = new DSL1
      let alias = run1
      let tc: TR = (this: DSL1) => 'Call A: run'
      expect('Call A: run-Call A: run').assertEqual(alias(dsl, tc));
    });
  })
}
