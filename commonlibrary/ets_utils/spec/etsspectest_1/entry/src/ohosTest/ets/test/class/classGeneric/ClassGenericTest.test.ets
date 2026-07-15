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
import { testGenericMethod, testGenericConstraint } from './classGenericTsHelper'

export default function ClassGenericTest() {
  describe('ClassGenericTest', () => {
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
     * @tc.number    SUB_CLASS_GENERIC_0100
     * @tc.name      testGenericMethod0001
     * @tc.desc      Verify generic method map<U> in generic class with type transformation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testGenericMethod()).assertEqual('10')
    })

    /**
     * @tc.number    SUB_CLASS_GENERIC_0200
     * @tc.name      testGenericConstraint0001
     * @tc.desc      Verify generic class with extends constraint on type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericConstraint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(testGenericConstraint()).assertEqual('5')
    })
  })
}
