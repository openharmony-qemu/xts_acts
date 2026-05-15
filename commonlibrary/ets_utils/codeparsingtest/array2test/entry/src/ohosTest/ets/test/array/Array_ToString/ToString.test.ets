/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ToStringJs from './ToString';

export default function ArrayToStringMindMapTest() {
  describe('ArrayToStringMindMapTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
      ToStringJs.restoreArrayPrototypeJoinSnapshot();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testToStringTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0100
     * @tc.desc   Convert simple array to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0100()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0200
     * @tc.desc   Convert mixed-type array to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0101()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify return value type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0102()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0400
     * @tc.desc   Empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0103()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0500
     * @tc.desc   Single-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0104()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0600
     * @tc.desc   Large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0105()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0700
     * @tc.desc   Numeric elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0106()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0800
     * @tc.desc   String elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0107()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_0900
     * @tc.desc   Boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0108()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1000
     * @tc.desc   null and undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0109()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1100
     * @tc.desc   Object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0110()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1200
     * @tc.desc   Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0111()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1300
     * @tc.desc   BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0112()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1400
     * @tc.desc   Function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0113()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1500
     * @tc.desc   Two-dimensional array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0114()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1600
     * @tc.desc   Multi-level nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0115()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1700
     * @tc.desc   Mixed nesting (array and non-array elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0116()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1800
     * @tc.desc   Array with holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0117()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_1900
     * @tc.desc   Holes at start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0118()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2000
     * @tc.desc   All-holes array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0119()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2100
     * @tc.desc   Sparse array from Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0120()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2200
     * @tc.desc   Self-referential array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0121()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2300
     * @tc.desc   Indirect circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0122()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2400
     * @tc.desc   Deep circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0123()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2500
     * @tc.desc   Normal join method call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0124()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2600
     * @tc.desc   join overridden as non-function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0125()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2700
     * @tc.desc   join method deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0126()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2800
     * @tc.desc   join returns non-string value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0127()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_2900
     * @tc.desc   join throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0128()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3000
     * @tc.desc   Implicit call in string concatenation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0129()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3100
     * @tc.desc   Implicit call in template literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0130()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3200
     * @tc.desc   Explicit String() conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0131()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3300
     * @tc.desc   Conversion via plus operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0132()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3400
     * @tc.desc   call on plain object with join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0133()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3500
     * @tc.desc   call on plain object without join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0134()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3600
     * @tc.desc   call with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0135()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3700
     * @tc.desc   call on primitive value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0136()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3800
     * @tc.desc   Call via apply and bind
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0137()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_3900
     * @tc.desc   Compare toString and join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0138()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4000
     * @tc.desc   Compare toString and toLocaleString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0139()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4100
     * @tc.desc   toString and valueOf interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0140()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4200
     * @tc.desc   Compare toString and JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0141()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4300
     * @tc.desc   Effect of modifying join on toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0142()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4400
     * @tc.desc   Array subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0143()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4500
     * @tc.desc   Array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0144()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4600
     * @tc.desc   Proxy-wrapped array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0145()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4700
     * @tc.desc   Frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0146()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4800
     * @tc.desc   Object.create(Array.prototype)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0147_empty()).assertEqual(true);
      expect(ToStringJs.ToStringJs_0147_indexed()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_4900
     * @tc.desc   Separator verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0148()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5000
     * @tc.desc   Return value immutability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0149()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5100
     * @tc.desc   toString does not mutate original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0150()).assertEqual(true);
    });
    /**
     * @tc.name   testToStringTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_TOSTRING_SUPPLEMENT_TEST_5200
     * @tc.desc   Consecutive toString calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testToStringTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ToStringJs.ToStringJs_0151()).assertEqual(true);
    });
  });
}
