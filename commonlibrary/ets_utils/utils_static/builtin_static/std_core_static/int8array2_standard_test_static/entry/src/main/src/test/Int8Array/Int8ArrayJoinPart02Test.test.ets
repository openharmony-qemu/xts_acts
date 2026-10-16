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

export default function int8ArrayJoinPart02Test(): void {
  describe('Int8ArrayJoinPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART02_TEST_0100
     * @tc.name int8ArrayJoinPart02Test001
     * @tc.desc Verify a null separator raises ClassCastError rather than acting as the default separator, while an undefined separator keeps the default comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let sep: string | null = null;
      let nullThrew: boolean = false;
      try {
        let result: string = arr.join(sep as string | undefined);
      } catch (e) {
        nullThrew = true;
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(nullThrew).assertTrue();
      let undefinedSep: string | undefined = undefined;
      let undefinedResult: string = arr.join(undefinedSep);
      expect(undefinedResult).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART02_TEST_0200
     * @tc.name int8ArrayJoinPart02Test002
     * @tc.desc Verify multi-character, space and escaped separators are inserted verbatim between elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let r1: string = arr.join('ab');
      let r2: string = arr.join('--');
      let r3: string = arr.join(' ');
      let r4: string = arr.join('\t');
      let r5: string = arr.join('\n');
      expect(r1).assertEqual('1ab2ab3');
      expect(r2).assertEqual('1--2--3');
      expect(r3).assertEqual('1 2 3');
      expect(r4).assertEqual('1\t2\t3');
      expect(r5).assertEqual('1\n2\n3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART02_TEST_0300
     * @tc.name int8ArrayJoinPart02Test003
     * @tc.desc Verify negative element signs are not merged with the separator, and repeated boundary values keep their own sign prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boundaryArr: Int8Array = Int8Array.of(-128, 127);
      let r1: string = boundaryArr.join('-');
      let r2: string = boundaryArr.join(',');
      expect(r1).assertEqual('-128-127');
      expect(r2).assertEqual('-128,127');
      let repeatedNegArr: Int8Array = Int8Array.of(-1, -1);
      let r3: string = repeatedNegArr.join('-');
      expect(r3).assertEqual('-1--1');
      let plusArr: Int8Array = Int8Array.of(-1, -2);
      let r4: string = plusArr.join('+');
      expect(r4).assertEqual('-1+-2');
      let zeroArr: Int8Array = Int8Array.of(0, 0);
      let r5: string = zeroArr.join();
      expect(r5).assertEqual('0,0');
      let signArr: Int8Array = Int8Array.of(-1, 0, 1);
      let r6: string = signArr.join('');
      expect(r6).assertEqual('-101');
      let minArr: Int8Array = Int8Array.of(-128, -128, -128);
      let r7: string = minArr.join(',');
      expect(r7).assertEqual('-128,-128,-128');
      let maxArr: Int8Array = Int8Array.of(127, 127, 127);
      let r8: string = maxArr.join(',');
      expect(r8).assertEqual('127,127,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART02_TEST_0400
     * @tc.name int8ArrayJoinPart02Test004
     * @tc.desc Verify result length equals sum of element string lengths plus separator length times element count minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArr: Int8Array = new Int8Array(100);
      let largeResult: string = largeArr.join(',');
      let actualLargeLen: int = largeResult.length;
      let expectedLargeLen: int = 199;
      expect(actualLargeLen).assertEqual(expectedLargeLen);
      let threeArr: Int8Array = Int8Array.of(1, 2, 3);
      let multiSepResult: string = threeArr.join('--');
      let actualMultiSepLen: int = multiSepResult.length;
      let expectedMultiSepLen: int = 7;
      expect(actualMultiSepLen).assertEqual(expectedMultiSepLen);
      let twoArr: Int8Array = Int8Array.of(1, 2);
      let emptySepResult: string = twoArr.join('');
      let actualEmptySepLen: int = emptySepResult.length;
      let expectedEmptySepLen: int = 2;
      expect(actualEmptySepLen).assertEqual(expectedEmptySepLen);
    });
  });
}
