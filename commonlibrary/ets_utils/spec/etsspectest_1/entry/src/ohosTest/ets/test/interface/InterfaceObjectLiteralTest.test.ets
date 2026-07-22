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
import { testMethodShorthand, testNestedLiteral } from './interfaceObjectLiteralTsHelper'

export default function InterfaceObjectLiteralTest() {
  describe('InterfaceObjectLiteralTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_INTERFACE_OBJECTLITERAL_0100
     * @tc.name      testMethodShorthand0001
     * @tc.desc      ArkTS dynamic: Verify object literal with method shorthand satisfies interface type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodShorthand0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testMethodShorthand()).assertEqual('shorthand')
    })

    /**
     * @tc.number    SUB_INTERFACE_OBJECTLITERAL_0200
     * @tc.name      testNestedLiteral0001
     * @tc.desc      ArkTS dynamic: Verify nested object literal satisfies extended interface with all members
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNestedLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: string = testNestedLiteral()
      expect(r).assertEqual('nested-name|25|nested-label')
    })
  })
}
