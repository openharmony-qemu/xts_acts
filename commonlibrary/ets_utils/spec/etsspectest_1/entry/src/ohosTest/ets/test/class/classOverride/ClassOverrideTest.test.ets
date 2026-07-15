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

class BaseGreet {
  public speak(): string {
    return 'base'
  }
}

class OverrideGreet extends BaseGreet {
  public speak(): string {
    return 'override'
  }
}

class BaseCompute {
  public compute(): number {
    return 10
  }
}

class OverrideCompute extends BaseCompute {
  public compute(): number {
    return super.compute() * 2
  }
}

export default function ClassOverrideTest() {
  describe('ClassOverrideTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0100
     * @tc.name      testOverrideMethod0001
     * @tc.desc      Verify derived class method overrides base class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideGreet = new OverrideGreet()
      expect(obj.speak()).assertEqual('override')
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0200
     * @tc.name      testOverrideSuperCall0001
     * @tc.desc      Verify override method can call super.method() then add own logic
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideSuperCall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideCompute = new OverrideCompute()
      expect(obj.compute()).assertEqual(20)
    })

    /**
     * @tc.number    SUB_CLASS_OVERRIDE_0300
     * @tc.name      testBaseRefDerivedOverride0001
     * @tc.desc      Verify base type reference calls derived override method at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBaseRefDerivedOverride0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: OverrideCompute = new OverrideCompute()
      let base: BaseCompute = obj
      expect(base.compute()).assertEqual(20)
    })
  })
}
