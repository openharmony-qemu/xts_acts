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

export default function int8ArrayJoinPart01Test(): void {
  describe('Int8ArrayJoinPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART01_0100
     * @tc.name int8ArrayJoinPart01Test001
     * @tc.desc Verify no-argument, explicit undefined and explicit comma separators are equivalent on a three-element array, result is a string of length 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let noArgResult: string = arr.join();
      let undefinedResult: string = arr.join(undefined);
      let commaResult: string = arr.join(',');
      expect(noArgResult).assertEqual('1,2,3');
      expect(undefinedResult).assertEqual('1,2,3');
      expect(commaResult).assertEqual('1,2,3');
      let actualLen: int = noArgResult.length;
      expect(actualLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART01_0200
     * @tc.name int8ArrayJoinPart01Test002
     * @tc.desc Verify empty string separator concatenates all elements without any delimiter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let sep: string = '';
      let result: string = arr.join(sep);
      let expected: string = '123';
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART01_0300
     * @tc.name int8ArrayJoinPart01Test003
     * @tc.desc Verify empty array joins to empty string for every separator form, separator is never inserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let actualLen: int = arr.length;
      let expectedLen: int = 0;
      expect(actualLen).assertEqual(expectedLen);
      let expected: string = '';
      let r1: string = arr.join();
      let r2: string = arr.join(undefined);
      let r3: string = arr.join('');
      let r4: string = arr.join('abc');
      let r5: string = arr.join('😀');
      let r6: string = arr.join('<script>');
      let r7: string = arr.join('\\');
      expect(r1).assertEqual(expected);
      expect(r2).assertEqual(expected);
      expect(r3).assertEqual(expected);
      expect(r4).assertEqual(expected);
      expect(r5).assertEqual(expected);
      expect(r6).assertEqual(expected);
      expect(r7).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART01_0400
     * @tc.name int8ArrayJoinPart01Test004
     * @tc.desc Verify single-element array joins to the element itself, separator is never inserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let actualLen: int = arr.length;
      let expectedLen: int = 1;
      expect(actualLen).assertEqual(expectedLen);
      let expected: string = '7';
      let r1: string = arr.join();
      let r2: string = arr.join(undefined);
      let r3: string = arr.join('');
      let r4: string = arr.join('-');
      let r5: string = arr.join('abc');
      let r6: string = arr.join('😀');
      expect(r1).assertEqual(expected);
      expect(r2).assertEqual(expected);
      expect(r3).assertEqual(expected);
      expect(r4).assertEqual(expected);
      expect(r5).assertEqual(expected);
      expect(r6).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART01_0500
     * @tc.name int8ArrayJoinPart01Test005
     * @tc.desc Verify multi-character, emoji, markup and backslash separators are inserted verbatim between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let r1: string = arr.join('-');
      let r2: string = arr.join('ab');
      let r3: string = arr.join('😀');
      let r4: string = arr.join('<script>');
      let r5: string = arr.join('\\');
      expect(r1).assertEqual('1-2-3');
      expect(r2).assertEqual('1ab2ab3');
      expect(r3).assertEqual('1😀2😀3');
      expect(r4).assertEqual('1<script>2<script>3');
      expect(r5).assertEqual('1\\2\\3');
    });
  });
}
