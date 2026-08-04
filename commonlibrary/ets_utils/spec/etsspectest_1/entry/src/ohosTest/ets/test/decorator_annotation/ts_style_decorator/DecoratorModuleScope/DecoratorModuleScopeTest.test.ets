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
  ImportedClass,
  importedBoolean,
  importedClassParamFactory,
  importedConst,
  importedConstParamFactory,
  verifyImportedFactoryNoParams,
  verifyImportedFactorySingleParam,
  verifyImportedFactoryMultiParam,
  verifyImportedFactoryReturnDeco,
  verifyImportedFactoryClosure,
  importedFactoryNoParams,
  importedFactorySingleParam,
  importedFactoryMultiParam,
  importedFactoryReturnDeco,
  importedFactoryClosure,
  importedFunction,
  importedFunctionParamFactory,
  importedNumber,
  importedNumberParamFactory,
  importedString,
  importedStringParamFactory,
  importedBooleanParamFactory,
  verifyRefImportedNumber,
  verifyRefImportedString,
  verifyRefImportedBoolean,
  verifyCreateImportedClass,
  verifyCallImportedFunction,
  verifyRefImportedConst
} from './DecoratorModuleScopeHelper';

@importedFactoryNoParams()
class ModuleScopeFactoryNoParamsTarget {
  value: number = 1
}

@importedFactorySingleParam('hello')
class ModuleScopeFactorySingleParamTarget {
  value: number = 2
}

@importedFactoryMultiParam('a', 1)
class ModuleScopeFactoryMultiParamTarget {
  value: number = 3
}

@importedFactoryReturnDeco()
class ModuleScopeFactoryReturnDecoTarget {
  value: number = 4
}

@importedFactoryClosure('closure_value')
class ModuleScopeFactoryClosureTarget {
  value: number = 5
}

@importedNumberParamFactory(importedNumber)
class ModuleScopeImportedNumberTarget {
  value: number = 6
}

@importedStringParamFactory(importedString)
class ModuleScopeImportedStringTarget {
  value: number = 7
}

@importedBooleanParamFactory(importedBoolean)
class ModuleScopeImportedBooleanTarget {
  value: number = 8
}

@importedClassParamFactory(new ImportedClass('test_instance'))
class ModuleScopeImportedClassTarget {
  value: number = 9
}

@importedFunctionParamFactory(importedFunction)
class ModuleScopeImportedFunctionTarget {
  value: number = 10
}

@importedConstParamFactory(importedConst)
class ModuleScopeImportedConstTarget {
  value: number = 11
}

export default function DecoratorModuleScopeTest() {
  describe('DecoratorModuleScopeTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0100
     * @tc.name      testClassImportedFactoryNoParams0001
     * @tc.desc      Verify imported no-parameter class decorator factory is evaluated and applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImportedFactoryNoParams0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyImportedFactoryNoParams()).assertEqual('factory_no_params:decorator_applied')
      expect(new ModuleScopeFactoryNoParamsTarget().value).assertEqual(1)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0200
     * @tc.name      testClassImportedFactorySingleParam0002
     * @tc.desc      Verify imported class decorator factory with single parameter is evaluated and applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImportedFactorySingleParam0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyImportedFactorySingleParam()).assertEqual('factory_single_param:hello:decorator_applied')
      expect(new ModuleScopeFactorySingleParamTarget().value).assertEqual(2)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0300
     * @tc.name      testClassImportedFactoryMultiParam0003
     * @tc.desc      Verify imported class decorator factory with multiple parameters is evaluated and applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImportedFactoryMultiParam0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyImportedFactoryMultiParam()).assertEqual('factory_multi_param:a:1:decorator_applied')
      expect(new ModuleScopeFactoryMultiParamTarget().value).assertEqual(3)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0400
     * @tc.name      testClassImportedFactoryReturnDeco0004
     * @tc.desc      Verify imported factory-returned class decorator function is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImportedFactoryReturnDeco0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyImportedFactoryReturnDeco()).assertEqual('factory_return_deco:decorator_applied')
      expect(new ModuleScopeFactoryReturnDecoTarget().value).assertEqual(4)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0500
     * @tc.name      testClassImportedFactoryClosure0005
     * @tc.desc      Verify imported closure factory captures parameter when class decorator is applied.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassImportedFactoryClosure0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyImportedFactoryClosure()).assertEqual('factory_closure:closure_value:decorator_applied')
      expect(new ModuleScopeFactoryClosureTarget().value).assertEqual(5)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0600
     * @tc.name      testClassParamRefImportedNumber0006
     * @tc.desc      Verify decorator factory parameter references imported number value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamRefImportedNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyRefImportedNumber()).assertEqual(42)
      expect(new ModuleScopeImportedNumberTarget().value).assertEqual(6)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0700
     * @tc.name      testClassParamRefImportedString0007
     * @tc.desc      Verify decorator factory parameter references imported string value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamRefImportedString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyRefImportedString()).assertEqual('imported_string:imported_value')
      expect(new ModuleScopeImportedStringTarget().value).assertEqual(7)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0800
     * @tc.name      testClassParamRefImportedBoolean0008
     * @tc.desc      Verify decorator factory parameter references imported boolean value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamRefImportedBoolean0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyRefImportedBoolean()).assertEqual(true)
      expect(new ModuleScopeImportedBooleanTarget().value).assertEqual(8)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_0900
     * @tc.name      testClassParamRefImportedClass0009
     * @tc.desc      Verify decorator factory parameter references imported class instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamRefImportedClass0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyCreateImportedClass()).assertEqual('imported_class:test_instance')
      expect(new ModuleScopeImportedClassTarget().value).assertEqual(9)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_1000
     * @tc.name      testClassParamRefImportedFunction0010
     * @tc.desc      Verify decorator factory parameter references imported function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamRefImportedFunction0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyCallImportedFunction()).assertEqual('imported_function:imported_function_result')
      expect(new ModuleScopeImportedFunctionTarget().value).assertEqual(10)
    })

    /**
     * @tc.number    SUB_DECORATOR_MODULE_SCOPE_1100
     * @tc.name      testClassParamRefImportedConst0011
     * @tc.desc      Verify decorator factory parameter references imported const.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassParamRefImportedConst0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(verifyRefImportedConst()).assertEqual('imported_const:imported_const_value')
      expect(new ModuleScopeImportedConstTarget().value).assertEqual(11)
    })
  })
}
