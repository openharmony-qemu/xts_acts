'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

interface UserInfo009 { name: string; age: number }

interface Point015 { x: number; y: number }

class Dog031 {
  name: string = "Buddy"
  age: number = 3
}

class EitherImpl<L, R> {
  private readonly isLeftValue: boolean;
  private readonly leftValue?: L;
  private readonly rightValue?: R;

  constructor(isLeft: boolean, leftValue?: L, rightValue?: R) {
    this.isLeftValue = isLeft;
    this.leftValue = leftValue;
    this.rightValue = rightValue;
  }

  static left<L, R>(value: L): EitherImpl<L, R> {
    return new EitherImpl<L, R>(true, value);
  }

  static right<L, R>(value: R): EitherImpl<L, R> {
    return new EitherImpl<L, R>(false, undefined, value);
  }

  get left(): L {
    if (!this.isLeftValue) {
      throw new Error("Cannot access left value of Right instance");
    }
    return this.leftValue as L;
  }

  get right(): R {
    if (this.isLeftValue) {
      throw new Error("Cannot access right value of Left instance");
    }
    return this.rightValue as R;
  }

  isLeft(): boolean {
    return this.isLeftValue;
  }

  isRight(): boolean {
    return !this.isLeftValue;
  }
}

export default function EitherLeftTest(): void {
  describe('EitherLeftTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0100
     * @tc.name testEitherLeft0001
     * @tc.desc Verify Left instance reads left property via getter normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      let value: number = either.left
      expect(value).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0200
     * @tc.name testEitherLeft0002
     * @tc.desc Verify Either.left getter returns the wrapped left value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      expect(either.left).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0300
     * @tc.name testEitherLeft0003
     * @tc.desc Verify optional chaining access to left property on Either instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either: EitherImpl<number, string> | null = EitherImpl.left<number, string>(42)
      let value = either?.left
      expect(value).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0500
     * @tc.name testEitherLeft0005
     * @tc.desc Verify left returns string value when generic L is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<string, number>("hello")
      let value: string = either.left
      expect(value).assertEqual("hello")
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0600
     * @tc.name testEitherLeft0006
     * @tc.desc Verify left returns boolean value when generic L is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<boolean, string>(true)
      let value: boolean = either.left
      expect(value).assertEqual(true)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0700
     * @tc.name testEitherLeft0007
     * @tc.desc Verify left returns various number special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<number, string>(0)
      expect(e1.left).assertEqual(0)
      let e2 = EitherImpl.left<number, string>(-100)
      expect(e2.left).assertEqual(-100)
      let e3 = EitherImpl.left<number, string>(Number.MAX_VALUE)
      expect(e3.left).assertEqual(Number.MAX_VALUE)
      let e4 = EitherImpl.left<number, string>(Number.MIN_VALUE)
      expect(e4.left).assertEqual(Number.MIN_VALUE)
      let e5 = EitherImpl.left<number, string>(Number.NaN)
      expect(Number.isNaN(e5.left)).assertTrue()
      let e6 = EitherImpl.left<number, string>(Number.POSITIVE_INFINITY)
      expect(e6.left).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0800
     * @tc.name testEitherLeft0008
     * @tc.desc Verify left returns various string special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<string, number>("")
      expect(e1.left).assertEqual("")
      let e2 = EitherImpl.left<string, number>(" ")
      expect(e2.left).assertEqual(" ")
      let e3 = EitherImpl.left<string, number>("你好世界")
      expect(e3.left).assertEqual("你好世界")
      let longStr: string = "a".repeat(10000)
      let e4 = EitherImpl.left<string, number>(longStr)
      expect(e4.left.length).assertEqual(10000)
      let e5 = EitherImpl.left<string, number>("\n\t\r")
      expect(e5.left).assertEqual("\n\t\r")
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_0900
     * @tc.name testEitherLeft0009
     * @tc.desc Verify left returns object reference when L is object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let user: UserInfo009 = { name: "Alice", age: 30 }
      let either = EitherImpl.left<UserInfo009, string>(user)
      let value: UserInfo009 = either.left
      expect(value.name).assertEqual("Alice")
      expect(value.age).assertEqual(30)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1000
     * @tc.name testEitherLeft0010
     * @tc.desc Verify left returns array when L is array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let either = EitherImpl.left<number[], string>(arr)
      let value: number[] = either.left
      expect(value.length).assertEqual(5)
      expect(value[0]).assertEqual(1)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1100
     * @tc.name testEitherLeft0011
     * @tc.desc Verify left returns null when L is null type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<null, string>(null)
      let value: null = either.left
      expect(value).assertNull()
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1200
     * @tc.name testEitherLeft0012
     * @tc.desc Verify left returns undefined when L is undefined type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<undefined, string>(undefined)
      let value: undefined = either.left
      expect(value).assertUndefined()
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1300
     * @tc.name testEitherLeft0013
     * @tc.desc Verify left return value type matches generic L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      let value: number = either.left
      expect(typeof value === "number").assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1400
     * @tc.name testEitherLeft0014
     * @tc.desc Verify left return value type inference under different generic parameterized types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<string, number>("test")
      let v1: string = e1.left
      expect(typeof v1 === "string").assertTrue()
      let e2 = EitherImpl.left<boolean, string>(false)
      let v2: boolean = e2.left
      expect(typeof v2 === "boolean").assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1500
     * @tc.name testEitherLeft0015
     * @tc.desc Verify return value structural integrity when L is composite type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let point: Point015 = { x: 10, y: 20 }
      let either = EitherImpl.left<Point015, string>(point)
      let value: Point015 = either.left
      expect(value instanceof Object).assertTrue()
      expect(value.x).assertEqual(10)
      expect(value.y).assertEqual(20)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1600
     * @tc.name testEitherLeft0016
     * @tc.desc Verify return value when L is nested Either type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inner = EitherImpl.left<number, string>(100)
      let outer = EitherImpl.left<EitherImpl<number, string>, boolean>(inner)
      let value: EitherImpl<number, string> = outer.left
      expect(value.left).assertEqual(100)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1700
     * @tc.name testEitherLeft0017
     * @tc.desc Verify return value when L is union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<number | string, boolean>(42)
      expect(e1.left).assertEqual(42)
      let e2 = EitherImpl.left<number | string, boolean>("hello")
      expect(e2.left).assertEqual("hello")
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1800
     * @tc.name testEitherLeft0018
     * @tc.desc Verify accessing left property on Right instance throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.right<number, string>("error")
      try {
        let value: number = either.left
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_1900
     * @tc.name testEitherLeft0019
     * @tc.desc Verify Right instances with different generic types all throw Error when accessing left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.right<number, string>("err")
      try {
        let v = e1.left
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      let e2 = EitherImpl.right<string, boolean>(false)
      try {
        let v = e2.left
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_2000
     * @tc.name testEitherLeft0020
     * @tc.desc Verify thrown error is an Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.right<number, string>("error")
      try {
        let value = either.left
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_2300
     * @tc.name testEitherLeft0023
     * @tc.desc Verify error propagates correctly when accessing left in nested try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inner = EitherImpl.right<number, string>("inner")
      let outer = EitherImpl.left<EitherImpl<number, string>, boolean>(inner)
      let eitherValue = outer.left
      try {
        let value = eitherValue.left
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_2700
     * @tc.name testEitherLeft0027
     * @tc.desc Verify left property is public and accessible from any scope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(99)
      expect(either.left).assertEqual(99)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_2800
     * @tc.name testEitherLeft0028
     * @tc.desc Verify left behavior when generic L is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(3.14)
      expect(either.left).assertEqual(3.14)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_2900
     * @tc.name testEitherLeft0029
     * @tc.desc Verify left behavior when generic L is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<string, number>("hello")
      expect(either.left).assertEqual("hello")
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3000
     * @tc.name testEitherLeft0030
     * @tc.desc Verify left behavior when generic L is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<boolean, string>(true)
      expect(either.left).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3100
     * @tc.name testEitherLeft0031
     * @tc.desc Verify left behavior when generic L is custom object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let dog = new Dog031()
      let either = EitherImpl.left<Dog031, string>(dog)
      expect(either.left.name).assertEqual("Buddy")
      expect(either.left.age).assertEqual(3)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3200
     * @tc.name testEitherLeft0032
     * @tc.desc Verify left behavior when generic L is array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<string[], number>(["a", "b", "c"])
      expect(either.left.length).assertEqual(3)
      expect(either.left[0]).assertEqual("a")
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3300
     * @tc.name testEitherLeft0033
     * @tc.desc Verify left behavior when generic L is Map type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let map = new Map<string, number>()
      map.set("key1", 1)
      let either = EitherImpl.left<Map<string, number>, string>(map)
      expect(either.left.get("key1")).assertEqual(1)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3400
     * @tc.name testEitherLeft0034
     * @tc.desc Verify multiple reads of left property return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      let v1: number = either.left
      let v2: number = either.left
      let v3: number = either.left
      expect(v1).assertEqual(v2)
      expect(v2).assertEqual(v3)
      expect(v1).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3500
     * @tc.name testEitherLeft0035
     * @tc.desc Verify left property value unchanged after other operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      let v1: number = either.left
      let temp: number = v1 + 10
      let v2: number = either.left
      expect(v1).assertEqual(v2)
      expect(temp).assertEqual(52)
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3600
     * @tc.name testEitherLeft0036
     * @tc.desc Verify Left instance reads left normally but accessing right throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      expect(either.left).assertEqual(42)
      try {
        let value: string = either.right
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3700
     * @tc.name testEitherLeft0037
     * @tc.desc Verify Right instance reads right normally but accessing left throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.right<number, string>("hello")
      expect(either.right).assertEqual("hello")
      try {
        let value: number = either.left
        expect().assertFail()
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3800
     * @tc.name testEitherLeft0038
     * @tc.desc Verify safe access to left after checking isLeft
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.left<number, string>(42)
      if (either.isLeft()) {
        let value: number = either.left
        expect(value).assertEqual(42)
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number ETHN_ETHR_LEFT_CHK_3900
     * @tc.name testEitherLeft0039
     * @tc.desc Verify avoiding left access when isRight is true to prevent exceptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherLeft0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let either = EitherImpl.right<number, string>("hello")
      if (either.isRight()) {
        expect(either.right).assertEqual("hello")
      } else {
        expect(either.left).assertEqual(42)
      }
    });
  });
}
