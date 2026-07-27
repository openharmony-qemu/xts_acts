/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
import {
  callProcessValueNumber,
  callProcessValueString,
  callHandleMixedNumber,
  callHandleMixedString,
  callProcessArrayOrItemString,
  callProcessArrayOrItemNumberArray,
  callProcessArrayOrItemNumber,
  getOverloadRuntimeEntityType,
  callOverloadRuntimeNumber,
  callOverloadRuntimeString
} from './genericOverloadTsHelper'

export default function GenericOverloadTest() {
  describe('GenericOverloadTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0100
     * @tc.name      testOverloadSignatures0001
     * @tc.desc      GTP-OL-001: overload implementation handles number input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadSignatures0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callProcessValueNumber(3)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0200
     * @tc.name      testOverloadSignatures0002
     * @tc.desc      GTP-OL-001: overload implementation handles string input
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadSignatures0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callProcessValueString('a')).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0300
     * @tc.name      testMixedOverload0001
     * @tc.desc      GTP-OL-002: mixed overload number branch returns number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMixedOverload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callHandleMixedNumber(10)).assertEqual(10)
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0400
     * @tc.name      testMixedOverload0002
     * @tc.desc      GTP-OL-002: mixed overload generic branch returns string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMixedOverload0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callHandleMixedString('mix')).assertEqual('mix')
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0500
     * @tc.name      testOverloadExplicitTypeArg0001
     * @tc.desc      GTP-OL-003: explicit string type argument path returns hello
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadExplicitTypeArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callProcessArrayOrItemString('hello')).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0600
     * @tc.name      testOverloadInference0001
     * @tc.desc      GTP-OL-004: number array input selects array branch and returns first element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadInference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callProcessArrayOrItemNumberArray([1, 2, 3])).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0700
     * @tc.name      testOverloadInference0002
     * @tc.desc      GTP-OL-004: single number input selects item branch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadInference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callProcessArrayOrItemNumber(99)).assertEqual(99)
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0800
     * @tc.name      testOverloadRuntimeErasure0001
     * @tc.desc      GTP-OL-008: runtime entity type is function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadRuntimeErasure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getOverloadRuntimeEntityType()).assertEqual('function')
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_0900
     * @tc.name      testOverloadRuntimeErasure0002
     * @tc.desc      GTP-OL-008: single implementation handles number at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadRuntimeErasure0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callOverloadRuntimeNumber(1)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_OL_OVERLOAD_1000
     * @tc.name      testOverloadRuntimeErasure0003
     * @tc.desc      GTP-OL-008: single implementation handles string at runtime
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testOverloadRuntimeErasure0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(callOverloadRuntimeString('s')).assertEqual('s')
    })
  })
}
