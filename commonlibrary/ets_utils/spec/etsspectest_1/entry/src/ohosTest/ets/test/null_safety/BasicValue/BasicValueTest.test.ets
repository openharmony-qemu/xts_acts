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

export default function BasicValueTest() {
  describe('BasicValueTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0100
     * @tc.name      testTypeofNull0001
     * @tc.desc      Verify typeof null returns "object" (ECMA-262 §13.5.3 Table 40 historical)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypeofNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(typeof null).assertEqual('object')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0200
     * @tc.name      testTypeofUndefined0002
     * @tc.desc      Verify typeof undefined returns "undefined" (ECMA-262 §13.5.3 Table 40)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypeofUndefined0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(typeof undefined).assertEqual('undefined')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0300
     * @tc.name      testNullVsUndefinedTypeDifference0003
     * @tc.desc      Verify typeof null and typeof undefined are different strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullVsUndefinedTypeDifference0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(typeof null === typeof undefined).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0400
     * @tc.name      testLooselyEqualNullUndefined0004
     * @tc.desc      Verify null == undefined is true (ECMA-262 §7.2.14 IsLooselyEqual)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLooselyEqualNullUndefined0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(null == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0500
     * @tc.name      testStrictlyEqualNullUndefined0005
     * @tc.desc      Verify null === undefined is false (ECMA-262 §7.2.15 IsStrictlyEqual)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrictlyEqualNullUndefined0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(null === undefined).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0600
     * @tc.name      testNullSelfEquality0006
     * @tc.desc      Verify null == null is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNullSelfEquality0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(null == null).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0700
     * @tc.name      testUndefinedSelfEquality0007
     * @tc.desc      Verify undefined == undefined is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testUndefinedSelfEquality0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(undefined == undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0800
     * @tc.name      testNullNotLooselyEqualToZero0008
     * @tc.desc      Verify null == 0 is false (null only loosely equals undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNullNotLooselyEqualToZero0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(null == 0).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_0900
     * @tc.name      testUndefinedNotLooselyEqualToZero0009
     * @tc.desc      Verify undefined == 0 is false (undefined only loosely equals null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUndefinedNotLooselyEqualToZero0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(undefined == 0).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1000
     * @tc.name      testBooleanNull0010
     * @tc.desc      Verify Boolean(null) is false (ECMA-262 §7.1.2 ToBoolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testBooleanNull0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Boolean(null)).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1100
     * @tc.name      testBooleanUndefined0011
     * @tc.desc      Verify Boolean(undefined) is false (ECMA-262 §7.1.2 ToBoolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testBooleanUndefined0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Boolean(undefined)).assertFalse()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1200
     * @tc.name      testNotNull0012
     * @tc.desc      Verify !null is true (ECMA-262 §7.1.2 ToBoolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNotNull0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(!null).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1300
     * @tc.name      testNumberNull0013
     * @tc.desc      Verify Number(null) is 0 (ECMA-262 §7.1.3 ToNumber)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberNull0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Number(null)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1400
     * @tc.name      testNumberUndefined0014
     * @tc.desc      Verify Number(undefined) is NaN (ECMA-262 §7.1.3 ToNumber)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUndefined0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let nan: number = Number(undefined)
      expect(nan !== nan).assertTrue()
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1500
     * @tc.name      testStringNull0015
     * @tc.desc      Verify String(null) is "null" (ECMA-262 §7.1.12 ToString)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringNull0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(String(null)).assertEqual('null')
    })

    /**
     * @tc.number    SUB_NULL_SAFETY_BASIC_1600
     * @tc.name      testStringUndefined0016
     * @tc.desc      Verify String(undefined) is "undefined" (ECMA-262 §7.1.12 ToString)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUndefined0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(String(undefined)).assertEqual('undefined')
    })
  })
}
