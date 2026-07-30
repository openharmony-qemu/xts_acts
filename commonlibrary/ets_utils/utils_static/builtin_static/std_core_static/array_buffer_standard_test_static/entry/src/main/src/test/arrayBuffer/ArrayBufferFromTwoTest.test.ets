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
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferFromTwoTest(): void {
  describe('ArrayBufferFromTwoTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0100
     * @tc.desc Verify from(FixedArray<byte>) copies byteLength 4 and every source byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> =
        [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(buffer.at(i)).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0200
     * @tc.desc Verify from(FixedArray) copies are independent of source and other from() results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20)];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      arr[0] = Int.toByte(99);
      buffer1.set(0, Int.toByte(88));
      expect(buffer1.at(0)).assertEqual(Int.toByte(88));
      expect(arr[0]).assertEqual(Int.toByte(99));
      expect(arr[1]).assertEqual(Int.toByte(20));
      expect(buffer2.at(0)).assertEqual(Int.toByte(10));
      expect((buffer1 !== buffer2)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0300
     * @tc.desc Verify from empty, single [42], and full byte-range FixedArray<byte> copy correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: FixedArray<byte> = [];
      expect(ArrayBuffer.from(empty).byteLength).assertEqual(0);

      const single: FixedArray<byte> = [Int.toByte(42)];
      const one = ArrayBuffer.from(single);
      expect(one.byteLength).assertEqual(1);
      expect(one.at(0)).assertEqual(Int.toByte(42));

      const spectrum: FixedArray<byte> =
        [Int.toByte(-128), Int.toByte(-1), Int.toByte(0), Int.toByte(1), Int.toByte(127)];
      const edge = ArrayBuffer.from(spectrum);
      expect(edge.byteLength).assertEqual(5);
      expect(edge.at(0)).assertEqual(Int.toByte(-128));
      expect(edge.at(4)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0400
     * @tc.desc Verify from(null as FixedArray<byte>) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToFixedArrayByte(Utils.nullAsObject()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
