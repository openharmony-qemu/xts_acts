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
import { Action } from '@ohos.multimodalInput.touchEvent';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index"
import { BusinessError } from "@ohos.base"
import hilog from '@ohos.hilog'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function TouchEventTest(): void {
  describe("TouchEventTest", (): void => {
    /**
     * @tc.name   SUB_MMI_Input_Api_Static_TouchEvent_Action_0100
     * @tc.number SUB_MMI_Input_Api_Static_TouchEvent_Action_0100
     * @tc.desc   Test TouchEvent Action.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MMI_Input_Api_Static_TouchEvent_Action_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_Static_TouchEvent_Action_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(Action.PULL_DOWN === 4).assertTrue();
          expect(Action.PULL_MOVE === 5).assertTrue();
          expect(Action.PULL_UP === 6).assertTrue();
          done();
        } catch (error) {
          console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}