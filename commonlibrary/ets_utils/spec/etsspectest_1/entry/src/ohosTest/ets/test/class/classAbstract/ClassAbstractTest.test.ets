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
import { testMultiAbstractChain } from './classAbstractTsHelper'

export default function ClassAbstractTest() {
  describe('ClassAbstractTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_ABSTRACT_0100
     * @tc.name      testMultiAbstractChain0001
     * @tc.desc      ArkTS dynamic: Verify multi-level abstract inheritance: A abstract -> B abstract -> C concrete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMultiAbstractChain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r: string = testMultiAbstractChain()
      let parts: string[] = r.split("|")
      expect(parts[0]).assertEqual('leaf-level')
      expect(parts[1]).assertEqual('42')
      expect(parts[2]).assertEqual('base-concrete')
    })
  })
}
