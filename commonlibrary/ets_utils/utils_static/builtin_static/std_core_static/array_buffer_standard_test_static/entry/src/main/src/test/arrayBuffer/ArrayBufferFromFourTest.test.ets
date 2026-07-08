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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function arrayBufferFromFourTest(): void {
  describe('ArrayBufferFromFourTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromFour0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0100
     * @tc.desc Verify from(double[1,2,3,4]) yields bytes 1,2,3,4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0, 4.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(2));
      expect(buffer.at(2)).assertEqual(Int.toByte(3));
      expect(buffer.at(3)).assertEqual(Int.toByte(4));
    });

    /**
     * @tc.name testArrayBufferFromFour0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0200
     * @tc.desc Verify from truncates fractional doubles to byte and copy is isolated from source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.9, 99.5, -1.7];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(99));
      expect(buffer.at(2)).assertEqual(Int.toByte(-1));
      const src: double[] = [10.0, 20.0];
      const buffer1 = ArrayBuffer.from(src);
      const buffer2 = ArrayBuffer.from(src);
      src[0] = 99.0;
      buffer1.set(0, Int.toByte(88));
      expect(buffer1.at(0)).assertEqual(Int.toByte(88));
      expect(src[0]).assertEqual(99.0);
      expect(buffer2.at(0)).assertEqual(Int.toByte(10));
      expect(buffer1 === buffer2).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromFour0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0300
     * @tc.desc Verify from empty double[], NaN/Infinity, and byte-range doubles convert correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.from([]).byteLength).assertEqual(0);
      const special: double[] = [1.0, Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY];
      const sp = ArrayBuffer.from(special);
      expect(sp.byteLength).assertEqual(4);
      expect(sp.at(0)).assertEqual(Double.toByte(1.0));
      expect(sp.at(1)).assertEqual(Double.toByte(Double.NaN));
      expect(sp.at(2)).assertEqual(Double.toByte(Double.POSITIVE_INFINITY));
      expect(sp.at(3)).assertEqual(Double.toByte(Double.NEGATIVE_INFINITY));
      const range: double[] = [127.0, -128.0, 256.0, -129.0];
      const edge = ArrayBuffer.from(range);
      expect(edge.byteLength).assertEqual(4);
      expect(edge.at(0)).assertEqual(Int.toByte(127));
      expect(edge.at(1)).assertEqual(Int.toByte(-128));
      expect(edge.at(2)).assertEqual(Double.toByte(256.0));
      expect(edge.at(3)).assertEqual(Double.toByte(-129.0));
    });

    /**
     * @tc.name testArrayBufferFromFour0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0400
     * @tc.desc Verify from(null as double[]) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(null as double[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
