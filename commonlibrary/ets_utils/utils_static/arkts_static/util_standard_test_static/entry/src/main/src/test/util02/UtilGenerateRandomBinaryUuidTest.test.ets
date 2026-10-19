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
  TestType
} from "../../../../hypium/index";
import util from "@ohos.util";
import Utils from "../Util.test";

export default function utilGenerateRandomBinaryUuidTest(): void {
  describe("UtilGenerateRandomBinaryUuidTest", (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0100
     * @tc.name testUtilGenerateRandomBinaryUuidTest001
     * @tc.desc Verify generateRandomBinaryUUID returns a 16-byte Uint8Array (length/byteLength/buffer/byteOffset/typeof/instanceof)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bin: Uint8Array | undefined = util.generateRandomBinaryUUID();
      expect(bin!.length).assertEqual(16);
      let actualByteLength: int = bin!.byteLength;
      let expectedByteLength: int = 16;
      expect(actualByteLength).assertEqual(expectedByteLength);
      let actualBufLen: int = bin!.buffer.byteLength;
      expect(actualBufLen).assertEqual(16);
      let actualOffset: int = bin!.byteOffset;
      let expectedOffset: int = 0;
      expect(actualOffset).assertEqual(expectedOffset);
      let actualType: string = typeof bin;
      let expectedType: string = "object";
      expect(actualType).assertEqual(expectedType);
      let actualBufType: string = typeof bin!.buffer;
      let expectedBufType: string = "object";
      expect(actualBufType).assertEqual(expectedBufType);
      let isU8: boolean = bin instanceof Uint8Array;
      expect(isU8).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0200
     * @tc.name testUtilGenerateRandomBinaryUuidTest002
     * @tc.desc Verify RFC 4122 v4 fields and byte range across iterations (byte[6]>>4===4, byte[8]&0xC0===0x80, all bytes in [0,255])
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allV4: boolean = true;
      let allVariant: boolean = true;
      let allInRange: boolean = true;
      for (let i = 0; i < 32; i++) {
        let u: Uint8Array | undefined = util.generateRandomBinaryUUID();
        if ((u!.$_get(6) >> 4) !== 4) {
          allV4 = false;
        }
        let variant: number = u!.$_get(8) & 0xC0;
        let expectedVariant: number = 0x80;
        if (variant !== expectedVariant) {
          allVariant = false;
        }
        for (let j = 0; j < 16; j++) {
          let byteVal: number = u!.$_get(j);
          if (byteVal < 0 || byteVal > 255) {
            allInRange = false;
          }
        }
      }
      expect(allV4).assertTrue();
      expect(allVariant).assertTrue();
      expect(allInRange).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0300
     * @tc.name testUtilGenerateRandomBinaryUuidTest003
     * @tc.desc Verify two consecutive calls return distinct buffers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Uint8Array | undefined = util.generateRandomBinaryUUID(false);
      let b: Uint8Array | undefined = util.generateRandomBinaryUUID(false);
      expect(a!.length).assertEqual(16);
      expect(b!.length).assertEqual(16);
      let distinct: boolean = a !== b;
      expect(distinct).assertTrue();

      let x: Uint8Array | undefined = util.generateRandomBinaryUUID();
      let y: Uint8Array | undefined = util.generateRandomBinaryUUID();
      let distinct2: boolean = x !== y;
      expect(distinct2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0400
     * @tc.name testUtilGenerateRandomBinaryUuidTest004
     * @tc.desc Verify byte access ($_set/$_get), single-byte write, buffer aliasing and subarray(4,8) shared memory
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bin: Uint8Array | undefined = util.generateRandomBinaryUUID();
      for (let i = 0; i < 16; i++) {
        bin!.$_set(i, i);
      }
      for (let i = 0; i < 16; i++) {
        let actualValue: number = bin!.$_get(i);
        let expectedValue: number = i;
        expect(actualValue).assertEqual(expectedValue);
      }

      bin!.$_set(0, 0x7E);
      expect(bin!.length).assertEqual(16);

      let singleByte: Uint8Array | undefined = util.generateRandomBinaryUUID(false);
      singleByte!.$_set(0, 255);
      let actualByte: number = singleByte!.$_get(0);
      let expectedByte: int = 255;
      expect(actualByte).assertEqual(expectedByte);

      let view: Uint8Array = new Uint8Array(bin!.buffer);
      expect(view.length).assertEqual(16);
      view.$_set(0, 0x7C);
      let actualAlias: number = bin!.$_get(0);
      let expectedAlias: number = 0x7C;
      expect(actualAlias).assertEqual(expectedAlias);

      let sub: Uint8Array = bin!.subarray(4, 8);
      expect(sub.length).assertEqual(4);
      let actualSubOffset: int = sub.byteOffset;
      let expectedSubOffset: int = 4;
      expect(actualSubOffset).assertEqual(expectedSubOffset);
      sub.$_set(0, 0x3B);
      let actualSubAlias: number = bin!.$_get(4);
      let expectedSubAlias: number = 0x3B;
      expect(actualSubAlias).assertEqual(expectedSubAlias);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0500
     * @tc.name testUtilGenerateRandomBinaryUuidTest005
     * @tc.desc Verify JSON.stringify of the binary UUID starts with '{'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bin: Uint8Array | undefined = util.generateRandomBinaryUUID();
      let json: string = JSON.stringify(bin!);
      let actualValue: boolean = json.startsWith("\u007B");
      expect(actualValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0600
     * @tc.name testUtilGenerateRandomBinaryUuidTest006
     * @tc.desc Verify generateRandomUUID + parseUUID yields a 16-byte buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let su: string = util.generateRandomUUID();
      let bu: Uint8Array | undefined = util.generateRandomBinaryUUID();
      let parsed: Uint8Array = util.parseUUID(su);
      expect(parsed.length).assertEqual(16);
      expect(bu!.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_BINARY_UUID_0700
     * @tc.name testUtilGenerateRandomBinaryUuidTest007
     * @tc.desc Verify uniqueness across 16 binary UUIDs expressed as hex strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomBinaryUuidTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set16: Set<string> = new Set<string>();
      let table: string = "0123456789abcdef";
      for (let i = 0; i < 16; i++) {
        let u: Uint8Array | undefined = util.generateRandomBinaryUUID();
        let hex: string = "";
        for (let j = 0; j < 16; j++) {
          hex += table.charAt((u!.$_get(j) >> 4).toInt());
          hex += table.charAt((u!.$_get(j) & 0x0F).toInt());
        }
        set16.add(hex);
      }
      expect(set16.size).assertEqual(16);
    });

  });
}
