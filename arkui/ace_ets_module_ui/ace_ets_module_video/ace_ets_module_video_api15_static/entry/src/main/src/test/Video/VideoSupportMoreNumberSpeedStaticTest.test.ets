'use static';

/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "@ohos/hypium-binary/src/main/indexStatic"
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import { PlaybackSpeed } from '@ohos.arkui.component';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import events_emitter from '@ohos.events.emitter';
import { KeyCode } from '@ohos.multimodalInput.keyCode'
import { BusinessError } from '@ohos.base';
import { startAbility, stopApplication, UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function VideoSupportMoreNumberSpeedStaticTest() {
  describe('VideoSupportMoreNumberSpeedStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("VideoSupportMoreNumberSpeedStaticTest beforeEach start");
      await startAbility("com.arkui.ace.video.api15.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("VideoSupportMoreNumberSpeedStaticTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Video/VideoSupportMoreNumberSpeedStatic",
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get VideoSupportMoreNumberSpeedStatic state pages: " + JSON.stringify(pages));
        if (!("VideoSupportMoreNumberSpeedStatic" == pages.name)) {
          console.info("get VideoSupportMoreNumberSpeedStatic state pages.name: " + JSON.stringify(pages.name));
          
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push VideoSupportMoreNumberSpeedStatic page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   VideoSupportMoreNumberSpeedStaticTest_0100
     * @tc.number SUB_ARKUI_API_VideoSupportMoreNumberSpeedStaticTest_0100
     * @tc.desc   VideoAPI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('VideoSupportMoreNumberSpeedStaticTest_0100', Level.LEVEL0, async (done: () => void) => {
      console.info('VideoSupportMoreNumberSpeedStaticTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(2000);

      let button = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeedStart'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let button1 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_0.025'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button2 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_0.125'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson2 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button3 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_0.5'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson3 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button4 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_1'));
      await (button4?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson4 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button5 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_2'));
      await (button5?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson5 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button6 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_3'));
      await (button6?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson6 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button7 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_4'));
      await (button7?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson7 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button8 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_5'));
      await (button8?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson8 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button9 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_6'));
      await (button9?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson9 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button10 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_7'));
      await (button10?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson10 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button11 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_8'));
      await (button11?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson11 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      let button12 = await driver.findComponent(ON.id('VideoSupportMoreNumberSpeed_n_9'));
      await (button12?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson12 = inspector.getInspectorByKey('VideoSupportMoreNumberSpeedText');

      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0.025');
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('0.125');
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('0.5');
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')).assertEqual('1');
      expect(JSON.parseJsonElement(strJson5).getElement('$attrs').getString('content')).assertEqual('2');
      expect(JSON.parseJsonElement(strJson6).getElement('$attrs').getString('content')).assertEqual('3');
      expect(JSON.parseJsonElement(strJson7).getElement('$attrs').getString('content')).assertEqual('4');
      expect(JSON.parseJsonElement(strJson8).getElement('$attrs').getString('content')).assertEqual('5');
      expect(JSON.parseJsonElement(strJson9).getElement('$attrs').getString('content')).assertEqual('6');
      expect(JSON.parseJsonElement(strJson10).getElement('$attrs').getString('content')).assertEqual('7');
      expect(JSON.parseJsonElement(strJson11).getElement('$attrs').getString('content')).assertEqual('8');
      expect(JSON.parseJsonElement(strJson12).getElement('$attrs').getString('content')).assertEqual('9');

      console.info('[VideoSupportMoreNumberSpeedStaticTest_0100] END');
      done();
    });

  })
}