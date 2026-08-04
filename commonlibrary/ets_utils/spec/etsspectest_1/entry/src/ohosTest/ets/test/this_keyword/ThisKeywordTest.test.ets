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
  callReturnsA,
  applyReturnsA,
  bindReturnsB,
  plainStrictThis,
  objMethodThis,
  callCannotChangeArrowThis,
  bindThenCallReturnsB,
  bindCallbackReturnsB,
  staticMethodThisIsClass,
  callNullThisIsNull,
  bindCannotChangeArrowThis,
  bindNullThisIsNull
} from './ThisKeywordHelper'

class ThisBasic {
  id: number
  ctorRef: ThisBasic

  constructor(id: number) {
    this.id = id
    this.ctorRef = this
  }

  self(): ThisBasic {
    return this
  }

  arrowSelf(): () => ThisBasic {
    return () => this
  }

  arrowCapturedId(): () => number {
    return () => this.id
  }

  nestedArrowSelf(): () => () => ThisBasic {
    return () => () => this
  }

  get selfViaGetter(): ThisBasic {
    return this
  }
}

class SetterThis {
  id: number

  constructor(id: number) {
    this.id = id
  }

  set setId(v: number) {
    this.id = v
  }
}

class Base {
  baseId: number
  constructor(baseId: number) { this.baseId = baseId }
  who(): string { return String(this.baseId) }
}

class Derived extends Base {
  extra: number

  constructor(baseId: number, extra: number) {
    super(baseId)
    this.extra = extra
  }

  derivedSelf(): Derived {
    return this
  }

  combined(): string {
    return this.who() + this.extra
  }
}

class ArrowCbThis {
  id: number

  constructor(id: number) {
    this.id = id
  }

  callbackReturningThis(): () => ArrowCbThis {
    return () => this
  }

  runAsCallback(): ArrowCbThis {
    const cb = this.callbackReturningThis()
    return invokeCbThis(cb)
  }
}

class DerivedWithSuper extends Base {
  extra: number

  constructor(baseId: number, extra: number) {
    super(baseId)
    this.extra = extra
  }

  superWho(): string {
    return super.who()
  }

  getId(): number {
    return this.baseId
  }
}

function invokeCbThis(cb: () => ArrowCbThis): ArrowCbThis {
  return cb()
}

export default function ThisKeywordTest() {
  describe('ThisKeywordTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0100
     * @tc.name      testthiskeyword0001
     * @tc.desc      Verify method call this is the receiver object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b = new ThisBasic(1)
      expect(b.self() === b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0200
     * @tc.name      testthiskeyword0002
     * @tc.desc      Verify arrow function captures lexical this from enclosing method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b = new ThisBasic(2)
      expect(b.arrowSelf()() === b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0300
     * @tc.name      testthiskeyword0003
     * @tc.desc      Verify call changes this to the passed receiver. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callReturnsA()).assertEqual('A')
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0400
     * @tc.name      testthiskeyword0004
     * @tc.desc      Verify apply changes this to the passed receiver. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(applyReturnsA()).assertEqual('A')
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0500
     * @tc.name      testthiskeyword0005
     * @tc.desc      Verify bind permanently binds this to the passed receiver. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bindReturnsB()).assertEqual('B')
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0600
     * @tc.name      testthiskeyword0006
     * @tc.desc      Verify class constructor this is the new instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b = new ThisBasic(6)
      expect(b.ctorRef === b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0700
     * @tc.name      testthiskeyword0007
     * @tc.desc      Verify static method this is the class constructor. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(staticMethodThisIsClass()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0800
     * @tc.name      testthiskeyword0008
     * @tc.desc      Verify getter this is the accessed object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b = new ThisBasic(9)
      expect(b.selfViaGetter === b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_0900
     * @tc.name      testthiskeyword0009
     * @tc.desc      Verify plain function call strict this is undefined. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(plainStrictThis()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_1000
     * @tc.name      testthiskeyword0010
     * @tc.desc      Verify obj.method() this is the calling object. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(objMethodThis()).assertEqual('OBJ1')
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_1200
     * @tc.name      testthiskeyword0012
     * @tc.desc      Verify arrow function captures outer this value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b = new ThisBasic(13)
      expect(b.arrowCapturedId()()).assertEqual(b.id)
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_1300
     * @tc.name      testthiskeyword0013
     * @tc.desc      Verify nested arrow preserves outermost this
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b = new ThisBasic(14)
      expect(b.nestedArrowSelf()()() === b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_1400
     * @tc.name      testthiskeyword0014
     * @tc.desc      Verify call cannot change arrow lexical this. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callCannotChangeArrowThis()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_1800
     * @tc.name      testthiskeyword0018
     * @tc.desc      Verify call cannot override a prior bind of this. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bindThenCallReturnsB()).assertEqual('B')
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2000
     * @tc.name      testthiskeyword0020
     * @tc.desc      Verify derived class this is initialized after super()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const d = new Derived(1, 2)
      expect(d.derivedSelf() === d).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2200
     * @tc.name      testthiskeyword0022
     * @tc.desc      Verify this is usable after super() in derived constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const d = new Derived(1, 2)
      expect(d.extra).assertEqual(2)
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2300
     * @tc.name      testthiskeyword0023
     * @tc.desc      Verify setter this is the assigned object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = new SetterThis(0)
      s.setId = 9
      expect(s.id).assertEqual(9)
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2400
     * @tc.name      testthiskeyword0024
     * @tc.desc      Verify arrow callback preserves enclosing this
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ac = new ArrowCbThis(27)
      expect(ac.runAsCallback() === ac).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2500
     * @tc.name      testthiskeyword0025
     * @tc.desc      Verify bind callback preserves bound this. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bindCallbackReturnsB()).assertEqual('B')
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2700
     * @tc.name      testthiskeyword0027
     * @tc.desc      Verify this with arrow function callback combination
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2800
     * @tc.name      testthiskeyword0028
     * @tc.desc      Verify strict call(null) keeps this null (ECMA-262 §10.2.1.2). Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callNullThisIsNull()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_2900
     * @tc.name      testthiskeyword0029
     * @tc.desc      Verify negative: bind cannot override arrow lexical this. Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bindCannotChangeArrowThis()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_3000
     * @tc.name      testthiskeyword0030
     * @tc.desc      Verify strict bind(null) keeps this null (ECMA-262 §10.2.1.2). Observed via .ts helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testthiskeyword0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(bindNullThisIsNull()).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_3100
     * @tc.name      testOptionalChainThis0031
     * @tc.desc      Verify obj?.method() preserves this binding when obj is non-null (ECMA-262 OptionalChain §13.3.9)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOptionalChainThis0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let b: ThisBasic | null = new ThisBasic(1)
      expect(b?.self() === b).assertTrue()
    })

    /**
     * @tc.number    SUB_MODULE_THIS_KEYWORD_3200
     * @tc.name      testSuperMethodThis0032
     * @tc.desc      Verify super.method() this is the derived instance (ECMA-262 SuperCall §13.3.7)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSuperMethodThis0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let d: DerivedWithSuper = new DerivedWithSuper(5, 10)
      expect(d.superWho()).assertEqual('5')
      expect(d.getId()).assertEqual(5)
    })
  })
}
