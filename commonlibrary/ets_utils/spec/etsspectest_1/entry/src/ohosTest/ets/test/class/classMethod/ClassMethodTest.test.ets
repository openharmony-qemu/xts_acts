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
  getBigintMethodResult,
  testComputedMethodString,
  testComputedMethodCall,
  testGeneratorValues,
  testStaticComputedGetStatus,
  testStaticComputedCalcValue,
  testAsyncGeneratorValues
} from './classMethodTsHelper'

class EmptyMethod {
  public flag: boolean = false

  public doNothing(): void {
  }

  public returnsVoid(): void {
    this.flag = true
  }
}

class SingleParam {
  public double(n: number): number {
    return n * 2
  }
}

class MultiParam {
  public add(a: number, b: number): number {
    return a + b
  }
}

class ReturnTypes {
  public getNum(): number {
    return 42
  }

  public getStr(): string {
    return 'hello'
  }

  public getBool(): boolean {
    return true
  }

  public getArr(): number[] {
    return [1, 2, 3]
  }
}

class MethodCallsMethod {
  public base(): number {
    return 5
  }

  public derived(): number {
    return this.base() * 2
  }
}

class OptionalParam {
  public concat(a: string, b?: string): string {
    if (b !== undefined) {
      return a + b
    }
    return a
  }
}

class RestParam {
  public sum(...values: number[]): number {
    let total: number = 0
    for (let i: number = 0; i < values.length; i++) {
      total = total + values[i]
    }
    return total
  }
}

class StringJoiner {
  public join(separator: string, ...parts: string[]): string {
    return parts.join(separator)
  }

  public sumWithBase(base: number, ...values: number[]): number {
    let total: number = base
    for (let i: number = 0; i < values.length; i++) {
      total = total + values[i]
    }
    return total
  }
}

class DefaultParam {
  public greet(name: string, greeting: string = 'Hello'): string {
    return greeting + ', ' + name
  }
}

class Point {
  public x: number
  public y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}

class ClassParam {
  public distance(p: Point): number {
    return p.x * p.x + p.y * p.y
  }
}

interface Drawable {
  draw(): string
}

class Circle implements Drawable {
  public draw(): string {
    return 'circle'
  }
}

class InterfaceParam {
  public render(d: Drawable): string {
    return d.draw()
  }
}

class ArrayParam {
  public join(items: string[]): string {
    let result: string = ''
    for (let i: number = 0; i < items.length; i++) {
      result = result + items[i]
    }
    return result
  }
}

class Chainable {
  public value: number = 0

  public add(n: number): Chainable {
    this.value = this.value + n
    return this
  }

  public multiply(n: number): Chainable {
    this.value = this.value * n
    return this
  }
}

class StaticMethod {
  public static version(): string {
    return '1.0'
  }

  public static double(n: number): number {
    return n * 2
  }
}

class ObjReturn {
  public getPoint(): Point {
    return new Point(3, 4)
  }

  public getLabel(): string {
    return 'point-label'
  }
}

class MethodBase {
  protected getBase(): string {
    return 'base'
  }
}

class MethodChild extends MethodBase {
  public callProtected(): string {
    return this.getBase()
  }
}

export default function ClassMethodTest() {
  describe('ClassMethodTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0100
     * @tc.name      testMethodEmptyAndVoid0001
     * @tc.desc      ECMA-262 §15.4: Verify empty method and void return method can be called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodEmptyAndVoid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: EmptyMethod = new EmptyMethod()
      obj.doNothing()
      expect(obj.flag).assertEqual(false)
      obj.returnsVoid()
      expect(obj.flag).assertEqual(true)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0200
     * @tc.name      testMethodSingleParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with single number parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodSingleParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: SingleParam = new SingleParam()
      expect(obj.double(5)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0300
     * @tc.name      testMethodMultiParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with multiple parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodMultiParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: MultiParam = new MultiParam()
      expect(obj.add(3, 4)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0400
     * @tc.name      testMethodReturnTypes0001
     * @tc.desc      ECMA-262 §15.4: Verify methods with number, string, boolean, array return types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodReturnTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ReturnTypes = new ReturnTypes()
      expect(obj.getNum()).assertEqual(42)
      expect(obj.getStr()).assertEqual('hello')
      expect(obj.getArr().length).assertEqual(3)
      expect(obj.getArr()[0]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0500
     * @tc.name      testMethodBigintReturn0001
     * @tc.desc      ArkTS dynamic: Verify method returning bigint via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodBigintReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: string = getBigintMethodResult()
      expect(s).assertEqual('100')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0700
     * @tc.name      testMethodCallsMethod0001
     * @tc.desc      ECMA-262 §15.4: Verify method body calls another instance method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodCallsMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: MethodCallsMethod = new MethodCallsMethod()
      expect(obj.derived()).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_0900
     * @tc.name      testMethodOptionalParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with optional parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodOptionalParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OptionalParam = new OptionalParam()
      expect(obj.concat('a', 'b')).assertEqual('ab')
      expect(obj.concat('a')).assertEqual('a')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1000
     * @tc.name      testMethodRestParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodRestParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: RestParam = new RestParam()
      expect(obj.sum(1, 2, 3)).assertEqual(6)
      expect(obj.sum(10)).assertEqual(10)
      expect(obj.sum()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1100
     * @tc.name      testMethodDefaultParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with default parameter value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodDefaultParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: DefaultParam = new DefaultParam()
      expect(obj.greet('World')).assertEqual('Hello, World')
      expect(obj.greet('World', 'Hi')).assertEqual('Hi, World')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1200
     * @tc.name      testMethodClassParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with class typed parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodClassParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ClassParam = new ClassParam()
      let p: Point = new Point(3, 4)
      expect(obj.distance(p)).assertEqual(25)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1300
     * @tc.name      testMethodInterfaceParam0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify method with interface typed parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodInterfaceParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: InterfaceParam = new InterfaceParam()
      let c: Circle = new Circle()
      expect(obj.render(c)).assertEqual('circle')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1400
     * @tc.name      testMethodArrayParam0001
     * @tc.desc      ECMA-262 §15.4: Verify method with array typed parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodArrayParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ArrayParam = new ArrayParam()
      let items: string[] = ['a', 'b', 'c']
      expect(obj.join(items)).assertEqual('abc')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1500
     * @tc.name      testMethodReturnThis0001
     * @tc.desc      ECMA-262 §15.4: Verify method returns this for chaining
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodReturnThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: Chainable = new Chainable()
      let result: Chainable = obj.add(5).multiply(3)
      expect(result.value).assertEqual(15)
      expect(result).assertEqual(obj)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1600
     * @tc.name      testMethodStatic0001
     * @tc.desc      ECMA-262 §15.2: Verify static method callable on class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticMethod.version()).assertEqual('1.0')
      expect(StaticMethod.double(5)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1700
     * @tc.name      testMethodProtected0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify protected method accessible in derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodProtected0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: MethodChild = new MethodChild()
      expect(obj.callProtected()).assertEqual('base')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_1800
     * @tc.name      testMethodReturnObject0001
     * @tc.desc      ECMA-262 §15.4: Verify method returns class instance object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodReturnObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ObjReturn = new ObjReturn()
      let p: Point = obj.getPoint()
      expect(p.x).assertEqual(3)
      expect(p.y).assertEqual(4)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_2000
     * @tc.name      testMethodGenerator0001
     * @tc.desc      ArkTS dynamic: Verify generator method yields values correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodGenerator0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testGeneratorValues()
      expect(result).assertEqual('123')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_2100
     * @tc.name      testMethodComputedName0001
     * @tc.desc      ArkTS dynamic: Verify method with computed property name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodComputedName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testComputedMethodCall()).assertEqual('computed-method')
      expect(testComputedMethodString()).assertEqual('12')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_2200
     * @tc.name      testStaticComputedMethod0001
     * @tc.desc      ArkTS dynamic: Verify static method with computed property name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticComputedMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testStaticComputedGetStatus()).assertEqual('active')
      expect(testStaticComputedCalcValue()).assertEqual(6)
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_2300
     * @tc.name      testAsyncGeneratorMethod0001
     * @tc.desc      ArkTS dynamic: Verify async generator method yields values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAsyncGeneratorMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let result: string = await testAsyncGeneratorValues()
      expect(result).assertEqual('123')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_2400
     * @tc.name      testMethodRestString0001
     * @tc.desc      ECMA-262 §15.4: Verify method with rest parameter joins variable string arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodRestString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let j: StringJoiner = new StringJoiner()
      let result: string = j.join(', ', 'a', 'b', 'c')
      expect(result).assertEqual('a, b, c')
    })

    /**
     * @tc.number    SUB_CLASS_METHOD_2500
     * @tc.name      testMethodRestNumberBase0001
     * @tc.desc      ECMA-262 §15.4: Verify method with rest parameter of number type with base value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodRestNumberBase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let j: StringJoiner = new StringJoiner()
      let total: number = j.sumWithBase(10, 1, 2, 3)
      expect(total).assertEqual(16)
    })
  })
}
