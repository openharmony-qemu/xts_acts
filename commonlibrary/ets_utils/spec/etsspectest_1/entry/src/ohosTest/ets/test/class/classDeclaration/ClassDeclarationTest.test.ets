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
  testComputedAccessor,
  testAnonymousClassExpression,
  testNamedClassExpression,
  testExpressionExtends
} from './classDeclarationTsHelper'

class Point {
  public x: number = 0
  public y: number = 0
}

class Calculator {
  public add(a: number, b: number): number {
    return a + b
  }
}

class MyClass {
  public id: number = 1
}

class Person {
  public name: string
  public age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }

  public greet(): string {
    return 'Hello, I am ' + this.name
  }
}

class Logger {
  public prefix: string
  public level: number

  constructor(prefix: string = 'LOG', level: number = 1) {
    this.prefix = prefix
    this.level = level
  }

  public format(msg: string, suffix: string = '.'): string {
    return '[' + this.prefix + '] ' + msg + suffix
  }
}

class Joiner {
  public join(separator: string, ...parts: string[]): string {
    return parts.join(separator)
  }

  public sum(base: number, ...values: number[]): number {
    let total: number = base
    for (let i: number = 0; i < values.length; i++) {
      total = total + values[i]
    }
    return total
  }
}

function defaultLabel(): string {
  return 'untitled'
}

function nextId(): number {
  return 42
}

class Document {
  public title: string = defaultLabel()
  public id: number = nextId()
  public createdAt: string = String(Date.now())
}

class RectShape {
  private _width: number = 0
  private _height: number = 0

  public get area(): number {
    return this._width * this._height
  }

  public set width(w: number) {
    this._width = w
  }

  public get width(): number {
    return this._width
  }

  public set height(h: number) {
    this._height = h
  }

  public get height(): number {
    return this._height
  }
}

class StringBuilder {
  private buffer: string = ''
  private separator: string = ''

  public setSeparator(sep: string): StringBuilder {
    this.separator = sep
    return this
  }

  public append(value: string): StringBuilder {
    if (this.buffer.length > 0) {
      this.buffer = this.buffer + this.separator
    }
    this.buffer = this.buffer + value
    return this
  }

  public appendNumber(value: number): StringBuilder {
    return this.append(String(value))
  }

  public build(): string {
    return this.buffer
  }

  public clear(): StringBuilder {
    this.buffer = ''
    return this
  }
}

class DataService {
  public async fetchItem(id: number): Promise<number> {
    return id * 2
  }

  public async process(): Promise<string> {
    let a: number = await this.fetchItem(5)
    let b: number = await this.fetchItem(3)
    return String(a + b)
  }
}

class LabeledPoint {
  public x: number = 0
  public y: number = 0
  public label: string = ''
}

interface Drawable {
  draw(): string
}

interface Resettable {
  reset(): void
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

class RectDrawable implements Drawable, Resettable {
  public width: number
  public height: number
  private drawn: boolean = false

  constructor(width: number, height: number) {
    this.width = width
    this.height = height
  }

  public draw(): string {
    this.drawn = true
    return 'Rect(' + this.width + 'x' + this.height + ')'
  }

  public reset(): void {
    this.drawn = false
  }

  public isDrawn(): boolean {
    return this.drawn
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

  public setValue(v: T): void {
    this.value = v
  }
}

class Pair<K, V> {
  public key: K
  public value: V

  constructor(key: K, value: V) {
    this.key = key
    this.value = value
  }

  public getKey(): K {
    return this.key
  }

  public getValue(): V {
    return this.value
  }
}

class Base {
  public value: number

  constructor(v: number) {
    this.value = v
  }
}

class Derived extends Base {
  constructor(v: number) {
    super(v)
  }
}

class Animal {
  public name: string

  constructor(name: string) {
    this.name = name
  }

  public move(): string {
    return this.name + ' moves'
  }
}

class Dog extends Animal {
  constructor(name: string) {
    super(name)
  }

  public speak(): string {
    return 'woof'
  }
}

class Puppy extends Dog {
  constructor(name: string) {
    super(name)
  }

  public speak(): string {
    return 'yip'
  }
}

class InnerData {
  public id: number
  public name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}

class DataProcessor {
  public process(data: InnerData): string {
    return 'Processed: ' + data.id + ' - ' + data.name
  }

  public static transform(data: InnerData): InnerData {
    return new InnerData(data.id * 2, data.name + '_transformed')
  }
}

class ItemContainer {
  public items: InnerData[]
  private count: number = 0

  constructor(items: InnerData[]) {
    this.items = items
    this.count = items.length
  }

  public getCount(): number {
    return this.count
  }

  public add(item: InnerData): void {
    this.items.push(item)
    this.count = this.count + 1
  }

  public findByName(name: string): InnerData | null {
    for (let i: number = 0; i < this.items.length; i++) {
      if (this.items[i].name === name) {
        return this.items[i]
      }
    }
    return null
  }
}

class ExportedClass {
  public value: number

  constructor(value: number) {
    this.value = value
  }

  public double(): number {
    return this.value * 2
  }
}

class ExportedClassWithStatic {
  public static category: string = "exported"
  public value: number

  constructor(value: number) {
    this.value = value
  }
}

class DefaultExportClass {
  public id: number
  public label: string

  constructor(id: number, label: string) {
    this.id = id
    this.label = label
  }

  public describe(): string {
    return "[" + this.id + "] " + this.label
  }
}

class Config {
  public static version: string = "1.0.0"
}

class MathUtil {
  public static square(x: number): number {
    return x * x
  }
}

class Counter {
  public static count: number = 0

  public static increment(): number {
    Counter.count = Counter.count + 1
    return Counter.count
  }
}

class Account {
  public balance: number

  constructor(balance: number) {
    this.balance = balance
  }

  public deposit(amount: number): void {
    this.balance = this.balance + amount
  }
}

class StaticAccessorStore {
  private static _value: string = "default"
  private static _count: number = 0

  public static get value(): string {
    return StaticAccessorStore._value
  }

  public static set value(v: string) {
    StaticAccessorStore._value = v
  }

  public static get count(): number {
    return StaticAccessorStore._count
  }

  public static set count(c: number) {
    StaticAccessorStore._count = c
  }

  public static get doubleCount(): number {
    return StaticAccessorStore._count * 2
  }
}

class SetOnlyAccessor {
  private _value: string = ""

  public set message(v: string) {
    this._value = v
  }

  public getValue(): string {
    return this._value
  }
}

export default function ClassDeclarationTest() {
  describe('ClassDeclarationTest', () => {
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
     * @tc.number    SUB_CLASS_DECLARATION_0100
     * @tc.name      testClassDeclarationBasicSyntax0001
     * @tc.desc      Verify basic class declaration with fields can be instantiated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDeclarationBasicSyntax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point()
      expect(p.x).assertEqual(0)
      expect(p.y).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0200
     * @tc.name      testClassDeclarationBasicSyntax0002
     * @tc.desc      Verify class with method can be invoked
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDeclarationBasicSyntax0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let calc: Calculator = new Calculator()
      let result: number = calc.add(3, 4)
      expect(result).assertEqual(7)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0300
     * @tc.name      testClassDeclarationBasicSyntax0003
     * @tc.desc      Verify instanceof check on class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDeclarationBasicSyntax0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: MyClass = new MyClass()
      expect(obj instanceof MyClass).assertEqual(true)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0400
     * @tc.name      testClassDeclarationConstructor0001
     * @tc.desc      Verify constructor initializes instance fields correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDeclarationConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Person = new Person('Alice', 30)
      expect(p.name).assertEqual('Alice')
      expect(p.age).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0500
     * @tc.name      testClassDeclarationConstructor0002
     * @tc.desc      Verify multiple instances created via constructor have independent state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDeclarationConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p1: Person = new Person('Alice', 30)
      let p2: Person = new Person('Bob', 25)
      expect(p1.name).assertEqual('Alice')
      expect(p1.age).assertEqual(30)
      expect(p2.name).assertEqual('Bob')
      expect(p2.age).assertEqual(25)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0600
     * @tc.name      testClassDeclarationConstructor0003
     * @tc.desc      Verify method on constructor-initialized instance works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDeclarationConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Person = new Person('Alice', 30)
      expect(p.greet()).assertEqual('Hello, I am Alice')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0700
     * @tc.name      testClassDefaultParam0001
     * @tc.desc      Verify constructor default parameter values apply when arguments omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let log: Logger = new Logger()
      expect(log.prefix).assertEqual('LOG')
      expect(log.level).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0800
     * @tc.name      testClassDefaultParam0002
     * @tc.desc      Verify constructor overrides default values when arguments provided
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultParam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let log: Logger = new Logger('DEBUG', 2)
      expect(log.prefix).assertEqual('DEBUG')
      expect(log.level).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0900
     * @tc.name      testClassDefaultParam0003
     * @tc.desc      Verify method default parameter values apply when undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultParam0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let log: Logger = new Logger('TEST')
      let msg: string = log.format('hello')
      expect(msg).assertEqual('[TEST] hello.')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1000
     * @tc.name      testClassDefaultParam0004
     * @tc.desc      Verify method parameter overrides default when provided
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultParam0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let log: Logger = new Logger('TEST')
      let msg: string = log.format('hello', '!')
      expect(msg).assertEqual('[TEST] hello!')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1100
     * @tc.name      testClassRestParam0001
     * @tc.desc      Verify method with rest parameter concatenates variable arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassRestParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let j: Joiner = new Joiner()
      let result: string = j.join(', ', 'a', 'b', 'c')
      expect(result).assertEqual('a, b, c')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1200
     * @tc.name      testClassRestParam0002
     * @tc.desc      Verify method with rest parameter and zero extra arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassRestParam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let j: Joiner = new Joiner()
      let result: string = j.join(', ', 'only')
      expect(result).assertEqual('only')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1300
     * @tc.name      testClassRestParam0003
     * @tc.desc      Verify method with rest parameter of number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassRestParam0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let j: Joiner = new Joiner()
      let total: number = j.sum(10, 1, 2, 3)
      expect(total).assertEqual(16)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1400
     * @tc.name      testFieldFunctionInit0001
     * @tc.desc      Verify class field can be initialized by calling a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldFunctionInit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let doc: Document = new Document()
      expect(doc.title).assertEqual('untitled')
      expect(doc.id).assertEqual(42)
      expect(doc.createdAt.length > 0).assertEqual(true)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1500
     * @tc.name      testClassGetterSetter0001
     * @tc.desc      Verify getter returns computed value based on private field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGetterSetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: RectShape = new RectShape()
      r.width = 3
      r.height = 4
      expect(r.width).assertEqual(3)
      expect(r.height).assertEqual(4)
      expect(r.area).assertEqual(12)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1600
     * @tc.name      testClassGetterSetter0002
     * @tc.desc      Verify setter and getter round-trip maintains state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGetterSetter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: RectShape = new RectShape()
      r.width = 10
      r.height = 20
      expect(r.area).assertEqual(200)
      r.width = 5
      expect(r.area).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1800
     * @tc.name      testClassMethodChaining0002
     * @tc.desc      Verify chained calls with separator and mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodChaining0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sb: StringBuilder = new StringBuilder()
      let result: string = sb.setSeparator(', ')
        .append('x')
        .appendNumber(1)
        .append('y')
        .build()
      expect(result).assertEqual('x, 1, y')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1900
     * @tc.name      testClassAsyncMethod0001
     * @tc.desc      Verify async method returns Promise and resolves correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassAsyncMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let svc: DataService = new DataService()
      let result: number = await svc.fetchItem(21)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2000
     * @tc.name      testClassAsyncMethod0002
     * @tc.desc      Verify async method with multiple awaits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassAsyncMethod0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let svc: DataService = new DataService()
      let result: string = await svc.process()
      expect(result).assertEqual('16')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2100
     * @tc.name      testClassObjectLiteral0001
     * @tc.desc      Verify object literal with matching shape can be assigned to class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassObjectLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = { x: 10, y: 20 }
      expect(p.x).assertEqual(10)
      expect(p.y).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2200
     * @tc.name      testClassObjectLiteral0002
     * @tc.desc      Verify object literal with extra fields can be assigned to class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassObjectLiteral0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: LabeledPoint = { x: 1, y: 2, label: 'A' }
      expect(p.x).assertEqual(1)
      expect(p.y).assertEqual(2)
      expect(p.label).assertEqual('A')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2300
     * @tc.name      testClassObjectLiteral0003
     * @tc.desc      Verify object literal fields can be read and written after assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassObjectLiteral0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = { x: 5, y: 15 }
      expect(p.x + p.y).assertEqual(20)
      p.x = 100
      expect(p.x).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2400
     * @tc.name      testClassImplementsInterface0001
     * @tc.desc      Verify class implements single interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImplementsInterface0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let c: Circle = new Circle(5)
      expect(c.draw()).assertEqual('Circle(5)')
      expect(c instanceof Circle).assertEqual(true)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2500
     * @tc.name      testClassImplementsInterface0002
     * @tc.desc      Verify class implements multiple interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImplementsInterface0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: RectDrawable = new RectDrawable(3, 4)
      expect(r.draw()).assertEqual('Rect(3x4)')
      expect(r.isDrawn()).assertEqual(true)
      r.reset()
      expect(r.isDrawn()).assertEqual(false)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2600
     * @tc.name      testClassImplementsInterface0003
     * @tc.desc      Verify class implementing interface can be assigned to interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImplementsInterface0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let d: Drawable = new Circle(10)
      expect(d.draw()).assertEqual('Circle(10)')
      let d2: Drawable = new RectDrawable(1, 2)
      expect(d2.draw()).assertEqual('Rect(1x2)')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2700
     * @tc.name      testClassGeneric0001
     * @tc.desc      Verify generic class with number type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<number> = new Box<number>(42)
      expect(box.getValue()).assertEqual(42)
      box.setValue(100)
      expect(box.getValue()).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2800
     * @tc.name      testClassGeneric0002
     * @tc.desc      Verify generic class with string type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<string> = new Box<string>('hello')
      expect(box.getValue()).assertEqual('hello')
      box.setValue('world')
      expect(box.getValue()).assertEqual('world')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2900
     * @tc.name      testClassGeneric0003
     * @tc.desc      Verify generic class with boolean array type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<boolean[]> = new Box<boolean[]>([true, false, true])
      let val: boolean[] = box.getValue()
      expect(val.length).assertEqual(3)
      expect(val[0]).assertEqual(true)
      expect(val[1]).assertEqual(false)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3000
     * @tc.name      testClassGeneric0004
     * @tc.desc      Verify generic class with dual type parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pair: Pair<string, number> = new Pair<string, number>('age', 30)
      expect(pair.getKey()).assertEqual('age')
      expect(pair.getValue()).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3100
     * @tc.name      testClassInheritance0001
     * @tc.desc      Verify derived class inherits base class field via super()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let d: Derived = new Derived(42)
      expect(d.value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3300
     * @tc.name      testClassInheritance0003
     * @tc.desc      Verify multi-level inheritance chain works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassInheritance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Puppy = new Puppy('Max')
      expect(p.name).assertEqual('Max')
      expect(p.speak()).assertEqual('yip')
      expect(p.move()).assertEqual('Max moves')
      expect(p instanceof Animal).assertEqual(true)
      expect(p instanceof Dog).assertEqual(true)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3400
     * @tc.name      testClassModuleIntegration0001
     * @tc.desc      Verify class A uses class B as field type and method parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassModuleIntegration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let data: InnerData = new InnerData(1, 'test')
      let processor: DataProcessor = new DataProcessor()
      let result: string = processor.process(data)
      expect(result).assertEqual('Processed: 1 - test')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3500
     * @tc.name      testClassModuleIntegration0002
     * @tc.desc      Verify static method of one class creates instance of another class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassModuleIntegration0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let original: InnerData = new InnerData(5, 'original')
      let transformed: InnerData = DataProcessor.transform(original)
      expect(transformed.id).assertEqual(10)
      expect(transformed.name).assertEqual('original_transformed')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3600
     * @tc.name      testClassModuleIntegration0003
     * @tc.desc      Verify container class manages array of another class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassModuleIntegration0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let items: InnerData[] = [new InnerData(1, 'A'), new InnerData(2, 'B')]
      let container: ItemContainer = new ItemContainer(items)
      expect(container.getCount()).assertEqual(2)
      let found: InnerData | null = container.findByName('B')
      expect(found !== null).assertEqual(true)
      if (found !== null) {
        expect(found.id).assertEqual(2)
      }
      container.add(new InnerData(3, 'C'))
      expect(container.getCount()).assertEqual(3)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3700
     * @tc.name      testClassExportNamed0001
     * @tc.desc      Verify named export class with fields and methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExportNamed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ExportedClass = new ExportedClass(21)
      expect(obj.value).assertEqual(21)
      expect(obj.double()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3800
     * @tc.name      testClassExportNamed0002
     * @tc.desc      Verify exported class with static member
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExportNamed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(ExportedClassWithStatic.category).assertEqual("exported")
      let obj: ExportedClassWithStatic = new ExportedClassWithStatic(10)
      expect(obj.value).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_3900
     * @tc.name      testClassDefaultExport0001
     * @tc.desc      Verify default export class with constructor and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultExport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: DefaultExportClass = new DefaultExportClass(1, "default")
      expect(obj.id).assertEqual(1)
      expect(obj.label).assertEqual("default")
      expect(obj.describe()).assertEqual("[1] default")
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_4000
     * @tc.name      testClassStaticMember0001
     * @tc.desc      Verify static field is accessible on class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticMember0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Config.version).assertEqual("1.0.0")
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_4100
     * @tc.name      testClassStaticMember0002
     * @tc.desc      Verify static method is callable on class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticMember0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(MathUtil.square(5)).assertEqual(25)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_4200
     * @tc.name      testClassStaticMember0003
     * @tc.desc      Verify static field mutation persists across accesses
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassStaticMember0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Counter.increment()).assertEqual(1)
      expect(Counter.increment()).assertEqual(2)
      expect(Counter.count).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_4500
     * @tc.name      testClassMultipleInstances0001
     * @tc.desc      Verify multiple instances have independent state after method mutation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleInstances0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a1: Account = new Account(100)
      let a2: Account = new Account(200)
      a1.deposit(50)
      expect(a1.balance).assertEqual(150)
      expect(a2.balance).assertEqual(200)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_4800
     * @tc.name      testStaticGetterSetter0001
     * @tc.desc      Verify static getter and setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticGetterSetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticAccessorStore.value).assertEqual("default")
      StaticAccessorStore.value = "updated"
      expect(StaticAccessorStore.value).assertEqual("updated")
      StaticAccessorStore.count = 5
      expect(StaticAccessorStore.count).assertEqual(5)
      expect(StaticAccessorStore.doubleCount).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_4900
     * @tc.name      testClassExpressionAnonymous0001
     * @tc.desc      Verify anonymous class expression via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionAnonymous0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testAnonymousClassExpression()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_5000
     * @tc.name      testClassExpressionNamed0001
     * @tc.desc      Verify named class expression via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionNamed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testNamedClassExpression()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_5100
     * @tc.name      testClassExpressionExtends0001
     * @tc.desc      Verify class expression with extends via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionExtends0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testExpressionExtends()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_5200
     * @tc.name      testComputedAccessor0001
     * @tc.desc      Verify computed accessor with symbol via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testComputedAccessor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testComputedAccessor()
      let parts: string[] = result.split("|")
      expect(parts[0]).assertEqual("sym-value")
      expect(parts[1]).assertEqual("default-data")
      expect(parts[2]).assertEqual("updated-data")
      expect(parts[3]).assertEqual("my-label")
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_5300
     * @tc.name      testSetterOnlyAccessor0001
     * @tc.desc      Verify setter without getter still writes value accessible via method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetterOnlyAccessor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: SetOnlyAccessor = new SetOnlyAccessor()
      obj.message = "hello"
      expect(obj.getValue()).assertEqual("hello")
      obj.message = "world"
      expect(obj.getValue()).assertEqual("world")
    })
  })
}
