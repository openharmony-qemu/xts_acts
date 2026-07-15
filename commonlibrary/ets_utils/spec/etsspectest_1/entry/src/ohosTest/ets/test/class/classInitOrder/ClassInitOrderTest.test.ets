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

class FieldBeforeCtor {
  public value: number = 1

  constructor() {
    this.value = this.value + 1
  }
}

class BaseField {
  public baseValue: string = 'from-base'

  constructor() {
  }
}

class DerivedFieldAfterSuper extends BaseField {
  public derivedValue: string

  constructor() {
    super()
    this.derivedValue = this.baseValue + '-ext'
  }
}

class StaticRefOrder {
  public static base: number = 5
  public static derived: number = StaticRefOrder.base * 2
}

class StaticBlockOrder {
  public static step1: number = 0
  public static step2: number = 0
  static {
    StaticBlockOrder.step1 = 10
    StaticBlockOrder.step2 = StaticBlockOrder.step1 * 2
  }
}

export default function ClassInitOrderTest() {
  describe('ClassInitOrderTest', () => {
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
     * @tc.number    SUB_CLASS_INITORDER_0100
     * @tc.name      testFieldBeforeCtor0001
     * @tc.desc      Verify field initializer runs before constructor body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFieldBeforeCtor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let f: FieldBeforeCtor = new FieldBeforeCtor()
      expect(f.value).assertEqual(2)
    })

    /**
     * @tc.number    SUB_CLASS_INITORDER_0200
     * @tc.name      testDerivedFieldAfterSuper0001
     * @tc.desc      Verify derived class field initializer runs after super() returns
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDerivedFieldAfterSuper0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: DerivedFieldAfterSuper = new DerivedFieldAfterSuper()
      expect(obj.baseValue).assertEqual('from-base')
      expect(obj.derivedValue).assertEqual('from-base-ext')
    })

    /**
     * @tc.number    SUB_CLASS_INITORDER_0300
     * @tc.name      testStaticRefOrder0001
     * @tc.desc      Verify static field can reference earlier static field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticRefOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticRefOrder.base).assertEqual(5)
      expect(StaticRefOrder.derived).assertEqual(10)
    })

    /**
     * @tc.number    SUB_CLASS_INITORDER_0400
     * @tc.name      testStaticBlockOrder0001
     * @tc.desc      Verify static block initializes fields in declaration order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStaticBlockOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(StaticBlockOrder.step1).assertEqual(10)
      expect(StaticBlockOrder.step2).assertEqual(20)
    })
  })
}
