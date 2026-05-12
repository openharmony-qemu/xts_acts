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

function foo1() {  // infer byte
  return new Byte(127);
}

function foo2() {  // infer short
  return 2 as short;
}

function foo3() {  // infer long
  return new Long(3);
}

function foo4() {  // infer float
  return 4.2;
}

function foo5() {  // infer double
  return new Double(5.3);
}

function foo6() {  // infer char
  return c'A';
}

function foo7() {  // infer String
  return new String("some str");
}

function foo8() {  // infer boolean
  return true;
}

function foo9() {  // infer null
  return null;
}

function foo10() {  // infer undefined
  return undefined;
}

function foo11() {  // infer undefined|null
  let i: undefined|null;
  return i;
}

function foo12() {  // infer undefined|null
  let i: undefined|null;
  return i;
}

function foo13() {  // infer union number|undefined|null
  let i: undefined|null|number = 1.1 as number;
  return i;
}

abstract class AC14 {  // infer abstract class
  abstract foo(): int;
}
class A14 extends AC14 {
  foo(): int { return 1 }
}
class B14 extends AC14 {
  foo(): int { return 2 }
}

function foo14(i: boolean) {
  if(i)
    return new A14();
  return new B14();
}

interface I15 {} // infer interface
interface II15 extends I15 {}
interface III15 extends I15 {}
class A15 implements II15 {}
class B15 implements III15 {}

function foo15(i: boolean) {
  if(i)
    return new A15();
  return new B15();
}

function foo16() {  // infer std::Array
  return new Array<int>(2);
}

enum ENM17 {Red, Blue}  // infer enum
function foo17() {
  return ENM17.Blue
}

type TPL18 = [number, string]  // infer tuple
function foo18() {
  let i: TPL18 = [1.1, "some str"]
  return i
}

const cstr19 = "some string"  // infer string/char
function foo19(i: boolean) {
  if(i) return cstr19
  return c'A'
}

function foo20(i: int) {
  switch(i) {
    case 1: return new Byte(1 as byte);
    case 2: return new Short(2 as short);
    case 3: return new Int(3);
    case 4: return new Long(4);
    case 5: return new Float(5);
    case 6: return 6 as number;
    case 7: return 'B';
    default: return 0;
  }
}

function foo21(i: int) {  // infer string of different size
  switch(i) {
    case 1: return "\u{D800}\u{D801}"; //surrogate
    case 2: return "\u{A123}"; // utf-16
    case 3: return "\u{00000069}"; // utf-32
    default: return "utf-8";
  }
}

interface IPerson22 {
  name: String
  age: int
}
function foo22() {  // infer object literal of interface type
  return {name: 'Bob', age: 12}  as IPerson22
}

class Person23 {
  name: String = 'username'
  age: int = 0
}
function foo23() {  // infer object literal of class type
  return {name: 'Bob', age: 12} as Person23
}

class Person24 {
  name: String = 'username'
  age: int = 0
  foo(): this {
    return this;
  }
}
function foo24() {  // infer class type from this function
  return new Person24().foo()
}

function foo25() {  // infer object literal of Record type
  let map: Record<string, number> = {'John': 25, 'Mary': 21}
  return map;
}

const lb26: () => void = () => { throw new Error('never returns') }

class Person27 {
  name: String = 'username'
  age: int = 0
}

class Person28  {
  name: String = 'username'
  age: int = 0
  static build() {
    return new Person28()
  }
}

class Person29  {
  name: String = 'username'
  age: int = 0
  lb = () => { return this }
}

class HighLevelFunctionClass30  {
  lb = () => { return 0 }
  rtl() {
    return this.lb
  }
}

class HighLevelFunctionClass31  {
  lb = () => { return 0 }
  static rts() {
    return new HighLevelFunctionClass31().lb
  }
}

interface IMy32 {}
class MyClass32 implements IMy32 {
}

function getMyClass32(...val: IMy32[]) {
  return val[0]
}

function getArrayLength33(...val: IMy32[]) {
  return val.length
}

const a34: 'string literal' = 'string literal'

function getASL34() {
  return a34
}

function getSumASL35() {
  return a34 + a34
}

function getType36() {
  return typeof a34
}

function getInstanceofCheck37() {
  return  a34 instanceof String
}

export default function ReturnTypeInferenceTest04():void {
  describe('ReturnTypeInferenceTest04', () => {
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
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0100
     * @tc.name      testRetTypeInfer0001
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo1() == new Byte(127)).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0200
     * @tc.name      testRetTypeInfer0002
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo2() == new Short(2 as short)).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0300
     * @tc.name      testRetTypeInfer0003
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo3() == new Long(3)).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0400
     * @tc.name      testRetTypeInfer0004
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo4() == 4.2).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0500
     * @tc.name      testRetTypeInfer0005
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo5() == new Double(5.3)).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0600
     * @tc.name      testRetTypeInfer0006
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo6() == c'A').assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0700
     * @tc.name      testRetTypeInfer0007
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b = foo7();
      expect(b instanceof String).assertTrue();
      expect(b == "some str").assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0800
     * @tc.name      testRetTypeInfer0008
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo8()).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_0900
     * @tc.name      testRetTypeInfer0009
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo9() == null).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1000
     * @tc.name      testRetTypeInfer0010
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo10() == undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1100
     * @tc.name      testRetTypeInfer0011
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo11() == undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1200
     * @tc.name      testRetTypeInfer0012
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo12() == undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1300
     * @tc.name      testRetTypeInfer0013
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: number = foo13() as number;
      expect(i == 1.1 as number).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1400
     * @tc.name      testRetTypeInfer0014
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = foo14(true);
      expect(i instanceof A14).assertTrue();
      expect(i instanceof B14).assertFalse();
      let j = foo14(false);
      expect(j instanceof B14).assertTrue();
      expect(j instanceof A14).assertFalse();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1500
     * @tc.name      testRetTypeInfer0015
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = foo15(true);
      let j = foo15(false);
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1600
     * @tc.name      testRetTypeInfer0016
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo16() instanceof Array).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1700
     * @tc.name      testRetTypeInfer0017
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: ENM17 = foo17()
      expect(i == ENM17.Blue).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1800
     * @tc.name      testRetTypeInfer0018
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = foo18()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_1900
     * @tc.name      testRetTypeInfer0019
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo19(true) == cstr19).assertTrue();
      expect(foo19(false) == c'A').assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2000
     * @tc.name      testRetTypeInfer0020
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo20(1) == 1).assertTrue()
      expect(foo20(2) == 2).assertTrue()
      expect(foo20(3) == 3).assertTrue()
      expect(foo20(4) == 4).assertTrue()
      expect(foo20(5) == 5).assertTrue()
      expect(foo20(6) == 6).assertTrue()
      expect(foo20(7) == "B").assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2100
     * @tc.name      testRetTypeInfer0021
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo21(1) == "\u{D800}\u{D801}").assertTrue()
      expect(foo21(2) == "\u{A123}").assertTrue()
      expect(foo21(3) == "\u{00000069}").assertTrue()
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2200
     * @tc.name      testRetTypeInfer0022
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo22() instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2300
     * @tc.name      testRetTypeInfer0023
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo23() instanceof Person23).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2400
     * @tc.name      testRetTypeInfer0024
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo24() instanceof Person24).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2500
     * @tc.name      testRetTypeInfer0025
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo25() instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2600
     * @tc.name      testRetTypeInfer0026
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        lb26()
        expect(false).assertTrue()
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2700
     * @tc.name      testRetTypeInfer0027
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lb: () => Person27 = () => { return {name: 'Bob', age: 12} as Person27 }
      expect(lb() instanceof Person27).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2800
     * @tc.name      testRetTypeInfer0028
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Person28.build() instanceof Person28).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_2900
     * @tc.name      testRetTypeInfer0029
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Person29().lb() instanceof Person29).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3000
     * @tc.name      testRetTypeInfer0030
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new HighLevelFunctionClass30().rtl() instanceof Function).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3100
     * @tc.name      testRetTypeInfer0031
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(HighLevelFunctionClass31.rts() instanceof Function).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3200
     * @tc.name      testRetTypeInfer0032
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let classes: IMy32[] = [new MyClass32(), new MyClass32()]
      expect(getMyClass32(...classes) instanceof MyClass32).assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3300
     * @tc.name      testRetTypeInfer0033
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let classes: IMy32[] = [new MyClass32(), new MyClass32()];
      let len = getArrayLength33(...classes);
      expect(len).assertEqual(2);
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3400
     * @tc.name      testRetTypeInfer0034
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof getASL34() === 'string').assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3500
     * @tc.name      testRetTypeInfer0035
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof getSumASL35() === 'string').assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3600
     * @tc.name      testRetTypeInfer0036
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof getType36() === 'string').assertTrue();
    });

    /**
     * @tc.number    SUB_RETURN_TYPE_INFERENCETESTFOUR_3700
     * @tc.name      testRetTypeInfer0037
     * @tc.desc      An omitted function or method return type can be inferred from the function
     * or the method body.
     * to a numeric target type from the context.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRetTypeInfer0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof getInstanceofCheck37() === 'boolean').assertTrue();
    });

  })
}