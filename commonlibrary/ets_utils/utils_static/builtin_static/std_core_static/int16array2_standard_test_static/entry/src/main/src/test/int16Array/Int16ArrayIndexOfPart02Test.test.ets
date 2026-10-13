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
} from "../../../../hypium/index";
import Utils from "../Util.test";

export default function int16ArrayIndexOfPart02Test(): void {
  describe("Int16ArrayIndexOfPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__0100
     * @tc.name int16ArrayIndexOfPart02Test001
     * @tc.desc Verify indexOf found result returns the index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const result: int = arr.indexOf(10);
      let actual: int = result;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__0200
     * @tc.name int16ArrayIndexOfPart02Test002
     * @tc.desc Verify indexOf boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10, 15, 20]);
      const result: int = arr.indexOf(15);
      let actual: boolean = result >= 0 && result < arr.length;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__0300
     * @tc.name int16ArrayIndexOfPart02Test003
     * @tc.desc Verify indexOf -1 undefined
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const result: int | undefined = arr.indexOf(99);
      let actual: boolean = result !== undefined;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__0400
     * @tc.name int16ArrayIndexOfPart02Test004
     * @tc.desc Verify indexOf value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30, 40]);
      const first: int = arr.indexOf(20);
      const second: int = arr.indexOf(20);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__0500
     * @tc.name int16ArrayIndexOfPart02Test005
     * @tc.desc Verify indexOf value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array([7, 14, 21]);
      const arr2 = new Int16Array([7, 14, 21]);
      let actual: int = arr1.indexOf(14);
      let expected: int = arr2.indexOf(14);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__0600
     * @tc.name int16ArrayIndexOfPart02Test006
     * @tc.desc Verify indexOf value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([11, 22, 33]);
      const lenBefore: int = arr.length;
      arr.indexOf(22);
      let actual: int = arr.length;
      let expected: int = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__1600
     * @tc.name int16ArrayIndexOfPart02Test016
     * @tc.desc Verify indexOf byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const byteLenBefore: int = arr.byteLength;
      arr.indexOf(20);
      let actual: int = arr.byteLength;
      let expected: int = byteLenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__2600
     * @tc.name int16ArrayIndexOfPart02Test026
     * @tc.desc Verify indexOf $_get/$_get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30]);
      const firstBefore = arr.$_get(0);
      arr.indexOf(20);
      let actual: number = arr.$_get(0);
      let expected: number = firstBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__3900
     * @tc.name int16ArrayIndexOfPart02Test039
     * @tc.desc Verify indexOf $_get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([40, 50, 60]);
      const idx: int = arr.indexOf(50);
      let actual: number = arr.$_get(idx);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__4000
     * @tc.name int16ArrayIndexOfPart02Test040
     * @tc.desc Verify indexOf $_get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([10, 20, 30, 40]);
      const idx: int = arr.indexOf(20);
      let actual: number = arr.$_get(idx + 1);
      let expected: int = 30;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__4100
     * @tc.name int16ArrayIndexOfPart02Test041
     * @tc.desc Verify indexOf boolean
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const result: int = arr.indexOf(99);
      let actual: boolean = result === -1;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__4600
     * @tc.name int16ArrayIndexOfPart02Test046
     * @tc.desc Verify indexOf -1 !== -1 false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      const result: int = arr.indexOf(99);
      let actual: boolean = result !== -1;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__4800
     * @tc.name int16ArrayIndexOfPart02Test048
     * @tc.desc Verify ArrayBuffer Int16Array indexOf buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf);
      arr.indexOf(0);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__4900
     * @tc.name int16ArrayIndexOfPart02Test049
     * @tc.desc Verify ArrayBuffer Int16Array indexOf buffer.byteLength equals 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      arr.indexOf(0);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5000
     * @tc.name int16ArrayIndexOfPart02Test050
     * @tc.desc Verify ArrayBuffer Int16Array indexOf byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2, 3);
      const offsetBefore: int = arr.byteOffset;
      arr.indexOf(0);
      let actual: int = arr.byteOffset;
      let expected: int = offsetBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5100
     * @tc.name int16ArrayIndexOfPart02Test051
     * @tc.desc Verify Int16Array indexOf byteOffset 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      arr.indexOf(2);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5200
     * @tc.name int16ArrayIndexOfPart02Test052
     * @tc.desc Verify ArrayBuffer.isView indexOf Int16Array true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      arr.indexOf(0);
      let actual: boolean = ArrayBuffer.isView(arr);
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5300
     * @tc.name int16ArrayIndexOfPart02Test053
     * @tc.desc Verify ArrayBuffer.isView Int16Array indexOf true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([5, 10]);
      arr.indexOf(10);
      let actual: boolean = ArrayBuffer.isView(arr);
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5400
     * @tc.name int16ArrayIndexOfPart02Test054
     * @tc.desc Verify indexOf $_set/$_set/$_get value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0, 2);
      const view2 = new Int16Array(buf, 2, 2);
      view1.$_set(0, 100);
      view2.$_set(0, 200);
      const v2Before = view2.$_get(0);
      view1.indexOf(100);
      let actual: number = view2.$_get(0);
      let expected: number = v2Before;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5500
     * @tc.name int16ArrayIndexOfPart02Test055
     * @tc.desc Verify buffer indexOf buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0, 2);
      const view2 = new Int16Array(buf, 2, 2);
      view1.indexOf(0);
      let actual: boolean = view1.buffer === view2.buffer;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5600
     * @tc.name int16ArrayIndexOfPart02Test056
     * @tc.desc Verify ArrayBuffer indexOf buffer.byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 0, 5);
      const bufLenBefore = arr.buffer.byteLength;
      arr.indexOf(0);
      let actual: int = arr.buffer.byteLength;
      let expected: number = bufLenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5700
     * @tc.name int16ArrayIndexOfPart02Test057
     * @tc.desc Verify indexOf(0) on zero-filled byteOffset view returns index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 2, 4);
      const result: int = arr.indexOf(0);
      let actual: int = result;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5800
     * @tc.name int16ArrayIndexOfPart02Test058
     * @tc.desc Verify byteOffset indexOf
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 2, 4);
      arr.$_set(0, 50);
      arr.$_set(1, 60);
      const result: int = arr.indexOf(60);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__5900
     * @tc.name int16ArrayIndexOfPart02Test059
     * @tc.desc Verify buffer byteLength after indexOf is 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([3, 6, 9]);
      arr.indexOf(6);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__6000
     * @tc.name int16ArrayIndexOfPart02Test060
     * @tc.desc Verify ArrayBuffer indexOf buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([2, 4, 6]);
      arr.indexOf(4);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__6100
     * @tc.name int16ArrayIndexOfPart02Test061
     * @tc.desc Verify byteOffset after indexOf is 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([1, 2, 3]);
      arr.indexOf(1);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__6200
     * @tc.name int16ArrayIndexOfPart02Test062
     * @tc.desc Verify indexOf byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, 2, 2);
      const offset = arr.byteOffset;
      arr.indexOf(0);
      arr.indexOf(1);
      let actual: int = arr.byteOffset;
      let expected: number = offset;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART02__6300
     * @tc.name int16ArrayIndexOfPart02Test063
     * @tc.desc Verify indexOf $_set/$_set/$_set value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart02Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0, 4);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      const index1 = view1.indexOf(20);
      view1.$_set(2, 30);
      const index2 = view1.indexOf(20);
      expect(index1).assertEqual(index2);
    });

  });
}
