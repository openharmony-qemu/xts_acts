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
  testInterfaceUnion,
  IdentityAndValueResult,
  OptionalOmittedResult,
  MethodReceiverResult,
  ClassImplResult,
  ExtendsAllResult,
  ObjectModelResult,
  ArrayResult,
  FnParamReturnResult,
  NestedResult,
  CallSignatureResult,
  ConstructSignatureResult,
  ReadonlyResult,
  ExtendsClassResult,
  UnionResult
} from './interfaceTsHelper'

export default function InterfaceTest() {
  describe('InterfaceTest', () => {
    beforeAll(() => {})
    beforeEach(() => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_INTERFACE_0100
     * @tc.name      testInterfaceErasureIdentity0001
     * @tc.desc      ArkTS dynamic: Verify interface annotation does not change object identity or property values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceErasureIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: IdentityAndValueResult = testIdentityAndValue()
      expect(r.x).assertEqual(10)
      expect(r.label).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_INTERFACE_0200
     * @tc.name      testInterfaceOptionalOmitted0001
     * @tc.desc      ArkTS dynamic: Verify omitted optional property does not create own property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceOptionalOmitted0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: OptionalOmittedResult = testOptionalOmitted()
      expect(r.hasOptional).assertEqual(false)
      expect(r.requiredValue).assertEqual('req')
    })

    /**
     * @tc.number    SUB_INTERFACE_0300
     * @tc.name      testInterfaceMethodReceiver0001
     * @tc.desc      ArkTS dynamic: Verify method call on interface-typed object binds this to receiver
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceMethodReceiver0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: MethodReceiverResult = testMethodReceiver()
      expect(r.result).assertEqual(42)
    })

    /**
     * @tc.number    SUB_INTERFACE_0400
     * @tc.name      testInterfaceClassImpl0001
     * @tc.desc      ArkTS dynamic: Verify class implements preserves prototype, instanceof, and supports multi-interface
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceClassImpl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ClassImplResult = testClassImpl()
      expect(r.shapeDraw).assertEqual('shape-draw')
      expect(r.shapeExtra).assertEqual('extra')
      expect(r.bothLeft).assertEqual('left')
      expect(r.bothRight).assertEqual('right')
    })

    /**
     * @tc.number    SUB_INTERFACE_0500
     * @tc.name      testInterfaceExtends0001
     * @tc.desc      ArkTS dynamic: Verify interface single, multi-level, and multi-base extends merge all members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceExtends0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ExtendsAllResult = testInterfaceExtendsAll()
      expect(r.singleA).assertEqual('A')
      expect(r.singleB).assertEqual('B')
      expect(r.singleC).assertEqual('C')
      expect(r.multiX).assertEqual('X')
      expect(r.multiY).assertEqual('Y')
      expect(r.multiZ).assertEqual('Z')
    })

    /**
     * @tc.number    SUB_INTERFACE_0600
     * @tc.name      testInterfaceObjectModel0001
     * @tc.desc      ArkTS dynamic: Verify interface-typed object follows ECMAScript object model: assign, read, write, delete, missing undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceObjectModel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ObjectModelResult = testObjectModel()
      expect(r.readX).assertEqual(3)
      expect(r.readY).assertEqual(4)
      expect(r.missing).assertEqual(undefined)
      expect(r.afterWrite).assertEqual(20)
      expect(r.hasDeleted).assertEqual(false)
    })

    /**
     * @tc.number    SUB_INTERFACE_0700
     * @tc.name      testInterfaceArray0001
     * @tc.desc      ArkTS dynamic: Verify interface-typed array elements can be read and written
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ArrayResult = testInterfaceArray()
      expect(r.length).assertEqual(2)
      expect(r.firstX).assertEqual(1)
      expect(r.firstY).assertEqual(2)
      expect(r.afterWrite).assertEqual(5)
    })

    /**
     * @tc.number    SUB_INTERFACE_0800
     * @tc.name      testInterfaceFnParamReturn0001
     * @tc.desc      ArkTS dynamic: Verify interface as function parameter and return type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceFnParamReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: FnParamReturnResult = testInterfaceFnParamReturn()
      expect(r.outputValue).assertEqual(20)
      expect(r.outputLabel).assertEqual('test-processed')
    })

    /**
     * @tc.number    SUB_INTERFACE_0900
     * @tc.name      testInterfaceNested0001
     * @tc.desc      ArkTS dynamic: Verify nested interface property read and write
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceNested0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: NestedResult = testNestedInterface()
      expect(r.initialId).assertEqual(42)
      expect(r.name).assertEqual('outer')
      expect(r.afterWrite).assertEqual(99)
    })

    /**
     * @tc.number    SUB_INTERFACE_1000
     * @tc.name      testInterfaceCallSignature0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify interface call signature with callable object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceCallSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: CallSignatureResult = testCallSignature()
      expect(r.result).assertEqual('42')
    })

    /**
     * @tc.number    SUB_INTERFACE_1100
     * @tc.name      testInterfaceConstructSignature0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify interface construct signature with constructable class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceConstructSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ConstructSignatureResult = testConstructSignature()
      expect(r.x).assertEqual(1)
      expect(r.y).assertEqual(2)
    })

    /**
     * @tc.number    SUB_INTERFACE_1200
     * @tc.name      testInterfaceReadonlyErasure0001
     * @tc.desc      ArkTS dynamic: Verify interface readonly is compile-time only, object is mutable at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceReadonlyErasure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ReadonlyResult = testInterfaceReadonly()
      expect(r.afterWrite).assertEqual(30)
    })

    /**
     * @tc.number    SUB_INTERFACE_1300
     * @tc.name      testInterfaceExtendsClass0001
     * @tc.desc      ArkTS dynamic: Verify interface can extend a class type and merge members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceExtendsClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: ExtendsClassResult = testInterfaceExtendsClass()
      expect(r.baseResult).assertEqual('base')
      expect(r.extraResult).assertEqual('extra')
    })

    /**
     * @tc.number    SUB_INTERFACE_1400
     * @tc.name      testInterfaceUnion0001
     * @tc.desc      ArkTS dynamic (TS-only): Verify interface union type with discriminant property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testInterfaceUnion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: UnionResult = testInterfaceUnion()
      expect(r.catKind).assertEqual('cat')
      expect(r.catMeow).assertEqual('meow')
      expect(r.dogKind).assertEqual('dog')
      expect(r.dogBark).assertEqual('woof')
    })
  })
}
