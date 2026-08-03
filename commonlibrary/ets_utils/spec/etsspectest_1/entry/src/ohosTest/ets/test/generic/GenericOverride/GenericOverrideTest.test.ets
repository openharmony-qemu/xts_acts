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

class OverrideSameBase {
  public method<T>(v: T): T {
    return v
  }
}

class OverrideSameDerived extends OverrideSameBase {
  public override method<T>(v: T): T {
    return v
  }
}

class OverrideRenameBase {
  public method<T>(v: T): T {
    return v
  }
}

class OverrideRenameDerived extends OverrideRenameBase {
  public override method<U>(v: U): U {
    return v
  }
}

class OverrideChainBase {
  public getValue<T>(v: T): string {
    return 'base'
  }
}

class OverrideChainMid extends OverrideChainBase {
  public override getValue<T>(v: T): string {
    return 'mid'
  }
}

class OverrideChainDerived extends OverrideChainMid {
  public override getValue<T>(v: T): string {
    return 'derived'
  }
}

export default function GenericOverrideTest() {
  describe('GenericOverrideTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_OV_OVERRIDE_0100
     * @tc.name      testOverrideSameSignature0001
     * @tc.desc      Verify subclass overrides generic method with same signature, string and number arguments pass through. (GTP-OV-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideSameSignature0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const derived = new OverrideSameDerived()
      expect(derived.method<string>('hello')).assertEqual('hello')
      expect(derived.method<number>(42)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_OV_OVERRIDE_0200
     * @tc.name      testOverrideRenameTypeParam0001
     * @tc.desc      Verify override with renamed equivalent type parameter, string and number arguments pass through. (GTP-OV-002)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideRenameTypeParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const derived = new OverrideRenameDerived()
      expect(derived.method<string>('renamed')).assertEqual('renamed')
      expect(derived.method<number>(100)).assertEqual(100)
    })

    /**
     * @tc.number    SUB_GENERIC_OV_OVERRIDE_0300
     * @tc.name      testOverrideSameSignature0003
     * @tc.desc      Verify deepest override wins in multi-level chain Base→Mid→Derived. (GTP-OV-001)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverrideSameSignature0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const derived = new OverrideChainDerived()
      expect(derived.getValue<string>('test')).assertEqual('derived')

      const midRef: OverrideChainBase = new OverrideChainMid()
      expect(midRef.getValue<string>('test')).assertEqual('mid')
    })
  })
}
