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
import {
  testGenericExtendsNonGeneric,
  testConcreteExtendsGeneric,
  testPassthroughGeneric
} from './classInheritanceTsHelper'

class MyAppError extends Error {
  public code: number

  constructor(message: string, code: number) {
    super(message)
    this.code = code
  }

  public getCode(): number {
    return this.code
  }
}

export default function ClassInheritanceTest() {
  describe('ClassInheritanceTest', () => {
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
     * @tc.number    SUB_CLASS_INHERITANCE_0100
     * @tc.name      testGenericExtendsNonGeneric0001
     * @tc.desc      Verify generic class extends non-generic class, inherits fields and uses own type param
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGenericExtendsNonGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = testGenericExtendsNonGeneric()
      expect(result).assertEqual(52)
    })

    /**
     * @tc.number    SUB_CLASS_INHERITANCE_0200
     * @tc.name      testConcreteExtendsGeneric0001
     * @tc.desc      Verify non-generic class extends generic class with concrete type argument
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConcreteExtendsGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = testConcreteExtendsGeneric()
      expect(result).assertEqual(99)
    })

    /**
     * @tc.number    SUB_CLASS_INHERITANCE_0300
     * @tc.name      testPassthroughGeneric0001
     * @tc.desc      Verify derived class passes its generic type parameter to base class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPassthroughGeneric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: number = testPassthroughGeneric()
      expect(result).assertEqual(50)
    })

    /**
     * @tc.number    SUB_CLASS_INHERITANCE_0400
     * @tc.name      testClassExtendsBuiltin0001
     * @tc.desc      Verify class extends built-in Error class, inherits message property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassExtendsBuiltin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let err: MyAppError = new MyAppError("not found", 404)
      expect(err instanceof MyAppError).assertEqual(true)
      expect(err instanceof Error).assertEqual(true)
      expect(err.message).assertEqual("not found")
      expect(err.code).assertEqual(404)
      expect(err.getCode()).assertEqual(404)
    })
  })
}
