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
import { testDefaultDerivedCtorPassthrough, testNewTargetPropagation } from './classConstructorTsHelper'

class EmptyCtor {
  public x: number = 1

  constructor() {
  }
}

class ParamInitCtor {
  public x: number
  public label: string

  constructor(x: number, label: string) {
    this.x = x
    this.label = label
  }
}

class CtorCallMethod {
  public value: number = 0

  constructor(v: number) {
    this.init(v)
  }

  public init(v: number): void {
    this.value = v
  }
}

class CtorAccessStatic {
  public static defaultX: number = 10
  public x: number

  constructor() {
    this.x = CtorAccessStatic.defaultX
  }
}

class CtorOptional {
  public a: string
  public b: string

  constructor(a: string, b?: string) {
    this.a = a
    this.b = b !== undefined ? b : 'default'
  }
}

class CtorRest {
  public values: number[]

  constructor(...values: number[]) {
    this.values = values
  }
}

class CtorDefault {
  public x: number
  public label: string

  constructor(x: number = 5, label: string = 'default') {
    this.x = x
    this.label = label
  }
}

let sideEffectCount: number = 0

function sideEffectDefault(): string {
  sideEffectCount++
  return 'side-effect'
}

class CtorSideEffect {
  public a: string
  public b: string

  constructor(a: string, b: string = sideEffectDefault()) {
    this.a = a
    this.b = b
  }
}

class CtorRestMixed {
  public prefix: string
  public items: number[]

  constructor(prefix: string, ...items: number[]) {
    this.prefix = prefix
    this.items = items
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

class CtorClassParam {
  public p: Point

  constructor(p: Point) {
    this.p = p
  }

  public getX(): number {
    return this.p.x
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

class CtorInterfaceParam {
  public d: Drawable

  constructor(d: Drawable) {
    this.d = d
  }

  public render(): string {
    return this.d.draw()
  }
}

class CtorArrayParam {
  public items: string[]

  constructor(items: string[]) {
    this.items = items
  }

  public count(): number {
    return this.items.length
  }
}

class BaseField {
  public baseValue: string = 'from-base'

  constructor() {
  }
}

class ChildSuperThenThis extends BaseField {
  public derivedValue: string

  constructor() {
    super()
    this.derivedValue = this.baseValue + '-ext'
  }
}

class BaseWithParam {
  public baseValue: number

  constructor(v: number) {
    this.baseValue = v
  }
}

class ChildSuperWithArg extends BaseWithParam {
  public childValue: number

  constructor(baseVal: number, childVal: number) {
    super(baseVal)
    this.childValue = childVal
  }
}

class GenericCtor<T> {
  public value: T

  constructor(v: T) {
    this.value = v
  }

  public getValue(): T {
    return this.value
  }
}

export default function ClassConstructorTest() {
  describe('ClassConstructorTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
      sideEffectCount = 0
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0100
     * @tc.name      testCtorEmpty0001
     * @tc.desc      ECMA-262 §15.2: Verify explicit empty constructor creates instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: EmptyCtor = new EmptyCtor()
      expect(obj.x).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0200
     * @tc.name      testCtorParamInit0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with parameters initializes fields
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorParamInit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ParamInitCtor = new ParamInitCtor(42, 'test')
      expect(obj.x).assertEqual(42)
      expect(obj.label).assertEqual('test')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0300
     * @tc.name      testCtorCallMethod0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor calls instance method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorCallMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: CtorCallMethod = new CtorCallMethod(7)
      expect(obj.value).assertEqual(7)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0400
     * @tc.name      testCtorAccessStatic0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor accesses static member
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorAccessStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: CtorAccessStatic = new CtorAccessStatic()
      expect(obj.x).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0500
     * @tc.name      testCtorOptionalParam0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with optional parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorOptionalParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj1: CtorOptional = new CtorOptional('a')
      expect(obj1.a).assertEqual('a')
      expect(obj1.b).assertEqual('default')
      let obj2: CtorOptional = new CtorOptional('a', 'b')
      expect(obj2.a).assertEqual('a')
      expect(obj2.b).assertEqual('b')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0600
     * @tc.name      testCtorRestParam0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorRestParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj1: CtorRest = new CtorRest(1, 2, 3)
      expect(obj1.values.length).assertEqual(3)
      expect(obj1.values[0]).assertEqual(1)
      let obj2: CtorRest = new CtorRest()
      expect(obj2.values.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0700
     * @tc.name      testCtorDefaultParam0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with default parameter values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorDefaultParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj1: CtorDefault = new CtorDefault()
      expect(obj1.x).assertEqual(5)
      expect(obj1.label).assertEqual('default')
      let obj2: CtorDefault = new CtorDefault(10, 'custom')
      expect(obj2.x).assertEqual(10)
      expect(obj2.label).assertEqual('custom')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0800
     * @tc.name      testCtorClassParam0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with class typed parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorClassParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: Point = new Point(3, 4)
      let obj: CtorClassParam = new CtorClassParam(p)
      expect(obj.getX()).assertEqual(3)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_0900
     * @tc.name      testCtorInterfaceParam0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with interface typed parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorInterfaceParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let c: Circle = new Circle()
      let obj: CtorInterfaceParam = new CtorInterfaceParam(c)
      expect(obj.render()).assertEqual('circle')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1000
     * @tc.name      testCtorArrayParam0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with array typed parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorArrayParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let items: string[] = ['a', 'b', 'c']
      let obj: CtorArrayParam = new CtorArrayParam(items)
      expect(obj.count()).assertEqual(3)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1300
     * @tc.name      testCtorSuperThenThis0001
     * @tc.desc      ECMA-262 §15.2: Verify super() then access this field in derived constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorSuperThenThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ChildSuperThenThis = new ChildSuperThenThis()
      expect(obj.baseValue).assertEqual('from-base')
      expect(obj.derivedValue).assertEqual('from-base-ext')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1400
     * @tc.name      testCtorSuperWithArg0001
     * @tc.desc      ECMA-262 §15.2: Verify derived constructor passes args via super()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorSuperWithArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ChildSuperWithArg = new ChildSuperWithArg(10, 20)
      expect(obj.baseValue).assertEqual(10)
      expect(obj.childValue).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1500
     * @tc.name      testCtorGeneric0001
     * @tc.desc      ECMA-262 §15.2: Verify generic class constructor with type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let objNum: GenericCtor<number> = new GenericCtor<number>(42)
      expect(objNum.value).assertEqual(42)
      expect(objNum.getValue()).assertEqual(42)
      let objStr: GenericCtor<string> = new GenericCtor<string>('hello')
      expect(objStr.value).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1600
     * @tc.name      testCtorDefaultDerivedPassthrough0001
     * @tc.desc      ArkTS dynamic: Verify derived class without explicit ctor passes args to base ctor via default super(...args)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorDefaultDerivedPassthrough0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v: number = testDefaultDerivedCtorPassthrough()
      expect(v).assertEqual(42)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1700
     * @tc.name      testCtorNewTarget0001
     * @tc.desc      ArkTS dynamic: Verify new.target propagates through inheritance chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorNewTarget0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let s: string = testNewTargetPropagation()
      expect(s).assertEqual('child')
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1800
     * @tc.name      testCtorDefaultSideEffect0001
     * @tc.desc      ECMA-262 §15.2: Verify default param side effect runs only when arg is omitted
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorDefaultSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      sideEffectCount = 0
      let obj: CtorSideEffect = new CtorSideEffect('provided', 'explicit')
      expect(obj.a).assertEqual('provided')
      expect(obj.b).assertEqual('explicit')
      expect(sideEffectCount).assertEqual(0)

      let obj2: CtorSideEffect = new CtorSideEffect('only')
      expect(obj2.a).assertEqual('only')
      expect(obj2.b).assertEqual('side-effect')
      expect(sideEffectCount).assertEqual(1)
    })

    /**
     * @tc.number    SUB_CLASS_CONSTRUCTOR_1900
     * @tc.name      testCtorRestMixed0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor with regular param followed by rest param
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCtorRestMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: CtorRestMixed = new CtorRestMixed('nums', 1, 2, 3)
      expect(obj.prefix).assertEqual('nums')
      expect(obj.items.length).assertEqual(3)
      expect(obj.items[0]).assertEqual(1)
      expect(obj.items[2]).assertEqual(3)
    })
  })
}
