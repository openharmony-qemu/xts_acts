'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
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
import Utils from '../Util.test';

export default function int32ArrayToReversedPart02Test(): void {
  describe('int32ArrayToReversedPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayToReversedPart02Test001
     * @tc.desc Verify four elements are reversed; Also verify verify toReversed() byteOffset=0 buffer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      expect(r.toString()).assertEqual('4,3,2,1');

      {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      expect(r.byteOffset).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayToReversedPart02Test002
     * @tc.desc Verify Array<number>; Also verify verify BYTES_PER_ELEMENT 4 Int32Array; Also verify verify 3 toReversed() byteLength=12; Also verify verify toReversed() buffer buffer; Also verify verify result buffer byteLength matches three elements; Also verify verify toReversed() join(','); Also verify verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.toString()).assertEqual('3,2,1');

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      }

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.byteLength).assertEqual(12);
      }

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.buffer).not().assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.buffer.byteLength).assertEqual(12);
      }

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.join(',')).assertEqual('3,2,1');
      }

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r).not().assertEqual(arr);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayToReversedPart02Test003
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayToReversedPart02Test004
     * @tc.desc Verify two elements are reversed; Also verify verify non-empty result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = arr.toReversed();
      expect(r.toString()).assertEqual('2,1');

      {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayToReversedPart02Test005
     * @tc.desc Verify empty toReversed() result; Also verify verify toReversed() length 0; Also verify verify toReversed() byteLength=0; Also verify verify empty result uses an independent empty buffer; Also verify verify toReversed() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(0);
      expect(r.toString()).assertEqual('');

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(arr.length);
      }

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      expect(r.byteLength).assertEqual(0);
      }

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      expect(r.buffer.byteLength).assertEqual(0);
      expect(r.buffer).not().assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toReversed();
      expect(r.join(',')).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayToReversedPart02Test006
     * @tc.desc Verify single element is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayToReversedPart02Test007
     * @tc.desc Verify toReversed() length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayToReversedPart02Test008
     * @tc.desc Verify 6 toReversed() length=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayToReversedPart02Test009
     * @tc.desc Verify length length; Also verify verify toReversed() at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(arr.length);

      {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let r: Int32Array = arr.toReversed();
      expect(r.at(0)).assertEqual(40);
      expect(r.at(-1)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayToReversedPart02Test010
     * @tc.desc Verify byteLength length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let r: Int32Array = arr.toReversed();
      expect(r.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayToReversedPart02Test011
     * @tc.desc Verify toReversed preserves the sequence when all elements are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(7);
      expect(r.$_get(2)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayToReversedPart02Test012
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, -1]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayToReversedPart02Test013
     * @tc.desc Verify INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, -1]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayToReversedPart02Test014
     * @tc.desc Verify INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayToReversedPart02Test015
     * @tc.desc Verify toReversed returns the exact reverse order for mixed positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 2, -2, 3]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(-2);
      expect(r.$_get(2)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(-1);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayToReversedPart02Test016
     * @tc.desc Verify toReversed returns the exact reverse order for negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-4);
      expect(r.$_get(1)).assertEqual(-3);
      expect(r.$_get(2)).assertEqual(-2);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayToReversedPart02Test017
     * @tc.desc Verify toReversed preserves the sequence of an even-length palindrome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 2, 1]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(arr.$_get(0));
      expect(r.$_get(1)).assertEqual(arr.$_get(1));
      expect(r.$_get(2)).assertEqual(arr.$_get(2));
      expect(r.$_get(3)).assertEqual(arr.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayToReversedPart02Test018
     * @tc.desc Verify toReversed preserves the checked positions of an odd-length palindrome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 2, 1]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(arr.$_get(0));
      expect(r.$_get(2)).assertEqual(arr.$_get(2));
      expect(r.$_get(4)).assertEqual(arr.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayToReversedPart02Test019
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(10);

      {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.toReversed();
      expect(arr.$_get(1)).assertEqual(20);
      }

      {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.toReversed();
      expect(arr.$_get(2)).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayToReversedPart02Test020
     * @tc.desc Verify toReversed() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let oldLen: number = arr.length;
      arr.toReversed();
      expect(arr.length).assertEqual(oldLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayToReversedPart02Test021
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77]);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayToReversedPart02Test022
     * @tc.desc Verify toReversed() 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayToReversedPart02Test023
     * @tc.desc Verify toReversed() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let oldBL: number = arr.byteLength;
      arr.toReversed();
      expect(arr.byteLength).assertEqual(oldBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayToReversedPart02Test024
     * @tc.desc Verify toReversed() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let oldBO: number = arr.byteOffset;
      arr.toReversed();
      expect(arr.byteOffset).assertEqual(oldBO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayToReversedPart02Test025
     * @tc.desc Verify byteOffset toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.toReversed();
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayToReversedPart02Test026
     * @tc.desc Verify $_set(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      r.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayToReversedPart02Test027
     * @tc.desc Verify modifying the reversed result does not change the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.toReversed();
      r.$_set(r.length - 1, -777);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayToReversedPart02Test028
     * @tc.desc Verify $_set toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      arr.$_set(0, 100);
      expect(r.$_get(r.length - 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayToReversedPart02Test029
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      arr.$_set(3, 44);
      let r: Int32Array = arr.toReversed();
      let rView: Int32Array = new Int32Array(r.buffer);
      rView.$_set(0, 9999);
      expect(r.$_get(0)).assertEqual(9999);
      expect(arr.$_get(3)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayToReversedPart02Test030
     * @tc.desc Verify buffer byteLength r.length * 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let r: Int32Array = arr.toReversed();
      expect(r.buffer.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayToReversedPart02Test031
     * @tc.desc Verify toReversed() buffer 4; Also verify verify toReversed() join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.toReversed();
      expect(r.buffer.byteLength).assertEqual(4);

      {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.toReversed();
      expect(r.join(',')).assertEqual('42');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayToReversedPart02Test032
     * @tc.desc Verify toReversed() toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let rr: Int32Array = arr.toReversed().toReversed();
      expect(rr.length).assertEqual(arr.length);
      expect(rr.$_get(0)).assertEqual(arr.$_get(0));
      expect(rr.$_get(2)).assertEqual(arr.$_get(2));
      expect(rr.$_get(4)).assertEqual(arr.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayToReversedPart02Test033
     * @tc.desc Verify toReversed() toReversed() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let rr: Int32Array = arr.toReversed().toReversed();
      expect(rr.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayToReversedPart02Test034
     * @tc.desc Verify toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      arr.toReversed();
      arr.toReversed();
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayToReversedPart02Test035
     * @tc.desc Verify toReversed() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r1: Int32Array = arr.toReversed();
      let r2: Int32Array = arr.toReversed();
      expect(r1.buffer).not().assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayToReversedPart02Test036
     * @tc.desc Verify toReversed() forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      let acc: number[] = [];
      r.forEach((v: number, _i: int, _a: Int32Array): void => {
        acc.push(Double.toInt(v));
      });
      expect(acc.length).assertEqual(3);
      expect(acc[0]).assertEqual(3);
      expect(acc[1]).assertEqual(2);
      expect(acc[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayToReversedPart02Test037
     * @tc.desc Verify toReversed() for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let r: Int32Array = arr.toReversed();
      let first: number = 0;
      for (let i = 0; i < r.length; i++) {
        let v = r.$_get(i);
        first = v;
        break;
      }
      expect(first).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayToReversedPart02Test038
     * @tc.desc Verify Int32Array.of toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(33);
      expect(r.$_get(2)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayToReversedPart02Test039
     * @tc.desc Verify Int32Array.from toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [5, 10, 15, 20];
      let arr: Int32Array = Int32Array.from(src);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayToReversedPart02Test040
     * @tc.desc Verify ArrayBuffer byteOffset toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 100);
      arr.$_set(1, 200);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(200);
      expect(r.$_get(1)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayToReversedPart02Test041
     * @tc.desc Verify ArrayBuffer toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.toReversed();
      let mirror: Int32Array = new Int32Array(buf);
      expect(mirror.$_get(0)).assertEqual(1);
      expect(mirror.$_get(1)).assertEqual(2);
      expect(mirror.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayToReversedPart02Test042
     * @tc.desc Verify ArrayBuffer toReversed() byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      arr.$_set(0, 7);
      arr.$_set(1, 8);
      let r: Int32Array = arr.toReversed();
      expect(r.byteOffset).assertEqual(0);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayToReversedPart02Test043
     * @tc.desc Verify INT_MIN toReversed() INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0]);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayToReversedPart02Test044
     * @tc.desc Verify INT_MAX toReversed() INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647]);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayToReversedPart02Test045
     * @tc.desc Verify toReversed() INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2147483648]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayToReversedPart02Test046
     * @tc.desc Verify -1 toReversed() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      arr.toReversed();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayToReversedPart02Test047
     * @tc.desc Verify toReversed() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r1: Int32Array = arr.toReversed();
      let r2: Int32Array = arr.toReversed();
      expect(r1.length).assertEqual(0);
      expect(r2.length).assertEqual(0);
      expect(r1).not().assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayToReversedPart02Test048
     * @tc.desc Verify toReversed() reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      r.reverse();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayToReversedPart02Test049
     * @tc.desc Verify toReversed() fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      r.fill(0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayToReversedPart02Test050
     * @tc.desc Verify toReversed() set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toReversed();
      let src: Int32Array = new Int32Array([99, 88, 77]);
      r.set(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayToReversedPart02Test051
     * @tc.desc Verify 7 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6, 7]);
      let r: Int32Array = arr.toReversed();
      expect(r.length).assertEqual(7);
      expect(r.byteLength).assertEqual(28);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(6)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayToReversedPart02Test052
     * @tc.desc Verify toReversed() []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(30);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayToReversedPart02Test053
     * @tc.desc Verify toReversed() copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      r.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
      expect(r.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayToReversedPart02Test054
     * @tc.desc Verify toReversed() reverse toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toReversed();
      r.reverse();
      let rr: Int32Array = r.toReversed();
      expect(rr.$_get(0)).assertEqual(4);
      expect(rr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayToReversedPart02Test055
     * @tc.desc Verify 0 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayToReversedPart02Test056
     * @tc.desc Verify 0 toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, 1);
      arr.$_set(1, 0);
      arr.$_set(2, 2);
      let r: Int32Array = arr.toReversed();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_REVERSED_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayToReversedPart02Test057
     * @tc.desc Verify for toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToReversedPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcVals: number[] = [10, 20, 30, 40, 50, 60];
      let arr: Int32Array = Int32Array.from(srcVals);
      let r: Int32Array = arr.toReversed();
      for (let i = 0; i < r.length; i++) {
        expect(r.$_get(i)).assertEqual(arr.$_get(arr.length - 1 - i));
      }
    });
  });
}
