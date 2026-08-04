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

export default function Float64ArrayReturnChainTest(): void {
  describe('Float64ArrayReturnChainTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0100
     * @tc.name testFloat64ArrayReturnChain001
     * @tc.desc Verify consecutive filter calls use the previous result and preserve source isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const first: Float64Array = source.filter((v: number): boolean => v % 2.0 === 1.0);
      const second: Float64Array = first.filter((v: number): boolean => v > 1.0);

      const actualLength = first.length;
      const expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = first.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = first.$_get(2);
      const expectedElement2: number = 5.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0Second = second.$_get(0);
      const expectedElement0Second: number = 3.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = second.$_get(1);
      const expectedElement1Second: number = 5.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const sharesFirstResultBuffer: boolean = second.buffer === first.buffer;
      expect(sharesFirstResultBuffer).assertFalse();
      const actualLengthThird = source.length;
      const expectedLengthThird: int = 5;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualElement0Third = source.$_get(0);
      const expectedElement0Third: number = 1.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElementAt4 = source.$_get(4);
      const expectedElementAt4: number = 5.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0200
     * @tc.name testFloat64ArrayReturnChain002
     * @tc.desc Verify consecutive slice calls apply offsets to the intermediate copy and remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const first: Float64Array = source.slice(1, 5);
      const second: Float64Array = first.slice(1, 3);

      const actualLength = first.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 20.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement3 = first.$_get(3);
      const expectedElement3: number = 50.0;
      expect(actualElement3).assertEqual(expectedElement3);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0Second = second.$_get(0);
      const expectedElement0Second: number = 30.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1 = second.$_get(1);
      const expectedElement1: number = 40.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const sharesSecondResultBuffer: boolean = second.buffer === first.buffer;
      expect(sharesSecondResultBuffer).assertFalse();
      const actualElement0Third = source.$_get(0);
      const expectedElement0Third: number = 10.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElementAt4 = source.$_get(4);
      const expectedElementAt4: number = 50.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0300
     * @tc.name testFloat64ArrayReturnChain003
     * @tc.desc Verify filter on an empty intermediate result skips the second callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0);
      const first: Float64Array = source.filter((v: number): boolean => false);
      let secondCalls: int = 0;
      const second: Float64Array = first.filter((v: number): boolean => {
        secondCalls += 1;
        return true;
      });

      const actualLength = first.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 0;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualResult = secondCalls;
      const expectedResult: number = 0;
      expect(actualResult).assertEqual(expectedResult);
      const sharesFilteredResultBuffer: boolean = second.buffer === first.buffer;
      expect(sharesFilteredResultBuffer).assertFalse();
      const actualLengthThird = source.length;
      const expectedLengthThird: int = 2;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
      const actualElement0 = source.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0400
     * @tc.name testFloat64ArrayReturnChain004
     * @tc.desc Verify consecutive slice calls normalize negative indexes on the intermediate copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const first: Float64Array = source.slice(1, 5);
      const second: Float64Array = first.slice(-3, -1);

      const actualLength = first.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0 = second.$_get(0);
      const expectedElement0: number = 30.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = second.$_get(1);
      const expectedElement1: number = 40.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const sharesMappedResultBuffer: boolean = second.buffer === first.buffer;
      expect(sharesMappedResultBuffer).assertFalse();
      const actualElement1Second = source.$_get(1);
      const expectedElement1Second: number = 20.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElementAt4 = source.$_get(4);
      const expectedElementAt4: number = 50.0;
      expect(actualElementAt4).assertEqual(expectedElementAt4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0500
     * @tc.name testFloat64ArrayReturnChain005
     * @tc.desc Verify mutating a second filter result does not affect the first result or source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const first: Float64Array = source.filter((v: number): boolean => v % 2.0 === 1.0);
      const second: Float64Array = first.filter((v: number): boolean => v > 1.0);
      second.$_set(0, 99.0);

      const actualElement0 = second.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = first.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = source.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0600
     * @tc.name testFloat64ArrayReturnChain006
     * @tc.desc Verify mutating a second slice result does not affect the first result or source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const first: Float64Array = source.slice(1, 5);
      const second: Float64Array = first.slice(1, 3);
      second.$_set(0, 99.0);

      const actualElement0 = second.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = first.$_get(1);
      const expectedElement1: number = 30.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = source.$_get(2);
      const expectedElement2: number = 30.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0700
     * @tc.name testFloat64ArrayReturnChain007
     * @tc.desc Verify map twice produces complete independent transformed results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = source.map((v: number): number => v + 1.0);
      const second: Float64Array = first.map((v: number): number => v * 10.0);

      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = first.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = first.$_get(2);
      const expectedElement2: number = 4.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0Second = second.$_get(0);
      const expectedElement0Second: number = 20.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement1Second = second.$_get(1);
      const expectedElement1Second: number = 30.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2Second = second.$_get(2);
      const expectedElement2Second: number = 40.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const sharesSecondChainBuffer: boolean = second.buffer === first.buffer;
      expect(sharesSecondChainBuffer).assertFalse();
      const sharesFirstSourceBuffer: boolean = first.buffer === source.buffer;
      expect(sharesFirstSourceBuffer).assertFalse();
      const actualElement0Third = source.$_get(0);
      const expectedElement0Third: number = 1.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0800
     * @tc.name testFloat64ArrayReturnChain008
     * @tc.desc Verify a negative index on the derived array is rejected without changing either array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const first: Float64Array = source.with(2, 99.0);
      try {
        first.with(-1, 88.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        const actualMessage = e.message;
        const expectedMessage: string = 'invalid index';
        expect(actualMessage).assertEqual(expectedMessage);
      }

      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 10.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = first.$_get(1);
      const expectedElement1: number = 20.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const actualElement2 = first.$_get(2);
      const expectedElement2: number = 99.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const sharesFirstSourceBuffer: boolean = first.buffer === source.buffer;
      expect(sharesFirstSourceBuffer).assertFalse();
      const actualElement1Second = source.$_get(1);
      const expectedElement1Second: number = 20.0;
      expect(actualElement1Second).assertEqual(expectedElement1Second);
      const actualElement2Second = source.$_get(2);
      const expectedElement2Second: number = 30.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_0900
     * @tc.name testFloat64ArrayReturnChain009
     * @tc.desc Verify consecutive toSorted calls create distinct sorted copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const first: Float64Array = source.toSorted();
      const second: Float64Array = first.toSorted();

      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = first.$_get(2);
      const expectedElement2: number = 3.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0Second = second.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2Second = second.$_get(2);
      const expectedElement2Second: number = 3.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const sharesFirstSourceBuffer: boolean = first.buffer === source.buffer;
      expect(sharesFirstSourceBuffer).assertFalse();
      const sharesSecondChainBuffer: boolean = second.buffer === first.buffer;
      expect(sharesSecondChainBuffer).assertFalse();
      const actualElement0Third = source.$_get(0);
      const expectedElement0Third: number = 3.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1000
     * @tc.name testFloat64ArrayReturnChain010
     * @tc.desc Verify consecutive toReversed calls create distinct copies and restore values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = source.toReversed();
      const second: Float64Array = first.toReversed();

      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = first.$_get(2);
      const expectedElement2: number = 1.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0Second = second.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2Second = second.$_get(2);
      const expectedElement2Second: number = 3.0;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
      const sharesFirstSourceBuffer: boolean = first.buffer === source.buffer;
      expect(sharesFirstSourceBuffer).assertFalse();
      const sharesSecondChainBuffer: boolean = second.buffer === first.buffer;
      expect(sharesSecondChainBuffer).assertFalse();
      const actualElement0Third = source.$_get(0);
      const expectedElement0Third: number = 1.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1100
     * @tc.name testFloat64ArrayReturnChain011
     * @tc.desc Verify nested subarray on an empty view keeps zero length and buffer sharing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const first: Float64Array = source.subarray(2, 2);
      const second: Float64Array = first.subarray(0);

      const actualLength = first.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 0;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const sharesEmptyResultSourceBuffer: boolean = second.buffer === source.buffer;
      expect(sharesEmptyResultSourceBuffer).assertTrue();
      expect(second.byteOffset).assertEqual(first.byteOffset);
      const actualLengthThird = source.length;
      const expectedLengthThird: int = 4;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1200
     * @tc.name testFloat64ArrayReturnChain012
     * @tc.desc Verify nested subarray normalizes negative indexes relative to the intermediate view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const first: Float64Array = source.subarray(1, 5);
      const second: Float64Array = first.subarray(-3, -1);

      const actualLength = first.length;
      const expectedLength: int = 4;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 2;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualElement0 = second.$_get(0);
      const expectedElement0: number = 3.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = second.$_get(1);
      const expectedElement1: number = 4.0;
      expect(actualElement1).assertEqual(expectedElement1);
      const sharesMappedSourceBuffer: boolean = second.buffer === source.buffer;
      expect(sharesMappedSourceBuffer).assertTrue();
      const actualByteOffset = second.byteOffset;
      const expectedByteOffset: int = 16;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1300
     * @tc.name testFloat64ArrayReturnChain013
     * @tc.desc Verify consecutive from calls create independent copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = Float64Array.from(source);
      const second: Float64Array = Float64Array.from(first);
      second.$_set(0, 99.0);

      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 1.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = second.$_get(0);
      const expectedElement0Second: number = 99.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const sharesFirstSourceBuffer: boolean = first.buffer === source.buffer;
      expect(sharesFirstSourceBuffer).assertFalse();
      const sharesSecondChainBuffer: boolean = second.buffer === first.buffer;
      expect(sharesSecondChainBuffer).assertFalse();
      const actualElement0Third = source.$_get(0);
      const expectedElement0Third: number = 1.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1400
     * @tc.name testFloat64ArrayReturnChain014
     * @tc.desc Verify the second filter callback receives the intermediate array and reset index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = source.filter((v: number): boolean => v > 1.0);
      let secondIndex: int = -1;
      let secondArrayIsFirst: boolean = false;
      const second: Float64Array = first.filter((v: number, index: int, a: Float64Array): boolean => {
        secondIndex = index;
        secondArrayIsFirst = a === first;
        return v > 1.0;
      });

      const actualLength = second.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualResult = secondIndex;
      const expectedResult: number = 1;
      expect(actualResult).assertEqual(expectedResult);
      expect(secondArrayIsFirst).assertTrue();
      const actualElement0 = second.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement1 = second.$_get(1);
      const expectedElement1: number = 3.0;
      expect(actualElement1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1500
     * @tc.name testFloat64ArrayReturnChain015
     * @tc.desc Verify the second map callback receives transformed values and reset index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = source.map((v: number): number => v + 10.0);
      let secondIndex: int = -1;
      let secondValue: number = 0.0;
      let secondArrayIsFirst: boolean = false;
      const second: Float64Array = first.map((v: number, index: int, a: Float64Array): number => {
        secondIndex = index;
        secondValue = v;
        secondArrayIsFirst = a === first;
        return v * 2.0;
      });

      const actualResult = secondIndex;
      const expectedResult: number = 2;
      expect(actualResult).assertEqual(expectedResult);
      const actualResultSecond = secondValue;
      const expectedResultSecond: number = 13.0;
      expect(actualResultSecond).assertEqual(expectedResultSecond);
      expect(secondArrayIsFirst).assertTrue();
      const actualElement0 = second.$_get(0);
      const expectedElement0: number = 22.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = second.$_get(2);
      const expectedElement2: number = 26.0;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1600
     * @tc.name testFloat64ArrayReturnChain016
     * @tc.desc Verify an exception in the second map callback propagates and preserves the first result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = source.map((v: number): number => v + 1.0);
      try {
        first.map((v: number): number => {
          throw new Error('second map callback');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement2 = first.$_get(2);
      const expectedElement2: number = 4.0;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0Second = source.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1700
     * @tc.name testFloat64ArrayReturnChain017
     * @tc.desc Verify an exception in the second filter callback propagates and preserves the first result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const first: Float64Array = source.filter((v: number): boolean => v > 1.0);
      try {
        first.filter((v: number): boolean => {
          throw new Error('second filter callback');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      const actualLength = first.length;
      const expectedLength: int = 2;
      expect(actualLength).assertEqual(expectedLength);
      const actualElement0 = first.$_get(0);
      const expectedElement0: number = 2.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = source.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1800
     * @tc.name testFloat64ArrayReturnChain018
     * @tc.desc Verify consecutive map calls preserve negative zero NaN and infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(-0.0, NaN, Infinity);
      const first: Float64Array = source.map((v: number): number => v);
      const second: Float64Array = first.map((v: number): number => v);

      const actualElement0 = 1.0 / second.$_get(0);
      const expectedElement0: number = -Infinity;
      expect(actualElement0).assertEqual(expectedElement0);
      expect(second.$_get(1)).assertNaN();
      const actualElement2 = second.$_get(2);
      const expectedElement2: number = Infinity;
      expect(actualElement2).assertEqual(expectedElement2);
      const actualElement0Second = 1.0 / first.$_get(0);
      const expectedElement0Second: number = -Infinity;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement2Second = source.$_get(2);
      const expectedElement2Second: number = Infinity;
      expect(actualElement2Second).assertEqual(expectedElement2Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_1900
     * @tc.name testFloat64ArrayReturnChain019
     * @tc.desc Verify consecutive slice calls produce an empty independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(10.0, 20.0, 30.0);
      const first: Float64Array = source.slice(1, 1);
      const second: Float64Array = first.slice(0);

      const actualLength = first.length;
      const expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      const actualLengthSecond = second.length;
      const expectedLengthSecond: int = 0;
      expect(actualLengthSecond).assertEqual(expectedLengthSecond);
      const actualByteOffset = second.byteOffset;
      const expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      const actualByteLength = second.byteLength;
      const expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
      const sharesEmptyChainBuffer: boolean = second.buffer === first.buffer;
      expect(sharesEmptyChainBuffer).assertFalse();
      const actualLengthThird = source.length;
      const expectedLengthThird: int = 3;
      expect(actualLengthThird).assertEqual(expectedLengthThird);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2000
     * @tc.name testFloat64ArrayReturnChain020
     * @tc.desc Verify modifying the first sorted or reversed copy does not affect the second copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sortedSource: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      const sortedFirst: Float64Array = sortedSource.toSorted();
      const sortedSecond: Float64Array = sortedFirst.toSorted();
      sortedFirst.$_set(0, 99.0);

      const reversedSource: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const reversedFirst: Float64Array = reversedSource.toReversed();
      const reversedSecond: Float64Array = reversedFirst.toReversed();
      reversedFirst.$_set(0, 88.0);

      const actualElement0 = sortedFirst.$_get(0);
      const expectedElement0: number = 99.0;
      expect(actualElement0).assertEqual(expectedElement0);
      const actualElement0Second = sortedSecond.$_get(0);
      const expectedElement0Second: number = 1.0;
      expect(actualElement0Second).assertEqual(expectedElement0Second);
      const actualElement0Third = sortedSource.$_get(0);
      const expectedElement0Third: number = 3.0;
      expect(actualElement0Third).assertEqual(expectedElement0Third);
      const actualElement0Fourth = reversedFirst.$_get(0);
      const expectedElement0Fourth: number = 88.0;
      expect(actualElement0Fourth).assertEqual(expectedElement0Fourth);
      const actualElement0Fifth = reversedSecond.$_get(0);
      const expectedElement0Fifth: number = 1.0;
      expect(actualElement0Fifth).assertEqual(expectedElement0Fifth);
      const actualElement0Sixth = reversedSource.$_get(0);
      const expectedElement0Sixth: number = 1.0;
      expect(actualElement0Sixth).assertEqual(expectedElement0Sixth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2100
     * @tc.name testFloat64ArrayReturnChain021
     * @tc.desc Verify consecutive copyWithin calls use the prior in-place result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const first: Float64Array = source.copyWithin(1, 0, 2);
      const second: Float64Array = first.copyWithin(2, 0, 2);

      const isFirstOriginal: boolean = first === source;
      expect(isFirstOriginal).assertTrue();
      const isSecondOriginal: boolean = second === source;
      expect(isSecondOriginal).assertTrue();
      const actualElement0Seventh = second.$_get(0);
      const expectedElement0Seventh: number = 1.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Third = second.$_get(1);
      const expectedElement1Third: number = 1.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = second.$_get(2);
      const expectedElement2Third: number = 1.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement3Second = second.$_get(3);
      const expectedElement3Second: number = 1.0;
      expect(actualElement3Second).assertEqual(expectedElement3Second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2200
     * @tc.name testFloat64ArrayReturnChain022
     * @tc.desc Verify filter().slice().fill() keeps the filtered copy independent from the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const filtered: Float64Array = source.filter((v: number): boolean => v >= 2.0);
      const part: Float64Array = filtered.slice(0, 2);
      part.fill(9.0);

      const actualElement0Seventh = part.$_get(0);
      const expectedElement0Seventh: number = 9.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Third = part.$_get(1);
      const expectedElement1Third: number = 9.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement0Eighth = filtered.$_get(0);
      const expectedElement0Eighth: number = 2.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = source.$_get(1);
      const expectedElement1Fourth: number = 2.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2300
     * @tc.name testFloat64ArrayReturnChain023
     * @tc.desc Verify map().with() changes only the second independent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0);
      const mapped: Float64Array = source.map((v: number): number => v * 2.0);
      const replaced: Float64Array = mapped.with(1, 99.0);

      const actualElement0Seventh = replaced.$_get(0);
      const expectedElement0Seventh: number = 2.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Third = replaced.$_get(1);
      const expectedElement1Third: number = 99.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement1Fourth = mapped.$_get(1);
      const expectedElement1Fourth: number = 4.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement1Fifth = source.$_get(1);
      const expectedElement1Fifth: number = 2.0;
      expect(actualElement1Fifth).assertEqual(expectedElement1Fifth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2400
     * @tc.name testFloat64ArrayReturnChain024
     * @tc.desc Verify subarray().filter() returns a detached copy while the view remains shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const view: Float64Array = source.subarray(1, 3);
      const filtered: Float64Array = view.filter((v: number): boolean => v >= 2.0);
      filtered.fill(88.0);

      const actualElement0Seventh = filtered.$_get(0);
      const expectedElement0Seventh: number = 88.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement0Eighth = view.$_get(0);
      const expectedElement0Eighth: number = 2.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Third = source.$_get(1);
      const expectedElement1Third: number = 2.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const sharesFilteredViewBuffer: boolean = filtered.buffer === view.buffer;
      expect(sharesFilteredViewBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2500
     * @tc.name testFloat64ArrayReturnChain025
     * @tc.desc Verify slice().subarray().fill() shares only the sliced copy buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(10.0, 20.0, 30.0, 40.0);
      const copy: Float64Array = source.slice(1, 4);
      const view: Float64Array = copy.subarray(1, 3);
      view.fill(77.0);

      const actualElement0Seventh = view.$_get(0);
      const expectedElement0Seventh: number = 77.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement2Third = copy.$_get(2);
      const expectedElement2Third: number = 77.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement2Fourth = source.$_get(2);
      const expectedElement2Fourth: number = 30.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
      const sharesCopyBuffer: boolean = view.buffer === copy.buffer;
      expect(sharesCopyBuffer).assertTrue();
      const sharesSourceBuffer: boolean = view.buffer === source.buffer;
      expect(sharesSourceBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2600
     * @tc.name testFloat64ArrayReturnChain026
     * @tc.desc Verify fill().sort() and sort().fill() produce different order-sensitive results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillThenSort: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      fillThenSort.fill(4.0, 1, 3).sort();
      const sortThenFill: Float64Array = Float64Array.of(3.0, 1.0, 2.0);
      sortThenFill.sort().fill(4.0, 1, 3);

      const actualElement0Seventh = fillThenSort.$_get(0);
      const expectedElement0Seventh: number = 3.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Third = fillThenSort.$_get(1);
      const expectedElement1Third: number = 4.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = fillThenSort.$_get(2);
      const expectedElement2Third: number = 4.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualElement0Eighth = sortThenFill.$_get(0);
      const expectedElement0Eighth: number = 1.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
      const actualElement1Fourth = sortThenFill.$_get(1);
      const expectedElement1Fourth: number = 4.0;
      expect(actualElement1Fourth).assertEqual(expectedElement1Fourth);
      const actualElement2Fourth = sortThenFill.$_get(2);
      const expectedElement2Fourth: number = 4.0;
      expect(actualElement2Fourth).assertEqual(expectedElement2Fourth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2700
     * @tc.name testFloat64ArrayReturnChain027
     * @tc.desc Verify an in-place reverse followed by filter and findLastIndex observes the final order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(1.0, 2.0, 3.0, 2.0);
      const result: Float64Array = source.reverse().filter((v: number): boolean => v >= 2.0);
      const lastIndex: int = result.findLastIndex((v: number): boolean => v === 2.0);

      const actualElement0Seventh = result.$_get(0);
      const expectedElement0Seventh: number = 2.0;
      expect(actualElement0Seventh).assertEqual(expectedElement0Seventh);
      const actualElement1Third = result.$_get(1);
      const expectedElement1Third: number = 3.0;
      expect(actualElement1Third).assertEqual(expectedElement1Third);
      const actualElement2Third = result.$_get(2);
      const expectedElement2Third: number = 2.0;
      expect(actualElement2Third).assertEqual(expectedElement2Third);
      const actualResultThird = lastIndex;
      const expectedResultThird: number = 2;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualElement0Eighth = source.$_get(0);
      const expectedElement0Eighth: number = 2.0;
      expect(actualElement0Eighth).assertEqual(expectedElement0Eighth);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_RETURN_CHAIN_2800
     * @tc.name testFloat64ArrayReturnChain028
     * @tc.desc Verify an empty filter result preserves empty-array semantics for every some and join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReturnChain028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Float64Array = Float64Array.of(Number.MIN_VALUE, -0.0, NaN);
      const empty: Float64Array = source.filter((v: number): boolean => v > 10.0);
      let callbackCount: int = 0;
      const all: boolean = empty.every((v: number): boolean => {
        callbackCount++;
        return false;
      });
      const any: boolean = empty.some((v: number): boolean => {
        callbackCount++;
        return true;
      });

      const actualLengthFourth = empty.length;
      const expectedLengthFourth: int = 0;
      expect(actualLengthFourth).assertEqual(expectedLengthFourth);
      expect(all).assertTrue();
      expect(any).assertFalse();
      const actualResultThird = callbackCount;
      const expectedResultThird: number = 0;
      expect(actualResultThird).assertEqual(expectedResultThird);
      const actualString = empty.join(',');
      const expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
      const actualLengthFifth = source.length;
      const expectedLengthFifth: int = 3;
      expect(actualLengthFifth).assertEqual(expectedLengthFifth);
    });
  })
}
