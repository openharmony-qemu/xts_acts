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

export default function baseTypeStringTest(): void {
  describe("ActsBaseTypeStringTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_String_Concatx_STATIC_0100
     * @tc.name      test_String_Concatx_Static_0001
     * @tc.desc      Concatx should concatenate two strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Concatx_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_String_Concatx_Static_0001 start');
      let res: string = test_base.concatx("tai", "he");
      expect(res).assertEqual("taihe");
      console.log('test_String_Concatx_Static_0001 done');
      done();
      console.log('test_String_Concatx_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_String_Splitx_STATIC_0100
     * @tc.name      test_String_Splitx_Static_0001
     * @tc.desc      Splitx should return the prefix of a string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_Splitx_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_String_Splitx_Static_0001 start');
      let res: string = test_base.splitx("taihe", 3);
      expect(res).assertEqual("tai");
      console.log('test_String_Splitx_Static_0001 done');
      done();
      console.log('test_String_Splitx_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_String_ToI32_STATIC_0100
     * @tc.name      test_String_ToI32_Static_0001
     * @tc.desc      ToI32 should parse a string to int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_ToI32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_String_ToI32_Static_0001 start');
      let res: int = test_base.toI32("10");
      expect(res).assertEqual(10);
      console.log('test_String_ToI32_Static_0001 done');
      done();
      console.log('test_String_ToI32_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_String_FromI32_STATIC_0100
     * @tc.name      test_String_FromI32_Static_0001
     * @tc.desc      FromI32 should convert an int to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_String_FromI32_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_String_FromI32_Static_0001 start');
      let res: string = test_base.fromI32(10);
      expect(res).assertEqual("10");
      console.log('test_String_FromI32_Static_0001 done');
      done();
      console.log('test_String_FromI32_Static_0001 end');
    });
  })
}
