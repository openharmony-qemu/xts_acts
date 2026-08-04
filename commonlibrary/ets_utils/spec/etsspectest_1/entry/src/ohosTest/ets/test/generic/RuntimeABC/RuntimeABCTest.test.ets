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
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium';

class Box<T> {
  public value: T

  public constructor(value: T) {
    this.value = value
  }
}

class Animal {
  public name: string = 'animal'

  public speak(): string {
    return 'generic sound'
  }
}

function identity<T>(value: T): T {
  return value
}

function checkType<T>(value: T): string {
  return typeof value
}

function genericThrow<T>(value: T): void {
  throw new Error('Generic exception')
}

export default function RuntimeABCTest() {
  describe('RuntimeABCTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_1700
     * @tc.name      testTypeArgDoesNotChangeFieldValueNumber0001
     * @tc.desc      Verify Box<number> value field equals actual number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeArgDoesNotChangeFieldValueNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const box: Box<number> = new Box<number>(42)
      expect(box.value).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_1800
     * @tc.name      testTypeArgDoesNotChangeFieldValueString0001
     * @tc.desc      Verify Box<string> value field equals actual string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeArgDoesNotChangeFieldValueString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const box: Box<string> = new Box<string>('hello')
      expect(box.value).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_2200
     * @tc.name      testTypeofInGenericFunctionNumber0001
     * @tc.desc      Verify typeof number value in generic function returns 'number'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofInGenericFunctionNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkType<number>(42)).assertEqual('number')
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_2300
     * @tc.name      testTypeofInGenericFunctionString0001
     * @tc.desc      Verify typeof string value in generic function returns 'string'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofInGenericFunctionString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkType<string>('hello')).assertEqual('string')
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_2400
     * @tc.name      testTypeofInGenericFunctionBoolean0001
     * @tc.desc      Verify typeof boolean value in generic function returns 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeofInGenericFunctionBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkType<boolean>(true)).assertEqual('boolean')
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_2600
     * @tc.name      testTypeArgDoesNotChangeBehaviorNumber0001
     * @tc.desc      Verify identity<number> returns the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeArgDoesNotChangeBehaviorNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(identity<number>(100)).assertEqual(100)
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_2700
     * @tc.name      testTypeArgDoesNotChangeBehaviorString0001
     * @tc.desc      Verify identity<string> returns the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeArgDoesNotChangeBehaviorString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(identity<string>('test')).assertEqual('test')
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_2800
     * @tc.name      testTypeArgDoesNotChangeBehaviorBoolean0001
     * @tc.desc      Verify identity<boolean> returns the same value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testTypeArgDoesNotChangeBehaviorBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(identity<boolean>(false)).assertFalse()
    })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_3100
     * @tc.name      testExceptionsSideEffectsTypeArgIndependentNumber0001
     * @tc.desc      Verify exception propagation works with number type argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExceptionsSideEffectsTypeArgIndependentNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let caught: boolean = false
        try {
          genericThrow<number>(42)
        } catch (e) {
          caught = true
          expect(e.message).assertEqual('Generic exception')
        }
        expect(caught).assertTrue()
      })

    /**
     * @tc.number    SUB_GENERIC_ABC_RUNTIME_3200
     * @tc.name      testExceptionsSideEffectsTypeArgIndependentString0001
     * @tc.desc      Verify exception propagation works with string type argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExceptionsSideEffectsTypeArgIndependentString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        let caught: boolean = false
        try {
          genericThrow<string>('hello')
        } catch (e) {
          caught = true
          expect(e.message).assertEqual('Generic exception')
        }
        expect(caught).assertTrue()
      })
  })
}
