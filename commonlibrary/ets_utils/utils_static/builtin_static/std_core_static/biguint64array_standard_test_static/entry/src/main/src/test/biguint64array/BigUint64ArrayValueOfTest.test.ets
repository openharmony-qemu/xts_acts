'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

const MAX_UINT64_VALUE: bigint = 18446744073709551615n;
const UINT64_MODULUS_VALUE: bigint = 18446744073709551616n;

export default function biguint64arrayValueOfTest(): void {

  describe('BigUint64ArrayValueOfTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0100
     * @tc.name testBigUint64ArrayValueOf001
     * @tc.desc Verify valueOf() on an empty array returns the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array();
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray.length).assertEqual(0);
      expect(returnedArray.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0200
     * @tc.name testBigUint64ArrayValueOf002
     * @tc.desc Verify valueOf() on a copied instance returns that copied object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([4n, 5n, 6n]);
      let copiedArray = new BigUint64Array(originalArray);
      let returnedArray = copiedArray.valueOf();
      originalArray[0] = 40n;
      expect(returnedArray).assertEqual(copiedArray);
      expect(returnedArray[0]).assertEqual(4n);
      expect(copiedArray[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0300
     * @tc.name testBigUint64ArrayValueOf003
     * @tc.desc Verify valueOf() on a whole ArrayBuffer view keeps the same buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer);
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray.buffer).assertEqual(sourceBuffer);
      expect(returnedArray.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0400
     * @tc.name testBigUint64ArrayValueOf004
     * @tc.desc Verify valueOf() on an ArrayBuffer offset view preserves byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer, 8);
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray.byteOffset).assertEqual(8);
      expect(returnedArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0500
     * @tc.name testBigUint64ArrayValueOf005
     * @tc.desc Verify valueOf() on an ArrayBuffer offset length view preserves view metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let sourceArray = new BigUint64Array(sourceBuffer, 8, 2);
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray.byteOffset).assertEqual(8);
      expect(returnedArray.byteLength).assertEqual(16);
      expect(returnedArray.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0600
     * @tc.name testBigUint64ArrayValueOf006
     * @tc.desc Verify valueOf() preserves max uint64 elements on the same object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([MAX_UINT64_VALUE, 0n]);
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(returnedArray[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0700
     * @tc.name testBigUint64ArrayValueOf007
     * @tc.desc Verify valueOf() observes stored values after uint64 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n, UINT64_MODULUS_VALUE + 1n]);
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray).assertEqual(sourceArray);
      expect(returnedArray[0]).assertEqual(MAX_UINT64_VALUE);
      expect(returnedArray[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0800
     * @tc.name testBigUint64ArrayValueOf008
     * @tc.desc Verify repeated valueOf() calls return the same object reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let firstReturnedArray = sourceArray.valueOf();
      let secondReturnedArray = sourceArray.valueOf();
      expect(firstReturnedArray).assertEqual(sourceArray);
      expect(secondReturnedArray).assertEqual(firstReturnedArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_0900
     * @tc.name testBigUint64ArrayValueOf009
     * @tc.desc Verify chained valueOf() calls keep returning the original object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 4n]);
      let chainedArray = sourceArray.valueOf().valueOf();
      expect(chainedArray).assertEqual(sourceArray);
      expect(chainedArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1000
     * @tc.name testBigUint64ArrayValueOf010
     * @tc.desc Verify writing through the valueOf() result updates the original array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let returnedArray = sourceArray.valueOf();
      returnedArray[0] = 99n;
      expect(sourceArray[0]).assertEqual(99n);
      expect(returnedArray).assertEqual(sourceArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1100
     * @tc.name testBigUint64ArrayValueOf011
     * @tc.desc Verify writing through the original array updates the valueOf() result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let returnedArray = sourceArray.valueOf();
      sourceArray[2] = 77n;
      expect(returnedArray[2]).assertEqual(77n);
      expect(returnedArray).assertEqual(sourceArray);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1200
     * @tc.name testBigUint64ArrayValueOf012
     * @tc.desc Verify subarray() from the valueOf() result shares the original buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let returnedArray = sourceArray.valueOf();
      let childView = returnedArray.subarray(1, 3);
      childView[0] = 99n;
      expect(sourceArray[1]).assertEqual(99n);
      expect(childView.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1300
     * @tc.name testBigUint64ArrayValueOf013
     * @tc.desc Verify a constructor copy from valueOf() creates an independent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let copiedArray = new BigUint64Array(sourceArray.valueOf());
      sourceArray[0] = 99n;
      expect(copiedArray[0]).assertEqual(10n);
      expect(copiedArray.length).assertEqual(sourceArray.length);
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1400
     * @tc.name testBigUint64ArrayValueOf014
     * @tc.desc Verify valueOf() returns an object with matching byte metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(4);
      let returnedArray = sourceArray.valueOf();
      expect(returnedArray.BYTES_PER_ELEMENT).assertEqual(8);
      expect(returnedArray.byteLength).assertEqual(sourceArray.byteLength);
      expect(returnedArray.byteOffset).assertEqual(sourceArray.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1500
     * @tc.name testBigUint64ArrayValueOf015
     * @tc.desc Verify valueOf() on an offset view writes through the shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(sourceBuffer);
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      let returnedView = offsetView.valueOf();
      returnedView[0] = 999n;
      expect(returnedView).assertEqual(offsetView);
      expect(fullView[1]).assertEqual(999n);
      expect(fullView[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1600
     * @tc.name testBigUint64ArrayValueOf016
     * @tc.desc Verify valueOf() on a subarray view preserves receiver identity and shared buffer writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 4);
      let subarrayView = offsetView.subarray(1, 3);
      let returnedView = subarrayView.valueOf();
      returnedView[1] = 88n;
      expect(returnedView).assertEqual(subarrayView);
      expect(returnedView.buffer).assertEqual(sourceBuffer);
      expect(returnedView.byteOffset).assertEqual(16);
      expect(returnedView.length).assertEqual(2);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(88n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1700
     * @tc.name testBigUint64ArrayValueOf017
     * @tc.desc Verify valueOf() on a nested byteOffset subarray keeps the current window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffsetView = new BigUint64Array(sourceBuffer, 8, 5);
      let firstWindow = byteOffsetView.subarray(1, 5);
      let nestedWindow = firstWindow.subarray(1, 3);
      let returnedWindow = nestedWindow.valueOf();
      fullView[4] = 555n;
      expect(returnedWindow).assertEqual(nestedWindow);
      expect(returnedWindow.buffer).assertEqual(sourceBuffer);
      expect(returnedWindow.byteOffset).assertEqual(24);
      expect(returnedWindow.length).assertEqual(2);
      expect(returnedWindow[0]).assertEqual(40n);
      expect(returnedWindow[1]).assertEqual(555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1800
     * @tc.name testBigUint64ArrayValueOf018
     * @tc.desc Verify slice() from valueOf() on a byteOffset view creates an independent window copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let returnedView = offsetView.valueOf();
      let sliceCopy = returnedView.slice(1, 3);
      fullView[2] = 777n;
      expect(returnedView).assertEqual(offsetView);
      expect(returnedView[1]).assertEqual(777n);
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(2);
      expect(sliceCopy[0]).assertEqual(30n);
      expect(sliceCopy[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_VALUEOF_1900
     * @tc.name testBigUint64ArrayValueOf019
     * @tc.desc Verify valueOf() on a zero-length byteOffset view returns the same receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer: ArrayBuffer = new ArrayBuffer(24);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let sourceView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let returnedView = sourceView.valueOf();
      expect(returnedView).assertEqual(sourceView);
      expect(returnedView.buffer).assertEqual(sourceBuffer);
      expect(returnedView.byteOffset).assertEqual(16);
      expect(returnedView.byteLength).assertEqual(0);
      expect(returnedView.length).assertEqual(0);
    });

  });
}
