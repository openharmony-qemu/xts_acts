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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import * as test_base from '../ets/base_test'

export default function baseTypeFloatTest(): void {
  describe("ActsBaseTypeFloatTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let tolerance: float = 0.00001f;

    /**
     * @tc.number    SUB_Taihe_Float_AddF32_STATIC_0100
     * @tc.name      test_Float_AddF32_Static_0001
     * @tc.desc      AddF32 should return the float sum of two floats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Float_AddF32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Float_AddF32_Static_0001 start');
      let res: float = test_base.addF32(2.5f, 3.5f);
      expect(Math.abs(res - 6.0) < tolerance).assertTrue();
      console.log('test_Float_AddF32_Static_0001 done');
      done();
      console.log('test_Float_AddF32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Float_SubF32_STATIC_0100
     * @tc.name      test_Float_SubF32_Static_0001
     * @tc.desc      SubF32 should return the float difference of two floats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Float_SubF32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Float_SubF32_Static_0001 start');
      let res: float = test_base.subF32(4.3f, 3.0f);
      expect(Math.abs(res - 1.3) < tolerance).assertTrue();
      console.log('test_Float_SubF32_Static_0001 done');
      done();
      console.log('test_Float_SubF32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Float_AddF64_STATIC_0100
     * @tc.name      test_Float_AddF64_Static_0001
     * @tc.desc      AddF64 should return the double sum of float and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Float_AddF64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Float_AddF64_Static_0001 start');
      let res: double = test_base.addF64(3.7f, 5.3);
      expect(Math.abs(res - 9.0) < tolerance).assertTrue();
      console.log('test_Float_AddF64_Static_0001 done');
      done();
      console.log('test_Float_AddF64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Float_SubF64_STATIC_0100
     * @tc.name      test_Float_SubF64_Static_0001
     * @tc.desc      SubF64 should return the double difference of float and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Float_SubF64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Float_SubF64_Static_0001 start');
      let res: double = test_base.subF64(3.5f, 1.0);
      expect(Math.abs(res - 2.5) < tolerance).assertTrue();
      console.log('test_Float_SubF64_Static_0001 done');
      done();
      console.log('test_Float_SubF64_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Float_MulF64_STATIC_0100
     * @tc.name      test_Float_MulF64_Static_0001
     * @tc.desc      MulF64 should return the double product of two floats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_Float_MulF64_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_Float_MulF64_Static_0001 start');
      let res: double = test_base.mulF64(2.5f, 4.0f);
      expect(Math.abs(res - 10.0) < tolerance).assertTrue();
      console.log('test_Float_MulF64_Static_0001 done');
      done();
      console.log('test_Float_MulF64_Static_0001 end');
    });
  })
}
