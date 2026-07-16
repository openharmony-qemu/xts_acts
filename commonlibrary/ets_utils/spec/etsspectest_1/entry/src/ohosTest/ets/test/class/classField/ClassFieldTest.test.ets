/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import utils from '../../Utils';
import {
  getWithMethodCallValue,
  getBigintAsString
} from './classFieldTsHelper'

class SingleField {
  public x: number = 42
}

class MultiField {
  public a: number = 1
  public b: string = 'hello'
  public c: boolean = true
}

function defaultX(): number {
  return 99
}

class FuncInitField {
  public x: number = defaultX()
}

class CtorAssignField {
  public x: number
  public y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}

class CtorReadField {
  public value: number = 10
  public result: number

  constructor() {
    this.result = this.value + 5
  }
}

class FieldWithMethod {
  public x: number = 7

  public getX(): number {
    return this.x
  }

  public double(): number {
    return this.x * 2
  }
}

class StaticFieldClass {
  public static version: string = '1.0.0'
  public static count: number = 0
}

class InnerObj {
  public v: number
  constructor(v: number) {
    this.v = v
  }
}

class OuterWithNew {
  public inner: InnerObj = new InnerObj(42)
}

class InnerData {
  public id: number
  public label: string
  constructor(id: number, label: string) {
    this.id = id
    this.label = label
  }
}

class ClassTypedField {
  public data: InnerData
  public items: InnerData[]
  constructor(data: InnerData, items: InnerData[]) {
    this.data = data
    this.items = items
  }
  public getFirstItem(): InnerData {
    return this.items[0]
  }
}

class Box<T> {
  public value: T

  constructor(v: T) {
    this.value = v
  }

  public getValue(): T {
    return this.value
  }
}

class ArrayField {
  public numbers: number[] = [1, 2, 3]
  public names: string[] = ['a', 'b']
}

class HasInitNoReassign {
  public value: number = 42
  public label: string = 'init'
  constructor() {
  }
}

export default function ClassFieldTest() {
  describe('ClassFieldTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0100
     * @tc.name      testFieldSingleNumber0001
     * @tc.desc      Verify single number field with literal initializer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldSingleNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: SingleField = new SingleField()
      expect(obj.x).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0200
     * @tc.name      testFieldMultipleTypes0001
     * @tc.desc      Verify multiple fields with number, string, boolean types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldMultipleTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: MultiField = new MultiField()
      expect(obj.a).assertEqual(1)
      expect(obj.b).assertEqual('hello')
      expect(obj.c).assertEqual(true)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0300
     * @tc.name      testFieldFuncInit0001
     * @tc.desc      Verify field with function call initializer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldFuncInit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: FuncInitField = new FuncInitField()
      expect(obj.x).assertEqual(99)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0400
     * @tc.name      testFieldCtorAssign0001
     * @tc.desc      Verify field assigned in constructor, no declaration initializer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldCtorAssign0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: CtorAssignField = new CtorAssignField(10, 20)
      expect(obj.x).assertEqual(10)
      expect(obj.y).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0500
     * @tc.name      testFieldCtorReadsField0001
     * @tc.desc      Verify constructor reads field initialized by declaration initializer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldCtorReadsField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: CtorReadField = new CtorReadField()
      expect(obj.value).assertEqual(10)
      expect(obj.result).assertEqual(15)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0600
     * @tc.name      testFieldMethodReadsField0001
     * @tc.desc      Verify method reads and computes using instance field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldMethodReadsField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: FieldWithMethod = new FieldWithMethod()
      expect(obj.getX()).assertEqual(7)
      expect(obj.double()).assertEqual(14)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0700
     * @tc.name      testFieldStatic0001
     * @tc.desc      Verify static field accessible on class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticFieldClass.version).assertEqual('1.0.0')
      expect(StaticFieldClass.count).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0800
     * @tc.name      testFieldInitNewExpr0001
     * @tc.desc      Verify field initializer with new expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldInitNewExpr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OuterWithNew = new OuterWithNew()
      expect(obj.inner.v).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_0900
     * @tc.name      testFieldGeneric0001
     * @tc.desc      Verify generic class field with different types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let boxNum: Box<number> = new Box<number>(42)
      expect(boxNum.value).assertEqual(42)
      expect(boxNum.getValue()).assertEqual(42)

      let boxStr: Box<string> = new Box<string>('hello')
      expect(boxStr.value).assertEqual('hello')
      expect(boxStr.getValue()).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_1000
     * @tc.name      testFieldArray0001
     * @tc.desc      Verify array field with number and string element types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ArrayField = new ArrayField()
      expect(obj.numbers.length).assertEqual(3)
      expect(obj.numbers[0]).assertEqual(1)
      expect(obj.numbers[1]).assertEqual(2)
      expect(obj.numbers[2]).assertEqual(3)
      expect(obj.names.length).assertEqual(2)
      expect(obj.names[0]).assertEqual('a')
      expect(obj.names[1]).assertEqual('b')
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_1100
     * @tc.name      testFieldInitNoReassign0001
     * @tc.desc      Verify field keeps initializer value when constructor does not reassign
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldInitNoReassign0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: HasInitNoReassign = new HasInitNoReassign()
      expect(obj.value).assertEqual(42)
      expect(obj.label).assertEqual('init')
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_1200
     * @tc.name      testFieldClassTyped0001
     * @tc.desc      Verify field typed as class type and array of class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldClassTyped0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inner: InnerData = new InnerData(1, 'first')
      let items: InnerData[] = [new InnerData(2, 'second'), new InnerData(3, 'third')]
      let obj: ClassTypedField = new ClassTypedField(inner, items)
      expect(obj.data.id).assertEqual(1)
      expect(obj.data.label).assertEqual('first')
      expect(obj.items.length).assertEqual(2)
      expect(obj.getFirstItem().id).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_1300
     * @tc.name      testFieldBigint0001
     * @tc.desc      Verify bigint field via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldBigint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: string = getBigintAsString()
      expect(s).assertEqual('100')
    })

    /**
     * @tc.number    SUB_CLASS_FIELD_1400
     * @tc.name      testFieldInitMethodCall0001
     * @tc.desc      Verify field initializer calls this.method()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldInitMethodCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v: number = getWithMethodCallValue()
      expect(v).assertEqual(10)
    })
  })
}
