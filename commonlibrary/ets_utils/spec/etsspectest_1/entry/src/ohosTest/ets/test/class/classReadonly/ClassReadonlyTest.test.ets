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
    beforeEach(async () => {
      await utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CLASS_READONLY_0100
     * @tc.name      testReadonlyDecl0001
     * @tc.desc      Verify readonly field initialized at declaration is readable
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
     * @tc.desc      Verify readonly field initialized in constructor is readable
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
     * @tc.desc      Verify readonly static field is readable
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
