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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function int8ArrayKeysPart02Test(): void {
  describe('Int8ArrayKeysPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART02_0100
     * @tc.name int8ArrayKeysPart02Test001
     * @tc.desc Verify buffer view keys() indexes are relative to the view start, not to the underlying buffer position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 2;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let expectedIndex: int = 0;
      let allMatch: boolean = true;
      let lastIndex: int = -1;
      for (let k of arr.keys()) {
        if (k !== expectedIndex) {
          allMatch = false;
        }
        lastIndex = k;
        expectedIndex += 1;
      }
      expect(allMatch).assertTrue();
      expect(expectedIndex).assertEqual(3);
      expect(lastIndex).assertEqual(2);
      let first = arr.keys().next();
      expect(first.value).assertEqual(0);
      expect(first.done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART02_0200
     * @tc.name int8ArrayKeysPart02Test002
     * @tc.desc Verify subarray view and slice copy each restart their keys() sequence at 0 and use their own length as the upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int8Array = new Int8Array(5);
      let subView: Int8Array = base.subarray(1, 4);
      let subExpected: int = 0;
      let subOk: boolean = true;
      let subCount: int = 0;
      for (let k of subView.keys()) {
        if (k !== subExpected) {
          subOk = false;
        }
        subExpected += 1;
        subCount += 1;
      }
      expect(subOk).assertTrue();
      expect(subCount).assertEqual(3);
      let copy: Int8Array = base.slice(1, 3);
      let copyExpected: int = 0;
      let copyOk: boolean = true;
      let copyCount: int = 0;
      for (let k of copy.keys()) {
        if (k !== copyExpected) {
          copyOk = false;
        }
        copyExpected += 1;
        copyCount += 1;
      }
      expect(copyOk).assertTrue();
      expect(copyCount).assertEqual(2);
      let actualCopyByteOffset: int = copy.byteOffset;
      let expectedCopyByteOffset: int = 0;
      expect(actualCopyByteOffset).assertEqual(expectedCopyByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART02_0300
     * @tc.name int8ArrayKeysPart02Test003
     * @tc.desc Verify keys() sequence is 0..length-1 regardless of how the Int8Array was constructed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ofArr: Int8Array = Int8Array.of(1, 2, 3);
      let ofCount: int = 0;
      let ofLast: int = -1;
      for (let k of ofArr.keys()) {
        ofCount += 1;
        ofLast = k;
      }
      expect(ofCount).assertEqual(3);
      expect(ofLast).assertEqual(2);
      let src: int[] = [1, 2, 3];
      let fromArr: Int8Array = Int8Array.from(src);
      let fromCount: int = 0;
      let fromLast: int = -1;
      for (let k of fromArr.keys()) {
        fromCount += 1;
        fromLast = k;
      }
      expect(fromCount).assertEqual(3);
      expect(fromLast).assertEqual(2);
      let setSrc: Set<int> = new Set<int>();
      setSrc.add(1);
      setSrc.add(2);
      let fromSetArr: Int8Array = Int8Array.from(setSrc);
      let setCount: int = 0;
      let setLast: int = -1;
      for (let k of fromSetArr.keys()) {
        setCount += 1;
        setLast = k;
      }
      expect(setCount).assertEqual(2);
      expect(setLast).assertEqual(1);
      let typedSrc: Int8Array = new Int8Array(3);
      let copyArr: Int8Array = new Int8Array(typedSrc);
      let copyCount: int = 0;
      let copyLast: int = -1;
      for (let k of copyArr.keys()) {
        copyCount += 1;
        copyLast = k;
      }
      expect(copyCount).assertEqual(3);
      expect(copyLast).assertEqual(2);
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let bufArr: Int8Array = new Int8Array(buf);
      let bufCount: int = 0;
      let bufLast: int = -1;
      for (let k of bufArr.keys()) {
        bufCount += 1;
        bufLast = k;
      }
      expect(bufCount).assertEqual(3);
      expect(bufLast).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART02_0400
     * @tc.name int8ArrayKeysPart02Test004
     * @tc.desc Verify keys() indexes depend only on length and are unaffected by out-of-range element values or repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapSrc: int[] = [0x80, 200, 0x100];
      let wrapArr: Int8Array = new Int8Array(wrapSrc);
      let wrapExpected: int = 0;
      let wrapOk: boolean = true;
      let wrapCount: int = 0;
      for (let k of wrapArr.keys()) {
        if (k !== wrapExpected) {
          wrapOk = false;
        }
        wrapExpected += 1;
        wrapCount += 1;
      }
      expect(wrapOk).assertTrue();
      expect(wrapCount).assertEqual(3);
      let sameSrc: int[] = [5, 5, 5, 5];
      let sameArr: Int8Array = new Int8Array(sameSrc);
      let sameExpected: int = 0;
      let sameOk: boolean = true;
      let sameCount: int = 0;
      for (let k of sameArr.keys()) {
        if (k !== sameExpected) {
          sameOk = false;
        }
        sameExpected += 1;
        sameCount += 1;
      }
      expect(sameOk).assertTrue();
      expect(sameCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_KEYS_PART02_0500
     * @tc.name int8ArrayKeysPart02Test005
     * @tc.desc Verify keys() index sequence stays 0-based and unaffected when array contents change before or during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayKeysPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      let iter = arr.keys();
      let first = iter.next();
      expect(first.value).assertEqual(0);
      arr.fill(9);
      let second = iter.next();
      expect(second.value).assertEqual(1);
      expect(second.done).assertFalse();
      let afterSort: Int8Array = new Int8Array([3, 1, 2]);
      afterSort.sort();
      expect(afterSort.keys().next().value).assertEqual(0);
      let afterReverse: Int8Array = new Int8Array([1, 2, 3]);
      afterReverse.reverse();
      let revIter = afterReverse.keys();
      revIter.next();
      expect(revIter.next().value).assertEqual(1);
      let afterFill: Int8Array = new Int8Array(3);
      afterFill.fill(7);
      let fillIter = afterFill.keys();
      fillIter.next();
      expect(fillIter.next().value).assertEqual(1);
      let afterSet: Int8Array = new Int8Array(3);
      afterSet.$_set(1, 100);
      expect(afterSet.keys().next().value).assertEqual(0);
      let copyWithinArr: Int8Array = new Int8Array([1, 2, 3, 4]);
      copyWithinArr.copyWithin(0, 2);
      let cwIter = copyWithinArr.keys();
      cwIter.next();
      expect(cwIter.next().value).assertEqual(1);
      let base: Int8Array = new Int8Array(3);
      expect(base.with(1, 99).keys().next().value).assertEqual(0);
      expect(base.toReversed().keys().next().value).assertEqual(0);
      let sortedSrc: int[] = [3, 1, 2];
      let sortedArr: Int8Array = new Int8Array(sortedSrc);
      expect(sortedArr.toSorted().keys().next().value).assertEqual(0);
      let exhausted: Int8Array = new Int8Array([1, 2, 3]);
      let exIter = exhausted.keys();
      exIter.next();
      exIter.next();
      exIter.next();
      exhausted.reverse();
      expect(exIter.next().done).assertTrue();
    });
  });
}
