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

class MyClass055 {
  value: number = 0
}

interface ObjWithKey011 {
  key: string;
}

interface ObjWithCode012 {
  code: number;
}

class EitherImpl<L, R> {
  readonly isLeftValue: boolean;
  readonly leftValue?: L;
  readonly rightValue?: R;

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

class SubEither003 {
  private value: string = "";
  constructor() {}
}

class StrNumEither013 {
  private value: number = 0;
  constructor() {}
}

export default function EitherTest(): void {
  describe('EitherTest', () => {
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
     * @tc.number ETHN_ETHR_ITEM_CHK_0100
     * @tc.name testEither0001
     * @tc.desc Verify abstract keyword exists in Either class declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      let val: number = e.right
      expect(val).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_0300
     * @tc.name testEither0003
     * @tc.desc Verify abstract modifier cannot be omitted for Either
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42)
      expect(e.left).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_0400
     * @tc.name testEither0004
     * @tc.desc Verify left property returns correct value with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("hello")
      expect(e.left).assertEqual("hello")
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_0500
     * @tc.name testEither0005
     * @tc.desc Verify isLeft returns true for Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42)
      expect(e.isLeft()).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_0600
     * @tc.name testEither0006
     * @tc.desc Verify generic parameter L with string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      expect(e.isRight()).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_0700
     * @tc.name testEither0007
     * @tc.desc Verify Left instance throws error when accessing right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("error")
      try {
        let val = e.right
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_0800
     * @tc.name testEither0008
     * @tc.desc Verify Right instance throws error when accessing left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      try {
        let val = e.left
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_1000
     * @tc.name testEither0010
     * @tc.desc Verify right returns object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ObjWithKey011 = { key: "value" }
      let e = EitherImpl.right<string, ObjWithKey011>(obj)
      expect(e.right).assertEqual(obj)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_1300
     * @tc.name testEither0013
     * @tc.desc Verify generic parameter R with number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number | undefined>(undefined)
      expect(e.right).assertUndefined()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_1400
     * @tc.name testEither0014
     * @tc.desc Verify left returns 0 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(0)
      expect(e.left).assertEqual(0)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_2500
     * @tc.name testEither0025
     * @tc.desc Verify export keyword exists for Either class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42);
      expect(e.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_2600
     * @tc.name testEither0026
     * @tc.desc Verify EitherImpl type is usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(100);
      expect(e.right).assertEqual(100);
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_2800
     * @tc.name testEither0028
     * @tc.desc Verify EitherImpl static right method creates Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello")
      expect(e.isRight()).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3100
     * @tc.name testEither0031
     * @tc.desc Verify EitherImpl as variable type annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let left = EitherImpl.left<string, number>("error")
      let right = EitherImpl.right<string, number>(42)
      expect(left.left).assertEqual("error")
      expect(right.right).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3200
     * @tc.name testEither0032
     * @tc.desc Verify EitherImpl as function parameter type annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42);
      expect(e.right).assertEqual(42);
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3300
     * @tc.name testEither0033
     * @tc.desc Verify EitherImpl as function return type annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = EitherImpl.right<string, number>(10);
      expect(result.right).assertEqual(10);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3400
     * @tc.name testEither0034
     * @tc.desc Verify EitherImpl as array element type annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<string, number>("err")
      let e2 = EitherImpl.right<string, number>(1)
      expect(e1.left).assertEqual("err")
      expect(e2.right).assertEqual(1)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3500
     * @tc.name testEither0035
     * @tc.desc Verify EitherImpl with different generic type combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<number, string>(42)
      expect(e1.left).assertEqual(42)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3600
     * @tc.name testEither0036
     * @tc.desc Verify EitherImpl subclass instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = new SubEither003()
      expect(e instanceof SubEither003).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_3700
     * @tc.name testEither0037
     * @tc.desc Verify EitherImpl with custom class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inst = new MyClass055()
      inst.value = 10
      let e = EitherImpl.right<string, MyClass055>(inst)
      expect(e.right.value).assertEqual(10)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_4200
     * @tc.name testEither0042
     * @tc.desc Verify interleaved reads of right are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(42)
      let val1: number = e.right
      let val2: number = e.right
      expect(val1).assertEqual(val2)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_4400
     * @tc.name testEither0044
     * @tc.desc Verify Left instance reads left and right throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<string, number>("error")
      expect(e.left).assertEqual("error")
      try {
        let v = e.right
      } catch (err) {
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_4500
     * @tc.name testEither0045
     * @tc.desc Verify right returns Error instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, Error>(new Error("test"))
      expect(e.right.name.length > 0).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_4800
     * @tc.name testEither0048
     * @tc.desc Verify subclass instantiation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = new StrNumEither013()
      expect(e instanceof StrNumEither013).assertTrue()
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_4900
     * @tc.name testEither0049
     * @tc.desc Verify multiple reads of left return consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42)
      let v1: number = e.left
      let v2: number = e.left
      let v3: number = e.left
      expect(v1).assertEqual(v2)
      expect(v2).assertEqual(v3)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5000
     * @tc.name testEither0050
     * @tc.desc Verify safe access to left after checking isLeft
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42)
      if (e.isLeft()) {
        let value: number = e.left
        expect(value).assertEqual(42)
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5100
     * @tc.name testEither0051
     * @tc.desc Verify avoiding left access when isRight is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello")
      if (e.isRight()) {
        expect(e.right).assertEqual("hello")
      } else {
        expect().assertFail()
      }
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5200
     * @tc.name testEither0052
     * @tc.desc Verify generic function with EitherImpl
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      expect(e.right).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5300
     * @tc.name testEither0053
     * @tc.desc Verify EitherImpl with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("ok")
      expect(e.right).assertEqual("ok")
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5400
     * @tc.name testEither0054
     * @tc.desc Verify EitherImpl with boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, boolean>(true)
      expect(e.right).assertEqual(true)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5500
     * @tc.name testEither0055
     * @tc.desc Verify EitherImpl with Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: Object = new Object()
      let e = EitherImpl.right<number, Object>(obj)
      expect(e.right).assertEqual(obj)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5600
     * @tc.name testEither0056
     * @tc.desc Verify EitherImpl with function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let fn = (x: number): number => x * 2
      let e = EitherImpl.right<number, (x: number) => number>(fn)
      expect(e.right(5)).assertEqual(10)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_5800
     * @tc.name testEither0058
     * @tc.desc Verify generic function return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(5)
      expect(e.right).assertEqual(5)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_6000
     * @tc.name testEither0060
     * @tc.desc Verify EitherImpl with different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(100)
      expect(e.left).assertEqual(100)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_6100
     * @tc.name testEither0061
     * @tc.desc Verify EitherImpl with array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let e = EitherImpl.left<number[], string>(arr)
      expect(e.left.length).assertEqual(5)
    });

    /**
     * @tc.number ETHN_ETHR_ITEM_CHK_6200
     * @tc.name testEither0062
     * @tc.desc Verify EitherImpl with Map type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEither0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let map = new Map<string, number>()
      map.set("key1", 1)
      let e = EitherImpl.left<Map<string, number>, string>(map)
      expect(e.left.get("key1")).assertEqual(1)
    });
  });
}
