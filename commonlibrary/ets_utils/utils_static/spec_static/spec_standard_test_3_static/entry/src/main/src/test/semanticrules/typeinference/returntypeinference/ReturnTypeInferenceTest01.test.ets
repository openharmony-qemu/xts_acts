/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

let i = 0;
function foo() {  // infer void
  i += 1;
}

let i1 = 0;
function foo1() {  // infer void
  i1 += 1;
  return;
}

let s2 = "foo";
function foo2() {  // infer string
  return s2;
}

let s3: int = 42;
function foo3() {  // infer int
  return s3;
}

let s4: number = 1.0;
function foo4() {  // infer number
  return s4;
}

let s5 = new Error();
function foo5() {  // infer Error
  return s5;
}

let s6: number[] = [1.0, 2.0, 3.0];
function foo6() {  // infer number[]
  return s6;
}

let s7: Boolean[] = [];
function foo7() {  // infer Boolean[]
  return s7;
}

let s8: Long[][] = [[new Long(0)]];
function foo8() {  // infer Long[][]
  if (s8 != null)
    return s8;
  else
    return [[new Long(0), new Long(0)], [new Long(0), new Long(0)]];
}


let s9: long[][] = [[0 as long]];
function foo9() {  // infer Error[][]|long[][]
  if (s9 != null)
    return s9;
  else
    return [[new Error()]]; //  Error[][]
}

let s10: Long[][] | null = null;
function foo10() {  // infer Error[]|Long[][]
  if (s10 == null)
    return s10;
  else
    return [new Error()];
}

let s11: Long[][] | null = [[new Long(0)]];
function foo11() {  // infer Error|Long[][]
  if (s11 != null)
    return s11;
  else
    return new Error();
}

class A12 {}
class B12 extends A12 {}
class C12 extends A12 {}
type TypeB = B12;
type TypeC = C12;
let s12 = 1;

function foo12() {  // infer A12
  if (s12 == 0)
    return new TypeB();
  else
    return new TypeC();
}

class A13 {}
class B13 extends A13 {}
class C13 extends B13 {}
class D13 extends B13 {}
let s13 = 1;

function foo13() {  // infer B13
  if (s13 == 0)
    return new C13();
  else
    return new D13();
}

let s14 = 0;
async function foo14() {  // infer Promise<Boolean>
  if (s14 == 0)
    return new Boolean(true);
  else
    return new Boolean(false);
}

let s15 = new Object();
function foo15() {    // infer boolean|boolean[]
  if (s15 != null)
    return true;
  else
    return [true];
}

class B16<T, U> {}
let s16 = 1;

function foo16<T>() {  // infer B16<T, Long|Error>
  if (s16== 0)
    return new B16<T, Long>();
  else
    return new B16<T, Error>();
}

export default function ReturnTypeInferenceTest01():void {
  describe('ReturnTypeInferenceTest01', () => {
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
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0100
     * @tc.name      testRetType0001
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      i = 0;
      foo();
      expect(i == 1).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0200
     * @tc.name      testRetType0002
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      i1 = 0;
      foo1();
      expect(i1 == 1).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0300
     * @tc.name      testRetType0003
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = foo2();
      expect(v == "foo").assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0400
     * @tc.name      testRetType0004
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: int = foo3();
      expect(v == 42).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0500
     * @tc.name      testRetType0005
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = foo4();
      expect(v == 1.0).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0600
     * @tc.name      testRetType0006
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Error = foo5();
      expect(v instanceof Error).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0700
     * @tc.name      testRetType0007
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo6();
      expect(v instanceof Array && v.length == 3).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0800
     * @tc.name      testRetType0008
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo7();
      expect(v instanceof Array && v.length == 0).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_0900
     * @tc.name      testRetType0009
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Long[][] = foo8();
      expect(v instanceof Array).assertTrue();
      expect(v[0] instanceof Array).assertTrue();
      expect(v[0][0] instanceof Long).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1000
     * @tc.name      testRetType0010
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long[][] = foo9() as Object as long[][];
      v[0][0] = 0 as long;
      expect(v[0][0] == 0).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1100
     * @tc.name      testRetType0011
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo10();
      expect(v === null).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1200
     * @tc.name      testRetType0012
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo11();
      expect(v instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1300
     * @tc.name      testRetType0013
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A12 = foo12();
      expect(v instanceof A12).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1400
     * @tc.name      testRetType0014
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B13[] = [];
      let res = foo13();
      v.push(res);
      expect(res instanceof D13).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1500
     * @tc.name      testRetType0015
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let v: Promise<Boolean> = foo14();
      expect(v instanceof Promise).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1600
     * @tc.name      testRetType0016
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo15();
      expect(v == true).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTONE_1700
     * @tc.name      testRetType0017
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = foo16<Boolean>();
      expect(v instanceof B16).assertTrue();
    });

  })
}