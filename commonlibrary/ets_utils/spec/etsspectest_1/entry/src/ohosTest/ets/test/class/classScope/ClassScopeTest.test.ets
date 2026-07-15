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
import { describe, expect, it, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import utils from '../../Utils';

class ScopeOuter {
  public outerValue: string = 'outer'

  public makeInner(): ScopeInner {
    return new ScopeInner()
  }
}

class ScopeInner {
  public innerValue: string = 'inner'
}

class RefPriorField {
  public first: number = 5
  public second: number = this.first + 3
}

export default function ClassScopeTest() {
  describe('ClassScopeTest', () => {
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
     * @tc.number    SUB_CLASS_SCOPE_0100
     * @tc.name      testNestedScope0001
     * @tc.desc      Verify outer class method can create inner class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNestedScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let o: ScopeOuter = new ScopeOuter()
      let i: ScopeInner = o.makeInner()
      expect(o.outerValue).assertEqual('outer')
      expect(i.innerValue).assertEqual('inner')
    })

    /**
     * @tc.number    SUB_CLASS_SCOPE_0200
     * @tc.name      testFieldRefPrior0001
     * @tc.desc      Verify field initializer can reference prior declared field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldRefPrior0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: RefPriorField = new RefPriorField()
      expect(obj.first).assertEqual(5)
      expect(obj.second).assertEqual(8)
    })
  })
}
