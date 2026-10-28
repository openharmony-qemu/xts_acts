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
import * as test_base from '../ets/base_test'

export default function baseTypeIntegerTest(): void {
  describe("ActsBaseTypeIntegerTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Integer_AddI8_STATIC_0100
     * @tc.name      test_Integer_AddI8_Static_0001
     * @tc.desc      AddI8 should return the byte sum of two bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Integer_AddI8_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Integer_AddI8_Static_0001 start');
      let res: byte = test_base.addI8((2).toByte(), (3).toByte());
      expect(res).assertEqual((5).toByte());
      console.log('test_Integer_AddI8_Static_0001 done');
      done();
      console.log('test_Integer_AddI8_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Integer_SubI16_STATIC_0100
     * @tc.name      test_Integer_SubI16_Static_0001
     * @tc.desc      SubI16 should return the short difference of two shorts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Integer_SubI16_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Integer_SubI16_Static_0001 start');
      let res: short = test_base.subI16((2).toShort(), (3).toShort());
      expect(res).assertEqual((-1).toShort());
      console.log('test_Integer_SubI16_Static_0001 done');
      done();
      console.log('test_Integer_SubI16_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Integer_MulI32_STATIC_0100
     * @tc.name      test_Integer_MulI32_Static_0001
     * @tc.desc      MulI32 should return the int product of two ints
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Integer_MulI32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Integer_MulI32_Static_0001 start');
      let res: int = test_base.mulI32(2, 3);
      expect(res).assertEqual(6);
      console.log('test_Integer_MulI32_Static_0001 done');
      done();
      console.log('test_Integer_MulI32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Integer_DivI64_STATIC_0100
     * @tc.name      test_Integer_DivI64_Static_0001
     * @tc.desc      DivI64 should return the long quotient of two longs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Integer_DivI64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Integer_DivI64_Static_0001 start');
      let res: long = test_base.divI64((2).toLong(), (2).toLong());
      expect(res).assertEqual((1).toLong());
      console.log('test_Integer_DivI64_Static_0001 done');
      done();
      console.log('test_Integer_DivI64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Integer_DivI64_STATIC_0200
     * @tc.name      test_Integer_DivI64_Static_0002
     * @tc.desc      DivI64 should throw an error when dividing by zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Integer_DivI64_Static_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Integer_DivI64_Static_0002 start');
      let caught: boolean = false;
      let errMsg: string = '';
      try {
        test_base.divI64((2).toLong(), (0).toLong());
      } catch (e) {
        caught = true;
        errMsg = e.toString();
      }
      expect(caught).assertTrue();
      expect(errMsg).assertEqual("Error: some error happen");
      console.log('test_Integer_DivI64_Static_0002 done');
      done();
      console.log('test_Integer_DivI64_Static_0002 end');
    });
  })
}
