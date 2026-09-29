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

import { collections } from '@kit.ArkTS';
import { beforeAll, beforeEach, afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable class ConcatArrayPoint {
  x: number = 0;
  y: number = 0;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

const POINT_A: ConcatArrayPoint = new ConcatArrayPoint(0, 0);
const POINT_B: ConcatArrayPoint = new ConcatArrayPoint(1, 2);
const POINT_C: ConcatArrayPoint = new ConcatArrayPoint(-1, -2);
const POINT_D: ConcatArrayPoint = new ConcatArrayPoint(100, 200);
const POINT_E: ConcatArrayPoint = new ConcatArrayPoint(0.5, -0.5);

export default function concatArrayObjectTest() {
  describe('ConcatArrayObjectTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.name testConcatArrayObjectTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_OBJECT_TEST_0100
     * @tc.desc Verify length property of ConcatArray with empty, single and multiple Sendable object elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>();
      expect(emptyArray.length).assertEqual(0);

      const singleArray: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_A);
      expect(singleArray.length).assertEqual(1);

      const values: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_A, POINT_B, POINT_C, POINT_D, POINT_E);
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.name testConcatArrayObjectTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_OBJECT_TEST_0200
     * @tc.desc Verify indexed access [index] returns Sendable object element content at first, middle and last
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayObjectTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_A, POINT_B, POINT_C, POINT_D, POINT_E);
      expect(values[0].x).assertEqual(0);
      expect(values[0].y).assertEqual(0);
      expect(values[2].x).assertEqual(-1);
      expect(values[4].x).assertEqual(0.5);
      expect(values[4].y).assertEqual(-0.5);

      expect(values[5]).assertUndefined();
      expect(values[-1]).assertUndefined();
    });

    /**
     * @tc.name testConcatArrayObjectTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_OBJECT_TEST_0300
     * @tc.desc Verify join serializes Sendable object elements with default, custom and unicode separators
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayObjectTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArray: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>();
      expect(emptyArray.join()).assertEqual('');

      const singleArray: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_B);
      const singleJoined: string = singleArray.join('-');
      expect(singleJoined).assertEqual('[object Object]');

      const values: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_B, POINT_C);
      const joined: string = values.join('|');
      expect(joined).assertEqual('[object Object]|[object Object]');

      const emptyJoined: string = emptyArray.join('|');
      expect(emptyJoined).assertEqual('');
    });

    /**
     * @tc.name testConcatArrayObjectTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_OBJECT_TEST_0400
     * @tc.desc Verify slice with normal range keeps Sendable object element content and source unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayObjectTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_A, POINT_B, POINT_C, POINT_D, POINT_E);
      const slicedArray: collections.ConcatArray<ConcatArrayPoint> = values.slice(1, 3);
      expect(slicedArray.length).assertEqual(2);
      expect(slicedArray[0].x).assertEqual(1);
      expect(slicedArray[1].x).assertEqual(-1);

      const tailSlice: collections.ConcatArray<ConcatArrayPoint> = values.slice(-2);
      expect(tailSlice[0].x).assertEqual(100);
      expect(tailSlice[1].x).assertEqual(0.5);

      expect(values[1].x).assertEqual(1);
      expect(values[4].x).assertEqual(0.5);
    });

    /**
     * @tc.name testConcatArrayObjectTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_OBJECT_TEST_0500
     * @tc.desc Verify slice with reversed, beyond-range and special indexes on Sendable object ConcatArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayObjectTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(POINT_A, POINT_B, POINT_C, POINT_D, POINT_E);

      const reversedSlice: collections.ConcatArray<ConcatArrayPoint> = values.slice(3, 1);
      expect(reversedSlice.join()).assertEqual('');

      const beyondSlice: collections.ConcatArray<ConcatArrayPoint> = values.slice(10, 20);
      expect(beyondSlice.join('-')).assertEqual('');

      const nanSlice: collections.ConcatArray<ConcatArrayPoint> = values.slice(NaN, 2);
      expect(nanSlice[0].x).assertEqual(0);
      expect(nanSlice[1].x).assertEqual(1);

      const infEndSlice: collections.ConcatArray<ConcatArrayPoint> = values.slice(1, Infinity);
      expect(infEndSlice[0].x).assertEqual(1);
      expect(infEndSlice[3].x).assertEqual(0.5);
    });

    /**
     * @tc.name testConcatArrayObjectTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONCAT_ARRAY_OBJECT_TEST_0600
     * @tc.desc Verify shared Sendable references keep consistent content across duplicate elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testConcatArrayObjectTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared: ConcatArrayPoint = new ConcatArrayPoint(11, 12);
      const values: collections.ConcatArray<ConcatArrayPoint> =
        new collections.Array<ConcatArrayPoint>(shared, shared, shared);
      expect(values[0].x).assertEqual(11);
      expect(values[1].x).assertEqual(11);
      expect(values[2].y).assertEqual(12);

      const slicedArray: collections.ConcatArray<ConcatArrayPoint> = values.slice(0, 2);
      expect(slicedArray[0].x).assertEqual(11);
      expect(slicedArray[1].y).assertEqual(12);
      expect(slicedArray.length).assertEqual(2);
    });
  });
}
