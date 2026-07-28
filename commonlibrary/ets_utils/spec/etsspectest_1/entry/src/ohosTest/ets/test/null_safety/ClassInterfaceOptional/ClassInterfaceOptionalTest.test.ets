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
import { hasOwnProperty, getDescriptor } from './ClassInterfaceOptionalHelper.js'

// Module: ClassInterfaceOptional
// class 字段未初始化/显式 null、interface 可选属性缺省/显式 undefined。
// ECMA-262 ClassFieldDefinitionEvaluation §15.7.10

class FieldCheck {
  x: number = 5
}

class Container {
  uninitialized: number | undefined
  initialized: number = 5
  nullField: string | null

  constructor(v: string | null) {
    this.nullField = v
  }
}

interface Config {
  required: string
  optional?: number
}

export default function ClassInterfaceOptionalTest() {
  describe('ClassInterfaceOptionalTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_CLS_IF_0200
     * @tc.name      testClassFieldExplicitNull0002
     * @tc.desc      Verify class field can hold explicit null value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClassFieldExplicitNull0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let a: Container = new Container('text')
      expect(a.nullField).assertEqual('text')

      let b: Container = new Container(null)
      expect(b.nullField).assertEqual(null)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_CLS_IF_0300
     * @tc.name      testInterfaceOptionalPropertyAbsent0003
     * @tc.desc      Verify optional property absent in object literal yields undefined [ARKTS-ONLY: Object.hasOwn]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testInterfaceOptionalPropertyAbsent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let c: Config = { required: 'yes' }
      expect(c.required).assertEqual('yes')
      expect(c.optional).assertEqual(undefined)
      expect(hasOwnProperty(c, 'optional')).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_CLS_IF_0400
     * @tc.name      testInterfaceOptionalPropertyExplicitUndefined0004
     * @tc.desc      Verify optional property with explicit undefined value yields undefined [ARKTS-ONLY: Object.hasOwn]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testInterfaceOptionalPropertyExplicitUndefined0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let c: Config = { required: 'yes', optional: undefined }
      expect(c.optional).assertEqual(undefined)
      expect(hasOwnProperty(c, 'optional')).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_CLS_IF_0500
     * @tc.name      testInterfaceOptionalPropertyProvided0005
     * @tc.desc      Verify optional property returns value when provided
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testInterfaceOptionalPropertyProvided0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let c: Config = { required: 'yes', optional: 99 }
      expect(c.optional).assertEqual(99)
    })

    // P1.7: class 字段自有属性存在性
    /**
     * @tc.number    SUB_NULL_SAFETY_CLS_IF_0600
     * @tc.name      testClassFieldOwnProperty0006
     * @tc.desc      Verify class field initialized field has own property descriptor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClassFieldOwnProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: FieldCheck = new FieldCheck()
      expect(hasOwnProperty(obj, 'x')).assertTrue()
      expect(getDescriptor(obj, 'x')).assertTrue()
    })
  })
}
