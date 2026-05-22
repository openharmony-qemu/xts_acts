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
import * as ArraySymbolSpeciesJs from './ArraySymbolSpeciesTest';

export default function ArraySymbolSpeciesTestSupplement() {
  describe('ArraySymbolSpeciesTestSupplement', () => {
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
     * @tc.name testArraySymbolSpeciesTest0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0100
     * @tc.desc Verify Array[Symbol.species] returns the Array constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0100()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0200
     * @tc.desc Access property via Symbol.species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0101()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0300
     * @tc.desc Verify Symbol.species is non-enumerable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0102()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0400
     * @tc.desc Verify Symbol.species is configurable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0103()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0500
     * @tc.desc Verify Symbol.species is a getter accessor property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0104()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0600
     * @tc.desc Verify the getter return value is a function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0105()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0700
     * @tc.desc Verify the return value is the same as the Array constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0106()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0800
     * @tc.desc Verify repeated access returns the same constructor reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0107()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_0900
     * @tc.desc Create an array using the constructor from Symbol.species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0108()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1000
     * @tc.desc Verify subclass default Symbol.species returns the subclass constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0109()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1100
     * @tc.desc Access constructor[Symbol.species] via subclass instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0110()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1200
     * @tc.desc Verify Symbol.species behavior with two-level inheritance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0111()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1300
     * @tc.desc Verify Symbol.species behavior with three-level inheritance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0112()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1400
     * @tc.desc Verify subclass filter returns instance of subclass type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0113()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1500
     * @tc.desc Verify subclass map returns instance of subclass type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0114()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1600
     * @tc.desc Verify subclass concat returns instance of subclass type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0115()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1700
     * @tc.desc Subclass overrides Symbol.species to return Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0116()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1800
     * @tc.desc Verify filter returns Array instance after overriding Symbol.species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0117()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_1900
     * @tc.desc Subclass overrides species to return another custom class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0118()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2000
     * @tc.desc Verify map returns CustomArray instance after override
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0119()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2100
     * @tc.desc Subclass overrides species to return null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0120()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2200
     * @tc.desc Subclass overrides species to return undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0121()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0122
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2300
     * @tc.desc Verify map uses Symbol.species for the result constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0122()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0123
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2400
     * @tc.desc Verify map on empty array with Symbol.species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0123()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0124
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2500
     * @tc.desc Verify filter uses Symbol.species for the result constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0124()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0125
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2600
     * @tc.desc Verify filter with no matches returns empty array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0125()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0126
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2700
     * @tc.desc Verify concat uses Symbol.species for the result constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0126()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0127
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2800
     * @tc.desc Verify concat with no arguments
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0127()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0128
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_2900
     * @tc.desc Verify slice uses Symbol.species for the result constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0128()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0129
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3000
     * @tc.desc Verify slice with negative indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0129()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0130
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3100
     * @tc.desc Verify flat uses Symbol.species for the result constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0130()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0131
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3200
     * @tc.desc Verify flatMap uses Symbol.species for the result constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0131()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0132
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3300
     * @tc.desc Verify splice uses Symbol.species for the array of deleted elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0132()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0133
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3400
     * @tc.desc Verify species may return a non-Array constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0133()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0134
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3500
     * @tc.desc Verify behavior when species returns an Object constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0134()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0135
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3600
     * @tc.desc Species returns Set constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0135()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0136
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3700
     * @tc.desc Species returns Map constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0136()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0137
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3800
     * @tc.desc Verify species returns a Proxy-wrapped constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0137()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0138
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_3900
     * @tc.desc Species returns a bound constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0138()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0139
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4000
     * @tc.desc Verify map on empty array respects species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0139()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0140
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4100
     * @tc.desc Verify filter on empty array respects species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0140()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0141
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4200
     * @tc.desc Verify map on large array respects species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0141()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0142
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4300
     * @tc.desc Verify map on sparse array respects species
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0142()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0143
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4400
     * @tc.desc Verify species behavior when array contains undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0143()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0144
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4500
     * @tc.desc Verify species behavior when array contains null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0144()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0145
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4600
     * @tc.desc Verify species behavior when array contains NaN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0145()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0146
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4700
     * @tc.desc Verify species getter may return a changing constructor
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0146()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0147
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4800
     * @tc.desc Verify species behavior when array contains self-reference
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0147()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0148
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_4900
     * @tc.desc Verify behavior when species getter throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0148()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0149
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5000
     * @tc.desc Verify species getter throws TypeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0149()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0150
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5100
     * @tc.desc Behavior when species returns a string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0150()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0151
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5200
     * @tc.desc Behavior when species returns a number
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0151()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0152
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5300
     * @tc.desc Behavior when species returns a plain object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0152()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0153
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5400
     * @tc.desc Behavior when species returns a Symbol
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0153()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0154
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5500
     * @tc.desc Verify behavior after deleting Array[Symbol.species]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0154()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0155
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5600
     * @tc.desc Verify deleting subclass Symbol.species falls back to parent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0155()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0156
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5700
     * @tc.desc Verify behavior when species is made non-writable
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0156()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0157
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5800
     * @tc.desc Verify constructor returned by species throws on instantiation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0157()).assertEqual(true);
    })

    /**
     * @tc.name testArraySymbolSpeciesTest0158
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SYMBOL_SPECIES_SUPPLEMENT_TEST_5900
     * @tc.desc Verify behavior when constructor is set to null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArraySymbolSpeciesTest0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArraySymbolSpeciesJs.ArraySymbolSpeciesJs_0158()).assertEqual(true);
    })
  })
}
