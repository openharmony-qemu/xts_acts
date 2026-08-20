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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayReverseTest01(): void {
  describe('Int16ArrayReverseTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0100
     * @tc.name testInt16ArrayReverseTestOne001
     * @tc.desc Verify reverse() returns the same empty Int16Array with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let result: Int16Array = arr.reverse();
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0200
     * @tc.name testInt16ArrayReverseTestOne002
     * @tc.desc Verify reverse() on new Int16Array([42]) yields [0]=42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let result: Int16Array = arr.reverse();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 42;
      expect(elementAt0).assertEqual(expectedElement0);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0300
     * @tc.name testInt16ArrayReverseTestOne003
     * @tc.desc Verify reverse() on Int16Array.of(32767) yields [0]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32767;
      let arr: Int16Array = Int16Array.of(val);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0400
     * @tc.name testInt16ArrayReverseTestOne004
     * @tc.desc Verify reverse() on Int16Array.of(100, -200) yields [0]=-200 [1]=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, -200);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -200;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 100;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0500
     * @tc.name testInt16ArrayReverseTestOne005
     * @tc.desc Verify reverse() on Int16Array.from(source) yields [0]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: int[] = [];
      for (let i = 0; i < 100; i++) {
        source.push(i);
      }
      let arr: Int16Array = Int16Array.from(source);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 99;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0600
     * @tc.name testInt16ArrayReverseTestOne006
     * @tc.desc Verify reverse() on Int16Array.of(-32768) yields [0]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0700
     * @tc.name testInt16ArrayReverseTestOne007
     * @tc.desc Verify reverse() on Int16Array.of(-1) yields [0]=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1;
      let arr: Int16Array = Int16Array.of(val);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0800
     * @tc.name testInt16ArrayReverseTestOne008
     * @tc.desc Verify reverse() on Int16Array.of(32767, -32768) yields [0]=-32768 [1]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_0900
     * @tc.name testInt16ArrayReverseTestOne009
     * @tc.desc Verify reverse() on Int16Array.of(0, -1) yields [0]=-1 [1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, -1);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1000
     * @tc.name testInt16ArrayReverseTestOne010
     * @tc.desc Verify reverse() on Int16Array.of(-1, 0) yields [0]=0 [1]=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, 0);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -1;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1100
     * @tc.name testInt16ArrayReverseTestOne011
     * @tc.desc Verify reverse() on Int16Array.of(32767, 32767) yields [0]=32767 [1]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1200
     * @tc.name testInt16ArrayReverseTestOne012
     * @tc.desc Verify reverse() on Int16Array.of(-32768, 0, 32767) yields [1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
      arr.reverse();
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1300
     * @tc.name testInt16ArrayReverseTestOne013
     * @tc.desc Verify reverse() on Int16Array.of(1, -32768, 3) yields [1]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, -32768, 3);
      arr.reverse();
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1400
     * @tc.name testInt16ArrayReverseTestOne014
     * @tc.desc Verify reverse() on Int16Array.of(-32768, -1, 0, 32767) yields [0]=32767 [1]=0 [2]=-1 [3]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -1, 0, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1500
     * @tc.name testInt16ArrayReverseTestOne015
     * @tc.desc Verify reverse() on Int16Array.of(0, 32767, -32768, -1) yields [0]=-1 [1]=-32768 [2]=32767 [3]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 32767, -32768, -1);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1600
     * @tc.name testInt16ArrayReverseTestOne016
     * @tc.desc Verify reverse() on Int16Array.of(-32768, -32768, 32767, 32767) yields [0]=32767 [1]=32767 [2]=-32768 [3]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -32768, 32767, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -32768;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1700
     * @tc.name testInt16ArrayReverseTestOne017
     * @tc.desc Verify reverse() on Int16Array.of(-32768, -2, 0, 2, 32767) yields [0]=32767 [1]=2 [2]=0 [3]=-2...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -2, 0, 2, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -2;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = -32768;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1800
     * @tc.name testInt16ArrayReverseTestOne018
     * @tc.desc Verify reverse() on Int16Array.of(-1, -1, -1, -1, -1) yields [0]=-1 [2]=-1 [4]=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -1, -1, -1, -1);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt4: number = arr.$_get(4);
      let expectedElement4: int = -1;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_1900
     * @tc.name testInt16ArrayReverseTestOne019
     * @tc.desc Verify reverse() on Int16Array.of(-32768, 0, 0, 0, 0, 0, 32767) yields [6]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 0, 0, 0, 0, 32767);
      arr.reverse();
      let elementAt6: number = arr.$_get(6);
      let expectedElement6: int = -32768;
      expect(elementAt6).assertEqual(expectedElement6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2000
     * @tc.name testInt16ArrayReverseTestOne020
     * @tc.desc Verify reverse() on Int16Array.of(-32768, 0, 0, 0, 0, 0, 32767) yields [0]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 0, 0, 0, 0, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2100
     * @tc.name testInt16ArrayReverseTestOne021
     * @tc.desc Verify reverse() on Int16Array.of(-32768, 0, 0, 0, 0, 0, 0, 32767) yields [0]=32767 [7]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 0, 0, 0, 0, 0, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt7: number = arr.$_get(7);
      let expectedElement7: int = -32768;
      expect(elementAt7).assertEqual(expectedElement7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2200
     * @tc.name testInt16ArrayReverseTestOne022
     * @tc.desc Verify reverse() on Int16Array.of(32767, 32767, 32767) yields [0]=32767 [1]=32767 [2]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 32767, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2300
     * @tc.name testInt16ArrayReverseTestOne023
     * @tc.desc Verify reverse() on Int16Array.of(-32768, -32768, -32768) yields [0]=-32768 [1]=-32768 [2]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -32768, -32768);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -32768;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2400
     * @tc.name testInt16ArrayReverseTestOne024
     * @tc.desc Verify reverse() on Int16Array.of(32766, 32767, -32768, -32767) yields [0]=-32767 [1]=-32768 [2]=32767 [3]=32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32766, 32767, -32768, -32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 32766;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2500
     * @tc.name testInt16ArrayReverseTestOne025
     * @tc.desc Verify reverse() on Int16Array.from([1, 2, 3]) yields [0]=3 [2]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([1, 2, 3]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2600
     * @tc.name testInt16ArrayReverseTestOne026
     * @tc.desc Verify reverse() yields [0]=10 [3]=40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int16Array = Int16Array.of(10, 20, 30, 40);
      orig.reverse();
      let copy: Int16Array = new Int16Array(orig);
      copy.reverse();
      let elementAt0: number = copy.$_get(0);
      let expectedElement0: int = 10;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = copy.$_get(3);
      let expectedElement3: int = 40;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2700
     * @tc.name testInt16ArrayReverseTestOne027
     * @tc.desc Verify reverse() on Int16Array.of(-100, -200, -300) yields [0]=-300 [2]=-100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, -200, -300);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -300;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -100;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2800
     * @tc.name testInt16ArrayReverseTestOne028
     * @tc.desc Verify reverse() on new Int16Array([32768, 1, 2]) yields [2]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768, 1, 2]);
      arr.reverse();
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -32768;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_2900
     * @tc.name testInt16ArrayReverseTestOne029
     * @tc.desc Verify reverse() on new Int16Array([-32769, 1, 2]) yields [2]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32769, 1, 2]);
      arr.reverse();
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3000
     * @tc.name testInt16ArrayReverseTestOne030
     * @tc.desc Verify reverse() on new Int16Array(3) yields [2]=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0, -3.7);
      arr.$_set(1, 90);
      arr.$_set(2, 100);
      arr.reverse();
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = -3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3100
     * @tc.name testInt16ArrayReverseTestOne031
     * @tc.desc Verify reverse() on Int16Array.of(-32768, 1, 2, 32767) yields [0]=-32768 [3]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 1, 2, 32767);
      arr.reverse();
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 32767;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3200
     * @tc.name testInt16ArrayReverseTestOne032
     * @tc.desc Verify reverse() on Int16Array.of(32767, 32767, 32767, 32767) yields [0]=32767 [2]=32767 [3]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, 32767, 32767, 32767);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 32767;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 32767;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3300
     * @tc.name testInt16ArrayReverseTestOne033
     * @tc.desc Verify reverse() on new Int16Array([32768, 42]) yields [0]=42 [1]=-32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768, 42]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 42;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3400
     * @tc.name testInt16ArrayReverseTestOne034
     * @tc.desc Verify reverse() on new Int16Array([-32769, 17]) yields [0]=17 [1]=32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32769, 17]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 17;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 32767;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3500
     * @tc.name testInt16ArrayReverseTestOne035
     * @tc.desc Verify reverse() on ArrayBuffer-backed Int16Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 0, 2);
      arr.reverse();
      let actualValue1: ArrayBuffer = arr.buffer;
      let expectedValue1: ArrayBuffer = buf;
      expect(actualValue1).assertEqual(expectedValue1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3600
     * @tc.name testInt16ArrayReverseTestOne036
     * @tc.desc Verify reverse() preserves length on Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let lenBefore: int = arr.length;
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3700
     * @tc.name testInt16ArrayReverseTestOne037
     * @tc.desc Verify reverse() returns non-null Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, -32768]);
      let result: Int16Array = arr.reverse();
      let actualLength: int = result.length;
      let expectedLength: int = arr.length;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3800
     * @tc.name testInt16ArrayReverseTestOne038
     * @tc.desc Verify reverse() element values [0]=4, [1]=3, [2]=2, [3]=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let result: Int16Array = arr.reverse();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 4;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 3;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = result.$_get(3);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_3900
     * @tc.name testInt16ArrayReverseTestOne039
     * @tc.desc Verify reverse() swaps int16.MAX and int16.MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, 0, -32768]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4000
     * @tc.name testInt16ArrayReverseTestOne040
     * @tc.desc Verify reverse() length equals byteLength divided by BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 8, 9]);
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: int = arr.byteLength / Int16Array.BYTES_PER_ELEMENT;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4100
     * @tc.name testInt16ArrayReverseTestOne041
     * @tc.desc Verify reverse() on new Int16Array(100) keeps length unchanged equal to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      arr.$_set(0, 1);
      arr.$_set(99, 2);
      let lenBefore: number = arr.length;
      arr.reverse();
      let actualLength: int = arr.length;
      let expectedLength: number = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4200
     * @tc.name testInt16ArrayReverseTestOne042
     * @tc.desc Verify reverse byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      arr.reverse();
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4300
     * @tc.name testInt16ArrayReverseTestOne043
     * @tc.desc Verify reverse().$_get(0) on new Int16Array([10, 20, 30]) returns reversed element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let val: number = arr.reverse().$_get(0);
      expect(val).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4400
     * @tc.name testInt16ArrayReverseTestOne044
     * @tc.desc Verify reverse().join(',') returns reversed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let s: string = arr.reverse().join(',');
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4500
     * @tc.name testInt16ArrayReverseTestOne045
     * @tc.desc Verify reverse().fill(0) fills reversed array with zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      arr.reverse().fill(0);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4600
     * @tc.name testInt16ArrayReverseTestOne046
     * @tc.desc Verify reverse().sort() sorts reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 1, 4, 2]);
      arr.reverse().sort();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 4;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4700
     * @tc.name testInt16ArrayReverseTestOne047
     * @tc.desc Verify reverse().copyWithin operates on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.reverse().copyWithin(0, 1);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4800
     * @tc.name testInt16ArrayReverseTestOne048
     * @tc.desc Verify reverse().slice() copies reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let sliced: Int16Array = arr.reverse().slice();
      let elementAt0: number = sliced.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = sliced.$_get(2);
      let expectedElement2: int = 1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_4900
     * @tc.name testInt16ArrayReverseTestOne049
     * @tc.desc Verify reverse().subarray() views reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let view: Int16Array = arr.reverse().subarray();
      let elementAt0: number = view.$_get(0);
      let expectedElement0: int = 30;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt2: number = view.$_get(2);
      let expectedElement2: int = 10;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5000
     * @tc.name testInt16ArrayReverseTestOne050
     * @tc.desc Verify reverse().reverse() restores original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.reverse().reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 4;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5100
     * @tc.name testInt16ArrayReverseTestOne051
     * @tc.desc Verify reverse().includes() searches reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let found: boolean = arr.reverse().includes(1);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5200
     * @tc.name testInt16ArrayReverseTestOne052
     * @tc.desc Verify reverse().lastIndexOf() finds index in reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 5, 10]);
      let idx: number = arr.reverse().lastIndexOf(5);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5300
     * @tc.name testInt16ArrayReverseTestOne053
     * @tc.desc Verify reverse().every() runs on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, 6, 9]);
      let allPositive: boolean = arr.reverse().every((v: number): boolean => {
        return v > 0;
      });
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5400
     * @tc.name testInt16ArrayReverseTestOne054
     * @tc.desc Verify reverse().some() runs on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let hasEven: boolean = arr.reverse().some((v: number): boolean => {
        return v % 2 === 0;
      });
      expect(hasEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5500
     * @tc.name testInt16ArrayReverseTestOne055
     * @tc.desc Verify reverse().find() finds value in reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let found: number | undefined = arr.reverse().find((v: number): boolean => {
        return v === 3;
      });
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5600
     * @tc.name testInt16ArrayReverseTestOne056
     * @tc.desc Verify reverse().findIndex() finds index in reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let idx: number = arr.reverse().findIndex((v: number): boolean => {
        return v === 100;
      });
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5700
     * @tc.name testInt16ArrayReverseTestOne057
     * @tc.desc Verify reverse().reduce() reduces reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let sum: number = arr.reverse().reduce((acc: number, v: number): number => {
        return acc + v;
      }, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5800
     * @tc.name testInt16ArrayReverseTestOne058
     * @tc.desc Verify reverse().reduceRight() reduces reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let sum: number = arr.reverse().reduceRight((acc: number, v: number): number => {
        return acc + v;
      }, 0);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_5900
     * @tc.name testInt16ArrayReverseTestOne059
     * @tc.desc Verify reverse().forEach() iterates reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let count: number = 0;
      arr.reverse().forEach((_v: number, _i: int, _arr: Int16Array): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6000
     * @tc.name testInt16ArrayReverseTestOne060
     * @tc.desc Verify reverse().map() maps reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let mapped: Int16Array = arr.reverse().map((v: number): number => {
        return v * 10;
      });
      let elementAt0: number = mapped.$_get(0);
      let expectedElement0: int = 30;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6100
     * @tc.name testInt16ArrayReverseTestOne061
     * @tc.desc Verify reverse().filter() filters reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let filtered: Int16Array = arr.reverse().filter((v: number): boolean => {
        return v > 2;
      });
      let elementAt0: number = filtered.$_get(0);
      let expectedElement0: int = 4;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6200
     * @tc.name testInt16ArrayReverseTestOne062
     * @tc.desc Verify reverse().toString() stringifies reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let s: string = arr.reverse().toString();
      expect(s).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6300
     * @tc.name testInt16ArrayReverseTestOne063
     * @tc.desc Verify reverse() shared buffer mutation via result is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let result: Int16Array = arr.reverse();
      result.$_set(0, 99);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 99;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6400
     * @tc.name testInt16ArrayReverseTestOne064
     * @tc.desc Verify reverse() keeps NaN truncated to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Double.NaN, 2, 3]);
      arr.reverse();
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 0;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6500
     * @tc.name testInt16ArrayReverseTestOne065
     * @tc.desc Verify reverse() on empty Int16Array returns same object identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let ret: Int16Array = arr.reverse();
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6600
     * @tc.name testInt16ArrayReverseTestOne066
     * @tc.desc Verify reverse() on ArrayBuffer view returns same object identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let ret: Int16Array = arr.reverse();
      expect(ret).assertEqual(arr);
      let actualElement0: number = ret.$_get(0);
      let expectedElement0: int = 3;
      expect(actualElement0).assertEqual(expectedElement0);
      let actualElement1: number = ret.$_get(1);
      let expectedElement1: int = 2;
      expect(actualElement1).assertEqual(expectedElement1);
      let actualElement2: number = ret.$_get(2);
      let expectedElement2: int = 1;
      expect(actualElement2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6700
     * @tc.name testInt16ArrayReverseTestOne067
     * @tc.desc Verify reverse() return ref mutation is visible via original ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let ret: Int16Array = arr.reverse();
      ret.$_set(0, 999);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 999;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6800
     * @tc.name testInt16ArrayReverseTestOne068
     * @tc.desc Verify reverse() mid and final refs are same object after two reverses
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let mid: Int16Array = arr.reverse();
      let fin: Int16Array = arr.reverse();
      expect(mid).assertEqual(fin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_6900
     * @tc.name testInt16ArrayReverseTestOne069
     * @tc.desc Verify reverse() then fill via return ref updates original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300, 400);
      let ret: Int16Array = arr.reverse();
      ret.fill(0);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = 0;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_REVERSE_ONE_7000
     * @tc.name testInt16ArrayReverseTestOne070
     * @tc.desc Verify reverse() all-overflow array stays all -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayReverseTestOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32768, 32768, 32768, 32768]);
      arr.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt3: number = arr.$_get(3);
      let expectedElement3: int = -32768;
      expect(elementAt3).assertEqual(expectedElement3);
    });

  });
}
