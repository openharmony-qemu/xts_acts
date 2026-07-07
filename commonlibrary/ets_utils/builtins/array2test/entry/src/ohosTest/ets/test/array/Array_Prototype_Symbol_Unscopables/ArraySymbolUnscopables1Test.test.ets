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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../../Util.test';
import * as ArraySymbolUnscopablesJs from './ArraySymbolUnscopablesTest';

export default function ArraySymbolUnscopables1TestSupplement() {
  describe('ArraySymbolUnscopables1TestSupplement', () => {
    beforeAll(() => {
    })
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /**
     * @tc.name testArraySymbolUnscopablesTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0100
     * @tc.desc Verify Array.prototype has a Symbol.unscopables property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0100()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0200
     * @tc.desc Verify different array instances share the same unscopables object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0101()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0300
     * @tc.desc Verify Symbol.unscopables does not appear among ordinary property names
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0102()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0400
     * @tc.desc Verify Symbol.unscopables appears among symbol-named properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0103()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0500
     * @tc.desc Verify the Symbol.unscopables property is non-writable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0104()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0600
     * @tc.desc Verify the Symbol.unscopables property is non-enumerable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0105()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0700
     * @tc.desc Verify the Symbol.unscopables property is configurable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0106()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0800
     * @tc.desc In a nested function inside with, an unscopable name should resolve from an outer scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0107()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_0900
     * @tc.desc Verify the type of unscopables is object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0108()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1000
     * @tc.desc Verify unscopables is not an instance of Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0109()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1100
     * @tc.desc Verify the unscopables property value is not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0110()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1200
     * @tc.desc Verify the unscopables object's [[Prototype]] is null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0111()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1300
     * @tc.desc Verify the prototype is null when accessed via __proto__
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0112()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1400
     * @tc.desc Verify unscopables does not inherit from Object.prototype
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0113()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1500
     * @tc.desc Verify the unscopables object has an at property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0114()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1600
     * @tc.desc Verify the unscopables object has a copyWithin property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0115()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1700
     * @tc.desc Verify the unscopables object has an entries property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0116()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1800
     * @tc.desc Verify the unscopables object has a fill property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0117()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_1900
     * @tc.desc Verify the unscopables object has a find property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0118()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2000
     * @tc.desc Verify the unscopables object has a findIndex property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0119()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2100
     * @tc.desc Verify the unscopables object has a findLast property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0120()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2200
     * @tc.desc Verify the unscopables object has a findLastIndex property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0121()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2300
     * @tc.desc Verify the unscopables object has a flat property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0122()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2400
     * @tc.desc Verify the unscopables object has a flatMap property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0123()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2500
     * @tc.desc Verify the unscopables object has an includes property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0124()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2600
     * @tc.desc Verify the unscopables object has a keys property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0125()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2700
     * @tc.desc Verify the unscopables object has a toReversed property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0126()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2800
     * @tc.desc Verify the unscopables object has a toSorted property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0127()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_2900
     * @tc.desc Verify the unscopables object has a toSpliced property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0128()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3000
     * @tc.desc Verify the unscopables object has a values property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0129()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3100
     * @tc.desc Verify every own property value on the unscopables object is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0130()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3200
     * @tc.desc Verify the at entry is strictly true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0131()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3300
     * @tc.desc Verify the includes entry is strictly true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0132()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3400
     * @tc.desc Verify the values entry is strictly true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0133()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3500
     * @tc.desc Verify push is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0134()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3600
     * @tc.desc Verify pop is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0135()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3700
     * @tc.desc Verify map is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0136()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3800
     * @tc.desc Verify forEach is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0137()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_3900
     * @tc.desc Verify length is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0138()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4000
     * @tc.desc Verify indexOf is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0139()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4100
     * @tc.desc Verify sort is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0140()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4200
     * @tc.desc Verify slice is not in the unscopables list
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0141()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4300
     * @tc.desc Verify the unscopables object has 16 own properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0142()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4400
     * @tc.desc Verify the unscopables object has no own symbol-keyed properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0143()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4500
     * @tc.desc Verify unscopables contains the full list of 16 property names
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0144()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4600
     * @tc.desc Inside with, flat should resolve to an outer binding, not Array.prototype.flat
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0145()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4700
     * @tc.desc Inside with, includes should resolve to an outer binding, not Array.prototype.includes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0146()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4800
     * @tc.desc Inside with, find should resolve to an outer binding, not Array.prototype.find
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0147()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_4900
     * @tc.desc Inside with, entries should resolve to an outer binding, not Array.prototype.entries
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0148()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5000
     * @tc.desc Inside with, at should resolve to an outer binding, not Array.prototype.at
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0149()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5100
     * @tc.desc length may be modified on the array inside with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0150()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5200
     * @tc.desc Add a custom property name to unscopables
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0151()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5300
     * @tc.desc Inside with, fill should resolve to an outer binding, not Array.prototype.fill
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0152()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5400
     * @tc.desc push is not unscopable; in with it binds to Array.prototype.push
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0153()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5500
     * @tc.desc pop is not unscopable; in with it binds to Array.prototype.pop
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0154()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5600
     * @tc.desc length is not unscopable; in with it binds to the array's length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0155()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5700
     * @tc.desc map is not unscopable; in with it binds to Array.prototype.map
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0156()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5800
     * @tc.desc toString is not in unscopables (null prototype); it should work normally in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0157()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_5900
     * @tc.desc indexOf is not unscopable; in with it binds to Array.prototype.indexOf
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0158()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0159
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6000
     * @tc.desc When a name is in the unscopables list, with should look it up from an outer scope
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0159()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0160
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6100
     * @tc.desc When an unscopable name is missing in an outer scope, access should throw ReferenceError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0160()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0161
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6200
     * @tc.desc When an outer function shares a name with an unscopable property, with should call the outer function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0161()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0162
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6300
     * @tc.desc Inside with, keys should resolve to an outer binding, not Array.prototype.keys
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0162()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0163
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6400
     * @tc.desc join is not unscopable; it can be called directly in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0163()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0164
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6500
     * @tc.desc concat is not unscopable; it can be called directly in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0164()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0165
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6600
     * @tc.desc reduce is not unscopable; it can be called directly in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0165()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0166
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6700
     * @tc.desc splice is not unscopable; it can be called directly in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0166()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0167
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6800
     * @tc.desc The at method must not bind in with; resolution falls back to an outer binding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0167()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0168
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_6900
     * @tc.desc Unscopables does not affect explicit at calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0168()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0169
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7000
     * @tc.desc The copyWithin method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0169()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0170
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7100
     * @tc.desc Unscopables does not affect explicit copyWithin calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0170()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0171
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7200
     * @tc.desc The entries method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0171()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0172
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7300
     * @tc.desc Unscopables does not affect explicit entries calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0172()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0173
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7400
     * @tc.desc The fill method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0173()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0174
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7500
     * @tc.desc Unscopables does not affect explicit fill calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0174()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0175
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7600
     * @tc.desc The find method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0175()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0176
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7700
     * @tc.desc Unscopables does not affect explicit find calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0176()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0177
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7800
     * @tc.desc The findIndex method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0177()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0178
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_7900
     * @tc.desc Unscopables does not affect explicit findIndex calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0178()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0179
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8000
     * @tc.desc The findLast method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0179()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0180
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8100
     * @tc.desc Unscopables does not affect explicit findLast calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0180()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0181
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8200
     * @tc.desc The findLastIndex method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0181()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0182
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8300
     * @tc.desc Unscopables does not affect explicit findLastIndex calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0182()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0183
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8400
     * @tc.desc The flat method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0183()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0184
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8500
     * @tc.desc Unscopables does not affect explicit flat calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0184()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0185
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8600
     * @tc.desc The flatMap method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0185()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0186
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8700
     * @tc.desc Unscopables does not affect explicit flatMap calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0186()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0187
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8800
     * @tc.desc The includes method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0187()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0188
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_8900
     * @tc.desc Unscopables does not affect explicit includes calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0188()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0189
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9000
     * @tc.desc The keys method must not bind in with; this is the main scenario unscopables addresses
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0189()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0190
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9100
     * @tc.desc Unscopables does not affect explicit keys calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0190()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0191
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9200
     * @tc.desc The toReversed method must not bind in with
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0191()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolUnscopablesTest0192
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_UNSCOPABLES_SUPPLEMENT_TEST_9300
     * @tc.desc Unscopables does not affect explicit toReversed calls on the object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolUnscopablesTest0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolUnscopablesJs.ArraySymbolUnscopablesJs_0192()).assertEqual(true);
    })
  })
}
