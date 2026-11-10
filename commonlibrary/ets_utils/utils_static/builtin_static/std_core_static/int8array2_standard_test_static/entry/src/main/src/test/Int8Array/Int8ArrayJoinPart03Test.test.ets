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

export default function int8ArrayJoinPart03Test(): void {
  describe('Int8ArrayJoinPart03Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART03_0100
     * @tc.name int8ArrayJoinPart03Test001
     * @tc.desc Verify subarray view joins only its own range and shares the host buffer without changing host elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let sub: Int8Array = arr.subarray(1, 3);
      let result: string = sub.join();
      let expected: string = '2,3';
      expect(result).assertEqual(expected);
      let actualLen: int = sub.length;
      let expectedLen: int = 2;
      expect(actualLen).assertEqual(expectedLen);
      let actualByteOffset: int = sub.byteOffset;
      let expectedByteOffset: int = 1;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let actualBufLen: int = sub.buffer.byteLength;
      let expectedBufLen: int = 4;
      expect(actualBufLen).assertEqual(expectedBufLen);
      let sameBuffer: boolean = sub.buffer === arr.buffer;
      expect(sameBuffer).assertTrue();
      let hostFirst: number = arr.$_get(0);
      let hostLast: number = arr.$_get(3);
      expect(hostFirst).assertEqual(1);
      expect(hostLast).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART03_0200
     * @tc.name int8ArrayJoinPart03Test002
     * @tc.desc Verify ArrayBuffer views with different offsets and lengths join their own ranges on a shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let full: Int8Array = new Int8Array(buf);
      full.$_set(0, 10);
      full.$_set(1, 20);
      full.$_set(2, 30);
      full.$_set(3, 40);
      let offsetView: Int8Array = new Int8Array(buf, 1, 2);
      let headView: Int8Array = new Int8Array(buf, 0, 2);
      let tailView: Int8Array = new Int8Array(buf, 2, 2);
      let r1: string = offsetView.join();
      let r2: string = headView.join();
      let r3: string = tailView.join();
      expect(r1).assertEqual('20,30');
      expect(r2).assertEqual('10,20');
      expect(r3).assertEqual('30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART03_0300
     * @tc.name int8ArrayJoinPart03Test003
     * @tc.desc Verify writes through subarray view and through host are visible to each other, join reflects the shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3, 4);
      let view: Int8Array = arr.subarray(1, 3);
      let before: string = view.join(',');
      expect(before).assertEqual('2,3');
      arr.$_set(1, 99);
      let afterHostWrite: string = view.join(',');
      expect(afterHostWrite).assertEqual('99,3');
      view.$_set(0, -5);
      let hostValue: number = arr.$_get(1);
      expect(hostValue).assertEqual(-5);
      let afterViewWrite: string = view.join(',');
      expect(afterViewWrite).assertEqual('-5,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_JOIN_PART03_0400
     * @tc.name int8ArrayJoinPart03Test004
     * @tc.desc Verify join has no side effect on length, byteLength, byteOffset, buffer identity and element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayJoinPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2, 3);
      let bufRef: ArrayBuffer = arr.buffer;
      let result: string = arr.join();
      let expected: string = '1,2,3';
      expect(result).assertEqual(expected);
      let actualLen: int = arr.length;
      let expectedLen: int = 3;
      expect(actualLen).assertEqual(expectedLen);
      let actualByteLen: int = arr.byteLength;
      let expectedByteLen: int = 3;
      expect(actualByteLen).assertEqual(expectedByteLen);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
      let sameBuffer: boolean = arr.buffer === bufRef;
      expect(sameBuffer).assertTrue();
      let e0: number = arr.$_get(0);
      let e1: number = arr.$_get(1);
      let e2: number = arr.$_get(2);
      expect(e0).assertEqual(1);
      expect(e1).assertEqual(2);
      expect(e2).assertEqual(3);
    });
  });
}
