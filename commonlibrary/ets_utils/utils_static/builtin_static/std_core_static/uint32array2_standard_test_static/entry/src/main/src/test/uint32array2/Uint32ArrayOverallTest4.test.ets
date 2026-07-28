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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayOverallFourTest(): void {
  describe('Uint32ArrayOverallFourTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0100
     * @tc.name testUint32ArrayOverallFour001
     * @tc.desc Verify $_set 0x100000000(4294967296) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 4294967296);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0200
     * @tc.name testUint32ArrayOverallFour002
     * @tc.desc Verify $_set -1 4294967295( 2^32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -1);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0300
     * @tc.name testUint32ArrayOverallFour003
     * @tc.desc Verify $_set NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, Number.NaN);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0400
     * @tc.name testUint32ArrayOverallFour004
     * @tc.desc Verify $_set 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 3.14);
      expect(values.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0500
     * @tc.name testUint32ArrayOverallFour005
     * @tc.desc Verify $_set -3.14 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -3.14);
      expect(values.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0600
     * @tc.name testUint32ArrayOverallFour006
     * @tc.desc Verify $_set int32.MIN -2147483648 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -2147483648);
      expect(values.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0700
     * @tc.name testUint32ArrayOverallFour007
     * @tc.desc Verify $_set -2147483649(int32.MIN-1) 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -2147483649);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0800
     * @tc.name testUint32ArrayOverallFour008
     * @tc.desc Verify $_set 0o37777777777 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 0o37777777777);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_0900
     * @tc.name testUint32ArrayOverallFour009
     * @tc.desc Verify $_set 0.999 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 0.999);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1000
     * @tc.name testUint32ArrayOverallFour010
     * @tc.desc Verify $_set -0.5 0( 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, -0.5);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1100
     * @tc.name testUint32ArrayOverallFour011
     * @tc.desc Verify $_set 1e15 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.$_set(0, 1e15);
      expect(values.$_get(0)).assertEqual(2764472320);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1200
     * @tc.name testUint32ArrayOverallFour012
     * @tc.desc Verify set(int,number) -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      values.set(0, -1);
      expect(values.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1300
     * @tc.name testUint32ArrayOverallFour013
     * @tc.desc Verify set(int,number) 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const v: number = 255;
      values.set(0, v);
      expect(values.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1400
     * @tc.name testUint32ArrayOverallFour014
     * @tc.desc Verify fill -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.fill(-1);
      expect(values.$_get(0)).assertEqual(4294967295);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1500
     * @tc.name testUint32ArrayOverallFour015
     * @tc.desc Verify fill 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.fill(4294967296);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1600
     * @tc.name testUint32ArrayOverallFour016
     * @tc.desc Verify fill NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      values.fill(Number.NaN);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1700
     * @tc.name testUint32ArrayOverallFour017
     * @tc.desc Verify with 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const replaced = values.with(0, 4294967296);
      expect(replaced.$_get(0)).assertEqual(0);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1800
     * @tc.name testUint32ArrayOverallFour018
     * @tc.desc Verify with -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      const replaced = values.with(1, -1);
      expect(replaced.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_1900
     * @tc.name testUint32ArrayOverallFour019
     * @tc.desc Verify set(FixedArray) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const source: FixedArray<number> = [-1.0, 4294967296.0];
      values.set(source);
      expect(values.$_get(0)).assertEqual(4294967295);
      expect(values.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2000
     * @tc.name testUint32ArrayOverallFour020
     * @tc.desc Verify set(Uint32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint32Array(2);
      const src = Uint32Array.of(-1, -2);
      dst.set(src);
      expect(dst.$_get(0)).assertEqual(4294967295);
      expect(dst.$_get(1)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2100
     * @tc.name testUint32ArrayOverallFour021
     * @tc.desc Verify from mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<number> = [1.0, 2.0];
      const values = Uint32Array.from<number>(source, (v, k) => -1);
      expect(values.$_get(0)).assertEqual(4294967295);
      expect(values.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2200
     * @tc.name testUint32ArrayOverallFour022
     * @tc.desc Verify copyWithin uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 4294967295);
      values.copyWithin(0, 2, 3);
      expect(values.$_get(0)).assertEqual(4294967295);
      expect(values.$_get(1)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2300
     * @tc.name testUint32ArrayOverallFour023
     * @tc.desc Verify subarray shares buffer: source $_set visible in view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const view = values.subarray(0, 2);
      values.$_set(0, 100);
      expect(view.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2400
     * @tc.name testUint32ArrayOverallFour024
     * @tc.desc Verify subarray shares buffer: view $_set visible in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const view = values.subarray(1, 3);
      view.$_set(0, 200);
      expect(values.$_get(1)).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2500
     * @tc.name testUint32ArrayOverallFour025
     * @tc.desc Verify ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Uint32Array(buf, 0, 2);
      view.$_set(0, 42);
      expect(view.buffer === buf).assertTrue();
      expect(view.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2600
     * @tc.name testUint32ArrayOverallFour026
     * @tc.desc Verify buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Uint32Array(buf, 4, 2);
      expect(view.buffer === buf).assertTrue();
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2700
     * @tc.name testUint32ArrayOverallFour027
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const v1 = values.subarray(0, 2);
      const v2 = values.subarray(2, 4);
      v1.$_set(0, 10);
      v2.$_set(0, 20);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2800
     * @tc.name testUint32ArrayOverallFour028
     * @tc.desc Verify subarray 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const v1 = values.subarray(0, 3);
      const v2 = values.subarray(1, 4);
      v1.$_set(1, 99);
      expect(v2.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_2900
     * @tc.name testUint32ArrayOverallFour029
     * @tc.desc Verify subarray(0,0) length 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const empty = values.subarray(0, 0);
      expect(empty.length).assertEqual(0);
      expect(empty.buffer === values.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3000
     * @tc.name testUint32ArrayOverallFour030
     * @tc.desc Verify subarray subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const inner = values.subarray(1, 4).subarray(0, 2);
      inner.$_set(0, 77);
      expect(values.$_get(1)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3100
     * @tc.name testUint32ArrayOverallFour031
     * @tc.desc Verify fill ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(1, 3);
      view.fill(9);
      expect(values.$_get(1)).assertEqual(9);
      expect(values.$_get(2)).assertEqual(9);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3200
     * @tc.name testUint32ArrayOverallFour032
     * @tc.desc Verify copyWithin ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const view = values.subarray(1, 5);
      view.copyWithin(0, 2, 4);
      expect(values.$_get(1)).assertEqual(4);
      expect(values.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3300
     * @tc.name testUint32ArrayOverallFour033
     * @tc.desc Verify reverse ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(0, 3);
      view.reverse();
      expect(values.$_get(0)).assertEqual(3);
      expect(values.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3400
     * @tc.name testUint32ArrayOverallFour034
     * @tc.desc Verify sort ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2, 4);
      const view = values.subarray(0, 3);
      view.sort();
      expect(values.join(',')).assertEqual('1,2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3500
     * @tc.name testUint32ArrayOverallFour035
     * @tc.desc Verify set(Uint32Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(2, 4);
      view.set(Uint32Array.of(8, 9));
      expect(values.$_get(2)).assertEqual(8);
      expect(values.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3600
     * @tc.name testUint32ArrayOverallFour036
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(0, 3);
      const rev = view.toReversed();
      expect(rev.join(',')).assertEqual('3,2,1');
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3700
     * @tc.name testUint32ArrayOverallFour037
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(0, 3);
      const mapped = view.map((v, i, a) => v + 10);
      expect(mapped.$_get(0)).assertEqual(11);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3800
     * @tc.name testUint32ArrayOverallFour038
     * @tc.desc Verify filter buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const filtered = values.filter((v, i, a) => v > 2);
      filtered.$_set(0, 100);
      expect(values.$_get(2)).assertEqual(3);
      expect(filtered.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_3900
     * @tc.name testUint32ArrayOverallFour039
     * @tc.desc Verify ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Uint32Array(buf, 0, 2);
      const v2 = new Uint32Array(buf, 8, 2);
      v1.$_set(0, 11);
      v2.$_set(0, 22);
      expect(v1.$_get(0)).assertEqual(11);
      expect(v2.$_get(0)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4000
     * @tc.name testUint32ArrayOverallFour040
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(-2);
      view.$_set(0, 88);
      expect(values.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4100
     * @tc.name testUint32ArrayOverallFour041
     * @tc.desc Verify from(Uint32Array) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const copy = Uint32Array.from(src);
      copy.$_set(0, 100);
      expect(src.$_get(0)).assertEqual(1);
      expect(copy.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4200
     * @tc.name testUint32ArrayOverallFour042
     * @tc.desc Verify valueOf this buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const same = values.valueOf();
      same.$_set(0, 44);
      expect(values.$_get(0)).assertEqual(44);
      expect(same === values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4300
     * @tc.name testUint32ArrayOverallFour043
     * @tc.desc Verify byteLength length*4 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const view = values.subarray(1, 3);
      expect(view.byteLength).assertEqual(8);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4400
     * @tc.name testUint32ArrayOverallFour044
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const a = values.subarray(1, 5);
      const b = a.subarray(1, 4);
      const c = b.subarray(0, 2);
      c.$_set(0, 333);
      expect(values.$_get(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4500
     * @tc.name testUint32ArrayOverallFour045
     * @tc.desc Verify set(Uint32Array,offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0, 0);
      const view = values.subarray(1, 4);
      view.set(Uint32Array.of(7, 8), 0);
      expect(values.$_get(1)).assertEqual(7);
      expect(values.$_get(2)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4600
     * @tc.name testUint32ArrayOverallFour046
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const v1 = new Uint32Array(buf, 0, 2);
      v1.$_set(0, 0x11223344);
      const v2 = new Uint32Array(buf, 0, 2);
      expect(v2.$_get(0)).assertEqual(0x11223344);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4700
     * @tc.name testUint32ArrayOverallFour047
     * @tc.desc Verify $_set $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.$_set(1, 42);
      expect(values.$_get(1)).assertEqual(42);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4800
     * @tc.name testUint32ArrayOverallFour048
     * @tc.desc Verify set(int,number) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.set(0, 7);
      values.set(1, 8);
      expect(values.join(',')).assertEqual('7,8,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_4900
     * @tc.name testUint32ArrayOverallFour049
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      values.fill(5);
      expect(values.join(',')).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5000
     * @tc.name testUint32ArrayOverallFour050
     * @tc.desc Verify copyWithin ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0, 2, 4);
      expect(values.join(',')).assertEqual('3,4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5100
     * @tc.name testUint32ArrayOverallFour051
     * @tc.desc Verify reverse ( this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const ret = values.reverse();
      expect(values.join(',')).assertEqual('3,2,1');
      expect(ret === values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5200
     * @tc.name testUint32ArrayOverallFour052
     * @tc.desc Verify sort ( this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const ret = values.sort();
      expect(values.join(',')).assertEqual('1,2,3');
      expect(ret === values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5300
     * @tc.name testUint32ArrayOverallFour053
     * @tc.desc Verify toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const rev = values.toReversed();
      expect(rev.join(',')).assertEqual('3,2,1');
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5400
     * @tc.name testUint32ArrayOverallFour054
     * @tc.desc Verify toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const sorted = values.toSorted();
      expect(sorted.join(',')).assertEqual('1,2,3');
      expect(values.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5500
     * @tc.name testUint32ArrayOverallFour055
     * @tc.desc Verify with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const replaced = values.with(1, 9);
      expect(replaced.join(',')).assertEqual('1,9,3');
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5600
     * @tc.name testUint32ArrayOverallFour056
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const mapped = values.map((v, i, a) => v * 2);
      expect(mapped.join(',')).assertEqual('2,4,6');
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5700
     * @tc.name testUint32ArrayOverallFour057
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const filtered = values.filter((v, i, a) => v % 2 === 0);
      expect(filtered.join(',')).assertEqual('2,4');
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5800
     * @tc.name testUint32ArrayOverallFour058
     * @tc.desc Verify slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const sliced = values.slice(1, 3);
      expect(sliced.join(',')).assertEqual('2,3');
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_5900
     * @tc.name testUint32ArrayOverallFour059
     * @tc.desc Verify set(FixedArray)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const source: FixedArray<number> = [10.0, 20.0, 30.0];
      values.set(source);
      expect(values.join(',')).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6000
     * @tc.name testUint32ArrayOverallFour060
     * @tc.desc Verify set(FixedArray,insertPos)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const source: FixedArray<number> = [7.0, 8.0];
      values.set(source, 1);
      expect(values.join(',')).assertEqual('0,7,8,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6100
     * @tc.name testUint32ArrayOverallFour061
     * @tc.desc Verify toReversed().toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const back = values.toReversed().toReversed();
      expect(back.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6200
     * @tc.name testUint32ArrayOverallFour062
     * @tc.desc Verify sort().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort().reverse();
      expect(values.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6300
     * @tc.name testUint32ArrayOverallFour063
     * @tc.desc Verify map(fn).filter(fn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const result = values.map((v, i, a) => v + 1).filter((v, i, a) => v > 2);
      expect(result.join(',')).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6400
     * @tc.name testUint32ArrayOverallFour064
     * @tc.desc Verify reverse().reverse()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.reverse().reverse();
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6500
     * @tc.name testUint32ArrayOverallFour065
     * @tc.desc Verify fill().fill() this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const ret = values.fill(1, 0, 2).fill(2, 2, 3);
      expect(values.join(',')).assertEqual('1,1,2');
      expect(ret === values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6600
     * @tc.name testUint32ArrayOverallFour066
     * @tc.desc Verify copyWithin().copyWithin()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      values.copyWithin(0, 3, 5).copyWithin(3, 0, 2);
      expect(values.join(',')).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6700
     * @tc.name testUint32ArrayOverallFour067
     * @tc.desc Verify toSorted().toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      const result = values.toSorted().toReversed();
      expect(result.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6800
     * @tc.name testUint32ArrayOverallFour068
     * @tc.desc Verify with().with()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.with(0, 9).with(2, 7);
      expect(result.join(',')).assertEqual('9,2,7');
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_6900
     * @tc.name testUint32ArrayOverallFour069
     * @tc.desc Verify map().map()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.map((v, i, a) => v + 1).map((v, i, a) => v * 10);
      expect(result.join(',')).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7000
     * @tc.name testUint32ArrayOverallFour070
     * @tc.desc Verify filter().filter()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const result = values.filter((v, i, a) => v > 1).filter((v, i, a) => v < 5);
      expect(result.join(',')).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7100
     * @tc.name testUint32ArrayOverallFour071
     * @tc.desc Verify reverse().toReversed()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const result = values.reverse().toReversed();
      expect(values.join(',')).assertEqual('3,2,1');
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7200
     * @tc.name testUint32ArrayOverallFour072
     * @tc.desc Verify slice().slice()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      const sliced = values.slice(0, 4).slice(1, 3);
      expect(sliced.join(',')).assertEqual('2,3');
      expect(values.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7300
     * @tc.name testUint32ArrayOverallFour073
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let sum: number = 0;
      values.forEach((v, i, a) => { sum = sum + v; });
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7400
     * @tc.name testUint32ArrayOverallFour074
     * @tc.desc Verify reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let count: number = 0;
      const total = values.reduce<number>((acc, v, i, a) => { count = count + 1; return acc + v; }, 0.0);
      expect(total).assertEqual(6);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7500
     * @tc.name testUint32ArrayOverallFour075
     * @tc.desc Verify map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let base: number = 100;
      const mapped = values.map((v, i, a) => v + base);
      expect(mapped.$_get(0)).assertEqual(101);
      expect(mapped.$_get(2)).assertEqual(103);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7600
     * @tc.name testUint32ArrayOverallFour076
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4, 5);
      let threshold: number = 3;
      const filtered = values.filter((v, i, a) => v > threshold);
      expect(filtered.join(',')).assertEqual('4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7700
     * @tc.name testUint32ArrayOverallFour077
     * @tc.desc Verify some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let found: boolean = false;
      const r = values.some((v, i, a) => { if (v === 2) { found = true; return true; } return false; });
      expect(r).assertTrue();
      expect(found).assertTrue();
      const r2 = values.some((v, i, a) => v > 100);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7800
     * @tc.name testUint32ArrayOverallFour078
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2, 4, 6);
      let visited: number = 0;
      const all = values.every((v, i, a) => { visited = visited + 1; return v % 2 === 0; });
      expect(all).assertTrue();
      expect(visited).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_7900
     * @tc.name testUint32ArrayOverallFour079
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      let visited: Array<number> = new Array<number>();
      const result = values.find((v, i, a) => { visited.push(i); return v === 3; });
      expect(result).assertEqual(3);
      expect(visited.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8000
     * @tc.name testUint32ArrayOverallFour080
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let calls: number = 0;
      const idx = values.findIndex((v, i, a) => { calls = calls + 1; return v === 3; });
      expect(idx).assertEqual(2);
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8100
     * @tc.name testUint32ArrayOverallFour081
     * @tc.desc Verify sort compareFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort((a: number, b: number): int => Double.toInt(b - a));
      expect(values.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8200
     * @tc.name testUint32ArrayOverallFour082
     * @tc.desc Verify forEach $_set ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let last: number = 0;
      let mid: number = 0;
      values.forEach((v, i, a) => { if (i === 0) { a.$_set(1, 99); } if (i === 1) { mid = v; } last = v; });
      expect(mid).assertEqual(99);
      expect(last).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8300
     * @tc.name testUint32ArrayOverallFour083
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let order: Array<number> = new Array<number>();
      values.forEach((v, i, a) => { order.push(i); });
      expect(order[0]).assertEqual(0);
      expect(order[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8400
     * @tc.name testUint32ArrayOverallFour084
     * @tc.desc Verify reverse indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.reverse();
      expect(values.indexOf(1)).assertEqual(2);
      expect(values.indexOf(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8500
     * @tc.name testUint32ArrayOverallFour085
     * @tc.desc Verify sort indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(3, 1, 2);
      values.sort();
      expect(values.indexOf(1)).assertEqual(0);
      expect(values.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8600
     * @tc.name testUint32ArrayOverallFour086
     * @tc.desc Verify copyWithin includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0, 2, 4);
      expect(values.includes(3)).assertTrue();
      expect(values.indexOf(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8700
     * @tc.name testUint32ArrayOverallFour087
     * @tc.desc Verify $_set out-of-bound throws RangeError and does not mutate length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      try {
        values.$_set(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8800
     * @tc.name testUint32ArrayOverallFour088
     * @tc.desc Verify fill ( no-op)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.fill(9, 5, 10);
      expect(values.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_8900
     * @tc.name testUint32ArrayOverallFour089
     * @tc.desc Verify copyWithin start end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      values.copyWithin(0, 3, 1);
      expect(values.join(',')).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_9000
     * @tc.name testUint32ArrayOverallFour090
     * @tc.desc Verify entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      let flat: Array<number> = new Array<number>();
      for (const entry of values.entries()) {
        flat.push(entry[0]);
        flat.push(entry[1]);
      }
      expect(flat.join(',')).assertEqual('0,10,1,20,2,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_9100
     * @tc.name testUint32ArrayOverallFour091
     * @tc.desc Verify values $_iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6, 7);
      let vals: Array<number> = new Array<number>();
      for (const v of values.values()) { vals.push(v); }
      expect(vals.join(',')).assertEqual('5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_9200
     * @tc.name testUint32ArrayOverallFour092
     * @tc.desc Verify keys length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(9, 8, 7);
      let keys: Array<number> = new Array<number>();
      for (const k of values.keys()) { keys.push(k); }
      expect(keys.join(',')).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_OVERALL_FOUR_9300
     * @tc.name testUint32ArrayOverallFour093
     * @tc.desc Verify indexOf negative fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayOverallFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 2, 1);
      expect(values.indexOf(2, -2)).assertEqual(3);
    });
  });
}
