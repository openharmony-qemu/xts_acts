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
import utils from '../../Utils';
import {
  getStaticThisValue,
  getStaticThisMultiplied,
  testStaticComputedGet,
  testStaticComputedSet,
  testMultiStaticBlockResult
} from './classStaticTsHelper'

// design 010: static field external write
class StaticWriteField {
  public static counter: number = 0
}

// design 021 + 022: child accesses inherited static field and method
class StaticParent {
  public static parentField: string = 'parent-field'

  public static parentMethod(): string {
    return 'parent-method'
  }
}

class StaticChild extends StaticParent {
}

// design 023 + 024: child shadows/overrides base static field and method
class StaticShadowBase {
  public static label: string = 'base-label'

  public static getLabel(): string {
    return 'base-getLabel'
  }
}

class StaticShadowChild extends StaticShadowBase {
  public static label: string = 'child-label'

  public static getLabel(): string {
    return 'child-getLabel'
  }
}

export default function ClassStaticTest() {
  describe('ClassStaticTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0100
     * @tc.name      testStaticFieldWrite0001
     * @tc.desc      Verify static field can be written and read externally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticFieldWrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticWriteField.counter).assertEqual(0)
      StaticWriteField.counter = 5
      expect(StaticWriteField.counter).assertEqual(5)
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0200
     * @tc.name      testStaticThisAccess0001
     * @tc.desc      Verify this in static method accesses static field and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticThisAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getStaticThisValue()).assertEqual(10)
      expect(getStaticThisMultiplied(3)).assertEqual(30)
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0300
     * @tc.name      testStaticInheritance0001
     * @tc.desc      Verify child class accesses inherited static field and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticChild.parentField).assertEqual('parent-field')
      expect(StaticChild.parentMethod()).assertEqual('parent-method')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0400
     * @tc.name      testStaticShadow0001
     * @tc.desc      Verify child class shadows base static field and method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticShadow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticShadowBase.label).assertEqual('base-label')
      expect(StaticShadowBase.getLabel()).assertEqual('base-getLabel')
      expect(StaticShadowChild.label).assertEqual('child-label')
      expect(StaticShadowChild.getLabel()).assertEqual('child-getLabel')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0500
     * @tc.name      testStaticComputedAccessor0001
     * @tc.desc      Verify static computed getter/setter via TS helper
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticComputedAccessor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testStaticComputedGet()).assertEqual('init-value')
      expect(testStaticComputedSet()).assertEqual('new-value')
    })

    /**
     * @tc.number    SUB_CLASS_STATIC_0600
     * @tc.name      testStaticMultiBlock0001
     * @tc.desc      Verify multiple static blocks execute in declaration order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticMultiBlock0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: string = testMultiStaticBlockResult()
      let parts: string[] = result.split("|")
      expect(parts[0]).assertEqual('10')
      expect(parts[1]).assertEqual('20')
      expect(parts[2]).assertEqual('25')
    })
  })
}
