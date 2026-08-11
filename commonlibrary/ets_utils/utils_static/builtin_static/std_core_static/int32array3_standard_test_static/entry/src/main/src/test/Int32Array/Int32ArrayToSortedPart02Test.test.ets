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

export default function int32ArrayToSortedPart02Test(): void {
  describe('int32ArrayToSortedPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayToSortedPart02Test001
     * @tc.desc Verify toSorted() returns values 1, 2, 3; Also verify verify toSorted() returns sorted values 1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(3);
      expect(r.toString()).assertEqual('1,2,3');

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.toString()).assertEqual('1,2,3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayToSortedPart02Test002
     * @tc.desc Verify toSorted() returns sorted values in a new Int32Array without changing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 4]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(4);
      expect(r.$_get(1)).assertEqual(5);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(4);
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayToSortedPart02Test003
     * @tc.desc Verify toSorted() Array; Also verify verify toSorted() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toSorted();
      expect(r.toString()).assertEqual('1,2,3');

      {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: Int32Array = arr.toSorted();
      expect(r).not().assertEqual(arr);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayToSortedPart02Test004
     * @tc.desc Verify toSorted() preserves a single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayToSortedPart02Test005
     * @tc.desc Verify toSorted() , (!==); Also verify verify 3 toSorted() length 3; Also verify verify 3 toSorted() byteLength 12 3*4; Also verify verify toSorted() byteOffset 0 ArrayBuffer 0; Also verify verify toSorted() buffer buffer; Also verify verify toSorted() buffer.byteLength byteLength; Also verify verify toSorted() ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r).not().assertEqual(arr);

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(3);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.byteLength).assertEqual(12);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.byteOffset).assertEqual(0);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.buffer).not().assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.buffer.byteLength).assertEqual(r.byteLength);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(r.buffer.byteLength / r.BYTES_PER_ELEMENT);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayToSortedPart02Test006
     * @tc.desc Verify toSorted(); Also verify verify toSorted() toSorted(); Also verify verify toSorted() buffer ( ); Also verify verify toSorted() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r1: Int32Array = arr.toSorted();
      let r2: Int32Array = arr.toSorted();
      expect(r1).not().assertEqual(r2);

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r1: Int32Array = arr.toSorted();
      let r2: Int32Array = r1.toSorted();
      expect(r2.$_get(0)).assertEqual(1);
      expect(r2.$_get(1)).assertEqual(2);
      expect(r2.$_get(2)).assertEqual(3);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r1: Int32Array = arr.toSorted();
      let r2: Int32Array = r1.toSorted();
      expect(r2.buffer).not().assertEqual(r1.buffer);
      expect(r2.buffer).not().assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r1: Int32Array = arr.toSorted();
      let r2: Int32Array = arr.toSorted();
      expect(r1.buffer).not().assertEqual(r2.buffer);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayToSortedPart02Test007
     * @tc.desc Verify toSorted() ,; Also verify verify toSorted() byteLength 0; Also verify verify toSorted() buffer ( ); Also verify verify toSorted() toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toSorted();
      expect(r).not().assertEqual(arr);

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toSorted();
      expect(r.byteLength).assertEqual(0);
      }

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toSorted();
      expect(r.buffer).not().assertEqual(arr.buffer);
      }

      {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toSorted();
      expect(r.toString()).assertEqual('');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayToSortedPart02Test008
     * @tc.desc Verify toSorted() length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayToSortedPart02Test009
     * @tc.desc Verify 5 toSorted() length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 0, 2, -1, 4]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayToSortedPart02Test010
     * @tc.desc Verify toSorted() byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99]);
      let r: Int32Array = arr.toSorted();
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayToSortedPart02Test011
     * @tc.desc Verify toSorted() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3, 8, 1, 9, 2, 7, 4, 6]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayToSortedPart02Test012
     * @tc.desc Verify 0 toSorted() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayToSortedPart02Test013
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      r.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayToSortedPart02Test014
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      arr.$_set(0, 888);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayToSortedPart02Test015
     * @tc.desc Verify subarray toSorted() buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, 5);
      arr.$_set(1, 1);
      let r: Int32Array = arr.toSorted();
      expect(r.buffer).not().assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayToSortedPart02Test016
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.toSorted();
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayToSortedPart02Test017
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
      arr.toSorted();
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayToSortedPart02Test018
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 3, -2, 0]);
      arr.toSorted();
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayToSortedPart02Test019
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.toSorted();
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayToSortedPart02Test020
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      arr.toSorted();
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayToSortedPart02Test021
     * @tc.desc Verify INT32_MAX INT32_MIN toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0]);
      arr.toSorted();
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayToSortedPart02Test022
     * @tc.desc Verify length toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2, 4]);
      arr.toSorted();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayToSortedPart02Test023
     * @tc.desc Verify byteLength toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let before: number = arr.byteLength;
      arr.toSorted();
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayToSortedPart02Test024
     * @tc.desc Verify 5 toSorted() [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 4, 3, 2, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayToSortedPart02Test025
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayToSortedPart02Test026
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayToSortedPart02Test027
     * @tc.desc Verify toSorted() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, -1, 2, -5, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-5);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(2);
      expect(r.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayToSortedPart02Test028
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayToSortedPart02Test029
     * @tc.desc Verify [5,5] toSorted() [5,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayToSortedPart02Test030
     * @tc.desc Verify INT32_MAX INT32_MIN toSorted() ,MIN MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayToSortedPart02Test031
     * @tc.desc Verify -1 0 toSorted() [-1,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayToSortedPart02Test032
     * @tc.desc Verify 1 -1 toSorted() [-1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayToSortedPart02Test033
     * @tc.desc Verify Number.NaN ToInt32 0 toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 0, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayToSortedPart02Test034
     * @tc.desc Verify [-2,-1,0,1,2] toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, -2, 0, 1, -1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-2);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(1);
      expect(r.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayToSortedPart02Test035
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 50, 0, -50, -100]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-100);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayToSortedPart02Test036
     * @tc.desc Verify toSorted() forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      let collect: number[] = [];
      r.forEach((v: number) => {
        collect.push(v);
      });
      expect(collect[0]).assertEqual(1);
      expect(collect[1]).assertEqual(2);
      expect(collect[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayToSortedPart02Test037
     * @tc.desc Verify toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 4, 7, 2, 6]);
      let r: Int32Array = arr.toSorted();
      let min0: number = r.$_get(0);
      arr.forEach((v: number) => {
        expect(min0 <= v).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayToSortedPart02Test038
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 4, 7, 2, 6]);
      let r: Int32Array = arr.toSorted();
      let last: number = r.$_get(r.length - 1);
      arr.forEach((v: number) => {
        expect(last >= v).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayToSortedPart02Test039
     * @tc.desc Verify toSorted() ( <= )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 2, 8, 1, 9, 3]);
      let r: Int32Array = arr.toSorted();
      for (let i: int = 0; i < r.length - 1; i++) {
        expect(r.$_get(i) <= r.$_get(i + 1)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayToSortedPart02Test040
     * @tc.desc Verify toSorted() forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: Int32Array = arr.toSorted();
      let count: number = 0;
      r.forEach((_v: number) => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayToSortedPart02Test041
     * @tc.desc Verify toSorted() forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.toSorted();
      let count: number = 0;
      let seen: number = 0;
      r.forEach((v: number) => {
        count++;
        seen = v;
      });
      expect(count).assertEqual(1);
      expect(seen).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayToSortedPart02Test042
     * @tc.desc Verify toSorted() toSorted() length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r2: Int32Array = arr.toSorted().toSorted();
      expect(r2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayToSortedPart02Test043
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 5, 0, -7, 2]);
      let r1: Int32Array = arr.toSorted();
      let r2: Int32Array = arr.toSorted();
      for (let i: int = 0; i < r1.length; i++) {
        expect(r1.$_get(i)).assertEqual(r2.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayToSortedPart02Test044
     * @tc.desc Verify ArrayBuffer toSorted() byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      let r: Int32Array = arr.toSorted();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayToSortedPart02Test045
     * @tc.desc Verify ArrayBuffer toSorted() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let r: Int32Array = arr.toSorted();
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayToSortedPart02Test046
     * @tc.desc Verify ArrayBuffer toSorted() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      arr.toSorted();
      let origView: Int32Array = new Int32Array(buf, 4, 3);
      expect(origView.$_get(0)).assertEqual(3);
      expect(origView.$_get(1)).assertEqual(1);
      expect(origView.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayToSortedPart02Test047
     * @tc.desc Verify of() toSorted() buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 2, 8);
      let r: Int32Array = arr.toSorted();
      expect(r.buffer).not().assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayToSortedPart02Test048
     * @tc.desc Verify from( ) toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.from([7, 1, 4]);
      let r: Int32Array = src.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(4);
      expect(r.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayToSortedPart02Test049
     * @tc.desc Verify toString() toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.toSorted();
      expect(arr.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayToSortedPart02Test050
     * @tc.desc Verify toSorted() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2, 2, 1]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(2);
      expect(r.$_get(3)).assertEqual(2);
      expect(r.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayToSortedPart02Test051
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, 0, 0, 1, 1]);
      let r: Int32Array = arr.toSorted();
      for (let i: int = 0; i < r.length; i++) {
        if (i < 2) {
          expect(r.$_get(i)).assertEqual(-1);
        } else if (i < 4) {
          expect(r.$_get(i)).assertEqual(0);
        } else {
          expect(r.$_get(i)).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayToSortedPart02Test052
     * @tc.desc Verify 0 -0( 0) toSorted() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayToSortedPart02Test053
     * @tc.desc Verify toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 7, 99, -3, 0, 55, -88, 13]);
      let r: Int32Array = arr.toSorted();
      expect(r.$_get(0)).assertEqual(-88);
      expect(r.$_get(r.length - 1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayToSortedPart02Test054
     * @tc.desc Verify toSorted() ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: Int32Array = arr.toSorted();
      for (let i: int = 0; i < r.length; i++) {
        r.$_set(i, 1000 + i);
      }
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_SORTED_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayToSortedPart02Test055
     * @tc.desc Verify toSorted() buffer ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToSortedPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r: Int32Array = arr.toSorted();
      r.$_set(0, 77);
      expect(arr.$_get(0)).assertEqual(42);
      expect(r.$_get(0)).assertEqual(77);
    });
  });
}
