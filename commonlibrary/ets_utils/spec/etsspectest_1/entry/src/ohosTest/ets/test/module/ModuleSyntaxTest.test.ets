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
  CONST_VAL,
  exportedFn,
  ExportedClass,
  localA,
  localB,
  renamedA,
  renamedB,
  moduleInitialized
} from './jsExporter'
import { localA as importedA, localB as importedB } from './jsExporter'
import * as ns from './jsExporter'
import { reExportedConst, CONST_VAL as reExported2 } from './jsReExporter'
import './jsExporter'
import defaultVal, {
  defaultFn,
  DefaultClass,
  mutableVal,
  stableConst,
  stableFn,
  mutateMutableVal,
  resetMutableVal
} from './jsDefaultExport'
import * as nsDefault from './jsDefaultExport'
import {
  checkNsPrototypeNull,
  checkNsFrozen,
  checkNsHasKey,
  checkNsToStringTag,
  getNsPropertyDescriptor
} from './nsPropertyHelper'

let moduleThis = this

export default function ModuleSyntaxTest() {
  describe('ModuleSyntaxTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
      resetMutableVal()
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0100
     * @tc.name      testExportConst0001
     * @tc.desc      Verify exported const value matches (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportConst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CONST_VAL).assertEqual(42)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0200
     * @tc.name      testExportFunction0001
     * @tc.desc      Verify exported function is callable (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(exportedFn(5)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0300
     * @tc.name      testExportClass0001
     * @tc.desc      Verify exported class is instantiable (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ExportedClass = new ExportedClass()
      expect(obj.getValue()).assertEqual(10)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0400
     * @tc.name      testExportList0001
     * @tc.desc      Verify multiple named exports from export list (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(localA).assertEqual(1)
      expect(localB).assertEqual(2)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0500
     * @tc.name      testExportRename0001
     * @tc.desc      Verify exported binding with rename (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExportRename0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(renamedA).assertEqual(1)
      expect(renamedB).assertEqual(2)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0600
     * @tc.name      testImportRename0001
     * @tc.desc      Verify imported binding with rename (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testImportRename0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(importedA).assertEqual(1)
      expect(importedB).assertEqual(2)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0700
     * @tc.name      testNamespaceImport0001
     * @tc.desc      Verify namespace import accesses all exports (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNamespaceImport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(ns.CONST_VAL).assertEqual(42)
      expect(ns.exportedFn(3)).assertEqual(6)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0800
     * @tc.name      testReExport0001
     * @tc.desc      Verify re-exported binding from export star (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReExport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(reExportedConst).assertEqual(42)
      expect(reExported2).assertEqual(42)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_0900
     * @tc.name      testSideEffectImport0001
     * @tc.desc      Verify side-effect import executes module code (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSideEffectImport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(moduleInitialized).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1000
     * @tc.name      testDefaultExportValue0001
     * @tc.desc      Verify default exported value via default import (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultExportValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(defaultVal).assertEqual(100)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1100
     * @tc.name      testDefaultExportFunction0001
     * @tc.desc      Verify default exported function is callable (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultExportFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(defaultFn()).assertEqual('from-default-fn')
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1200
     * @tc.name      testDefaultExportClass0001
     * @tc.desc      Verify default exported class is instantiable (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDefaultExportClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: DefaultClass = new DefaultClass()
      expect(obj.getName()).assertEqual('default-class')
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1300
     * @tc.name      testLiveBinding0001
     * @tc.desc      Verify exported let/const/function bindings (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLiveBinding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(mutableVal).assertEqual(1)
      mutateMutableVal()
      expect(mutableVal).assertEqual(2)
      mutateMutableVal()
      expect(mutableVal).assertEqual(3)
      expect(stableConst).assertEqual('stable')
      expect(stableFn()).assertEqual('fn-binding')
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1400
     * @tc.name      testNamespaceDefault0001
     * @tc.desc      Verify namespace object contains all exports (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNamespaceDefault0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(nsDefault.default).assertEqual(100)
      expect(nsDefault.defaultFn()).assertEqual('from-default-fn')
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1500
     * @tc.name      testModuleTopThis0001
     * @tc.desc      Verify module top-level this is undefined (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testModuleTopThis0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(moduleThis).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1600
     * @tc.name      testNamespaceDefaultAccess0001
     * @tc.desc      Verify namespace includes default export (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNamespaceDefaultAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(nsDefault.default).assertEqual(100)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1700
     * @tc.name      testModuleScopeIsolation0001
     * @tc.desc      Verify exports from different modules are independently accessible (§16.2.2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testModuleScopeIsolation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(CONST_VAL).assertEqual(42)
      expect(defaultVal).assertEqual(100)
      expect(ns.CONST_VAL).assertEqual(42)
      expect(nsDefault.default).assertEqual(100)
      expect(checkNsHasKey(ns, 'moduleInternal')).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1800
     * @tc.name      testNsFrozen0001
     * @tc.desc      Verify namespace object is not frozen (writable for live binding) (§16.2.3.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNsFrozen0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkNsFrozen(ns)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_1900
     * @tc.name      testNsPropertyDescriptor0001
     * @tc.desc      Verify namespace property descriptor —— writable for live binding (§16.2.3.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNsPropertyDescriptor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let desc = getNsPropertyDescriptor(ns, 'CONST_VAL')
      expect(desc!.writable).assertEqual(true)
      expect(desc!.enumerable).assertEqual(true)
      expect(desc!.configurable).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_2000
     * @tc.name      testNsHasProp0001
     * @tc.desc      Verify namespace has export via helper (§16.2.3.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNsHasProp0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkNsHasKey(ns, 'CONST_VAL')).assertEqual(true)
      expect(checkNsHasKey(ns, 'xxx')).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_2100
     * @tc.name      testNsPrototypeNull0001
     * @tc.desc      Verify namespace [[Prototype]] is null (§16.2.3.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNsPrototypeNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkNsPrototypeNull(ns)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FUNCTION_MODULE_SYNTAX_2200
     * @tc.name      testNsToStringTag0001
     * @tc.desc      Verify namespace [Symbol.toStringTag] is Module (§16.2.3.1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNsToStringTag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(checkNsToStringTag(ns)).assertEqual(true)
    })
  })
}
