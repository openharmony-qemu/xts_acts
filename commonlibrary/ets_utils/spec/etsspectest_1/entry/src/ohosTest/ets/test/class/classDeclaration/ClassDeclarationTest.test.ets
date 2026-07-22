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
import {
  testComputedAccessor,
  testAnonymousClassExpression,
  testNamedClassExpression,
  testExpressionExtends
} from './classDeclarationTsHelper'
import { InnerData, DataProcessor, ItemContainer } from './classModuleData'

class Point {
  public x: number = 0
  public y: number = 0
}

class Calculator {
  public add(a: number, b: number): number {
    return a + b
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
  public static category: string = 'exported'
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

class Account {
  public balance: number

  constructor(balance: number) {
    this.balance = balance
  }

  public deposit(amount: number): void {
    this.balance = this.balance + amount
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
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0100
     * @tc.name      testClassDeclarationBasicSyntax0001
     * @tc.desc      ECMA-262 §15.2: Verify basic class declaration with fields can be instantiated
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
     * @tc.desc      ECMA-262 §15.2: Verify class with method can be invoked
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
     * @tc.number    SUB_CLASS_DECLARATION_0400
     * @tc.name      testClassDefaultParam0004
     * @tc.desc      ECMA-262 §15.4: Verify method default parameter values apply when argument omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultParam0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let log: Logger = new Logger('TEST')
      let msg: string = log.format('hello')
      expect(msg).assertEqual('[TEST] hello.')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0500
     * @tc.name      testClassDefaultParam0005
     * @tc.desc      ECMA-262 §15.4: Verify method parameter overrides default when provided
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultParam0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let log: Logger = new Logger('TEST')
      let msg: string = log.format('hello', '!')
      expect(msg).assertEqual('[TEST] hello!')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0600
     * @tc.name      testClassGetterSetter0006
     * @tc.desc      ECMA-262 §15.4.2: Verify getter returns computed value based on private field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGetterSetter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: RectShape = new RectShape()
      r.width = 3
      r.height = 4
      expect(r.width).assertEqual(3)
      expect(r.height).assertEqual(4)
      expect(r.area).assertEqual(12)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0700
     * @tc.name      testClassGetterSetter0007
     * @tc.desc      ECMA-262 §15.4.2: Verify setter and getter round-trip maintains state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGetterSetter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: RectShape = new RectShape()
      r.width = 10
      r.height = 20
      expect(r.area).assertEqual(200)
      r.width = 5
      expect(r.area).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0800
     * @tc.name      testClassMethodChaining0008
     * @tc.desc      ECMA-262 §15.4: Verify chained calls with separator and mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodChaining0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sb: StringBuilder = new StringBuilder()
      let result: string = sb.setSeparator(', ')
        .append('x')
        .appendNumber(1)
        .append('y')
        .build()
      expect(result).assertEqual('x, 1, y')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_0900
     * @tc.name      testClassAsyncMethod0009
     * @tc.desc      ECMA-262 §15.8: Verify async method returns Promise and resolves correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassAsyncMethod0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let svc: DataService = new DataService()
      let result: number = await svc.fetchItem(21)
      expect(result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1000
     * @tc.name      testClassAsyncMethod0010
     * @tc.desc      ECMA-262 §15.8: Verify async method with multiple awaits
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassAsyncMethod0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let svc: DataService = new DataService()
      let result: string = await svc.process()
      expect(result).assertEqual('16')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1100
     * @tc.name      testClassObjectLiteral0011
     * @tc.desc      ArkTS dynamic (TS-only): Verify object literal with matching shape can be assigned to class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassObjectLiteral0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = { x: 10, y: 20 }
      expect(p.x).assertEqual(10)
      expect(p.y).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1200
     * @tc.name      testClassObjectLiteral0012
     * @tc.desc      ArkTS dynamic (TS-only): Verify object literal fields can be read and written after assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassObjectLiteral0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = { x: 5, y: 15 }
      expect(p.x + p.y).assertEqual(20)
      p.x = 100
      expect(p.x).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1300
     * @tc.name      testClassGeneric0013
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class with number type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<number> = new Box<number>(42)
      expect(box.getValue()).assertEqual(42)
      box.setValue(100)
      expect(box.getValue()).assertEqual(100)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1400
     * @tc.name      testClassGeneric0014
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class with string type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<string> = new Box<string>('hello')
      expect(box.getValue()).assertEqual('hello')
      box.setValue('world')
      expect(box.getValue()).assertEqual('world')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1500
     * @tc.name      testClassGeneric0015
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class with boolean array type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let box: Box<boolean[]> = new Box<boolean[]>([true, false, true])
      let val: boolean[] = box.getValue()
      expect(val.length).assertEqual(3)
      expect(val[1]).assertEqual(false)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1600
     * @tc.name      testClassGeneric0016
     * @tc.desc      ArkTS dynamic (TS-only): Verify generic class with dual type parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassGeneric0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pair: Pair<string, number> = new Pair<string, number>('age', 30)
      expect(pair.getKey()).assertEqual('age')
      expect(pair.getValue()).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1700
     * @tc.name      testClassInheritance0017
     * @tc.desc      ECMA-262 §15.2.3: Verify multi-level inheritance chain works
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassInheritance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Puppy = new Puppy('Max')
      expect(p.name).assertEqual('Max')
      expect(p.speak()).assertEqual('yip')
      expect(p.move()).assertEqual('Max moves')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1800
     * @tc.name      testClassModuleIntegration0018
     * @tc.desc      ECMA-262 §15.2: Verify imported class instance works as method parameter across module boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassModuleIntegration0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let data: InnerData = new InnerData(1, 'test')
      let processor: DataProcessor = new DataProcessor()
      let result: string = processor.process(data)
      expect(result).assertEqual('Processed: 1 - test')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_1900
     * @tc.name      testClassModuleIntegration0019
     * @tc.desc      ECMA-262 §15.2: Verify static method of imported class creates instance of another imported class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassModuleIntegration0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let original: InnerData = new InnerData(5, 'original')
      let transformed: InnerData = DataProcessor.transform(original)
      expect(transformed.id).assertEqual(10)
      expect(transformed.name).assertEqual('original_transformed')
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2000
     * @tc.name      testClassModuleIntegration0020
     * @tc.desc      ECMA-262 §15.2: Verify imported container class manages array of another imported class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassModuleIntegration0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number    SUB_CLASS_DECLARATION_2100
     * @tc.name      testClassExportNamed0021
     * @tc.desc      ECMA-262 §15.2: Verify class with fields and methods (named export style naming)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExportNamed0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ExportedClass = new ExportedClass(21)
      expect(obj.value).assertEqual(21)
      expect(obj.double()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2200
     * @tc.name      testClassExportNamed0022
     * @tc.desc      ECMA-262 §15.2: Verify class with static member (named export style naming)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExportNamed0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(ExportedClassWithStatic.category).assertEqual("exported")
      let obj: ExportedClassWithStatic = new ExportedClassWithStatic(10)
      expect(obj.value).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2300
     * @tc.name      testClassDefaultExport0023
     * @tc.desc      ECMA-262 §15.2: Verify class with constructor and method (default export style naming)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDefaultExport0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: DefaultExportClass = new DefaultExportClass(1, "default")
      expect(obj.id).assertEqual(1)
      expect(obj.label).assertEqual("default")
      expect(obj.describe()).assertEqual("[1] default")
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2400
     * @tc.name      testClassMultipleInstances0024
     * @tc.desc      ECMA-262 §15.2: Verify multiple instances have independent state after method mutation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMultipleInstances0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a1: Account = new Account(100)
      let a2: Account = new Account(200)
      a1.deposit(50)
      expect(a1.balance).assertEqual(150)
      expect(a2.balance).assertEqual(200)
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2500
     * @tc.name      testClassExpressionAnonymous0025
     * @tc.desc      ArkTS dynamic: Verify anonymous class expression via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionAnonymous0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        testAnonymousClassExpression()
        expect('completed').assertEqual('completed')
      } catch (e) {
        expect('thrown').assertEqual('completed')
      }
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2600
     * @tc.name      testClassExpressionNamed0026
     * @tc.desc      ArkTS dynamic: Verify named class expression via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionNamed0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        testNamedClassExpression()
        expect('completed').assertEqual('completed')
      } catch (e) {
        expect('thrown').assertEqual('completed')
      }
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2700
     * @tc.name      testClassExpressionExtends0027
     * @tc.desc      ArkTS dynamic: Verify class expression with extends via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExpressionExtends0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        testExpressionExtends()
        expect('completed').assertEqual('completed')
      } catch (e) {
        expect('thrown').assertEqual('completed')
      }
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2800
     * @tc.name      testComputedAccessor0028
     * @tc.desc      ArkTS dynamic: Verify computed accessor with symbol via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testComputedAccessor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testComputedAccessor()
      expect(result).assertEqual("sym-value|default-data|updated-data|my-label")
    })

    /**
     * @tc.number    SUB_CLASS_DECLARATION_2900
     * @tc.name      testSetterOnlyAccessor0029
     * @tc.desc      ECMA-262 §15.4.2: Verify setter without getter still writes value accessible via method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSetterOnlyAccessor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: SetOnlyAccessor = new SetOnlyAccessor()
      obj.message = "hello"
      expect(obj.getValue()).assertEqual("hello")
      obj.message = "world"
      expect(obj.getValue()).assertEqual("world")
    })
  })
}
