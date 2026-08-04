'use static'

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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayConstructor07Test(): void {
  describe('Uint16ArrayConstructor07Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0100
     * @tc.name testUint16ArrayConstructorSeven001
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = new Uint16Array(0);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0200
     * @tc.name testUint16ArrayConstructorSeven002
     * @tc.desc Verify [0]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(0);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(1);
      expect(dst.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0300
     * @tc.name testUint16ArrayConstructorSeven003
     * @tc.desc Verify [65535]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(65535);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(1);
      expect(dst.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0400
     * @tc.name testUint16ArrayConstructorSeven004
     * @tc.desc Verify [32768]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(32768);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(1);
      expect(dst.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0500
     * @tc.name testUint16ArrayConstructorSeven005
     * @tc.desc Verify [0, 65535]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(0, 65535);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(2);
      expect(dst.at(0)).assertEqual(0);
      expect(dst.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0600
     * @tc.name testUint16ArrayConstructorSeven006
     * @tc.desc Verify [1, 2, 3]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(1, 2, 3);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(3);
      expect(dst.at(0)).assertEqual(1);
      expect(dst.at(1)).assertEqual(2);
      expect(dst.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0700
     * @tc.name testUint16ArrayConstructorSeven007
     * @tc.desc Verify [10, 20, 30, 40, 50]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(5);
      expect(dst.at(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0800
     * @tc.name testUint16ArrayConstructorSeven008
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(10);
      expect(dst.at(9)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_0900
     * @tc.name testUint16ArrayConstructorSeven009
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        arr.push(i);
      }
      let src: Uint16Array = Uint16Array.from(arr);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(100);
      expect(dst.at(50)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1000
     * @tc.name testUint16ArrayConstructorSeven010
     * @tc.desc Verify 0 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = new Uint16Array(5);
      let dst: Uint16Array = new Uint16Array(src);
      for (let i: int = 0; i < 5; i++) {
        expect(dst[i]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1100
     * @tc.name testUint16ArrayConstructorSeven011
     * @tc.desc Verify 65535 Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = new Uint16Array(4);
      for (let i: int = 0; i < 4; i++) {
        src[i] = 65535;
      }
      let dst: Uint16Array = new Uint16Array(src);
      for (let i: int = 0; i < 4; i++) {
        expect(dst[i]).assertEqual(65535);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1200
     * @tc.name testUint16ArrayConstructorSeven012
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(0, 65535, 32768, 1, 65535);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
      expect(dst.at(1)).assertEqual(65535);
      expect(dst.at(2)).assertEqual(32768);
      expect(dst.at(3)).assertEqual(1);
      expect(dst.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1300
     * @tc.name testUint16ArrayConstructorSeven013
     * @tc.desc Verify Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(0xFFFF, 0x8000, 0x00FF);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(65535);
      expect(dst.at(1)).assertEqual(32768);
      expect(dst.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1400
     * @tc.name testUint16ArrayConstructorSeven014
     * @tc.desc Verify [1]Uint16Array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(1);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1500
     * @tc.name testUint16ArrayConstructorSeven015
     * @tc.desc Verify constructing from Uint16Array copies the first element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(100, 200);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1600
     * @tc.name testUint16ArrayConstructorSeven016
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(10, 20);
      let dst: Uint16Array = new Uint16Array(src);
      dst[0] = 99;
      expect(src.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1700
     * @tc.name testUint16ArrayConstructorSeven017
     * @tc.desc Verify buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(10, 20, 30);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.buffer.byteLength).assertEqual(src.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1800
     * @tc.name testUint16ArrayConstructorSeven018
     * @tc.desc Verify modifying the source does not affect the copied Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(5, 10);
      let dst: Uint16Array = new Uint16Array(src);
      src[0] = 99;
      expect(dst.at(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_1900
     * @tc.name testUint16ArrayConstructorSeven019
     * @tc.desc Verify modifying the copy does not affect the source Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(5, 10);
      let dst: Uint16Array = new Uint16Array(src);
      dst[1] = 99;
      expect(src.at(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2000
     * @tc.name testUint16ArrayConstructorSeven020
     * @tc.desc Verify [0xFFFF]Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(0xFFFF);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2100
     * @tc.name testUint16ArrayConstructorSeven021
     * @tc.desc Verify Uint16Array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = new Uint16Array(50);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.byteLength).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2200
     * @tc.name testUint16ArrayConstructorSeven022
     * @tc.desc Verify Uint16Array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(7, 14, 21);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(14);
      expect(dst.$_get(2)).assertEqual(21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2300
     * @tc.name testUint16ArrayConstructorSeven023
     * @tc.desc Verify Uint16Array at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(100, 200, 300);
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(100);
      expect(dst.at(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2400
     * @tc.name testUint16ArrayConstructorSeven024
     * @tc.desc Verify [1.0, 2.0, 3.0]Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1.0, 2.0, 3.0];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(3);
      expect(dst.at(0)).assertEqual(1);
      expect(dst.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2500
     * @tc.name testUint16ArrayConstructorSeven025
     * @tc.desc Verify [3.14, 65535.9]Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [3.14, 65535.9];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(3);
      expect(dst.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2600
     * @tc.name testUint16ArrayConstructorSeven026
     * @tc.desc Verify Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0, 65535, 32768, 65536, -1];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
      expect(dst.at(1)).assertEqual(65535);
      expect(dst.at(2)).assertEqual(32768);
      expect(dst.at(3)).assertEqual(0);
      expect(dst.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2700
     * @tc.name testUint16ArrayConstructorSeven027
     * @tc.desc Verify 0xFFFF 0x8000 Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0xFFFF, 0x8000];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(65535);
      expect(dst.at(1)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2800
     * @tc.name testUint16ArrayConstructorSeven028
     * @tc.desc Verify 0.0, 0.5, 1.9 Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0.0, 0.5, 1.9];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
      expect(dst.at(1)).assertEqual(0);
      expect(dst.at(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_2900
     * @tc.name testUint16ArrayConstructorSeven029
     * @tc.desc Verify [-65536] Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [-65536];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3000
     * @tc.name testUint16ArrayConstructorSeven030
     * @tc.desc Verify [-32768] Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [-32768];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3100
     * @tc.name testUint16ArrayConstructorSeven031
     * @tc.desc Verify [65535.0] Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [65535.0];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3200
     * @tc.name testUint16ArrayConstructorSeven032
     * @tc.desc Verify [1e2] Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1e2];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3300
     * @tc.name testUint16ArrayConstructorSeven033
     * @tc.desc Verify [0, 0, 0, 0, 0] Array<Number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0, 0, 0, 0, 0];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(5);
      for (let i: int = 0; i < 5; i++) {
        expect(dst[i]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3400
     * @tc.name testUint16ArrayConstructorSeven034
     * @tc.desc Verify Array<Int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3500
     * @tc.name testUint16ArrayConstructorSeven035
     * @tc.desc Verify [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [1, 2, 3];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(3);
      expect(dst.at(0)).assertEqual(1);
      expect(dst.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3600
     * @tc.name testUint16ArrayConstructorSeven036
     * @tc.desc Verify 0xFFFF Array<Int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [0xFFFF];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3700
     * @tc.name testUint16ArrayConstructorSeven037
     * @tc.desc Verify 0x1FFFF Array<Int> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [0x1FFFF];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3800
     * @tc.name testUint16ArrayConstructorSeven038
     * @tc.desc Verify 0 65535 Array<Int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [0, 65535];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
      expect(dst.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_3900
     * @tc.name testUint16ArrayConstructorSeven039
     * @tc.desc Verify -65536 Array<Int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [-65536];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4000
     * @tc.name testUint16ArrayConstructorSeven040
     * @tc.desc Verify -32768 Array<Int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [-32768];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4100
     * @tc.name testUint16ArrayConstructorSeven041
     * @tc.desc Verify 0xFF Array<Int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [0xFF];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4200
     * @tc.name testUint16ArrayConstructorSeven042
     * @tc.desc Verify BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [0, 65535, 32768, 65536, -1];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(0);
      expect(dst.at(1)).assertEqual(65535);
      expect(dst.at(2)).assertEqual(32768);
      expect(dst.at(3)).assertEqual(0);
      expect(dst.at(4)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4300
     * @tc.name testUint16ArrayConstructorSeven043
     * @tc.desc Verify Number length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [10, 20, 30, 40];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4400
     * @tc.name testUint16ArrayConstructorSeven044
     * @tc.desc Verify Number byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [10, 20, 30];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4500
     * @tc.name testUint16ArrayConstructorSeven045
     * @tc.desc Verify constructing from Number elements preserves the first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1, 2, 3];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4600
     * @tc.name testUint16ArrayConstructorSeven046
     * @tc.desc Verify BigInt length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [1, 2];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4700
     * @tc.name testUint16ArrayConstructorSeven047
     * @tc.desc Verify BigInt byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Int> = [1, 2];
      let dst: Uint16Array = new Uint16Array(src);
      expect(dst.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4800
     * @tc.name testUint16ArrayConstructorSeven048
     * @tc.desc Verify 2 (buf, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0);
      expect(dst.length).assertEqual(4);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_4900
     * @tc.name testUint16ArrayConstructorSeven049
     * @tc.desc Verify 3 (buf, 0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5000
     * @tc.name testUint16ArrayConstructorSeven050
     * @tc.desc Verify 3 (buf, undefined, undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf);
      expect(dst.length).assertEqual(4);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5100
     * @tc.name testUint16ArrayConstructorSeven051
     * @tc.desc Verify 3 (buf, undefined, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(dst.length).assertEqual(2);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5200
     * @tc.name testUint16ArrayConstructorSeven052
     * @tc.desc Verify byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 2, 2);
      expect(dst.byteOffset).assertEqual(2);
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5300
     * @tc.name testUint16ArrayConstructorSeven053
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 4, 1);
      expect(dst.byteOffset).assertEqual(4);
      expect(dst.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5400
     * @tc.name testUint16ArrayConstructorSeven054
     * @tc.desc Verify byteOffset 0.0 Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0.0, 3);
      expect(dst.byteOffset).assertEqual(0);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5500
     * @tc.name testUint16ArrayConstructorSeven055
     * @tc.desc Verify byteOffset 2.0 Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 2.0, 2);
      expect(dst.byteOffset).assertEqual(2);
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5600
     * @tc.name testUint16ArrayConstructorSeven056
     * @tc.desc Verify byteOffset 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 6, 2);
      expect(dst.byteOffset).assertEqual(6);
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5700
     * @tc.name testUint16ArrayConstructorSeven057
     * @tc.desc Verify byteOffset 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5800
     * @tc.name testUint16ArrayConstructorSeven058
     * @tc.desc Verify byteOffset buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 10, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_5900
     * @tc.name testUint16ArrayConstructorSeven059
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 8, 0);
      expect(dst.length).assertEqual(0);
      expect(dst.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6000
     * @tc.name testUint16ArrayConstructorSeven060
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 0);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6100
     * @tc.name testUint16ArrayConstructorSeven061
     * @tc.desc Verify length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 1);
      expect(dst.length).assertEqual(1);
      expect(dst.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6200
     * @tc.name testUint16ArrayConstructorSeven062
     * @tc.desc Verify length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2);
      expect(dst.length).assertEqual(2);
      expect(dst.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6300
     * @tc.name testUint16ArrayConstructorSeven063
     * @tc.desc Verify length undefined buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 4);
      expect(dst.length).assertEqual(4);
      expect(dst.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6400
     * @tc.name testUint16ArrayConstructorSeven064
     * @tc.desc Verify length 0.0 Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 0.0);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6500
     * @tc.name testUint16ArrayConstructorSeven065
     * @tc.desc Verify length 2.0 Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 0, 2.0);
      expect(dst.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6600
     * @tc.name testUint16ArrayConstructorSeven066
     * @tc.desc Verify length buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 4, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6700
     * @tc.name testUint16ArrayConstructorSeven067
     * @tc.desc Verify length 65536 buffer RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let dst: Uint16Array = new Uint16Array(buf, 0, 65536);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6800
     * @tc.name testUint16ArrayConstructorSeven068
     * @tc.desc Verify length 1 byteOffset=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dst: Uint16Array = new Uint16Array(buf, 6, 1);
      expect(dst.length).assertEqual(1);
      expect(dst.byteOffset).assertEqual(6);
      expect(dst.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR_SEVEN_6900
     * @tc.name testUint16ArrayConstructorSeven069
     * @tc.desc Verify byteOffset=2, length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructorSeven069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dst: Uint16Array = new Uint16Array(buf, 2, 1);
      expect(dst.length).assertEqual(1);
      expect(dst.byteOffset).assertEqual(2);
    });

  });
}
