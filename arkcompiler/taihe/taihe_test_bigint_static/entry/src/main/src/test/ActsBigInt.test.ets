'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import * as bigint_new from '../ets/Index'

export default function bigIntTest(): void {
  describe("ActsBigIntTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ProcessBigInt_STATIC_0100
     * @tc.name      test_ProcessBigInt_Static_0001
     * @tc.desc      processBigInt with (1n << 63n) - 1n (max positive signed 64-bit)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ProcessBigInt_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ProcessBigInt_Static_0001 start');
      let arg: bigint = (1n << 63n) - 1n;
      let res: bigint = bigint_new.processBigInt(arg);
      expect(res).assertEqual(arg << 64n);
      console.log('test_ProcessBigInt_Static_0001 done');
      done();
      console.log('test_ProcessBigInt_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ProcessBigInt_STATIC_0200
     * @tc.name      test_ProcessBigInt_Static_0002
     * @tc.desc      processBigInt with 1n << 63n (min positive unsigned 64-bit boundary)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ProcessBigInt_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ProcessBigInt_Static_0002 start');
      let arg: bigint = 1n << 63n;
      let res: bigint = bigint_new.processBigInt(arg);
      expect(res).assertEqual(arg << 64n);
      console.log('test_ProcessBigInt_Static_0002 done');
      done();
      console.log('test_ProcessBigInt_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_ProcessBigInt_STATIC_0300
     * @tc.name      test_ProcessBigInt_Static_0003
     * @tc.desc      processBigInt with (1n << 64n) - 1n (max unsigned 64-bit)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ProcessBigInt_Static_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ProcessBigInt_Static_0003 start');
      let arg: bigint = (1n << 64n) - 1n;
      let res: bigint = bigint_new.processBigInt(arg);
      expect(res).assertEqual(arg << 64n);
      console.log('test_ProcessBigInt_Static_0003 done');
      done();
      console.log('test_ProcessBigInt_Static_0003 end');
    });

    /**
     * @tc.number    SUB_Taihe_ProcessBigInt_STATIC_0400
     * @tc.name      test_ProcessBigInt_Static_0004
     * @tc.desc      processBigInt with 1n << 64n (just above 64-bit)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ProcessBigInt_Static_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ProcessBigInt_Static_0004 start');
      let arg: bigint = 1n << 64n;
      let res: bigint = bigint_new.processBigInt(arg);
      expect(res).assertEqual(arg << 64n);
      console.log('test_ProcessBigInt_Static_0004 done');
      done();
      console.log('test_ProcessBigInt_Static_0004 end');
    });

    /**
     * @tc.number    SUB_Taihe_ProcessBigInt_STATIC_0500
     * @tc.name      test_ProcessBigInt_Static_0005
     * @tc.desc      processBigInt with -1n << 63n (negative large)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ProcessBigInt_Static_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ProcessBigInt_Static_0005 start');
      let arg: bigint = -1n << 63n;
      let res: bigint = bigint_new.processBigInt(arg);
      expect(res).assertEqual(arg << 64n);
      console.log('test_ProcessBigInt_Static_0005 done');
      done();
      console.log('test_ProcessBigInt_Static_0005 end');
    });

    /**
     * @tc.number    SUB_Taihe_ProcessBigInt_STATIC_0600
     * @tc.name      test_ProcessBigInt_Static_0006
     * @tc.desc      processBigInt with -1n << 64n (negative larger)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ProcessBigInt_Static_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ProcessBigInt_Static_0006 start');
      let arg: bigint = -1n << 64n;
      let res: bigint = bigint_new.processBigInt(arg);
      expect(res).assertEqual(arg << 64n);
      console.log('test_ProcessBigInt_Static_0006 done');
      done();
      console.log('test_ProcessBigInt_Static_0006 end');
    });

    /**
     * @tc.number    SUB_Taihe_PrintBigInt_STATIC_0100
     * @tc.name      test_PrintBigInt_Static_0001
     * @tc.desc      printBigInt prints bigint values via stderr
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_PrintBigInt_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_PrintBigInt_Static_0001 start');
      let success: boolean = false;
      try {
        let num1: bigint = 18446744073709551616n;
        bigint_new.printBigInt(num1);
        let num2: bigint = -65535n;
        bigint_new.printBigInt(num2);
        success = true;
      } catch (e) {
        console.log('printBigInt failed', e.message);
      }
      expect(success).assertEqual(true);
      console.log('test_PrintBigInt_Static_0001 done');
      done();
      console.log('test_PrintBigInt_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CreateBigInt_STATIC_0100
     * @tc.name      test_CreateBigInt_Static_0001
     * @tc.desc      createBigInt copies a bigint value round-trip through C++
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CreateBigInt_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CreateBigInt_Static_0001 start');
      let num1: bigint = 18446744073709551616n;
      let res: bigint = bigint_new.createBigInt(num1);
      expect(res!.toString()).assertEqual(num1.toString());
      console.log('test_CreateBigInt_Static_0001 done');
      done();
      console.log('test_CreateBigInt_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_WantBigInt_STATIC_0100
     * @tc.name      test_WantBigInt_Static_0001
     * @tc.desc      Want interface set/get bigint property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_WantBigInt_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_WantBigInt_Static_0001 start');
      let want: bigint_new.Want = bigint_new.getWant();
      want.bigInt = 123n;
      let res: bigint = want.bigInt;
      expect(res).assertEqual(123n);
      console.log('test_WantBigInt_Static_0001 done');
      done();
      console.log('test_WantBigInt_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_SetupStructAndPrint_STATIC_0100
     * @tc.name      test_SetupStructAndPrint_Static_0001
     * @tc.desc      setupStructAndPrint passes struct containing bigint to C++
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_SetupStructAndPrint_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_SetupStructAndPrint_Static_0001 start');
      let success: boolean = false;
      try {
        let a: bigint_new.BigInt1 = {a: 123n};
        bigint_new.setupStructAndPrint(a);
        success = true;
      } catch (e) {
        console.log('setupStructAndPrint failed', e.message);
      }
      expect(success).assertEqual(true);
      console.log('test_SetupStructAndPrint_Static_0001 done');
      done();
      console.log('test_SetupStructAndPrint_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_GetBigIntOptional_STATIC_0100
     * @tc.name      test_GetBigIntOptional_Static_0001
     * @tc.desc      getBigIntOptional with bigint value (has optional)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetBigIntOptional_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetBigIntOptional_Static_0001 start');
      let a: bigint = 123n;
      let res: bigint = bigint_new.getBigIntOptional(a);
      expect(res).assertEqual(123n);
      console.log('test_GetBigIntOptional_Static_0001 done');
      done();
      console.log('test_GetBigIntOptional_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_GetBigIntOptional_STATIC_0200
     * @tc.name      test_GetBigIntOptional_Static_0002
     * @tc.desc      getBigIntOptional with undefined (no optional)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GetBigIntOptional_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_GetBigIntOptional_Static_0002 start');
      let res: bigint = bigint_new.getBigIntOptional(undefined);
      expect(res).assertEqual(0n);
      console.log('test_GetBigIntOptional_Static_0002 done');
      done();
      console.log('test_GetBigIntOptional_Static_0002 end');
    });

    /**
     * @tc.number    SUB_Taihe_MapBigInt_STATIC_0100
     * @tc.name      test_MapBigInt_Static_0001
     * @tc.desc      mapBigInt round-trips Record<string, bigint> through C++
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MapBigInt_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MapBigInt_Static_0001 start');
      let data: Record<string, bigint> = {"key1": 123n};
      let res: Record<string, bigint> = bigint_new.mapBigInt(data);
      expect(res["key1"]!).assertEqual(123n);
      console.log('test_MapBigInt_Static_0001 done');
      done();
      console.log('test_MapBigInt_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_MyUnion_STATIC_0100
     * @tc.name      test_MyUnion_Static_0001
     * @tc.desc      MyUnion with bigint, string, and null variants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MyUnion_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_MyUnion_Static_0001 start');
      // union bigInt
      let bigIntData: bigint = 1020847100762815390427017310442723737601n;
      bigint_new.showMyUnion(bigIntData);
      let bigIntResult: bigint_new.MyUnion = bigint_new.makeMyUnion(1);
      expect(bigIntData).assertEqual(bigIntResult);

      // union string
      let strData: string = "this is string data";
      bigint_new.showMyUnion(strData);
      let strResult: bigint_new.MyUnion = bigint_new.makeMyUnion(2);
      expect(strData).assertEqual(strResult);

      // union null (empty)
      bigint_new.showMyUnion(null);
      let nullResult: bigint_new.MyUnion = bigint_new.makeMyUnion(0);
      expect(nullResult).assertEqual(null);
      console.log('test_MyUnion_Static_0001 done');
      done();
      console.log('test_MyUnion_Static_0001 end');
    });
  })
}