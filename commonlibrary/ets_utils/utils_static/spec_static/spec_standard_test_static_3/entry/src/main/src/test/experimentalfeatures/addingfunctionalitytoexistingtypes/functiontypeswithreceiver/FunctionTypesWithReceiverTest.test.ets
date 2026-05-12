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
  Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


class A {}
type T = (this: A) => int;

interface I {}
type T1 = (this: I) => int;

type T2 = (this: boolean[]) => boolean

class A1 {}
type t1 = (this: A1) => boolean
type t2 = (a: A1) => boolean
function foo(this: A1): boolean { return true }
function bar(a: A1): boolean { return false }


export default function FunctionTypesWithReceiverTest() :void{
  describe('FunctionTypesWithReceiverTest', () => {
    beforeAll(() => {})

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {})

    afterAll(() => {})

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0100
     * @tc.name      testFunctionTypesWithReceiver0001
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: A = new A()
      let t: T = (this: A): int => { return 1 }
      expect(t(a)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0200
     * @tc.name      testFunctionTypesWithReceiver0002
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: A = new A()
      let t: T = (this: A): int => { return 1 }
      expect(a.t()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0300
     * @tc.name      testFunctionTypesWithReceiver0003
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let i: I = {}
      let t: T1 = (this: I): int => { return 1 }
      expect(t(i)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0400
     * @tc.name      testFunctionTypesWithReceiver0004
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let i: I = {}
      let t: T1 = (this: I): int => { return 1 }
      expect(i.t()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0500
     * @tc.name      testFunctionTypesWithReceiver0005
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b: boolean[] = [true, false]
      let t: T2 = (this: boolean[]): boolean => { return true }
      expect(t(b)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0600
     * @tc.name      testFunctionTypesWithReceiver0006
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let b: boolean[] = [true, false]
      let t: T2 = (this: boolean[]): boolean => { return true }
      expect(b.t()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_FUNCTION_TYPES_WITH_RECEIVER_0700
     * @tc.name      testFunctionTypesWithReceiver0007
     * @tc.desc      A function with receiver declaration is a top-level declaration (see Top-Level
    Declarations) that looks almost the same as Function Declarations, except that the
    first parameter is mandatory, and the keyword this is used as its name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionTypesWithReceiver0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let f: t1 = foo
      let b: t2 = bar
      let a: A1 = new A1()
      expect(b(a)).assertEqual(false);
      b = foo
      f = b
      expect(b(a)).assertEqual(true);
      expect(f(a)).assertEqual(true);
      expect(a.f()).assertEqual(true);
    });


  })
}







