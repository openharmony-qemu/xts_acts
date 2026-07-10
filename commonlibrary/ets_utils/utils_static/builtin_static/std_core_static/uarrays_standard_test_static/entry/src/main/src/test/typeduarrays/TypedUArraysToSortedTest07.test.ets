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

'use static';

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

// AUTO_TYPED_ARRAY_HELPERS_START
function sortUint16ArrayValue(source: Uint16Array): Uint16Array {
  const result = new Uint16Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

function sortUint8ArrayValue(source: Uint8Array): Uint8Array {
  const result = new Uint8Array(source);
  for (let i: number = 0; i < result.length; i++) {
    for (let j: number = i + 1; j < result.length; j++) {
      if (result[j.toInt()] < result[i.toInt()]) {
        const temp: number = result[i.toInt()];
        result[i.toInt()] = result[j.toInt()];
        result[j.toInt()] = temp;
      }
    }
  }
  return result;
}

// AUTO_TYPED_ARRAY_HELPERS_END

export default function typedUArraysToSortedTest07(): void {
  describe('TypedUArraysToSortedTest07', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0010
     * @tc.name testTypedUArraysToSortedPart302_001
     * @tc.desc Verify Number.MAX_VALUE Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val57 = ret[0];
      expect(val57).assertEqual(1);
      const val58 = ret[2];
      expect(val58).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0530
     * @tc.name testTypedUArraysToSortedPart302_053
     * @tc.desc Verify Uint8Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val59 = ret[0];
      expect(val59).assertEqual(1);
      const val60 = ret[2];
      expect(val60).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0540
     * @tc.name testTypedUArraysToSortedPart302_054
     * @tc.desc Verify ArrayBuffer.isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val61 = ret[0];
      expect(val61).assertEqual(1);
      const val62 = ret[2];
      expect(val62).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0550
     * @tc.name testTypedUArraysToSortedPart302_055
     * @tc.desc Verify Array.isArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val63 = ret[0];
      expect(val63).assertEqual(1);
      const val64 = ret[2];
      expect(val64).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0560
     * @tc.name testTypedUArraysToSortedPart302_056
     * @tc.desc Verify ArrayBuffer.isView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val65 = ret[0];
      expect(val65).assertEqual(1);
      const val66 = ret[2];
      expect(val66).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0570
     * @tc.name testTypedUArraysToSortedPart302_057
     * @tc.desc Verify arr instanceof Uint8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val67 = ret[0];
      expect(val67).assertEqual(1);
      const val68 = ret[2];
      expect(val68).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0580
     * @tc.name testTypedUArraysToSortedPart302_058
     * @tc.desc Verify typeof arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val69 = ret[0];
      expect(val69).assertEqual(1);
      const val70 = ret[2];
      expect(val70).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0590
     * @tc.name testTypedUArraysToSortedPart302_059
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val71 = ret[0];
      expect(val71).assertEqual(1);
      const val72 = ret[2];
      expect(val72).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0600
     * @tc.name testTypedUArraysToSortedPart302_060
     * @tc.desc Verify "@@toStringTag"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val73 = ret[0];
      expect(val73).assertEqual(1);
      const val74 = ret[2];
      expect(val74).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0610
     * @tc.name testTypedUArraysToSortedPart302_061
     * @tc.desc Verify Uint8Array[Symbol.hasInstance]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val75 = ret[0];
      expect(val75).assertEqual(1);
      const val76 = ret[2];
      expect(val76).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0620
     * @tc.name testTypedUArraysToSortedPart302_062
     * @tc.desc Verify Uint8Array[Symbol.species]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val77 = ret[0];
      expect(val77).assertEqual(1);
      const val78 = ret[2];
      expect(val78).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0630
     * @tc.name testTypedUArraysToSortedPart302_063
     * @tc.desc Verify arr[Symbol.toPrimitive]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val79 = ret[0];
      expect(val79).assertEqual(1);
      const val80 = ret[2];
      expect(val80).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0640
     * @tc.name testTypedUArraysToSortedPart302_064
     * @tc.desc Verify arr[Symbol.match]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val81 = ret[0];
      expect(val81).assertEqual(1);
      const val82 = ret[2];
      expect(val82).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0650
     * @tc.name testTypedUArraysToSortedPart302_065
     * @tc.desc Verify arr[Symbol.replace]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val83 = ret[0];
      expect(val83).assertEqual(1);
      const val84 = ret[2];
      expect(val84).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0660
     * @tc.name testTypedUArraysToSortedPart302_066
     * @tc.desc Verify arr[Symbol.search]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val85 = ret[0];
      expect(val85).assertEqual(1);
      const val86 = ret[2];
      expect(val86).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0670
     * @tc.name testTypedUArraysToSortedPart302_067
     * @tc.desc Verify arr[Symbol.split]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val87 = ret[0];
      expect(val87).assertEqual(1);
      const val88 = ret[2];
      expect(val88).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0680
     * @tc.name testTypedUArraysToSortedPart302_068
     * @tc.desc Verify arr["@@iterator")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val89 = ret[0];
      expect(val89).assertEqual(1);
      const val90 = ret[2];
      expect(val90).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0690
     * @tc.name testTypedUArraysToSortedPart302_069
     * @tc.desc Verify arr[Symbol.asyncIterator]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val91 = ret[0];
      expect(val91).assertEqual(1);
      const val92 = ret[2];
      expect(val92).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0700
     * @tc.name testTypedUArraysToSortedPart302_070
     * @tc.desc Verify arr[Symbol.isConcatSpreadable]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val93 = ret[0];
      expect(val93).assertEqual(1);
      const val94 = ret[2];
      expect(val94).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0710
     * @tc.name testTypedUArraysToSortedPart302_071
     * @tc.desc Verify arr[Symbol.unscopables]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val95 = ret[0];
      expect(val95).assertEqual(1);
      const val96 = ret[2];
      expect(val96).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0720
     * @tc.name testTypedUArraysToSortedPart302_072
     * @tc.desc Verify arr[Symbol.matchAll]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val97 = ret[0];
      expect(val97).assertEqual(1);
      const val98 = ret[2];
      expect(val98).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0730
     * @tc.name testTypedUArraysToSortedPart302_073
     * @tc.desc Verify Uint8Array[Symbol.hasInstance]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val99 = ret[0];
      expect(val99).assertEqual(1);
      const val100 = ret[2];
      expect(val100).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0740
     * @tc.name testTypedUArraysToSortedPart302_074
     * @tc.desc Verify Uint8Array[Symbol.species]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val101 = ret[0];
      expect(val101).assertEqual(1);
      const val102 = ret[2];
      expect(val102).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0750
     * @tc.name testTypedUArraysToSortedPart302_075
     * @tc.desc Verify arr[Symbol.toPrimitive]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val103 = ret[0];
      expect(val103).assertEqual(1);
      const val104 = ret[2];
      expect(val104).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0760
     * @tc.name testTypedUArraysToSortedPart302_076
     * @tc.desc Verify arr["@@toStringTag")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val105 = ret[0];
      expect(val105).assertEqual(1);
      const val106 = ret[2];
      expect(val106).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0770
     * @tc.name testTypedUArraysToSortedPart302_077
     * @tc.desc Verify arr["@@iterator") next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val107 = ret[0];
      expect(val107).assertEqual(1);
      const val108 = ret[2];
      expect(val108).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0780
     * @tc.name testTypedUArraysToSortedPart302_078
     * @tc.desc Verify arr[Symbol.asyncIterator]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val109 = ret[0];
      expect(val109).assertEqual(1);
      const val110 = ret[2];
      expect(val110).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0790
     * @tc.name testTypedUArraysToSortedPart302_079
     * @tc.desc Verify arr[Symbol.isConcatSpreadable]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val111 = ret[0];
      expect(val111).assertEqual(1);
      const val112 = ret[2];
      expect(val112).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0800
     * @tc.name testTypedUArraysToSortedPart302_080
     * @tc.desc Verify arr[Symbol.unscopables]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val113 = ret[0];
      expect(val113).assertEqual(1);
      const val114 = ret[2];
      expect(val114).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0810
     * @tc.name testTypedUArraysToSortedPart302_081
     * @tc.desc Verify arr[Symbol.matchAll]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val115 = ret[0];
      expect(val115).assertEqual(1);
      const val116 = ret[2];
      expect(val116).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0820
     * @tc.name testTypedUArraysToSortedPart302_082
     * @tc.desc Verify Uint8Array[Symbol.hasInstance]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val117 = ret[0];
      expect(val117).assertEqual(1);
      const val118 = ret[2];
      expect(val118).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0830
     * @tc.name testTypedUArraysToSortedPart302_083
     * @tc.desc Verify Uint8Array[Symbol.species]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val119 = ret[0];
      expect(val119).assertEqual(1);
      const val120 = ret[2];
      expect(val120).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0840
     * @tc.name testTypedUArraysToSortedPart302_084
     * @tc.desc Verify arr[Symbol.toPrimitive]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val121 = ret[0];
      expect(val121).assertEqual(1);
      const val122 = ret[2];
      expect(val122).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0850
     * @tc.name testTypedUArraysToSortedPart302_085
     * @tc.desc Verify arr["@@toStringTag")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val123 = ret[0];
      expect(val123).assertEqual(1);
      const val124 = ret[2];
      expect(val124).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0860
     * @tc.name testTypedUArraysToSortedPart302_086
     * @tc.desc Verify arr["@@iterator") done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val125 = ret[0];
      expect(val125).assertEqual(1);
      const val126 = ret[2];
      expect(val126).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0870
     * @tc.name testTypedUArraysToSortedPart302_087
     * @tc.desc Verify arr[Symbol.asyncIterator]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val127 = ret[0];
      expect(val127).assertEqual(1);
      const val128 = ret[2];
      expect(val128).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0880
     * @tc.name testTypedUArraysToSortedPart302_088
     * @tc.desc Verify arr[Symbol.isConcatSpreadable]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val129 = ret[0];
      expect(val129).assertEqual(1);
      const val130 = ret[2];
      expect(val130).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0890
     * @tc.name testTypedUArraysToSortedPart302_089
     * @tc.desc Verify arr[Symbol.unscopables]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val131 = ret[0];
      expect(val131).assertEqual(1);
      const val132 = ret[2];
      expect(val132).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0900
     * @tc.name testTypedUArraysToSortedPart302_090
     * @tc.desc Verify arr[Symbol.matchAll]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val133 = ret[0];
      expect(val133).assertEqual(1);
      const val134 = ret[2];
      expect(val134).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0910
     * @tc.name testTypedUArraysToSortedPart302_091
     * @tc.desc Verify Uint8Array[Symbol.hasInstance]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val135 = ret[0];
      expect(val135).assertEqual(1);
      const val136 = ret[2];
      expect(val136).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0920
     * @tc.name testTypedUArraysToSortedPart302_092
     * @tc.desc Verify Uint8Array[Symbol.species]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val137 = ret[0];
      expect(val137).assertEqual(1);
      const val138 = ret[2];
      expect(val138).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0930
     * @tc.name testTypedUArraysToSortedPart302_093
     * @tc.desc Verify arr[Symbol.toPrimitive]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val139 = ret[0];
      expect(val139).assertEqual(1);
      const val140 = ret[2];
      expect(val140).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0940
     * @tc.name testTypedUArraysToSortedPart302_094
     * @tc.desc Verify arr["@@toStringTag")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val141 = ret[0];
      expect(val141).assertEqual(1);
      const val142 = ret[2];
      expect(val142).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0950
     * @tc.name testTypedUArraysToSortedPart302_095
     * @tc.desc Verify arr["@@iterator") value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val143 = ret[0];
      expect(val143).assertEqual(1);
      const val144 = ret[2];
      expect(val144).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0960
     * @tc.name testTypedUArraysToSortedPart302_096
     * @tc.desc Verify arr[Symbol.asyncIterator]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val145 = ret[0];
      expect(val145).assertEqual(1);
      const val146 = ret[2];
      expect(val146).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0970
     * @tc.name testTypedUArraysToSortedPart302_097
     * @tc.desc Verify arr[Symbol.isConcatSpreadable]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val147 = ret[0];
      expect(val147).assertEqual(1);
      const val148 = ret[2];
      expect(val148).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0980
     * @tc.name testTypedUArraysToSortedPart302_098
     * @tc.desc Verify arr[Symbol.unscopables]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val149 = ret[0];
      expect(val149).assertEqual(1);
      const val150 = ret[2];
      expect(val150).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_0990
     * @tc.name testTypedUArraysToSortedPart302_099
     * @tc.desc Verify arr[Symbol.matchAll]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val151 = ret[0];
      expect(val151).assertEqual(1);
      const val152 = ret[2];
      expect(val152).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_1000
     * @tc.name testTypedUArraysToSortedPart302_100
     * @tc.desc Verify Uint8Array[Symbol.hasInstance]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val153 = ret[0];
      expect(val153).assertEqual(1);
      const val154 = ret[2];
      expect(val154).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_1010
     * @tc.name testTypedUArraysToSortedPart302_101
     * @tc.desc Verify Uint8Array[Symbol.species]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val155 = ret[0];
      expect(val155).assertEqual(1);
      const val156 = ret[2];
      expect(val156).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_1020
     * @tc.name testTypedUArraysToSortedPart302_102
     * @tc.desc Verify arr[Symbol.toPrimitive]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val157 = ret[0];
      expect(val157).assertEqual(1);
      const val158 = ret[2];
      expect(val158).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPEDUARRAYS_TOSORTED_PART302_1030
     * @tc.name testTypedUArraysToSortedPart302_103
     * @tc.desc Verify arr["@@toStringTag")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTypedUArraysToSortedPart302_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([3, 1, 2]);
      const ret = sortUint8ArrayValue(arr);
      const val159 = ret[0];
      expect(val159).assertEqual(1);
      const val160 = ret[2];
      expect(val160).assertEqual(3);
    });

  });
}
