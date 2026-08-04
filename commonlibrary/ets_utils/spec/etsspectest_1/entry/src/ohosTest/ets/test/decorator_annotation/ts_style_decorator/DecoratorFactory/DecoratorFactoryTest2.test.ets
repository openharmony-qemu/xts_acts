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
  importedLocalInitializerFactory,
  importedSideEffectFactory,
  readImportedModuleInitializerKey,
  readImportedModuleSideEffectCount
} from './DecoratorFactoryImportModule'

class DecoratorFactoryModuleSideEffectCase {
  @importedSideEffectFactory('moduleSideEffectValue')
  public moduleSideEffectValue: number = 103
}

class DecoratorFactoryImportedLocalInitializerCase {
  @importedLocalInitializerFactory('localInitializedValue')
  public localInitializedValue: number = 104
}

export default function DecoratorFactoryTest2() {
  describe('DecoratorFactoryTest2', () => {
    beforeAll(() => {})
    beforeEach(async () => { })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_5100
     * @tc.name      testClassDecoratorFactoryHelperModuleSideEffect0001
     * @tc.desc      Verify helper module factory side effect executes once (DECORATOR-FACTORY-TD-0103)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryHelperModuleSideEffect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: DecoratorFactoryModuleSideEffectCase = new DecoratorFactoryModuleSideEffectCase()
      expect(readImportedModuleSideEffectCount() + obj.moduleSideEffectValue).assertEqual(104)
    })

    /**
     * @tc.number    SUB_TS_DECORATOR_FACTORY_5200
     * @tc.name      testClassDecoratorFactoryImportedFactoryLocalInitializer0001
     * @tc.desc      Verify imported factory keeps local field initializer intact (DECORATOR-FACTORY-TD-0104)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassDecoratorFactoryImportedFactoryLocalInitializer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const obj: DecoratorFactoryImportedLocalInitializerCase = new DecoratorFactoryImportedLocalInitializerCase()
        const result: string = readImportedModuleInitializerKey() + ':' + obj.localInitializedValue.toString()
        expect(result).assertEqual('localInitializedValue:104')
      })
  })
}
