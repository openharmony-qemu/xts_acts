'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Pinch,
  ActionType,
  Rotate,
  ThreeFingersSwipe,
  FourFingersSwipe,
  ThreeFingersTap,
} from '@ohos.multimodalInput.gestureEvent';
import hilog from '@ohos.hilog';
import { BusinessError } from "@ohos.base";
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function MultimodalGestureEventTest() {
  describe("MultimodalGestureEventTest", (): void => {

    /**
     * @tc.name   SUB_MMI_Input_Api_GestureEvent_0100
     * @tc.number SUB_MMI_Input_Api_GestureEvent_0100
     * @tc.desc   Test GestureEvent Pinch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_GestureEvent_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_GestureEvent_0100";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let pinch: Pinch = {
            type: ActionType.BEGIN,
            scale: 1
          }
          expect(pinch.type == 1).assertTrue();
          expect(pinch.scale == 1).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_GestureEvent_0200
     * @tc.number SUB_MMI_Input_Api_GestureEvent_0200
     * @tc.desc   Test GestureEvent Rotate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_GestureEvent_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_GestureEvent_0200";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let rotate: Rotate = {
            type: ActionType.BEGIN,
            angle: 0
          }
          expect(rotate.type == 1).assertTrue();
          expect(rotate.angle == 0).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_GestureEvent_0300
     * @tc.number SUB_MMI_Input_Api_GestureEvent_0300
     * @tc.desc   Test GestureEvent ThreeFingersSwipe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_GestureEvent_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_GestureEvent_0300";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let ThreeFingersSwipe: ThreeFingersSwipe[] = [{
            type: ActionType.UPDATE,
            x: 1,
            y: 2
          }];
          expect(ThreeFingersSwipe[0].type == 2).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_GestureEvent_0400
     * @tc.number SUB_MMI_Input_Api_GestureEvent_0400
     * @tc.desc   Test GestureEvent FourFingersSwipe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_GestureEvent_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_GestureEvent_0400";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let FourFingersSwipe: FourFingersSwipe[] = [{
            type: ActionType.END,
            x: 1,
            y: 2
          }];
          console.info(`${caseName} success, FourFingersSwipe is ${JSON.stringify(FourFingersSwipe)}`);
          expect(FourFingersSwipe[0].type == 3).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_GestureEvent_0500
     * @tc.number SUB_MMI_Input_Api_GestureEvent_0500
     * @tc.desc   Test GestureEvent ThreeFingersTap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_GestureEvent_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_GestureEvent_0500";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          let ThreeFingersTap: ThreeFingersTap[] = [{
            type: ActionType.CANCEL
          }];
          console.info(`${caseName} success, ThreeFingersTap is ${JSON.stringify(ThreeFingersTap)}`);
          expect(ThreeFingersTap[0].type == 0).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });

    /**
     * @tc.name   SUB_MMI_Input_Api_GestureEvent_0600
     * @tc.number SUB_MMI_Input_Api_GestureEvent_0600
     * @tc.desc   Test GestureEvent ActionType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MMI_Input_Api_GestureEvent_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_GestureEvent_0600";
        hilog.info(domain, tag, `${caseName} enter`);
        try {
          expect(ActionType.CANCEL == 0).assertTrue();
          expect(ActionType.BEGIN == 1).assertTrue();
          expect(ActionType.UPDATE == 2).assertTrue();
          expect(ActionType.END == 3).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
          expect().assertFail();
          done();
        }
        hilog.info(domain, tag, `${caseName} leave`);
      });
  })
}