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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

import Utils from '../Util.test';

import util from "@ohos.util";

import { AnyType } from '../Util.test';

function parseUUIDErrCode(uuid: string): number {
  try {
    util.parseUUID(uuid);
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual("BusinessError");
    expect(e.code).assertEqual(10200002);
  }
  return -1;
}

function parseUUIDErrCodeAny(v: AnyType): number {
  try {
    util.parseUUID(String(v));
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual("BusinessError");
    expect(e.code).assertEqual(10200002);
  }
  return -1;
}

class PlainObj {
  x: int = 1;
}

function parseUUIDErr(uuid: string): number {
  try {
    util.parseUUID(uuid);
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual("BusinessError");
    expect(e.code).assertEqual(10200002);
  }
  return -1;
}

function parseUUIDErrAny(v: AnyType): number {
  try {
    util.parseUUID(String(v));
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual("BusinessError");
    expect(e.code).assertEqual(10200002);
  }
  return -1;
}

function parseUUIDErrMsg(uuid: string): string {
  try {
    util.parseUUID(uuid);
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual("BusinessError");
    expect(e.code).assertEqual(10200002);
    return JSON.stringify(e);
  }
  return '';
}

interface PlainRec {
  x: int;
}

export default function UtilParseUuidTest(): void {
  describe('UtilParseUuidTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0100
     * @tc.name testParseUuidThrows001
     * @tc.desc Verify util.parseUUID throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9cZ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(10200002);
        }

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9Q");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(10200002);
        }

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9q");
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertContain("Invalid");
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(10200002);
        }

      }
      {
        try {
          util.parseUUID(Number.NaN as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          util.parseUUID('');
          expect().assertFail();
        } catch (e) {
          expect(e.message).assertContain("Invalid");
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(10200002);
        }

      }
      {
        try {
          util.parseUUID("not-a-uuid");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(10200002);
        }
        let after: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: int = after.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9q");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID('a'.repeat(1000));
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID("not-a-uuid");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(10200002);
        }
        let u: string = util.generateRandomUUID();
        let actual1: int = u.length;
        let expected1: int = 36;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0200
     * @tc.name testParseUuidRandom001
     * @tc.desc Verify util.parseUUID with generated random UUIDs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidRandom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let strUuid: string = util.generateRandomUUID(true);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let actual1: int = parsed.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let strUuid: string = util.generateRandomUUID(true);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let v: int = parsed.$_get(6).toInt();
        let actual1: boolean = v >= 64;
        expect(actual1).assertTrue();
        let actual2: boolean = v <= 79;
        expect(actual2).assertTrue();

      }
      {
        let strUuid: string = util.generateRandomUUID(true);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let masked: int = (Number(parsed.$_get(8)) & 192).toInt();
        expect(masked).assertEqual(128);

      }
      {
        let uuidA: Uint8Array = util.parseUUID(util.generateRandomUUID(true));
        let uuidB: Uint8Array = util.parseUUID(util.generateRandomUUID(true));
        let diff: int = 0;
        for (let i: int = 0; i < 16; i++) {
          if (uuidA.$_get(i) !== uuidB.$_get(i)) {
            diff++;
          }
        }
        let actual1: boolean = diff > 0;
        expect(actual1).assertTrue();

      }
      {
        let strUuid: string = util.generateRandomUUID(false);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let v: int = parsed.$_get(6).toInt();
        let actual1: boolean = v >= 64;
        expect(actual1).assertTrue();
        let actual2: boolean = v <= 79;
        expect(actual2).assertTrue();

      }
      {
        let strUuid: string = util.generateRandomUUID(false);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let masked: int = (Number(parsed.$_get(8)) & 192).toInt();
        expect(masked).assertEqual(128);

      }
      {
        let binUuid: Uint8Array | undefined = util.generateRandomBinaryUUID(true);
        let nibble: int = (Number((binUuid as Uint8Array).$_get(6)) >> 4).toInt();
        expect(nibble).assertEqual(4);

      }
      {
        let binUuid: Uint8Array | undefined = util.generateRandomBinaryUUID(false);
        if (binUuid == undefined) {
          expect().assertFail();
          return;
        }
        let nibble: int = (Number(binUuid.$_get(6)) >> 4).toInt();
        expect(nibble).assertEqual(4);

      }
      {
        let strBin: Uint8Array = util.parseUUID(util.generateRandomUUID(true));
        let binUuid: Uint8Array | undefined = util.generateRandomBinaryUUID(true);
        if (binUuid == undefined) {
          expect().assertFail();
          return;
        }
        let actual1: number = Number(strBin.$_get(6) >> 4);
        let expected1: number = binUuid.$_get(6) >> 4;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0300
     * @tc.name testParseUuidStructure001
     * @tc.desc Verify util.parseUUID byte-level structure of parsed UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidStructure001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let bytes = util.parseUUID("550e8400-e29b-41d4-a716-446655440000");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 85;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 0;
        expect(actual3).assertEqual(expected3);

      }
      {
        let a = util.generateRandomUUID();
        let b = util.generateRandomUUID();
        let actual1: int = util.parseUUID(a).length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: int = util.parseUUID(b).length;
        let expected2: int = 16;
        expect(actual2).assertEqual(expected2);

      }
      {
        let result: Uint8Array = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        let actual1: int = result.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        let actual1: number = Number(result.$_get(0));
        let expected1: number = 0x84;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        let version: number = (Number(result.$_get(6)) >> 4) & 0x0f;
        let actual1: number = version;
        let expected1: number = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        let actual1: number = Number(result.$_get(15));
        let expected1: number = 0x9c;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('a0b1c2d3-0001-1000-8000-000000000000');
        let v: int = result.$_get(6).toInt();
        let actual1: boolean = v >= 16;
        expect(actual1).assertTrue();
        let actual2: boolean = v <= 31;
        expect(actual2).assertTrue();

      }
      {
        let result: Uint8Array = util.parseUUID('a0b1c2d3-0001-4000-8000-000000000000');
        let vt: int = result.$_get(8).toInt();
        let actual1: boolean = vt >= 128;
        expect(actual1).assertTrue();
        let actual2: boolean = vt <= 191;
        expect(actual2).assertTrue();

      }
      {
        let result: Uint8Array = util.parseUUID('10111213-1415-4a16-b017-18191a1b1c1d');
        let expected: Uint8Array = new Uint8Array([16, 17, 18, 19, 20, 21, 74, 22, 176, 23, 24, 25, 26, 27, 28, 29]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('efefefef-efef-4fef-8fef-efefefefefef');
        const expected: int[] = [239, 239, 239, 239, 239, 239, 79, 239, 143, 239, 239, 239, 239, 239, 239, 239];
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          expect(actual1).assertEqual(expected[i]);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0400
     * @tc.name testParseUuidStructure002
     * @tc.desc Verify util.parseUUID byte-level structure of parsed UUID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidStructure002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let result: Uint8Array = util.parseUUID('0000000f-0000-4000-8000-000000000000');
        let actual1: number = Number(result.$_get(3));
        let expected1: int = 15;
        expect(actual1).assertEqual(expected1);

      }
      {
        let first: Uint8Array = util.parseUUID('a0b1c2d3-0001-4000-8000-000000000000');
        let second: Uint8Array = util.parseUUID('a0b1c2d3-0001-4000-8000-000000000000');
        first.$_set(0, 1);
        let actual1: number = Number(second.$_get(0));
        let expected1: int = 160;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(first.$_get(0));
        let expected2: int = 1;
        expect(actual2).assertEqual(expected2);

      }
      {
        let first: Uint8Array = util.parseUUID('a0b1c2d3-0001-4000-8000-000000000000');
        let second: Uint8Array = util.parseUUID('ffffffff-ffff-ffff-ffff-ffffffffffff');
        first.$_set(1, 2);
        let actual1: number = Number(second.$_get(1));
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(first.$_get(1));
        let expected2: int = 2;
        expect(actual2).assertEqual(expected2);

      }
      {
        let strUuid: string = util.generateRandomUUID(false);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let actual1: int = parsed.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let version: number = (Number(parsed.$_get(6)) >> 4) & 0x0f;
        let actual2: number = version;
        let expected2: number = 4;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0500
     * @tc.name testParseUuidCase001
     * @tc.desc Verify util.parseUUID with uppercase and lowercase UUID forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidCase001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let lower = util.generateRandomUUID();
        let upper = util.parseUUID(lower.toUpperCase());
        let origin = util.parseUUID(lower);
        let actual1: int = upper.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(upper.$_get(0));
        let expected2: number = Number(origin.$_get(0));
        expect(actual2).assertEqual(expected2);

      }
      {
        let upper: Uint8Array = util.parseUUID('A0B1C2D3-0001-4000-8000-000000000000');
        let lower: Uint8Array = util.parseUUID('a0b1c2d3-0001-4000-8000-000000000000');
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(upper.$_get(i));
          let expected1: number = Number(lower.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('a0b1c2d3-ffff-4000-8000-000000000000');
        let expected: Uint8Array = new Uint8Array([160, 177, 194, 211, 255, 255, 64, 0, 128, 0, 0, 0, 0, 0, 0, 0]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('a0b1c2d3-0001-1000-8000-000000000000');
        let actual1: int = result.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('a0b1c2d3-0001-4000-8000-000000000000');
        const expected: Uint8Array = new Uint8Array([160, 177, 194, 211, 0, 1, 64, 0, 128, 0, 0, 0, 0, 0, 0, 0]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let src: string = 'a0b1c2d3-0001-4000-8000-000000000000';
        let result: Uint8Array = util.parseUUID(src);
        expect(result.byteLength).assertEqual(16);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0600
     * @tc.name testParseUuidConsistency001
     * @tc.desc Verify util.parseUUID result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let result: Uint8Array = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        let expected: Uint8Array = new Uint8Array([
          132, 189, 247, 150, 102, 204, 70, 85, 155, 137, 214, 33, 141, 16, 15, 156,
        ]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('01234567-89ab-4cde-8f00-102132435465');
        let expected: Uint8Array = new Uint8Array([1, 35, 69, 103, 137, 171, 76, 222, 143, 0, 16, 33, 50, 67, 84, 101]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('ba987654-3210-4fed-cba9-876543210fed');
        let expected: Uint8Array = new Uint8Array([
          186, 152, 118, 84, 50, 16, 79, 237, 203, 169, 135, 101, 67, 33, 15, 237,
        ]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('a0a1a2a3-a4a5-4ba6-a8a7-a9aaabacadae');
        let expected: Uint8Array = new Uint8Array([
          160, 161, 162, 163, 164, 165, 75, 166, 168, 167, 169, 170, 171, 172, 173, 174,
        ]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('ffff0000-0000-4fff-8fff-ffffffffffff');
        let expected: Uint8Array = new Uint8Array([
          255, 255, 0, 0, 0, 0, 79, 255, 143, 255, 255, 255, 255, 255, 255, 255,
        ]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('12345678-9abc-4def-8fed-cba987654321');
        let expected: Uint8Array = new Uint8Array([
          18, 52, 86, 120, 154, 188, 77, 239, 143, 237, 203, 169, 135, 101, 67, 33,
        ]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('12345678-9abc-4def-8fed-0123456789ab');
        let expected: Uint8Array = new Uint8Array([
          18, 52, 86, 120, 154, 188, 77, 239, 143, 237, 1, 35, 69, 103, 137, 171,
        ]);
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: number = Number(expected.$_get(i));
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('00000000-0000-0000-0000-000000000000');
        let actual1: int = result.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('ffffffff-ffff-ffff-ffff-ffffffffffff');
        let actual1: int = result.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('01234567-89ab-4cde-8f00-102132435465');
        let actual1: int = result.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0700
     * @tc.name testParseUuidConsistency002
     * @tc.desc Verify util.parseUUID result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let result: Uint8Array = util.parseUUID('ffff0000-0000-4fff-8fff-ffffffffffff');
        let actual1: int = result.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
        let actual1: int = result.byteOffset;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0800
     * @tc.name testParseUuidBoundary001
     * @tc.desc Verify util.parseUUID with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let longUuid: string = "84bdf796-66cc-4655-9b89-d6218d100f9c" + 'x'.repeat(10000);
        let actual1: number = parseUUIDErrCode(longUuid);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr('5'.repeat(10000));
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_0900
     * @tc.name testParseUuidBasic001
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let actual1: number = parseUUIDErrCodeAny(undefined);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCodeAny(null);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let bytes = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 132;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(7));
        let expected3: int = 85;
        expect(actual3).assertEqual(expected3);
        let actual4: number = Number(bytes.$_get(15));
        let expected4: int = 156;
        expect(actual4).assertEqual(expected4);

      }
      {
        let bytes = util.parseUUID("ffffffff-ffff-ffff-ffff-ffffffffffff");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
      {
        let bytes = util.parseUUID("6ba7b810-9dad-11d1-80b4-00c04fd430c8");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 107;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 200;
        expect(actual3).assertEqual(expected3);

      }
      {
        let bytes = util.parseUUID("886313e1-3b8a-5372-9b90-0c9aee199e5d");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 136;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 93;
        expect(actual3).assertEqual(expected3);

      }
      {
        let bytes = util.parseUUID("6ba7b810-9dad-51d1-b0b4-00c04fd430c8");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(8));
        let expected2: int = 176;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 200;
        expect(actual3).assertEqual(expected3);

      }
      {
        let bytes = util.parseUUID("80818283-8485-8687-8889-8a8b8c8d8e8f");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 128;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 143;
        expect(actual3).assertEqual(expected3);

      }
      {
        let bytes = util.parseUUID("01234567-89ab-cdef-0123-456789abcdef");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 1;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(3));
        let expected3: int = 103;
        expect(actual3).assertEqual(expected3);
        let actual4: number = Number(bytes.$_get(15));
        let expected4: int = 239;
        expect(actual4).assertEqual(expected4);

      }
      {
        let bytes = util.parseUUID("abcdefab-cdef-efab-cdef-abcdefabcdef");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 171;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 239;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_1000
     * @tc.name testParseUuidBasic002
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let bytes = util.parseUUID("ffffffff-0000-0000-0000-ffffffffffff");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(4));
        let expected3: int = 0;
        expect(actual3).assertEqual(expected3);
        let actual4: number = Number(bytes.$_get(10));
        let expected4: int = 255;
        expect(actual4).assertEqual(expected4);

      }
      {
        let bytes = util.parseUUID("7f7f7f7f-7f7f-7f7f-7f7f-7f7f7f7f7f7f");
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(bytes.$_get(0));
        let expected2: int = 127;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(bytes.$_get(15));
        let expected3: int = 127;
        expect(actual3).assertEqual(expected3);

      }
      {
        let upper = util.parseUUID("84BDF796-66CC-4655-9B89-D6218D100F9C");
        let actual1: int = upper.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(upper.$_get(0));
        let expected2: int = 132;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(upper.$_get(15));
        let expected3: int = 156;
        expect(actual3).assertEqual(expected3);

      }
      {
        let abcd = util.parseUUID("aBcD1234-ABCD-1234-abcd-ABCD1234abcd");
        let actual1: int = abcd.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(abcd.$_get(0));
        let expected2: int = 171;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(abcd.$_get(15));
        let expected3: int = 205;
        expect(actual3).assertEqual(expected3);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf79666cc46559b89d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655-9b89-d6218d100f9g");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655-9b89-d6218d100f9z");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796_66cc_4655_9b89_d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655-9b89-d6218d100f中");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655-9b89-d6218d100f９");
        let expected1: int =-1;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_1100
     * @tc.name testParseUuidBasic003
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let actual1: number = parseUUIDErrCode('');
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode('f');
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655-9b89-d6218d100f9");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode(" 84bdf796-66cc-4655-9b89-d6218d100f9c ");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796- 66cc-4655-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655-9b89-d6218d100f9\nc");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCode("84bdf796-66cc-4655\t-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCodeAny(42);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrCodeAny(true);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_1200
     * @tc.name testParseUuidBasic004
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let actual1: number = parseUUIDErrCodeAny(new PlainObj());
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let arr: int[] = [1, 2, 3];
        let actual1: number = parseUUIDErrCodeAny(arr);
        let expected1: int =-1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let ta: Uint8Array = new Uint8Array([1, 2, 3]);
        let actual1: number = parseUUIDErrCodeAny(ta);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let m = new Map<string, int>();
        let actual1: number = parseUUIDErrCodeAny(m);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let s = util.generateRandomUUID();
        let bytes = util.parseUUID(s);
        let actual1: int = bytes.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result: Uint8Array = util.parseUUID('00000000-0000-0000-0000-000000000000');
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let result: Uint8Array = util.parseUUID('ffffffff-ffff-ffff-ffff-ffffffffffff');
        for (let i: int = 0; i < 16; i++) {
          let actual1: number = Number(result.$_get(i));
          let expected1: int = 255;
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let src: string = '84bdf796-66cc-4655-9b89-d6218d100f9c';
        let result: Uint8Array = util.parseUUID(src);
        expect(result.byteLength).assertEqual(16);

      }
      {
        let strUuid: string = util.generateRandomUUID(true);
        let parsed: Uint8Array = util.parseUUID(strUuid);
        let nibble: int = (Number(parsed.$_get(6)) >> 4).toInt();
        expect(nibble).assertEqual(4);

      }
      {
        let binUuid: Uint8Array | undefined = util.generateRandomBinaryUUID(true);
        if (binUuid == undefined) {
          expect().assertFail();
          return;
        }
        let masked: int = (Number(binUuid.$_get(8)) & 192).toInt();
        expect(masked).assertEqual(128);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_1300
     * @tc.name testParseUuidBasic005
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let actual1: number = parseUUIDErr("84bdf796-66cc-4655-9b89-d6218d100f9c".substring(0, 2));
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr('a'.repeat(1000));
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrAny(Number.NaN);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErrAny(Number.POSITIVE_INFINITY);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let sarr: string[] = ['a', 'b'];
        let actual1: number = parseUUIDErrAny(sarr);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let s = new Set<int>();
        let actual1: number = parseUUIDErrAny(s);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let re: RegExp = new RegExp('a');
        let actual1: number = parseUUIDErrAny(re);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let d: Date = new Date(0);
        let actual1: number = parseUUIDErrAny(d);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let e = new Error("boom");
        let actual1: number = parseUUIDErrAny(e);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let fn = (): void => {};
        let actual1: number = parseUUIDErrAny(fn);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_1400
     * @tc.name testParseUuidBasic006
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let bi: bigint = BigInt(1);
        let actual1: number = parseUUIDErrAny(bi);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let rec: PlainRec = { x: 1 };
        let actual1: number = parseUUIDErrAny(rec);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let wk = new WeakMap<Object, int>();
        let actual1: number = parseUUIDErrAny(wk);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let ws = new WeakSet<Object>();
        let actual1: number = parseUUIDErrAny(ws);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let pr: Promise<int> = Promise.resolve(1);
        let actual1: number = parseUUIDErrAny(pr);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let ab: ArrayBuffer = new ArrayBuffer(4);
        let actual1: number = parseUUIDErrAny(ab);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let dv: DataView = new DataView(new ArrayBuffer(4));
        let actual1: number = parseUUIDErrAny(dv);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let i32 = new Int32Array([1, 2, 3]);
        let actual1: number = parseUUIDErrAny(i32);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("--84bdf796-66cc-4655-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("84bdf796-66cc 4655-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PARSE_UUID_1500
     * @tc.name testParseUuidBasic007
     * @tc.desc Verify util.parseUUID with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseUuidBasic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let actual1: number = parseUUIDErr("h4bdf796-66cc-4655-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("84bdf796-66uu-4655-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("84bdf796-66cc-4x55-9b89-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("84bdf796-66cc-4655-9bo9-d6218d100f9c");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("84bdf796-66cc-4655-9b89-d6218d100f9cn");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: number = parseUUIDErr("84bdf796-66cc-4655-9b89-d6218d100f9@");
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let msg: string = parseUUIDErrMsg("84bdf796-66cc-4655-9b89-d6218d100f9q");
        expect(msg.indexOf('{')).assertEqual(0);

      }
      {
        let first: number = parseUUIDErr("84bdf796-66cc-4655-9b89-d6218d100f9q");
        expect(first).assertEqual(-1);

      }
      {
        let first: number = parseUUIDErr("84bdf796-66cc-4655-9b89d6218-d100f9c");
        expect(first).assertEqual(-1);
        let second: number = parseUUIDErr("84bdf796-66cc-4655-9b89-d6218d100f9#");
        expect(second).assertEqual(-1);

      }
    });

  });
}
