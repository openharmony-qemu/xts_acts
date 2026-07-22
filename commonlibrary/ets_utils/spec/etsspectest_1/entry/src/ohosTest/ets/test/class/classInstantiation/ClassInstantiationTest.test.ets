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

class DefaultCtor {
  public x: number = 0
  public y: number = 0
}

class ParamCtor {
  public x: number
  public y: number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
}

class FieldInit {
  public multiplier: number = 2
  public base: number
  public observedMultiplier: number

  constructor(base: number) {
    this.observedMultiplier = this.multiplier
    this.base = base
  }

  public result(): number {
    return this.base * this.multiplier
  }
}

class CtorThrows {
  constructor() {
    throw new Error('ctor-error')
  }
}

export default function ClassInstantiationTest() {
  describe('ClassInstantiationTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_INSTANTIATION_0100
     * @tc.name      testNewDefaultCtor0001
     * @tc.desc      ECMA-262 §15.2: Verify new with default constructor creates instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNewDefaultCtor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: DefaultCtor = new DefaultCtor()
      expect(p.x).assertEqual(0)
      expect(p.y).assertEqual(0)
    })

    /**
     * @tc.number    SUB_CLASS_INSTANTIATION_0200
     * @tc.name      testNewParamCtor0001
     * @tc.desc      ECMA-262 §15.2: Verify new with parameterized constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNewParamCtor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let p: ParamCtor = new ParamCtor(3, 4)
      expect(p.x).assertEqual(3)
      expect(p.y).assertEqual(4)
    })

    /**
     * @tc.number    SUB_CLASS_INSTANTIATION_0300
     * @tc.name      testNewWithFieldInit0001
     * @tc.desc      ECMA-262 §15.2: Verify field initializers run before constructor body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNewWithFieldInit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: FieldInit = new FieldInit(10)
      expect(f.base).assertEqual(10)
      expect(f.multiplier).assertEqual(2)
      expect(f.observedMultiplier).assertEqual(2)
      expect(f.result()).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_INSTANTIATION_0400
     * @tc.name      testNewCtorThrows0001
     * @tc.desc      ECMA-262 §15.2: Verify constructor that throws error is propagated during new
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNewCtorThrows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        new CtorThrows()
        expect('no throw').assertEqual('should have thrown')
      } catch (e) {
        expect(String(e)).assertEqual('Error: ctor-error')
      }
    })
  })
}
