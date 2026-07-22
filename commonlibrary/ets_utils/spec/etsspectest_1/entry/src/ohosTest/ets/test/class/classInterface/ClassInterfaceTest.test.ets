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
import { testMultiInterfaceExtends, testGenericInterfaceImpl } from './classInterfaceTsHelper'

export default function ClassInterfaceTest() {
  describe('ClassInterfaceTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_INTERFACE_0100
     * @tc.name      testMultiInterfaceExtends0001
     * @tc.desc      ArkTS dynamic: Verify class implements interface that extends multiple base interfaces
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMultiInterfaceExtends0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: string = testMultiInterfaceExtends()
      expect(r).assertEqual('impl-A|impl-B|impl-C')
    })

    /**
     * @tc.number    SUB_CLASS_INTERFACE_0200
     * @tc.name      testGenericInterfaceImpl0001
     * @tc.desc      ArkTS dynamic: Verify class implements generic interface with concrete type arguments
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericInterfaceImpl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: string = testGenericInterfaceImpl()
      expect(r).assertEqual('hello|42')
    })
  })
}
