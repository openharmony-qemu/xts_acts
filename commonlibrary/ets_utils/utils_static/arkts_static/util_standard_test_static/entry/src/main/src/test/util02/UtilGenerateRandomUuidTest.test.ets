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

export default function utilGenerateRandomUuidTest(): void {
  describe("UtilGenerateRandomUuidTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_UUID_0100
     * @tc.name testUtilGenerateRandomUuidTest001
     * @tc.desc Verify generateRandomUUID returns a 36-char string for no-arg/true/false and a boolean expression arg
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomUuidTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuids: string[] = [
        util.generateRandomUUID(),
        util.generateRandomUUID(true),
        util.generateRandomUUID(false)
      ];
      for (let i = 0; i < uuids.length; i++) {
        let actualType: string = typeof uuids[i];
        let expectedType: string = "string";
        expect(actualType).assertEqual(expectedType);
        expect(uuids[i].length).assertEqual(36);
      }
      let arg: boolean = util.generateRandomUUID(true) !== undefined;
      let exprUuid: string = util.generateRandomUUID(arg);
      let actualExprType: string = typeof exprUuid;
      let expectedExprType: string = "string";
      expect(actualExprType).assertEqual(expectedExprType);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_UUID_0200
     * @tc.name testUtilGenerateRandomUuidTest002
     * @tc.desc Verify the dash-separated structure: first segment is 8 chars and split/join round-trip preserves the UUID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomUuidTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = util.generateRandomUUID();
      let actualValue: int = uuid.split("-")[0].length;
      let expectedValue: int = 8;
      expect(actualValue).assertEqual(expectedValue);
      let rebuilt: string = uuid.split("-").join("-");
      expect(rebuilt).assertEqual(uuid);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_UUID_0300
     * @tc.name testUtilGenerateRandomUuidTest003
     * @tc.desc Verify consecutive and iterated calls yield distinct UUIDs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomUuidTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = util.generateRandomUUID();
      let b: string = util.generateRandomUUID();
      expect(a !== b).assertTrue();

      let first: string = "";
      let second: string = "";
      for (let i = 0; i < 1025; i++) {
        let u: string = util.generateRandomUUID(false);
        if (i === 1023) {
          first = u;
        }
        if (i === 1024) {
          second = u;
        }
      }
      expect(first !== second).assertTrue();

      let prev: string = "";
      for (let i = 0; i < 384; i++) {
        prev = util.generateRandomUUID();
      }
      let next: string = util.generateRandomUUID(true);
      expect(prev !== next).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_UUID_0400
     * @tc.name testUtilGenerateRandomUuidTest004
     * @tc.desc Verify uniqueness and 36-char length across many iterations with no-arg/true/false/mixed args
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomUuidTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let configs: int[] = [128, 200, 384, 512, 768, 1024];
      let flags: boolean[] = [true, true, true, false, false, true];
      for (let c = 0; c < configs.length; c++) {
        let set: Set<string> = new Set<string>();
        for (let i = 0; i < configs[c]; i++) {
          let u: string = util.generateRandomUUID(flags[c]);
          expect(u.length).assertEqual(36);
          set.add(u);
        }
        expect(set.size).assertEqual(configs[c]);
      }

      let noArgSet: Set<string> = new Set<string>();
      for (let i = 0; i < 200; i++) {
        let u: string = util.generateRandomUUID();
        expect(u.length).assertEqual(36);
        noArgSet.add(u);
      }
      expect(noArgSet.size).assertEqual(200);

      let mixedSet: Set<string> = new Set<string>();
      for (let i = 0; i < 65; i++) {
        mixedSet.add(util.generateRandomUUID(true));
        mixedSet.add(util.generateRandomUUID(false));
      }
      expect(mixedSet.size).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_UUID_0500
     * @tc.name testUtilGenerateRandomUuidTest005
     * @tc.desc Verify every character is a hex digit (0-9 a-f) or a dash
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomUuidTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let allAllowed: boolean = true;
      for (let i = 0; i < 64; i++) {
        let u: string = util.generateRandomUUID(true);
        for (let j = 0; j < u.length; j++) {
          let cc: number = u.charCodeAt(j);
          let allowed: boolean = (cc === 45) || (cc >= 48 && cc <= 57) || (cc >= 97 && cc <= 102);
          if (!allowed) {
            allAllowed = false;
          }
        }
      }
      expect(allAllowed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_GENERATE_RANDOM_UUID_0600
     * @tc.name testUtilGenerateRandomUuidTest006
     * @tc.desc Verify a UUID is usable as a Map key and as a Set element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilGenerateRandomUuidTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uuid: string = util.generateRandomUUID();

      let m: Map<string, int> = new Map<string, int>();
      m.set(uuid, 1);
      let actualMap: int = m.get(uuid) as int;
      let expectedMap: int = 1;
      expect(actualMap).assertEqual(expectedMap);

      let set: Set<string> = new Set<string>();
      set.add(uuid);
      expect(set.size).assertEqual(1);
      let got: string = "";
      set.forEach((v: string) => {
        got = v;
      });
      expect(got).assertEqual(uuid);
      let hasIt: boolean = set.has(uuid);
      expect(hasIt).assertTrue();
    });

  });
}
