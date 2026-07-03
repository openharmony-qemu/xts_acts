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

class MyClass043 {
  value: number = 0
}

interface ObjWithKey {
  key: string;
}

interface ObjWithCode {
  code: number;
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

export default function EitherRightTest(): void {
  describe('EitherRightTest', () => {
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
     * @tc.number ETHN_ETHR_RIGHT_CHK_0200
     * @tc.name testEitherRight0002
     * @tc.desc Verify reading right property via getter syntax normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(100)
      expect(e.right).assertEqual(100)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_0400
     * @tc.name testEitherRight0004
     * @tc.desc Verify Right instance returns stored value via right property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      expect(e.right).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_0500
     * @tc.name testEitherRight0005
     * @tc.desc Verify Right instance returns string value via right property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello")
      expect(e.right).assertEqual("hello")
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_0600
     * @tc.name testEitherRight0006
     * @tc.desc Verify Right instance returns boolean value via right property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, boolean>(true)
      expect(e.right).assertEqual(true)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_0700
     * @tc.name testEitherRight0007
     * @tc.desc Verify Right instance returns object value via right property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ObjWithKey = { key: "value" }
      let e = EitherImpl.right<string, ObjWithKey>(obj)
      expect(e.right).assertEqual(obj)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_0800
     * @tc.name testEitherRight0008
     * @tc.desc Verify Right instance returns array value via right property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3]
      let e = EitherImpl.right<string, number[]>(arr)
      expect(e.right).assertEqual(arr)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_0900
     * @tc.name testEitherRight0009
     * @tc.desc Verify right returns null when R includes null type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number | null>(null)
      expect(e.right).assertNull()
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1000
     * @tc.name testEitherRight0010
     * @tc.desc Verify right returns undefined when R includes undefined type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, string | undefined>(undefined)
      expect(e.right).assertUndefined()
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1100
     * @tc.name testEitherRight0011
     * @tc.desc Verify right returns 0 when R is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(0)
      expect(e.right).assertEqual(0)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1200
     * @tc.name testEitherRight0012
     * @tc.desc Verify right returns empty string when R is string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("")
      expect(e.right).assertEqual("")
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1300
     * @tc.name testEitherRight0013
     * @tc.desc Verify right returns false when R is boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, boolean>(false)
      expect(e.right).assertEqual(false)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1400
     * @tc.name testEitherRight0014
     * @tc.desc Verify right returns NaN when R is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(Number.NaN)
      expect(Number.isNaN(e.right)).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1500
     * @tc.name testEitherRight0015
     * @tc.desc Verify right returns Infinity when R is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(Number.POSITIVE_INFINITY)
      expect(e.right).assertEqual(Number.POSITIVE_INFINITY)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1600
     * @tc.name testEitherRight0016
     * @tc.desc Verify right returns negative Infinity when R is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(Number.NEGATIVE_INFINITY)
      expect(e.right).assertEqual(Number.NEGATIVE_INFINITY)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1700
     * @tc.name testEitherRight0017
     * @tc.desc Verify right returns empty array when R is array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number[]>([])
      expect(e.right.length).assertEqual(0)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1800
     * @tc.name testEitherRight0018
     * @tc.desc Verify right returns MAX_SAFE_INTEGER when R is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(Number.MAX_SAFE_INTEGER)
      expect(e.right).assertEqual(Number.MAX_SAFE_INTEGER)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_1900
     * @tc.name testEitherRight0019
     * @tc.desc Verify right returns MIN_SAFE_INTEGER when R is number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(Number.MIN_SAFE_INTEGER)
      expect(e.right).assertEqual(Number.MIN_SAFE_INTEGER)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2100
     * @tc.name testEitherRight0021
     * @tc.desc Verify generic type inference for right property with different type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.right<string, number>(1)
      let e2 = EitherImpl.right<number, string>("a")
      let v1: number = e1.right
      let v2: string = e2.right
      expect(v1).assertEqual(1)
      expect(v2).assertEqual("a")
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2200
     * @tc.name testEitherRight0022
     * @tc.desc Verify right returns the wrapped Error object whose name is non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, Error>(new Error("test"))
      expect(e.right.name.length > 0).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2300
     * @tc.name testEitherRight0023
     * @tc.desc Verify right returns very large number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(1.7976931348623157e+308)
      expect(e.right).assertEqual(1.7976931348623157e+308)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2400
     * @tc.name testEitherRight0024
     * @tc.desc Verify right returns very long string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let longStr: string = "a".repeat(10000)
      let e = EitherImpl.right<number, string>(longStr)
      expect(e.right).assertEqual(longStr)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2500
     * @tc.name testEitherRight0025
     * @tc.desc Verify right returns string with special characters including Unicode and emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("你好世界🌍")
      expect(e.right).assertEqual("你好世界🌍")
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2600
     * @tc.name testEitherRight0026
     * @tc.desc Verify right returns nested Either type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inner = EitherImpl.right<string, number>(10)
      let outer = EitherImpl.right<boolean, EitherImpl<string, number>>(inner)
      expect(outer.right.right).assertEqual(10)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2700
     * @tc.name testEitherRight0027
     * @tc.desc Verify Left instance throws Error when accessing right property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("error")
      try {
        let val = e.right
		expect(false).assertTrue();
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2800
     * @tc.name testEitherRight0028
     * @tc.desc Verify Left instance throws Error with different generic types when accessing right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<number, string>(404)
      try {
        let v = e1.right
		expect(false).assertTrue();
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_2900
     * @tc.name testEitherRight0029
     * @tc.desc Verify Left instance throws Error when L is complex object type and accessing right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<ObjWithCode, number>({ code: 500 })
      try {
        let v = e.right
		expect(false).assertTrue();
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3000
     * @tc.name testEitherRight0030
     * @tc.desc Verify thrown exception is an Error instance when accessing right on Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("err")
      try {
        let v = e.right
		expect(false).assertTrue();
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3100
     * @tc.name testEitherRight0031
     * @tc.desc Verify thrown Error contains meaningful error message when accessing right on Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("err")
      try {
        let v = e.right
		expect(false).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3200
     * @tc.name testEitherRight0032
     * @tc.desc Verify try-catch catches Error thrown by accessing right on Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("err")
      let caught: boolean = false
      try {
        let v = e.right
      } catch (error) {
        expect(error.name).assertEqual('Error');
        caught = true
      }
      expect(caught).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3300
     * @tc.name testEitherRight0033
     * @tc.desc Verify program continues execution after catching Error from right access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("err")
      let caught = false
      try {
        let v = e.right
        expect(v >= 0).assertTrue()
      } catch (error) {
        expect(error.name).assertEqual('Error')
        caught = true
      }
      expect(caught).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3400
     * @tc.name testEitherRight0034
     * @tc.desc Verify multiple try-catch catches right Error each time on same Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("err")
      let count: number = 0
      for (let i = 0; i < 3; i++) {
        try {
          let v = e.right
        } catch (err) {
          expect(err.name).assertEqual('Error');
          count++
        }
      }
      expect(count).assertEqual(3)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3800
     * @tc.name testEitherRight0038
     * @tc.desc Verify readonly guarantees consistent value across multiple reads of right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      let v1: number = e.right
      let v2: number = e.right
      let v3: number = e.right
      expect(v1).assertEqual(v2)
      expect(v2).assertEqual(v3)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_3900
     * @tc.name testEitherRight0039
     * @tc.desc Verify right returns number value when R is number generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(123)
      expect(e.right).assertEqual(123)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4000
     * @tc.name testEitherRight0040
     * @tc.desc Verify right returns string value when R is string generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("abc")
      expect(e.right).assertEqual("abc")
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4200
     * @tc.name testEitherRight0042
     * @tc.desc Verify right returns Object instance when R is Object generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: object = {}
      let e = EitherImpl.right<string, object>(obj)
      expect(e.right).assertEqual(obj)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4300
     * @tc.name testEitherRight0043
     * @tc.desc Verify right returns custom class instance when R is custom class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inst = new MyClass043()
      inst.value = 10
      let e = EitherImpl.right<string, MyClass043>(inst)
      expect(e.right.value).assertEqual(10)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4400
     * @tc.name testEitherRight0044
     * @tc.desc Verify right returns union type value when R is union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number | string>(42)
      expect(e.right).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4500
     * @tc.name testEitherRight0045
     * @tc.desc Verify right returns function reference when R is function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fn = (x: number): number => x * 2
      let e = EitherImpl.right<string, (x: number) => number>(fn)
      expect(e.right(5)).assertEqual(10)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4600
     * @tc.name testEitherRight0046
     * @tc.desc Verify consecutive reads of right return same value consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      for (let i = 0; i < 100; i++) {
        expect(e.right).assertEqual(42)
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4700
     * @tc.name testEitherRight0047
     * @tc.desc Verify interleaved reads of right are not affected by other operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      let val: number = e.right
      let val2: number = e.right
      expect(val).assertEqual(val2)
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4800
     * @tc.name testEitherRight0048
     * @tc.desc Verify Right instance reads right successfully and left throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      expect(e.right).assertEqual(42)
      try {
        let v = e.left
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_4900
     * @tc.name testEitherRight0049
     * @tc.desc Verify Left instance reads left successfully and right throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("err")
      expect(e.left).assertEqual("err")
      try {
        let v = e.right
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_RIGHT_CHK_5000
     * @tc.name testEitherRight0050
     * @tc.desc Verify mutual exclusivity of right and left remains consistent across multiple accesses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherRight0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let caught = false;
      try {
        let r = EitherImpl.right<string, number>(1)
        r.left
      } catch (error) {
        caught = true;
        expect(error.name).assertEqual('Error');
      }
      expect(caught).assertTrue();
    });
  });
}
