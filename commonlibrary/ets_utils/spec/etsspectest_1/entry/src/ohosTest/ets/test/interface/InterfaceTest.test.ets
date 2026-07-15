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
import utils from '../Utils';
import {
  testIdentityAndValue,
  testOptionalOmitted,
  testMethodReceiver,
  testClassImpl,
  testInterfaceExtendsAll,
  testObjectModel,
  testInterfaceArray,
  testInterfaceFnParamReturn,
  testNestedInterface,
  testCallSignature,
  testConstructSignature,
  testInterfaceReadonly,
  testInterfaceExtendsClass,
  testInterfaceUnion
} from './interfaceTsHelper'

export default function InterfaceTest() {
  describe('InterfaceTest', () => {
    beforeAll(() => {})
    beforeEach(async () => { await utils.msSleep(30); })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_INTERFACE_0100
     * @tc.name      testInterfaceErasureIdentity0001
     * @tc.desc      Verify interface annotation does not change object identity or property values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceErasureIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testIdentityAndValue()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0200
     * @tc.name      testInterfaceOptionalOmitted0001
     * @tc.desc      Verify omitted optional property does not create own property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceOptionalOmitted0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testOptionalOmitted()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0300
     * @tc.name      testInterfaceMethodReceiver0001
     * @tc.desc      Verify method call on interface-typed object binds this to receiver
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceMethodReceiver0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testMethodReceiver()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0400
     * @tc.name      testInterfaceClassImpl0001
     * @tc.desc      Verify class implements preserves prototype, instanceof, and supports multi-interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceClassImpl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testClassImpl()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0500
     * @tc.name      testInterfaceExtends0001
     * @tc.desc      Verify interface single, multi-level, and multi-base extends merge all members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceExtends0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testInterfaceExtendsAll()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0600
     * @tc.name      testInterfaceObjectModel0001
     * @tc.desc      Verify interface-typed object follows ECMAScript object model: assign, read, write, delete, missing undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceObjectModel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testObjectModel()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0700
     * @tc.name      testInterfaceArray0001
     * @tc.desc      Verify interface-typed array elements can be read and written
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testInterfaceArray()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0800
     * @tc.name      testInterfaceFnParamReturn0001
     * @tc.desc      Verify interface as function parameter and return type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceFnParamReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testInterfaceFnParamReturn()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_0900
     * @tc.name      testInterfaceNested0001
     * @tc.desc      Verify nested interface property read and write
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceNested0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testNestedInterface()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_1000
     * @tc.name      testInterfaceCallSignature0001
     * @tc.desc      Verify interface call signature with callable object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceCallSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testCallSignature()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_1100
     * @tc.name      testInterfaceConstructSignature0001
     * @tc.desc      Verify interface construct signature with constructable class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceConstructSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testConstructSignature()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_1200
     * @tc.name      testInterfaceReadonlyErasure0001
     * @tc.desc      Verify interface readonly is compile-time only, object is mutable at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceReadonlyErasure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testInterfaceReadonly()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_1300
     * @tc.name      testInterfaceExtendsClass0001
     * @tc.desc      Verify interface can extend a class type and merge members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceExtendsClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testInterfaceExtendsClass()).assertEqual('ok')
    })

    /**
     * @tc.number    SUB_INTERFACE_1400
     * @tc.name      testInterfaceUnion0001
     * @tc.desc      Verify interface union type with discriminant property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceUnion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testInterfaceUnion()).assertEqual('ok')
    })
  })
}
