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

/*
 * NOTE: readonly is a compile-time constraint in ArkTS.
 * The compiler rejects reassignment to readonly fields outside declaration/constructor,
 * so XTS can only verify the positive path (values are readable).
 * Negative tests (confirming that reassignment is rejected) require compile-fail
 * testing, which is outside XTS scope.
 */
class ReadonlyDecl {
  public readonly id: number = 100
  public readonly label: string = 'fixed'
}

class ReadonlyCtor {
  public readonly id: number
  public readonly name: string

  constructor(id: number, name: string) {
    this.id = id
    this.name = name
  }
}

class ReadonlyStatic {
  public static readonly VERSION: string = '1.0.0'
  public static readonly MAX_COUNT: number = 100
}

export default function ClassReadonlyTest() {
  describe('ClassReadonlyTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_READONLY_0100
     * @tc.name      testReadonlyDecl0001
     * @tc.desc      ArkTS dynamic: Verify readonly field initialized at declaration is readable (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReadonlyDecl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ReadonlyDecl = new ReadonlyDecl()
      expect(obj.id).assertEqual(100)
      expect(obj.label).assertEqual('fixed')
    })

    /**
     * @tc.number    SUB_CLASS_READONLY_0200
     * @tc.name      testReadonlyCtor0001
     * @tc.desc      ArkTS dynamic: Verify readonly field initialized in constructor is readable (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReadonlyCtor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: ReadonlyCtor = new ReadonlyCtor(1, 'test')
      expect(obj.id).assertEqual(1)
      expect(obj.name).assertEqual('test')
    })

    /**
     * @tc.number    SUB_CLASS_READONLY_0300
     * @tc.name      testReadonlyStatic0001
     * @tc.desc      ArkTS dynamic: Verify readonly static field is readable (positive only; compile-time constraint not testable in XTS)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testReadonlyStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(ReadonlyStatic.VERSION).assertEqual('1.0.0')
      expect(ReadonlyStatic.MAX_COUNT).assertEqual(100)
    })
  })
}
