/*
 * Copyright (C) 2026 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium-dynamic';
import { pointer } from '@kit.InputKit';
import { BusinessError } from '@ohos.base';

export default function PointerTest() {
  describe("PointerTest", () => {
    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyle_0900
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_0900
     * @tc.desc   Test callback setPointerStyle interface when the windowId is -1, expect 202 error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0900";
        console.info(`${caseName} enter`);
        try {
          pointer.setPointerStyle(-1, pointer.PointerStyle.CROSS, (error: BusinessError) => {
            console.info(`${caseName} Set pointer style success`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect(error.code).assertEqual(202);
          done();
        }
        console.info(`${caseName} exit`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyle_1000
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyle_1000
     * @tc.desc   Test promise setPointerStyle interface when the windowId is -1, expect 202 error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_1000";
        console.info(`${caseName} enter`);
        try {
          pointer.setPointerStyle(-1, pointer.PointerStyle.CROSS).then(() => {
            console.info(`${caseName} Set pointer style success`);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect(error.code).assertEqual(202);
          done();
        }
        console.info(`${caseName} exit`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0600
     * @tc.number SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0600
     * @tc.desc   Test setPointerStyleSync interface when the windowId is -1, expect 202 error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0600";
        console.info(`${caseName} enter`);
        try {
          pointer.setPointerStyleSync(-1, pointer.PointerStyle.CROSS);
          console.info(`${caseName} Set pointer style success`);
          expect().assertFail();
          done();
        } catch (error) {
          console.info(`${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect(error.code).assertEqual(202);
          done();
        }
        console.info(`${caseName} exit`);
      });
  });
}
