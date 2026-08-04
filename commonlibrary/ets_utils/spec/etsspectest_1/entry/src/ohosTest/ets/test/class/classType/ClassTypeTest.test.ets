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
import { ExportedPoint } from './classTypeModuleData'
import { Point as TsPoint, createWithCtor, makeContainer, getClassName, getInstanceConstructorName } from './classTypeTsHelper'

class Point {
  public x: number
  public y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }

  public magnitude(): number {
    return this.x * this.x + this.y * this.y
  }

  public static origin(): Point {
    return new Point(0, 0)
  }

  public static description: string = 'Point class'
}

class Holder {
  public item: Point

  constructor(item: Point) {
    this.item = item
  }
}

function acceptPoint(p: Point): string {
  return 'got (' + p.x + ', ' + p.y + ')'
}

function makePoint(x: number, y: number): Point {
  return new Point(x, y)
}

interface Drawable {
  draw(): string
}

class Circle implements Drawable {
  public radius: number
  constructor(radius: number) {
    this.radius = radius
  }
  public draw(): string {
    return 'Circle(' + this.radius + ')'
  }
}

abstract class Shape {
  public abstract area(): number
}

class Square extends Shape {
  public side: number
  constructor(side: number) {
    super()
    this.side = side
  }
  public area(): number {
    return this.side * this.side
  }
}

class A {
  public label: string = 'A'
}

class B {
  public label: string = 'B'
}

interface Container {
  item: Point
  getItem(): Point
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

function acceptBox(box: Box<number>): number {
  return box.getValue()
}

function makeBox(v: number): Box<number> {
  return new Box<number>(v)
}

class NamedA {
  public x: number = 0
}

class NamedB {
  public y: number = 0
}

export default function ClassTypeTest() {
  describe('ClassTypeTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0100
     * @tc.name      testClassTypeVariable0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class as instance type for variable declaration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeVariable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(3, 4)
      expect(p.x).assertEqual(3)
      expect(p.y).assertEqual(4)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0200
     * @tc.name      testClassTypeParam0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class as instance type for function parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(1, 2)
      let result: string = acceptPoint(p)
      expect(result).assertEqual('got (1, 2)')
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0300
     * @tc.name      testClassTypeReturn0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class as instance type for function return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = makePoint(5, 6)
      expect(p.x).assertEqual(5)
      expect(p.y).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0400
     * @tc.name      testClassTypeArray0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class as instance type for array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let points: Point[] = [new Point(0, 0), new Point(1, 1)]
      expect(points.length).assertEqual(2)
      expect(points[0].x).assertEqual(0)
      expect(points[1].y).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0500
     * @tc.name      testClassTypeField0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class type field holds another class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(7, 8)
      let h: Holder = new Holder(p)
      expect(h.item.x).assertEqual(7)
      expect(h.item.y).assertEqual(8)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0600
     * @tc.name      testClassValueVariable0001
     * @tc.desc      ECMA-262 §15.2: Verify class constructor value can be stored in a variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassValueVariable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let Ctor = Point
      let p: Point = new Ctor(10, 20)
      expect(p.x).assertEqual(10)
      expect(p.y).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0700
     * @tc.name      testClassValueParam0001
     * @tc.desc      ECMA-262 §15.2: Verify class constructor value can be passed as argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassValueParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: TsPoint = createWithCtor(TsPoint, 0, 0)
      expect(p.x).assertEqual(0)
      expect(p.y).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_0800
     * @tc.name      testClassValueNew0001
     * @tc.desc      ECMA-262 §15.2: Verify class constructor value is callable with new and produces instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassValueNew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let Ctor = Point
      let p: Point = new Ctor(3, 4)
      expect(p.magnitude()).assertEqual(25)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1000
     * @tc.name      testInstanceFieldAccess0001
     * @tc.desc      ECMA-262 §15.2: Verify instance type can access instance fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceFieldAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(3, 4)
      expect(p.x).assertEqual(3)
      expect(p.y).assertEqual(4)
      p.x = 10
      expect(p.x).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1100
     * @tc.name      testInstanceMethodAccess0001
     * @tc.desc      ECMA-262 §15.2: Verify instance type can access instance methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceMethodAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(3, 4)
      expect(p.magnitude()).assertEqual(25)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1200
     * @tc.name      testClassValueStaticField0001
     * @tc.desc      ECMA-262 §15.2: Verify class value can access static fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassValueStaticField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Point.description).assertEqual('Point class')
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1300
     * @tc.name      testClassValueStaticMethod0001
     * @tc.desc      ECMA-262 §15.2: Verify class value can access static methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassValueStaticMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = Point.origin()
      expect(p.x).assertEqual(0)
      expect(p.y).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1500
     * @tc.name      testInstanceToInterface0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class instance can be assigned to implemented interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceToInterface0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let c: Circle = new Circle(5)
      let d: Drawable = c
      expect(d.draw()).assertEqual('Circle(5)')
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1600
     * @tc.name      testAbstractType0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify abstract class type receives concrete subclass instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAbstractType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: Square = new Square(4)
      let sh: Shape = s
      expect(sh.area()).assertEqual(16)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1700
     * @tc.name      testNullableClassType0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify nullable class type accepts instance and null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNullableClassType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a: A | null = new A()
      if (a !== null) {
        expect(a.label).assertEqual('A')
      }
      a = null
      expect(a).assertEqual(null)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1800
     * @tc.name      testUnionClassType0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify union class type accepts instances of either class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testUnionClassType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: A | B = new A()
      if (obj instanceof A) {
        expect(obj.label).assertEqual('A')
      }
      obj = new B()
      if (obj instanceof B) {
        expect(obj.label).assertEqual('B')
      }
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_1900
     * @tc.name      testInterfacePropertyClassType0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify interface property type can be a class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfacePropertyClassType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(1, 2)
      let c: Container = makeContainer(p)
      expect(c.item.x).assertEqual(1)
      expect(c.getItem().y).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2000
     * @tc.name      testClassTypeGenericArg0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify class type as generic type argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassTypeGenericArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(3, 4)
      let box: Box<Point> = new Box<Point>(p)
      let result: Point = box.getValue()
      expect(result.x).assertEqual(3)
      expect(result.y).assertEqual(4)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2100
     * @tc.name      testGenericInstanceNumber0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class instance type Box<number> reads number field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericInstanceNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<number> = new Box<number>(42)
      expect(box.getValue()).assertEqual(42)
      box.value = 100
      expect(box.value).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2200
     * @tc.name      testGenericTypeParam0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class type as function parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<number> = new Box<number>(7)
      let val: number = acceptBox(box)
      expect(val).assertEqual(7)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2300
     * @tc.name      testGenericTypeReturn0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class type as function return value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericTypeReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<number> = makeBox(99)
      expect(box.getValue()).assertEqual(99)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2600
     * @tc.name      testExportImportAsType0001
     * @tc.desc      ECMA-262 §15.2: Verify exported class can be imported and used
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportImportAsType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: ExportedPoint = new ExportedPoint(5, 6)
      expect(p.x).assertEqual(5)
      expect(p.y).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2700
     * @tc.name      testExportImportAsValue0001
     * @tc.desc      ECMA-262 §15.2: Verify exported class can be imported and used with new
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportImportAsValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: ExportedPoint = new ExportedPoint(7, 8)
      expect(p.x).assertEqual(7)
      let p2: ExportedPoint = new ExportedPoint(9, 10)
      expect(p2.y).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_2800
     * @tc.name      testTypeofClassTsHelper0001
     * @tc.desc      ArkTS dynamic: Verify typeof Class pattern from TS helper creates valid instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofClassTsHelper0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: TsPoint = createWithCtor(TsPoint, 5, 6)
      expect(p.x).assertEqual(5)
      expect(p.y).assertEqual(6)
      expect(p.magnitude()).assertEqual(61)
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_3000
     * @tc.name      testClassNameProperty0001
     * @tc.desc      ArkTS dynamic: Verify class name property via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassNameProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getClassName(NamedA)).assertEqual("NamedA")
      expect(getClassName(NamedB)).assertEqual("NamedB")
      expect(getInstanceConstructorName(new NamedA())).assertEqual("NamedA")
    })

    /**
     * @tc.number    SUB_CLASS_TYPE_3100
     * @tc.name      testInstanceofNegative0001
     * @tc.desc      ECMA-262 §13.10.2: Verify instanceof returns false for unrelated object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInstanceofNegative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new NamedA() instanceof Point).assertEqual(false)
    })
  })
}
