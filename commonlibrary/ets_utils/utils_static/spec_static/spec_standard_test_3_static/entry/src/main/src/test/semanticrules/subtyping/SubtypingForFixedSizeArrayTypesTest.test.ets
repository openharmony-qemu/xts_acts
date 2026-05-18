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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

interface I {}
interface J extends I { j: int }
class Base {}
class Derived extends Base {}
type CustomArr<T extends Base> = FixedArray<T>

let x: FixedArray<Number> = [1,2,3]
let y: FixedArray<Object> = x

function foo(ca: FixedArray<Object>) {
  ca[0] = new Object()
}

let x1: FixedArray<Boolean> = [true, false, true]
let y1: FixedArray<Object> = x1

function foo1(ca: FixedArray<Object>) {
  ca[0] = new Object()
}

let x2: FixedArray<J> = [{j: 1}, {j: 2}]
let y2: FixedArray<I> = x2

function foo2(ca: FixedArray<I>) {
  ca[0] = {}
}

let x3: FixedArray<bigint> = [123n, 1_123n, -123n]
let y3: FixedArray<Object> = x3

function foo3(ca: FixedArray<Object>) {
  ca[0] = new Object()
}

let x4: FixedArray<'1'|'2'|'3'> = ['1','2','3']
let y4: FixedArray<'1'|'2'|'3'|number|'4'> = x4

function foo4(ca: FixedArray<'1'|'2'|'3'|number|'4'>) {
  ca[0] = 1
}

let x5: FixedArray<[Base, J, string]> = [[new Base(), {j: 1}, 'a'], [new Derived(), {j: 2}, 'b']]
let y5: FixedArray<Object> = x5

function foo5(ca: FixedArray<Object>) {
  ca[0] = new Object
}
let x6: FixedArray<string[]> = [["a", "b"],["a", "b"]]
let y6: FixedArray<Object> = x6

function foo6(ca: FixedArray<Object>) {
  ca[0] = new Object()
}
let x7: FixedArray<Derived> = [new Derived, new Derived]
let y7: FixedArray<Base> = x7

function foo7(ca: FixedArray<Base>) {
  ca[0] = new Base
}

let x8: FixedArray<String> = ['1','2','3']
let y8: FixedArray<Object> = x8

function foo8(ca: FixedArray<Object>) {
  ca[0] = new Object()
}
let x9: FixedArray<'a'> = ['a','a','a']
let y9: FixedArray<Object> = x9

function foo9(ca: FixedArray<Object>) {
  ca[0] = new Object()
}

let x10: FixedArray<Base|Derived> = [new Base(), new Derived()]
let y10: FixedArray<Object> = x10

function foo10(ca: FixedArray<Object>) {
  ca[0] = new Object()
}
let x11: CustomArr<Derived> = [new Derived(), new Derived()]
let y11: FixedArray<Base> = x11

function foo11(ca: FixedArray<Base>) {
  ca[0] = new Base()
}

let x12: FixedArray<Number> = [1,2,3]
let y12: FixedArray<Object> = x12

let x13: FixedArray<boolean> = [true, false, true]
let y13: FixedArray<Object> = x13

let x14: FixedArray<J> = [{j: 1}, {j: 2}]
let y14: FixedArray<I> = x14

let x15: FixedArray<bigint> = [123n, 1_123n, -123n]
let y15: FixedArray<Object> = x15

let x16: FixedArray<string[]> = [["a", "b"],["a", "b"]]
let y16: FixedArray<Object> = x16

let x17: FixedArray<null> = [null, null, null]
let y17: FixedArray<Any> = x17

let x18: FixedArray<undefined> = [undefined, undefined, undefined]
let y18: FixedArray<Any> = x18

let x19: FixedArray<Derived> = [new Derived, new Derived]
let y19: FixedArray<Base> = x19

let x20: FixedArray<String> = ['1','2','3']
let y20: FixedArray<Object> = x20

let x21: FixedArray<'a'> = ['a','a','a']
let y21: FixedArray<Object> = x21

let x22: FixedArray<'1'|'2'|'3'> = ['1','2','3']
let y22: FixedArray<'1'|'2'|'3'|'4'> = x22

let x23: FixedArray<Base | Derived> = [new Base(), new Derived()]
let y23: FixedArray<Object> = x23

let x24: FixedArray<String|Number> = ['1', 1, 2]
let y24: FixedArray<Object> = x24

let x25: FixedArray<[Base, J, string]> = [[new Base(), {j: 1}, 'a'], [new Derived(), {j: 2}, 'b']]
let y25: FixedArray<Object> = x25

let x26: CustomArr<Derived> = [new Derived(), new Derived()]
let y26: FixedArray<Base> = x26

let x27: FixedArray<'1'|'2'|'3'> = ['1','2','3']
let y27: FixedArray<'1'|'2'|'3'|'4'> = x27

function foo12(ca: FixedArray<'1'|'2'|'3'|'4'>) {
  ca[0] = '4'
}
let x28: FixedArray<'1'|'2'|'3'> = ['1','2','3']
let y28: FixedArray<Object> = x28

function foo13(ca: FixedArray<Object>) {
  ca[0] = '4'
}
export default function SubtypingForFixedSizeArrayTypesTest(): void {
  describe('SubtypingForFixedSizeArrayTypesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0100
     * @tc.name      testNegativeTypeSafety0001
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck = (e: Error): boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught = false;
      try {
        foo(y);
      } catch (error) {
        caught = exceptionCheck(error as Error);
      }

      expect(caught).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0200
     * @tc.name      testNegativeTypeSafety0002
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck1 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught1 = false;
      try {
        foo1(y1);
      } catch (error) {
        caught1 = exceptionCheck1(error as Error);
      }
      expect(caught1).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0300
     * @tc.name      testNegativeTypeSafety0003
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck2 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught2 = false;
      try {
        foo2(y2);
      } catch (error) {
        caught2 = exceptionCheck2(error as Error);
      }
      expect(caught2).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0400
     * @tc.name      testNegativeTypeSafety0004
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck3 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught3 = false;
      try {
        foo3(y3);
      } catch (error) {
        caught3 = exceptionCheck3(error as Error);
      }
      expect(caught3).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0500
     * @tc.name      testNegativeTypeSafety0005
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck4 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught4 = false;
      try {
        foo4(y4);
      } catch (error) {
        caught4 = exceptionCheck4(error as Error);
      }
      expect(caught4).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0600
     * @tc.name      testNegativeTypeSafety0006
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck5 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught5 = false;
      try {
        foo5(y5);
      } catch (error) {
        caught5 = exceptionCheck5(error as Error);
      }
      expect(caught5).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0700
     * @tc.name      testNegativeTypeSafety0007
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck6 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught6 = false;
      try {
        foo6(y6);
      } catch (error) {
        caught6 = exceptionCheck6(error as Error);
      }
      expect(caught6).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0800
     * @tc.name      testNegativeTypeSafety0008
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck7 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught7 = false;
      try {
        foo7(y7);
      } catch (error) {
        caught7 = exceptionCheck7(error as Error);
      }
      expect(caught7).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_0900
     * @tc.name      testNegativeTypeSafety0009
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck8 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught8 = false;
      try {
        foo8(y8);
      } catch (error) {
        caught8 = exceptionCheck8(error as Error);
      }
      expect(caught8).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1000
     * @tc.name      testNegativeTypeSafety0010
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck9 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught9 = false;
      try {
        foo9(y9);
      } catch (error) {
        caught9 = exceptionCheck9(error as Error);
      }
      expect(caught9).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1100
     * @tc.name      testNegativeTypeSafety0011
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck10 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught10 = false;
      try {
        foo10(y10);
      } catch (error) {
        caught10 = exceptionCheck10(error as Error);
      }
      expect(caught10).assertEqual(true);

    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1200
     * @tc.name      testNegativeTypeSafety0012
     * @tc.desc      'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
     *               <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let exceptionCheck11 = (e: Error): Boolean => {
        return e instanceof ArrayStoreError &&
        (e as ArrayStoreError).message.includes('cannot be stored in an array of type');
      };

      let caught11 = false;
      try {
        foo11(y11);
      } catch (error) {
        caught11 = exceptionCheck11(error as Error);
      }
      expect(caught11).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1300
     * @tc.name      testNegativeTypeSafety0013
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y12 instanceof FixedArray<Number>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1400
     * @tc.name      testNegativeTypeSafety0014
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y13 instanceof FixedArray<Boolean>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1500
     * @tc.name      testNegativeTypeSafety0015
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y14 instanceof FixedArray<J>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1600
     * @tc.name      testNegativeTypeSafety0016
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y15 instanceof FixedArray<BigInt>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1700
     * @tc.name      testNegativeTypeSafety0017
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y16 instanceof FixedArray<Array>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1800
     * @tc.name      testNegativeTypeSafety0018
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y17 instanceof FixedArray<null>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_1900
     * @tc.name      testNegativeTypeSafety0019
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(y18 instanceof FixedArray<undefined>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2000
     * @tc.name      testNegativeTypeSafety0020
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y19 instanceof FixedArray<Base>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2100
     * @tc.name      testNegativeTypeSafety0021
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y20 instanceof FixedArray<String>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2200
     * @tc.name      testNegativeTypeSafety0022
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y21 instanceof FixedArray<String>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2300
     * @tc.name      testNegativeTypeSafety0023
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y22 instanceof FixedArray<'1'|'2'|'3'>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2400
     * @tc.name      testNegativeTypeSafety0024
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y23 instanceof FixedArray<Base>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2500
     * @tc.name      testNegativeTypeSafety0025
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y24 instanceof FixedArray<Object>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2600
     * @tc.name      testNegativeTypeSafety0026
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y25 instanceof FixedArray<[Base, J, string]>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NEGATIVE_TYPE_SAFETY_2700
     * @tc.name      testNegativeTypeSafety0027
     * @tc.desc     'Fixed-size array types are covariant and are formally defined as follows: FixedSize<B>
    <: FixedSize<A> if B <: A.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(y26 instanceof FixedArray<Derived>).assertEqual(true);
    });

    /**
     * @tc.number    SUB_POSITIVE_TYPE_SAFETY_0100
     * @tc.name      testNegativeTypeSafety0028
     * @tc.desc      Union of string literals in FixedArray erased to FixedArray<String> in runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      foo12(x27)
      foo12(y27)
      expect(x27[0]).assertEqual('4');
      expect(y27[0]).assertEqual('4');
    });

    /**
     * @tc.number    SUB_POSITIVE_TYPE_SAFETY_0200
     * @tc.name      testNegativeTypeSafety0029
     * @tc.desc      Union of string literals in FixedArray erased to FixedArray<String> in runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNegativeTypeSafety0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      foo13(x28)
      foo13(y28)
      expect(x28[0]).assertEqual('4');
      expect(y28[0]).assertEqual('4');
    });
  })
}
