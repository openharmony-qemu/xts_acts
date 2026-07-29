'use static';
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
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function Float64ArrayViewBufferTest(): void {
  describe('Float64ArrayViewBufferTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0010
     * @tc.name testFloat64ArrayViewBuffer001
     * @tc.desc Verify subarray write parent changes child element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      parent.$_set(1, 99.0);
      const actualElement0 = child.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0020
     * @tc.name testFloat64ArrayViewBuffer002
     * @tc.desc Verify subarray write child changes parent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      child.$_set(0, 88.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 88.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0030
     * @tc.name testFloat64ArrayViewBuffer003
     * @tc.desc Verify two views on same ArrayBuffer write parent read child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const firstResult = new Float64Array(buf);
      const secondResult = new Float64Array(buf, 8, 2);
      firstResult.$_set(1, 77.0);
      const actualElement0 = secondResult.$_get(0);
      const expectedElement0: number = 77.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0040
     * @tc.name testFloat64ArrayViewBuffer004
     * @tc.desc Verify two views write child read parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const firstResult = new Float64Array(buf);
      const secondResult = new Float64Array(buf, 8, 2);
      secondResult.$_set(1, 66.0);
      const actualElement2 = firstResult.$_get(2);
      const expectedElement2: number = 66.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0050
     * @tc.name testFloat64ArrayViewBuffer005
     * @tc.desc Verify two disjoint subarrays write back to parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(1, 2);
      const s2 = parent.subarray(2, 3);
      s1.$_set(0, 50.0);
      s2.$_set(0, 60.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 50.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 60.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0060
     * @tc.name testFloat64ArrayViewBuffer006
     * @tc.desc Verify nested subarray still shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const s1 = parent.subarray(1);
      const s2 = s1.subarray(1);
      s2.$_set(0, 42.0);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 42.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0070
     * @tc.name testFloat64ArrayViewBuffer007
     * @tc.desc Verify subarray byteOffset = parent.bo + start*8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(2);
      const actualByteOffset = child.byteOffset;
      const expectedByteOffset: int = parent.byteOffset + 16;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0080
     * @tc.name testFloat64ArrayViewBuffer008
     * @tc.desc Verify subarray negative index wrap shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(-2);
      child.$_set(0, 11.0);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 11.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0090
     * @tc.name testFloat64ArrayViewBuffer009
     * @tc.desc Verify three disjoint views on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const all = new Float64Array(buf);
      const firstResult = new Float64Array(buf, 0, 1);
      const secondResult = new Float64Array(buf, 8, 1);
      const thirdResult = new Float64Array(buf, 16, 1);
      firstResult.$_set(0, 10.0);
      secondResult.$_set(0, 20.0);
      thirdResult.$_set(0, 30.0);
      const actualElement0 = all.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = all.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0100
     * @tc.name testFloat64ArrayViewBuffer010
     * @tc.desc Verify zero-length subarray stays empty after parent change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(4);
      parent.$_set(0, 99.0);
      const actualLength = child.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0110
     * @tc.name testFloat64ArrayViewBuffer011
     * @tc.desc Verify fill on subarray only affects parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      child.fill(7.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 7.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement0 = parent.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0120
     * @tc.name testFloat64ArrayViewBuffer012
     * @tc.desc Verify reverse on subarray reverses parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      child.reverse();
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0130
     * @tc.name testFloat64ArrayViewBuffer013
     * @tc.desc Verify sort on subarray sorts parent range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([5.0, 3.0, 1.0, 4.0]);
      const child = parent.subarray(0, 3);
      child.sort();
      const actualElement0 = parent.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0140
     * @tc.name testFloat64ArrayViewBuffer014
     * @tc.desc Verify copyWithin on subarray rewrites parent slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      child.copyWithin(0, 1);
      const actualElement2 = parent.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0150
     * @tc.name testFloat64ArrayViewBuffer015
     * @tc.desc Verify set on subarray affects parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      child.set([55.0, 66.0]);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 55.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0160
     * @tc.name testFloat64ArrayViewBuffer016
     * @tc.desc Verify fill on subarray does not overflow view bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const child = parent.subarray(1, 3);
      child.fill(7.0);
      const actualElement0 = parent.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElementAt4 = parent.$_get(4);
      const expectedElementAt4: number = 5.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0170
     * @tc.name testFloat64ArrayViewBuffer017
     * @tc.desc Verify with on subarray does not pollute parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      const r = child.with(0, 99.0);
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0180
     * @tc.name testFloat64ArrayViewBuffer018
     * @tc.desc Verify map on subarray does not pollute parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      const r = child.map((v: number): number => {
        return v * 10.0;
      });
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0190
     * @tc.name testFloat64ArrayViewBuffer019
     * @tc.desc Verify toReversed on subarray does not pollute parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      const r = child.toReversed();
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 2.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0200
     * @tc.name testFloat64ArrayViewBuffer020
     * @tc.desc Verify toSorted on subarray does not pollute parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([3.0, 1.0, 2.0, 4.0]);
      const child = parent.subarray(0, 3);
      const r = child.toSorted();
      const actualElement1 = parent.$_get(1);
      const expectedElement1: number = 1.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0210
     * @tc.name testFloat64ArrayViewBuffer021
     * @tc.desc Verify reverse returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const r = arr.reverse();
      r.$_set(0, 99.0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0220
     * @tc.name testFloat64ArrayViewBuffer022
     * @tc.desc Verify nested reverse(reverse(x)) restores order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const reversed1 = arr.reverse();
      const r = reversed1.reverse();
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2Second = arr.$_get(2);
      const expectedElement2Second: number = 3.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0230
     * @tc.name testFloat64ArrayViewBuffer023
     * @tc.desc Verify nested map(map(x)) adds twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0]);
      const mapped1 = arr.map((v: number): number => {
        return v + 1.0;
      });
      const r = mapped1.map((v: number): number => {
        return v + 1.0;
      });
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0240
     * @tc.name testFloat64ArrayViewBuffer024
     * @tc.desc Verify nested filter then map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const filtered = arr.filter((v: number): boolean => {
        return v > 2.0;
      });
      const r = filtered.map((v: number): number => {
        return v * 10.0;
      });
      const actualElement0Second = r.$_get(0);
      const expectedElement0Second: number = 30.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualLengthSecond = r.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0250
     * @tc.name testFloat64ArrayViewBuffer025
     * @tc.desc Verify nested fill then copyWithin chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const filled = arr.fill(5.0, 0, 2);
      filled.copyWithin(2, 0, 2);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 5.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement3 = arr.$_get(3);
      const expectedElement3: number = 5.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0260
     * @tc.name testFloat64ArrayViewBuffer026
     * @tc.desc Verify nested with immutable chain does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const w0 = arr.with(0, 10.0);
      const r = w0.with(1, 20.0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = r.$_get(0);
      const expectedElement0Third: number = 10.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0270
     * @tc.name testFloat64ArrayViewBuffer027
     * @tc.desc Verify slice then subarray write does not change original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const copy = arr.slice();
      const sub = copy.subarray(0, 2);
      sub.$_set(0, 99.0);
      const actualElement0Second = arr.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0280
     * @tc.name testFloat64ArrayViewBuffer028
     * @tc.desc Verify forEach sees modification during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      let seen: number = 0;
      arr.forEach((v: number, i: int): void => {
        if (i === 0) {
          arr.$_set(2, 99.0);
        }
        if (i === 2) {
          seen = v;
        }
      });
      const actualResult = seen;
      const expectedResult: number = 99.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0290
     * @tc.name testFloat64ArrayViewBuffer029
     * @tc.desc Verify $_set then at reads same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.$_set(2, 33.0);
      const actualResult = arr.at(2);
      const expectedResult: number = 33.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0300
     * @tc.name testFloat64ArrayViewBuffer030
     * @tc.desc Verify fill partial then slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      arr.fill(0.0, 1, 3);
      const r = arr.slice(0, 4);
      const actualElement1Second = r.$_get(1);
      const expectedElement1Second: number = 0.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement3 = r.$_get(3);
      const expectedElement3: number = 4.0;
      expect(actualElement3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0310
     * @tc.name testFloat64ArrayViewBuffer031
     * @tc.desc Verify $_set then reverse moves value to symmetric position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      arr.$_set(2, 9.0);
      arr.reverse();
      const actualElement2Second = arr.$_get(2);
      const expectedElement2Second: number = 9.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0320
     * @tc.name testFloat64ArrayViewBuffer032
     * @tc.desc Verify modification before forEach iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      arr.$_set(0, 50.0);
      let saw: number = 0;
      arr.forEach((v: number): void => {
        if (saw === 0) {
          saw = v;
        }
      });
      const actualResult = saw;
      const expectedResult: number = 50.0;
      expect(actualResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0330
     * @tc.name testFloat64ArrayViewBuffer033
     * @tc.desc Verify subarray write parent read child: parent index1 change reflected in child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float64Array = parent.subarray(1, 3);
      parent.$_set(1, 99.0);
      const actualElement0Second = child.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0340
     * @tc.name testFloat64ArrayViewBuffer034
     * @tc.desc Verify subarray write child read parent: child element0 change reflected in parent index1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float64Array = parent.subarray(1, 3);
      child.$_set(0, 88.0);
      const actualElement1Second = parent.$_get(1);
      const expectedElement1Second: number = 88.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0350
     * @tc.name testFloat64ArrayViewBuffer035
     * @tc.desc Verify two non-overlapping subarrays each write to parent distinct slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const a: Float64Array = parent.subarray(0, 2);
      const b: Float64Array = parent.subarray(2, 4);
      a.$_set(1, 50.0);
      b.$_set(0, 60.0);
      const actualElement1Second = parent.$_get(1);
      const expectedElement1Second: number = 50.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2Second = parent.$_get(2);
      const expectedElement2Second: number = 60.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0360
     * @tc.name testFloat64ArrayViewBuffer036
     * @tc.desc Verify nested subarray still shares underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const mid: Float64Array = parent.subarray(1, 4);
      const inner: Float64Array = mid.subarray(1, 2);
      inner.$_set(0, 42.0);
      const actualElement2Second = parent.$_get(2);
      const expectedElement2Second: number = 42.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0370
     * @tc.name testFloat64ArrayViewBuffer037
     * @tc.desc Verify ArrayBuffer offsets: two views on same buffer write parent read child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parent: Float64Array = new Float64Array(buf);
      const child: Float64Array = new Float64Array(buf, 8, 2);
      parent.$_set(1, 77.0);
      const actualElement0Second = child.$_get(0);
      const expectedElement0Second: number = 77.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0380
     * @tc.name testFloat64ArrayViewBuffer038
     * @tc.desc Verify ArrayBuffer offsets: write child read parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const parent: Float64Array = new Float64Array(buf);
      const child: Float64Array = new Float64Array(buf, 8, 2);
      child.$_set(0, 66.0);
      const actualElement1Second = parent.$_get(1);
      const expectedElement1Second: number = 66.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0390
     * @tc.name testFloat64ArrayViewBuffer039
     * @tc.desc Verify three disjoint views on shared buffer each write separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const firstResult: Float64Array = new Float64Array(buf, 0, 1);
      const secondResult: Float64Array = new Float64Array(buf, 8, 1);
      const thirdResult: Float64Array = new Float64Array(buf, 16, 1);
      firstResult.$_set(0, 10.0);
      secondResult.$_set(0, 20.0);
      thirdResult.$_set(0, 30.0);
      const all: Float64Array = new Float64Array(buf);
      const actualElement0Second = all.$_get(0);
      const expectedElement0Second: number = 10.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = all.$_get(1);
      const expectedElement1Second: number = 20.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2Second = all.$_get(2);
      const expectedElement2Second: number = 30.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0400
     * @tc.name testFloat64ArrayViewBuffer040
     * @tc.desc Verify set on subarray view affects parent corresponding slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float64Array = parent.subarray(1, 3);
      child.set(new Float64Array([55.0, 56.0]));
      const actualElement1Second = parent.$_get(1);
      const expectedElement1Second: number = 55.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2Second = parent.$_get(2);
      const expectedElement2Second: number = 56.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0410
     * @tc.name testFloat64ArrayViewBuffer041
     * @tc.desc Verify fill on subarray view only affects parent corresponding range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const child: Float64Array = parent.subarray(1, 4);
      child.fill(7.0);
      const actualElement0Fourth = parent.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = parent.$_get(1);
      const expectedElement1Third: number = 7.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = parent.$_get(2);
      const expectedElement2Third: number = 7.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement3Second = parent.$_get(3);
      const expectedElement3Second: number = 7.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
      const actualElementAt4Second = parent.$_get(4);
      const expectedElementAt4Second: number = 5.0;
      expect(actualElementAt4Second).assertEqual(expectedElementAt4Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0420
     * @tc.name testFloat64ArrayViewBuffer042
     * @tc.desc Verify reverse on subarray view reverses parent corresponding range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const child: Float64Array = parent.subarray(1, 4);
      child.reverse();
      const actualElement1Third = parent.$_get(1);
      const expectedElement1Third: number = 4.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement3Second = parent.$_get(3);
      const expectedElement3Second: number = 2.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0430
     * @tc.name testFloat64ArrayViewBuffer043
     * @tc.desc Verify sort on subarray view sorts parent corresponding range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      const child: Float64Array = parent.subarray(0, 3);
      child.sort();
      const actualElement0Fourth = parent.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement2Third = parent.$_get(2);
      const expectedElement2Third: number = 5.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0440
     * @tc.name testFloat64ArrayViewBuffer044
     * @tc.desc Verify copyWithin on subarray view modifies parent corresponding slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const child: Float64Array = parent.subarray(0, 4);
      child.copyWithin(2, 0, 1);
      const actualElement2Third = parent.$_get(2);
      const expectedElement2Third: number = 1.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0450
     * @tc.name testFloat64ArrayViewBuffer045
     * @tc.desc Verify with on subarray returns new array does not pollute parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float64Array = parent.subarray(1, 3);
      const r: Float64Array = child.with(0, 100.0);
      const actualElement1Third = parent.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement0Fourth = r.$_get(0);
      const expectedElement0Fourth: number = 100.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0460
     * @tc.name testFloat64ArrayViewBuffer046
     * @tc.desc Verify map on subarray returns new array parent unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float64Array = parent.subarray(1, 3);
      const r: Float64Array = child.map((v: number): number => v * 10);
      const actualElement1Third = parent.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement1Fourth = r.$_get(1);
      const expectedElement1Fourth: number = 30.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0470
     * @tc.name testFloat64ArrayViewBuffer047
     * @tc.desc Verify ArrayBuffer.isView returns true for Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0]);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0480
     * @tc.name testFloat64ArrayViewBuffer048
     * @tc.desc Verify ArrayBuffer.isView returns false for bare ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      expect(ArrayBuffer.isView(buf)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0490
     * @tc.name testFloat64ArrayViewBuffer049
     * @tc.desc Verify offset views on shared buffer see each others writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const full: Float64Array = new Float64Array(buf);
      full.$_set(1, 88.0);
      const half: Float64Array = new Float64Array(buf, 8, 2);
      const actualElement0Fourth = half.$_get(0);
      const expectedElement0Fourth: number = 88.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0500
     * @tc.name testFloat64ArrayViewBuffer050
     * @tc.desc Verify subarray zero-length view stays empty after parent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child: Float64Array = parent.subarray(2, 2);
      parent.$_set(2, 99.0);
      const actualLengthThird = child.length;
      const expectedLengthThird: int = 0;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0510
     * @tc.name testFloat64ArrayViewBuffer051
     * @tc.desc Verify slice returned independent buffer does not share with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const copy: Float64Array = parent.slice(1, 3);
      copy.$_set(0, 999.0);
      const actualElement1Third = parent.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0520
     * @tc.name testFloat64ArrayViewBuffer052
     * @tc.desc Verify ArrayBuffer.isView returns true for subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const sub: Float64Array = arr.subarray(1, 3);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0530
     * @tc.name testFloat64ArrayViewBuffer053
     * @tc.desc Verify overlapping views share data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const firstResult: Float64Array = new Float64Array(buf, 0, 3);
      const secondResult: Float64Array = new Float64Array(buf, 8, 2);
      firstResult.$_set(0, 10.0);
      firstResult.$_set(1, 20.0);
      const actualElement0Fourth = secondResult.$_get(0);
      const expectedElement0Fourth: number = 20.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      secondResult.$_set(1, 99.0);
      const actualElement2Third = firstResult.$_get(2);
      const expectedElement2Third: number = 99.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0540
     * @tc.name testFloat64ArrayViewBuffer054
     * @tc.desc Verify three non-overlapping views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(48);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      const thirdResult: Float64Array = new Float64Array(buf, 32, 2);
      firstResult.$_set(0, 1.0);
      secondResult.$_set(0, 2.0);
      thirdResult.$_set(0, 3.0);
      const actualElement0Fourth = firstResult.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement0Fifth = secondResult.$_get(0);
      const expectedElement0Fifth: number = 2.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement0Sixth = thirdResult.$_get(0);
      const expectedElement0Sixth: number = 3.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0550
     * @tc.name testFloat64ArrayViewBuffer055
     * @tc.desc Verify fill on one view does not overlap others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      firstResult.fill(5.0);
      const actualElement0Fourth = secondResult.$_get(0);
      const expectedElement0Fourth: number = 0.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0560
     * @tc.name testFloat64ArrayViewBuffer056
     * @tc.desc Verify reverse on view only reverses that view region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      firstResult.$_set(0, 1.0);
      firstResult.$_set(1, 2.0);
      firstResult.reverse();
      const actualElement0Fourth = firstResult.$_get(0);
      const expectedElement0Fourth: number = 2.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = firstResult.$_get(1);
      const expectedElement1Third: number = 1.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement0Fifth = secondResult.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0570
     * @tc.name testFloat64ArrayViewBuffer057
     * @tc.desc Verify constructor buf offset 0 works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float64Array = new Float64Array(buf, 0, 2);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetSecond = arr.byteOffset;
      const expectedByteOffsetSecond: int = 0;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0580
     * @tc.name testFloat64ArrayViewBuffer058
     * @tc.desc Verify constructor buf offset 16 works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 16, 2);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetSecond = arr.byteOffset;
      const expectedByteOffsetSecond: int = 16;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0590
     * @tc.name testFloat64ArrayViewBuffer059
     * @tc.desc Verify sort on view only sorts view region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      firstResult.$_set(0, 2.0);
      firstResult.$_set(1, 1.0);
      firstResult.sort();
      const actualElement0Fourth = firstResult.$_get(0);
      const expectedElement0Fourth: number = 1.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement1Third = firstResult.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0600
     * @tc.name testFloat64ArrayViewBuffer060
     * @tc.desc Verify constructor with buf offset 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const arr: Float64Array = new Float64Array(buf, 24, 1);
      const actualLengthThird = arr.length;
      const expectedLengthThird: int = 1;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualByteOffsetSecond = arr.byteOffset;
      const expectedByteOffsetSecond: int = 24;
      expect(actualByteOffsetSecond).assertEqual(expectedByteOffsetSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0610
     * @tc.name testFloat64ArrayViewBuffer061
     * @tc.desc Verify overlapping views with reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const firstResult: Float64Array = new Float64Array(buf, 0, 3);
      const secondResult: Float64Array = new Float64Array(buf, 8, 2);
      firstResult.$_set(0, 1.0);
      firstResult.$_set(1, 2.0);
      firstResult.$_set(2, 3.0);
      firstResult.reverse();
      const actualElement0Fourth = secondResult.$_get(0);
      const expectedElement0Fourth: number = 2.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0620
     * @tc.name testFloat64ArrayViewBuffer062
     * @tc.desc Verify set on view modifies buffer only in view region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      const secondResult: Float64Array = new Float64Array(buf, 16, 2);
      const src: Float64Array = Float64Array.of(99.0, 100.0);
      firstResult.set(src);
      const actualElement0Fourth = firstResult.$_get(0);
      const expectedElement0Fourth: number = 99.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement0Fifth = secondResult.$_get(0);
      const expectedElement0Fifth: number = 0.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0630
     * @tc.name testFloat64ArrayViewBuffer063
     * @tc.desc Verify map on view creates independent Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const firstResult: Float64Array = new Float64Array(buf, 0, 2);
      firstResult.$_set(0, 1.0);
      firstResult.$_set(1, 2.0);
      const r = firstResult.map((x: number): number => x * 2.0);
      const actualElement0Fourth = r.$_get(0);
      const expectedElement0Fourth: number = 2.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      expect(r.buffer !== buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0640
     * @tc.name testFloat64ArrayViewBuffer064
     * @tc.desc Verify filter on view creates independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const v: Float64Array = new Float64Array(buf, 0, 3);
      v.$_set(0, 1.0);
      v.$_set(1, 2.0);
      v.$_set(2, 3.0);
      const r = v.filter((x: number): boolean => x > 1.0);
      const actualLengthFourth = r.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      expect(r.buffer !== buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0650
     * @tc.name testFloat64ArrayViewBuffer065
     * @tc.desc Verify subarray shares buffer with parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
      const actualLengthFourth = sub.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Seventh = sub.$_get(0);
      const expectedElement0Seventh: number = 2.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0660
     * @tc.name testFloat64ArrayViewBuffer066
     * @tc.desc Verify slice creates independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const s = arr.slice(1, 3);
      expect(s.buffer === arr.buffer).assertFalse();
      const actualLengthFourth = s.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Seventh = s.$_get(0);
      const expectedElement0Seventh: number = 2.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0670
     * @tc.name testFloat64ArrayViewBuffer067
     * @tc.desc Verify parent modification visible in subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(0, 2);
      arr.$_set(0, 99.0);
      const actualElement0Seventh = sub.$_get(0);
      const expectedElement0Seventh: number = 99.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0680
     * @tc.name testFloat64ArrayViewBuffer068
     * @tc.desc Verify parent fill visible in subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub = arr.subarray(0, 3);
      arr.fill(7.0, 0, 3);
      const actualElement0Seventh = sub.$_get(0);
      const expectedElement0Seventh: number = 7.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement2Fourth = sub.$_get(2);
      const expectedElement2Fourth: number = 7.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0690
     * @tc.name testFloat64ArrayViewBuffer069
     * @tc.desc Verify subarray reverse visible in parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(0, 3);
      sub.reverse();
      const actualElement0Seventh = arr.$_get(0);
      const expectedElement0Seventh: number = 3.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Fifth = arr.$_get(1);
      const expectedElement1Fifth: number = 2.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
      const actualElement2Fourth = arr.$_get(2);
      const expectedElement2Fourth: number = 1.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0700
     * @tc.name testFloat64ArrayViewBuffer070
     * @tc.desc Verify slice modification does not affect parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const s = arr.slice(0, 2);
      s.$_set(0, 99.0);
      const actualElement0Seventh = arr.$_get(0);
      const expectedElement0Seventh: number = 1.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0710
     * @tc.name testFloat64ArrayViewBuffer071
     * @tc.desc Verify subarray of subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s1 = arr.subarray(1, 4);
      const s2 = s1.subarray(1, 3);
      const actualLengthFourth = s2.length;
      const expectedLengthFourth: int = 2;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Seventh = s2.$_get(0);
      const expectedElement0Seventh: number = 3.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      expect(s2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0720
     * @tc.name testFloat64ArrayViewBuffer072
     * @tc.desc Verify subarray byteOffset increments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const sub = arr.subarray(1, 3);
      const actualByteOffsetThird = arr.byteOffset;
      const expectedByteOffsetThird: int = 0;
      expect(actualByteOffsetThird).assertEqual(expectedByteOffsetThird);
      const actualByteOffsetFourth = sub.byteOffset;
      const expectedByteOffsetFourth: int = 8;
      expect(actualByteOffsetFourth).assertEqual(expectedByteOffsetFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0730
     * @tc.name testFloat64ArrayViewBuffer073
     * @tc.desc Verify subarray length = end - begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub = arr.subarray(1, 4);
      const actualLengthFourth = sub.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0740
     * @tc.name testFloat64ArrayViewBuffer074
     * @tc.desc Verify subarray(0) full array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const actualLengthFourth = arr.subarray(0).length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0750
     * @tc.name testFloat64ArrayViewBuffer075
     * @tc.desc Verify subarray byteLength = length * 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(5);
      const sub = arr.subarray(2, 4);
      const actualByteLength = sub.byteLength;
      const expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0760
     * @tc.name testFloat64ArrayViewBuffer076
     * @tc.desc Verify copyWithin on subarray only modifies subarray region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const sub = arr.subarray(1, 4);
      sub.copyWithin(0, 1, 2);
      const actualElement1Fifth = arr.$_get(1);
      const expectedElement1Fifth: number = 3.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
      const actualElementAt4Third = arr.$_get(4);
      const expectedElementAt4Third: number = 5.0;
      expect(actualElementAt4Third).assertEqual(expectedElementAt4Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0770
     * @tc.name testFloat64ArrayViewBuffer077
     * @tc.desc Verify slice no args copies full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const s = arr.slice();
      const actualLengthFourth = s.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      expect(s.buffer !== arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0780
     * @tc.name testFloat64ArrayViewBuffer078
     * @tc.desc Verify Float64Array.set(Int32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64: Float64Array = new Float64Array(2);
      const i32: Int32Array = new Int32Array([10, 20]);
      f64.set(i32);
      const actualElement0Seventh = f64.$_get(0);
      const expectedElement0Seventh: number = 10.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Fifth = f64.$_get(1);
      const expectedElement1Fifth: number = 20.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0790
     * @tc.name testFloat64ArrayViewBuffer079
     * @tc.desc Verify Float64Array.set(Uint8Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64: Float64Array = new Float64Array(2);
      const u8: Uint8Array = new Uint8Array([255, 0]);
      f64.set(u8);
      const actualElement0Seventh = f64.$_get(0);
      const expectedElement0Seventh: number = 255.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Fifth = f64.$_get(1);
      const expectedElement1Fifth: number = 0.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0800
     * @tc.name testFloat64ArrayViewBuffer080
     * @tc.desc Verify new Float64Array(Int32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const i32: Int32Array = new Int32Array([1, 2, 3]);
      const f64: Float64Array = new Float64Array(i32);
      const actualLengthFourth = f64.length;
      const expectedLengthFourth: int = 3;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      const actualElement0Seventh = f64.$_get(0);
      const expectedElement0Seventh: number = 1.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement2Fourth = f64.$_get(2);
      const expectedElement2Fourth: number = 3.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0810
     * @tc.name testFloat64ArrayViewBuffer081
     * @tc.desc Verify Float64Array.set(Float32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64: Float64Array = new Float64Array(2);
      const f32: Float32Array = new Float32Array([1.5, 2.5]);
      f64.set(f32);
      const actualElement0Seventh = f64.$_get(0);
      const expectedElement0Seventh: number = 1.5;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Fifth = f64.$_get(1);
      const expectedElement1Fifth: number = 2.5;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0820
     * @tc.name testFloat64ArrayViewBuffer082
     * @tc.desc Verify values are copied into the destination starting at the offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f64: Float64Array = new Float64Array(4);
      const src: Float64Array = Float64Array.of(1.0, 2.0);
      f64.set(src, 1);
      const actualElement0Seventh = f64.$_get(0);
      const expectedElement0Seventh: number = 0.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Fifth = f64.$_get(1);
      const expectedElement1Fifth: number = 1.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
      const actualElement2Fourth = f64.$_get(2);
      const expectedElement2Fourth: number = 2.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0830
     * @tc.name testFloat64ArrayViewBuffer083
     * @tc.desc Verify byteLength equals length multiplied by BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      const actualBytesPerElement = arr.BYTES_PER_ELEMENT;
      const expectedBytesPerElement: int = 8;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
      const actualBytesPerElementSecond = Float64Array.BYTES_PER_ELEMENT;
      const expectedBytesPerElementSecond: int = 8;
      expect(actualBytesPerElementSecond).assertEqual(expectedBytesPerElementSecond);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 4;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      expect(arr.length * arr.BYTES_PER_ELEMENT).assertEqual(arr.byteLength);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 32;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0840
     * @tc.name testFloat64ArrayViewBuffer084
     * @tc.desc Verify constructor buf with byteOffset only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr: Float64Array = new Float64Array(buf, 8);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 2;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0850
     * @tc.name testFloat64ArrayViewBuffer085
     * @tc.desc Verify constructor buf with byteOffset 0 and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Float64Array = new Float64Array(buf, 0, 2);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 2;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0860
     * @tc.name testFloat64ArrayViewBuffer086
     * @tc.desc Verify buf length multiple of 8 only required for direct buf constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const arr: Float64Array = new Float64Array(buf, 0, 3);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0870
     * @tc.name testFloat64ArrayViewBuffer087
     * @tc.desc Verify byteOffset = 0 for normal constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(4);
      const actualByteOffsetFifth = arr.byteOffset;
      const expectedByteOffsetFifth: int = 0;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualByteLengthSecond = arr.byteLength;
      const expectedByteLengthSecond: int = 32;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0880
     * @tc.name testFloat64ArrayViewBuffer088
     * @tc.desc Verify buffer property returns same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(3);
      const buf = arr.buffer;
      const actualByteLengthSecond = buf.byteLength;
      const expectedByteLengthSecond: int = 24;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0890
     * @tc.name testFloat64ArrayViewBuffer089
     * @tc.desc Verify name property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(0);
      const actualName = arr.name;
      const expectedName: string = 'Float64Array';
      expect(actualName).assertEqual(expectedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0900
     * @tc.name testFloat64ArrayViewBuffer090
     * @tc.desc Verify constructor with length and buffer view byteOffset matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      const v: Float64Array = new Float64Array(buf, 8, 2);
      const actualByteOffsetFifth = v.byteOffset;
      const expectedByteOffsetFifth: int = 8;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualByteLengthSecond = v.byteLength;
      const expectedByteLengthSecond: int = 16;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
      const actualLengthFifth = v.length;
      const expectedLengthFifth: int = 2;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0910
     * @tc.name testFloat64ArrayViewBuffer091
     * @tc.desc Verify buffer slice creates new buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const b2 = buf.slice(0);
      const actualByteLengthSecond = b2.byteLength;
      const expectedByteLengthSecond: int = 16;
      expect(actualByteLengthSecond).assertEqual(expectedByteLengthSecond);
      expect(b2).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0920
     * @tc.name testFloat64ArrayViewBuffer092
     * @tc.desc Verify constructor with number length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array(10.0);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 10;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0930
     * @tc.name testFloat64ArrayViewBuffer093
     * @tc.desc Verify constructor from FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float64Array = new Float64Array([1, 2, 3]);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0940
     * @tc.name testFloat64ArrayViewBuffer094
     * @tc.desc Verify constructor from Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const arr: Float64Array = new Float64Array(src);
      const actualLengthFifth = arr.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      expect(arr.buffer).not().assertEqual(src.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0950
     * @tc.name testFloat64ArrayViewBuffer095
     * @tc.desc Verify toSorted result from subarray stays detached after parent mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(3.0, 1.0, 2.0, 4.0);
      const child: Float64Array = parent.subarray(0, 3);
      const sorted: Float64Array = child.toSorted();
      parent.$_set(1, 99.0);
      const actualElement0Eighth = sorted.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Sixth = sorted.$_get(1);
      const expectedElement1Sixth: number = 2.0;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Fifth = sorted.$_get(2);
      const expectedElement2Fifth: number = 3.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
      const actualElement1Seventh = child.$_get(1);
      const expectedElement1Seventh: number = 99.0;
      expect(actualElement1Seventh).assertEqual(expectedElement1Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0960
     * @tc.name testFloat64ArrayViewBuffer096
     * @tc.desc Verify with result from subarray stays detached after parent mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0);
      const child: Float64Array = parent.subarray(1, 4);
      const replaced: Float64Array = child.with(0, 77.0);
      parent.$_set(1, 200.0);
      const actualElement0Eighth = replaced.$_get(0);
      const expectedElement0Eighth: number = 77.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Sixth = replaced.$_get(1);
      const expectedElement1Sixth: number = 30.0;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement0Ninth = child.$_get(0);
      const expectedElement0Ninth: number = 200.0;
      expect(actualElement0Ninth).assertEqual(expectedElement0Ninth);
      const actualElement1Seventh = parent.$_get(1);
      const expectedElement1Seventh: number = 200.0;
      expect(actualElement1Seventh).assertEqual(expectedElement1Seventh);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0970
     * @tc.name testFloat64ArrayViewBuffer097
     * @tc.desc Verify nested subarray keeps byteOffset length and parent writeback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const outer: Float64Array = parent.subarray(1, 5);
      const inner: Float64Array = outer.subarray(1, 3);
      expect(inner.buffer).assertEqual(parent.buffer);
      const actualByteOffsetFifth = inner.byteOffset;
      const expectedByteOffsetFifth: int = parent.byteOffset + 16;
      expect(actualByteOffsetFifth).assertEqual(expectedByteOffsetFifth);
      const actualLengthFifth = inner.length;
      const expectedLengthFifth: int = 2;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
      inner.$_set(0, 77.0);
      const actualElement2Fifth = parent.$_get(2);
      const expectedElement2Fifth: number = 77.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0980
     * @tc.name testFloat64ArrayViewBuffer098
     * @tc.desc Verify slice copy subarray mutation stays isolated from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const copy: Float64Array = parent.slice(1, 4);
      const sub: Float64Array = copy.subarray(1, 3);
      sub.$_set(0, 77.0);
      expect(copy.buffer).not().assertEqual(parent.buffer);
      expect(sub.buffer).assertEqual(copy.buffer);
      const actualElement1Sixth = copy.$_get(1);
      const expectedElement1Sixth: number = 77.0;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      const actualElement2Fifth = parent.$_get(2);
      const expectedElement2Fifth: number = 3.0;
      expect(actualElement2Fifth).assertEqual(expectedElement2Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_0990
     * @tc.name testFloat64ArrayViewBuffer099
     * @tc.desc Verify critical static invalid buffer offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0x10);
      try {
        const view = new Float64Array(buf, 0b1);
        expect().assertFail();
      } catch (e) {
        const actualName = e.name;
        const expectedName: string = 'RangeError';
        expect(actualName).assertEqual(expectedName);
      }
      const arr: Float64Array = Float64Array.of(1e-308);
      const actualElement0Eighth = arr.$_get(0);
      const expectedElement0Eighth: number = 1e-308;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VIEW_BUFFER_1000
     * @tc.name testFloat64ArrayViewBuffer100
     * @tc.desc Verify chained view buffer slice keeps copy isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayViewBuffer100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const copy = source.subarray(1, 4).slice(0, 2);
      copy.$_set(0, 20.0);
      const actualElement0Eighth = copy.$_get(0);
      const expectedElement0Eighth: number = 20.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Sixth = source.$_get(1);
      const expectedElement1Sixth: number = 2.0;
      expect(actualElement1Sixth).assertEqual(expectedElement1Sixth);
      expect(copy.buffer).not().assertEqual(source.buffer);
    });
  })
}
