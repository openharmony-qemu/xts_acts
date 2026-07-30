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

export default function arrayBufferFromOneTest(): void {
  describe('ArrayBufferFromOneTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0100
     * @tc.desc Verify from(ValueArray<byte>) copies byteLength 5 and every source byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40), Int.toByte(50)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(5);
      for (let i: int = 0; i < 5; i++) {
        expect(result.at(i)).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0200
     * @tc.desc Verify from(ValueArray) copies are independent of source and other from() results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(10), Int.toByte(20)];
      const result = ArrayBuffer.from(arr);
      const result2 = ArrayBuffer.from(arr);
      arr[0] = Int.toByte(99);
      result.set(0, Int.toByte(88));
      expect(result.at(0)).assertEqual(Int.toByte(88));
      expect(arr[0]).assertEqual(Int.toByte(99));
      expect(arr[1]).assertEqual(Int.toByte(20));
      expect(result2.at(0)).assertEqual(Int.toByte(10));
      expect((result !== result2)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0300
     * @tc.desc Verify from empty, single-element, and 1024-element ValueArray<byte> copy correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty: ValueArray<byte> = [];
      expect(ArrayBuffer.from(empty).byteLength).assertEqual(0);

      const single: ValueArray<byte> = [Int.toByte(42)];
      const one = ArrayBuffer.from(single);
      expect(one.byteLength).assertEqual(1);
      expect(one.at(0)).assertEqual(Int.toByte(42));

      const large: ValueArray<byte> = new ValueArray<byte>(1024, Int.toByte(0));
      for (let i: int = 0; i < 1024; i++) {
        large[i] = Int.toByte(i % 256);
      }
      const big = ArrayBuffer.from(large);
      expect(big.byteLength).assertEqual(1024);
      expect(big.at(0)).assertEqual(Int.toByte(0));
      expect(big.at(1023)).assertEqual(Int.toByte(255));
    });

    /**
     * @tc.name testArrayBufferFromOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0400
     * @tc.desc Verify from(ValueArray) preserves byte edge values 127, -128, 0, and -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(127), Int.toByte(-128), Int.toByte(0), Int.toByte(-1)];
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(127));
      expect(result.at(1)).assertEqual(Int.toByte(-128));
      expect(result.at(2)).assertEqual(Int.toByte(0));
      expect(result.at(3)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0500
     * @tc.desc Verify from(null as ValueArray<byte>) throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from(Utils.castToValueArrayByte(Utils.nullAsObject()));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });
  });
}
