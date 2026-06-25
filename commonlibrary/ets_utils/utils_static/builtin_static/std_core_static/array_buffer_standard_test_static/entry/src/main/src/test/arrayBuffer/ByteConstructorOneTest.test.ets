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

export default function byteConstructorOneTest(): void {
  describe('ByteConstructorOneTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testByteConstructorOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0100
     * @tc.desc Verify default constructor creates Byte with toByte() equal 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte();
      expect(b.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0200
     * @tc.desc Verify two default-constructed Byte instances both toByte() equal 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b1: Byte = new Byte();
      const b2: Byte = new Byte();
      expect(b1.toByte()).assertEqual(0);
      expect(b2.toByte()).assertEqual(0);
    });

    /**
     * @tc.name testByteConstructorOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_BYTE_CONSTRUCTOR_ONE_0300
     * @tc.desc Verify default constructor creates Byte with toString() equal "0"
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testByteConstructorOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Byte = new Byte();
      expect(b.toString()).assertEqual("0");
    });
  });
}
