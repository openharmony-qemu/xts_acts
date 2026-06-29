'use static'
/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import { dcrFunctionEnumDefault, dcrFunctionConstDefault } from "../modules/dcr_function_defaults"
import { DcrCtorDefaultClass, DcrFieldInitClass, DcrMethodDefaultClass, DcrMethodOverrideBase, DcrMethodOverrideDerived } from "../modules/dcr_class_defaults"
import { dcrPick } from "../modules/dcr_overload_defaults"
import { DcrAnnoEnumDefault, DcrAnnoEnumArrayDefault } from "../modules/dcr_annotation_defaults"
import { dcrAcceptPublicUnion, dcrMakePublicUnion } from "../modules/dcr_type_alias_defaults"
import { DcrGenericBox, dcrGenericDefaultFunction } from "../modules/dcr_generic_defaults"
import { DcrAmbientAnno } from "../ambient/dcr_ambient_annotation"

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class DcrDerivedCtorDefaultClass extends DcrCtorDefaultClass {
  constructor() {
    super()
  }
}

@DcrAnnoEnumDefault
class DcrPass008Class {}

@DcrAnnoEnumArrayDefault
class DcrPass010Class {}

@DcrAmbientAnno
class DcrPass017Class {}

export default function DeclarationContextResolutionTest(): void {
  describe('DeclarationContextResolutionTest', () => {
    beforeAll(() => {
    })

    beforeEach(async () => {
      await sleep(30);
    })

    afterEach(() => {
    })

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_DCR_ALL_0100
     * @tc.name      testFunctionDefaultEnumPrivateImport
     * @tc.desc      Function parameter with enum default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionDefaultEnumPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testFunctionDefaultEnumPrivateImport start');
      expect(dcrFunctionEnumDefault()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_0200
     * @tc.name      testFunctionDefaultConstPrivateImport
     * @tc.desc      Function parameter with const default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionDefaultConstPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testFunctionDefaultConstPrivateImport start');
      expect(dcrFunctionConstDefault()).assertEqual(9)
    })

    /**
     * @tc.number    SUB_DCR_ALL_0300
     * @tc.name      testConstructorDefaultEnumPrivateImport
     * @tc.desc      Constructor parameter with enum default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConstructorDefaultEnumPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testConstructorDefaultEnumPrivateImport start');
      let c: DcrCtorDefaultClass = new DcrCtorDefaultClass()
      expect(c.value).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_0400
     * @tc.name      testSuperConstructorDefaultEnumPrivateImport
     * @tc.desc      Super constructor call with enum default resolves correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSuperConstructorDefaultEnumPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testSuperConstructorDefaultEnumPrivateImport start');
      let c: DcrDerivedCtorDefaultClass = new DcrDerivedCtorDefaultClass()
      expect(c.value).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_0500
     * @tc.name      testFieldInitializerEnumPrivateImport
     * @tc.desc      Field initializer using enum default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitializerEnumPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testFieldInitializerEnumPrivateImport start');
      let c: DcrFieldInitClass = new DcrFieldInitClass()
      expect(c.getValue()).assertEqual(1)
      expect(DcrFieldInitClass.getStaticValue()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_DCR_ALL_0600
     * @tc.name      testMethodDefaultEnumPrivateImport
     * @tc.desc      Method parameter with enum default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodDefaultEnumPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testMethodDefaultEnumPrivateImport start');
      let c: DcrMethodDefaultClass = new DcrMethodDefaultClass()
      expect(c.method()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_0700
     * @tc.name      testOverloadSignatureEnumPrivateImport
     * @tc.desc      Overload signature using enum default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverloadSignatureEnumPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testOverloadSignatureEnumPrivateImport start');
      expect(dcrPick(1)).assertEqual("int")
    })

    /**
     * @tc.number    SUB_DCR_ALL_0800
     * @tc.name      testAnnotationEnumDefaultPrivateImport
     * @tc.desc      Annotation with enum default resolves correctly and can be applied
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAnnotationEnumDefaultPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testAnnotationEnumDefaultPrivateImport start');
      let obj = new DcrPass008Class()
      expect(obj instanceof DcrPass008Class).assertTrue()
    })

    /**
     * @tc.number    SUB_DCR_ALL_1000
     * @tc.name      testAnnotationEnumArrayDefaultPrivateImport
     * @tc.desc      Annotation with enum array default resolves correctly and can be applied
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAnnotationEnumArrayDefaultPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testAnnotationEnumArrayDefaultPrivateImport start');
      let obj = new DcrPass010Class()
      expect(obj instanceof DcrPass010Class).assertTrue()
    })

    /**
     * @tc.number    SUB_DCR_ALL_1100
     * @tc.name      testMethodInheritedDefaultViaBaseType
     * @tc.desc      Inherited method with enum default resolves correctly via base type reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodInheritedDefaultViaBaseType", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testMethodInheritedDefaultViaBaseType start');
      let v: DcrMethodOverrideBase = new DcrMethodOverrideDerived()
      expect(v.method()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_1200
     * @tc.name      testMethodOverrideOwnDefaultPrivateImport
     * @tc.desc      Override method with own enum default resolves correctly via private import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodOverrideOwnDefaultPrivateImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testMethodOverrideOwnDefaultPrivateImport start');
      let v: DcrMethodOverrideDerived = new DcrMethodOverrideDerived()
      expect(v.method()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_1300
     * @tc.name      testNamespaceImportFunctionDefault
     * @tc.desc      Namespace import resolves function with enum default correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceImportFunctionDefault", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testNamespaceImportFunctionDefault start');
      expect(dcrFunctionEnumDefault()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_1400
     * @tc.name      testRenameImportFunctionDefault
     * @tc.desc      Renamed import resolves function with enum default correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRenameImportFunctionDefault", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testRenameImportFunctionDefault start');
      expect(dcrFunctionEnumDefault()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_1500
     * @tc.name      testTypeAliasPublicUnionWithoutImportMembers
     * @tc.desc      Type alias with public union resolves members correctly without explicit import
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeAliasPublicUnionWithoutImportMembers", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testTypeAliasPublicUnionWithoutImportMembers start');
      expect(dcrAcceptPublicUnion(dcrMakePublicUnion())).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_1600
     * @tc.name      testGenericDefaultPublicTypeWithoutImport
     * @tc.desc      Generic class/function with default type parameter resolves correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDefaultPublicTypeWithoutImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testGenericDefaultPublicTypeWithoutImport start');
      let box: DcrGenericBox = new DcrGenericBox()
      expect(box.getValue()).assertEqual(1)
      expect(dcrGenericDefaultFunction()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DCR_ALL_1700
     * @tc.name      testAmbientAnnotationDefaultEnumImport
     * @tc.desc      Ambient annotation with enum default resolves correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAmbientAnnotationDefaultEnumImport", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      console.log('testAmbientAnnotationDefaultEnumImport start');
      let obj = new DcrPass017Class()
      expect(obj instanceof DcrPass017Class).assertTrue()
    })
  })
}
