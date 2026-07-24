'use static'


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

const SIGNED_LONG_MAX_VALUE: bigint = 9223372036854775807n;
const ORDINARY_LARGE_VALUE: bigint = 9007199254740993n;

export default function biguint64arraySomeTest(): void {

  describe('BigUint64ArraySomeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0100
     * @tc.name testBigUint64ArraySome001
     * @tc.desc Verify some() returns true when the predicate matches a middle element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: boolean = sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        expect(index < array.length).assertTrue();
        return element === 2n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0200
     * @tc.name testBigUint64ArraySome002
     * @tc.desc Verify some() returns false when no element matches the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element === 99n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0300
     * @tc.name testBigUint64ArraySome003
     * @tc.desc Verify some() short circuits after a predicate returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        callCount++;
        return element === 10n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0400
     * @tc.name testBigUint64ArraySome004
     * @tc.desc Verify some() visits every element when the predicate always returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.some((_element: bigint): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(sourceArray.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0500
     * @tc.name testBigUint64ArraySome005
     * @tc.desc Verify some() on an empty array returns false without invoking the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let callCount: int = 0;
      let result: boolean = sourceArray.some((_element: bigint): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0600
     * @tc.name testBigUint64ArraySome006
     * @tc.desc Verify some() on a single matching element returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let result: boolean = sourceArray.some((element: bigint, index: int): boolean => {
        return element === 0n && index === 0;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0700
     * @tc.name testBigUint64ArraySome007
     * @tc.desc Verify some() on a single non matching element returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([55n]);
      let result: boolean = sourceArray.some((element: bigint, index: int): boolean => {
        return element === 0n || index > 0;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0800
     * @tc.name testBigUint64ArraySome008
     * @tc.desc Verify some() can match a zero element among positive values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 0n, 10n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element <= 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_0900
     * @tc.name testBigUint64ArraySome009
     * @tc.desc Verify some() returns false for a positive predicate on all zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n, 0n, 0n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element > 0n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1000
     * @tc.name testBigUint64ArraySome010
     * @tc.desc Verify some() matches the signed long max boundary exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, SIGNED_LONG_MAX_VALUE, 2n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element === SIGNED_LONG_MAX_VALUE;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1100
     * @tc.name testBigUint64ArraySome011
     * @tc.desc Verify some() matches an ordinary large BigInt value exactly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, ORDINARY_LARGE_VALUE, 3n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element === ORDINARY_LARGE_VALUE;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1200
     * @tc.name testBigUint64ArraySome012
     * @tc.desc Verify some() works on a sliced BigUint64Array copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let slicedArray = sourceArray.slice(1, 3);
      let result: boolean = slicedArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        return index === 1 && element === 30n && array.length === 2;
      });
      expect(result).assertTrue();
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1300
     * @tc.name testBigUint64ArraySome013
     * @tc.desc Verify some() can match by callback index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([50n, 60n, 70n]);
      let result: boolean = sourceArray.some((_element: bigint, index: int): boolean => {
        return index === 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1400
     * @tc.name testBigUint64ArraySome014
     * @tc.desc Verify some() returns false when an index predicate is outside the array range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.some((_element: bigint, index: int): boolean => {
        callCount++;
        return index === 5;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1500
     * @tc.name testBigUint64ArraySome015
     * @tc.desc Verify some() passes the receiver as the callback array argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let result: boolean = sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        return array === sourceArray && array[index] === element;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1600
     * @tc.name testBigUint64ArraySome016
     * @tc.desc Verify some() can read the callback array length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let result: boolean = sourceArray.some((_element: bigint, index: int, array: BigUint64Array): boolean => {
        return array.length === 3 && index === array.length - 1;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1700
     * @tc.name testBigUint64ArraySome017
     * @tc.desc Verify some() supports BigInt arithmetic in the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 3n, 5n, 8n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element % 2n === 0n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1800
     * @tc.name testBigUint64ArraySome018
     * @tc.desc Verify some() can observe callback mutations to later elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 0n, 0n]);
      let result: boolean = sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        if (index === 0) {
          array[1] = 9n;
          return false;
        }
        return element === 9n;
      });
      expect(result).assertTrue();
      expect(sourceArray[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_1900
     * @tc.name testBigUint64ArraySome019
     * @tc.desc Verify some() does not change source metadata for read only predicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([13n, 26n, 39n]);
      let lengthBefore: int = sourceArray.length;
      let byteLengthBefore: int = sourceArray.byteLength;
      let bufferBefore = sourceArray.buffer;
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element === 26n;
      });
      expect(result).assertTrue();
      expect(sourceArray.length).assertEqual(lengthBefore);
      expect(sourceArray.byteLength).assertEqual(byteLengthBefore);
      expect(sourceArray.buffer).assertEqual(bufferBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2000
     * @tc.name testBigUint64ArraySome020
     * @tc.desc Verify some() does not change source values for read only predicates
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([75n, 76n, 77n, 78n]);
      let result: boolean = sourceArray.some((element: bigint): boolean => {
        return element === 99n;
      });
      expect(result).assertFalse();
      expect(sourceArray[0]).assertEqual(75n);
      expect(sourceArray[1]).assertEqual(76n);
      expect(sourceArray[2]).assertEqual(77n);
      expect(sourceArray[3]).assertEqual(78n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2100
     * @tc.name testBigUint64ArraySome021
     * @tc.desc Verify some() on a byteOffset view only visits the view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 3);
      let result: boolean = offsetView.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        return index === 1 && element === 30n && array.byteOffset === 8;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2200
     * @tc.name testBigUint64ArraySome022
     * @tc.desc Verify some() propagates an Error thrown by the predicate
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let callCount: int = 0;
      try {
        sourceArray.some((element: bigint): boolean => {
          callCount++;
          if (element === 20n) {
            throw new Error('predicate error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2300
     * @tc.name testBigUint64ArraySome023
     * @tc.desc Verify repeated some() calls return stable boolean results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([23n, 46n, 69n]);
      let firstResult: boolean = sourceArray.some((element: bigint): boolean => {
        return element === 46n;
      });
      let secondResult: boolean = sourceArray.some((element: bigint): boolean => {
        return element === 46n;
      });
      let thirdResult: boolean = sourceArray.some((element: bigint): boolean => {
        return element === 0n;
      });
      expect(firstResult).assertTrue();
      expect(secondResult).assertTrue();
      expect(thirdResult).assertFalse();
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2400
     * @tc.name testBigUint64ArraySome024
     * @tc.desc Verify some() on a byteOffset view short circuits with local index zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let result: boolean = sourceView.some((element: bigint, index: int, _array: BigUint64Array): boolean => {
        callCount++;
        return index === 0 && element === 20n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2500
     * @tc.name testBigUint64ArraySome025
     * @tc.desc Verify some() on a subarray observes parent mutation before visiting later index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let sourceView = parentArray.subarray(beginIndex, endIndex);
      let observedLaterElement: bigint = 0n;
      let result: boolean = sourceView.some((element: bigint, index: int, _array: BigUint64Array): boolean => {
        if (index === 0) {
          parentArray[2] = 99n;
          return false;
        }
        observedLaterElement = element;
        return element === 99n;
      });
      expect(result).assertTrue();
      expect(observedLaterElement).assertEqual(99n);
      expect(parentArray[2]).assertEqual(99n);
      expect(sourceView[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2600
     * @tc.name testBigUint64ArraySome026
     * @tc.desc Verify some() propagates an Error thrown on the last predicate callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let callCount: int = 0;
      try {
        sourceArray.some((_element: bigint, index: int): boolean => {
          callCount++;
          if (index === 2) {
            throw new Error('some last callback error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2700
     * @tc.name testBigUint64ArraySome027
     * @tc.desc Verify some() on a nested byteOffset subarray uses local callback indices before the match
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer, 0, 7);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffset: int = 8;
      let viewLength: int = 5;
      let offsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let nestedWindow = offsetView.subarray(1, 4);
      let indexSum: int = 0;
      let result: boolean = nestedWindow.some(
        (element: bigint, index: int, array: BigUint64Array): boolean => {
          indexSum = indexSum + index;
          return array[index] === element && index === 2;
        });
      expect(result).assertTrue();
      expect(indexSum).assertEqual(3);
      expect(nestedWindow.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2800
     * @tc.name testBigUint64ArraySome028
     * @tc.desc Verify some() on a slice copy from a byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer, 0, 6);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let viewLength: int = 4;
      let offsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let sliceCopy = offsetView.slice(1, 4);
      fullView[2] = 777n;
      let result: boolean = sliceCopy.some((element: bigint): boolean => {
        return element === 30n;
      });
      let usesIndependentBuffer: boolean = sliceCopy.buffer !== sharedBuffer;
      expect(result).assertTrue();
      expect(sliceCopy[0]).assertEqual(30n);
      expect(fullView[2]).assertEqual(777n);
      expect(usesIndependentBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_2900
     * @tc.name testBigUint64ArraySome029
     * @tc.desc Verify some() on a zero-length byteOffset view returns false without invoking the callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer, 0, 4);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let callCount: int = 0;
      let result: boolean = zeroLengthView.some(
        (_element: bigint, _index: int, _array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return true;
        });
      expect(result).assertFalse();
      expect(callCount).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3000
     * @tc.name testBigUint64ArraySome030
     * @tc.desc Verify some() on a Set source uses callback values after duplicate removal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let callCount: int = 0;
      let result: boolean =
        sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 11n && index === 1 && array.length === 3;
        });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3100
     * @tc.name testBigUint64ArraySome031
     * @tc.desc Verify some() on an advanced iterator source uses local callback indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let sourceArray = new BigUint64Array(sourceIterator);
      let callCount: int = 0;
      let result: boolean =
        sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
          callCount = callCount + 1;
          return element === 15n && index === 1 && array[0] === 10n;
        });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
      expect(sourceArray.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3200
     * @tc.name testBigUint64ArraySome032
     * @tc.desc Verify some() short circuit prevents later callback side effects
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let callCount: int = 0;
      let result: boolean = sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        if (index === 2) {
          array[0] = 99n;
        }
        return element === 4n;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(2);
      expect(sourceArray[0]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3300
     * @tc.name testBigUint64ArraySome033
     * @tc.desc Verify some() callback writing the current source element keeps the captured value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([5n, 10n, 15n]);
      let capturedElement: bigint = 0n;
      let callCount: int = 0;
      let result: boolean = sourceArray.some((element: bigint, index: int, array: BigUint64Array): boolean => {
        callCount = callCount + 1;
        if (index === 0) {
          capturedElement = element;
          array[index] = 105n;
          return element === 5n;
        }
        return false;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(1);
      expect(capturedElement).assertEqual(5n);
      expect(sourceArray[0]).assertEqual(105n);
      expect(sourceArray[1]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3400
     * @tc.name testBigUint64ArraySome034
     * @tc.desc Verify some() propagates an Error thrown on the first predicate callback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([3n, 6n, 9n]);
      let callCount: int = 0;
      try {
        sourceArray.some((_element: bigint, index: int): boolean => {
          callCount = callCount + 1;
          if (index === 0) {
            throw new Error('some first callback error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3500
     * @tc.name testBigUint64ArraySome035
     * @tc.desc Verify some() visits callbacks in ascending index order before short circuit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n, 8n]);
      let visitedOrder: int = 0;
      let valueSum: bigint = 0n;
      let result: boolean = sourceArray.some((element: bigint, index: int): boolean => {
        visitedOrder = visitedOrder * 10 + index + 1;
        valueSum = valueSum + element;
        return element === 6n;
      });
      expect(result).assertTrue();
      expect(visitedOrder).assertEqual(123);
      expect(valueSum).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3600
     * @tc.name testBigUint64ArraySome036
     * @tc.desc Verify some() later write to a visited source index keeps the recorded callback value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([2n, 4n, 6n]);
      let observedValues: Array<bigint> = [];
      let result: boolean = sourceArray.some((element: bigint, index: int,
        array: BigUint64Array): boolean => {
        observedValues.push(element);
        if (index === 1) {
          array[0] = 99n;
        }
        return false;
      });
      expect(result).assertFalse();
      expect(observedValues.length).assertEqual(3);
      expect(observedValues[0]).assertEqual(2n);
      expect(observedValues[1]).assertEqual(4n);
      expect(observedValues[2]).assertEqual(6n);
      expect(sourceArray[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_SOME_3700
     * @tc.name testBigUint64ArraySome037
     * @tc.desc Verify some() observes an unvisited source value written through an overlapping sibling view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArraySome037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(32);
      let sourceView = new BigUint64Array(sharedBuffer, 0, 3);
      let siblingView = new BigUint64Array(sharedBuffer, 8, 2);
      sourceView[0] = 1n;
      sourceView[1] = 2n;
      sourceView[2] = 3n;
      let observedLaterValue: bigint = 0n;
      let result: boolean = sourceView.some((element: bigint, index: int,
        _array: BigUint64Array): boolean => {
        if (index === 0) {
          siblingView[0] = 9n;
        }
        if (index === 1) {
          observedLaterValue = element;
        }
        return element === 9n;
      });
      expect(result).assertTrue();
      expect(observedLaterValue).assertEqual(9n);
      expect(sourceView[1]).assertEqual(9n);
      expect(siblingView[0]).assertEqual(9n);
    });
  });
}
