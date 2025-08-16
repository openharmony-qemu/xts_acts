/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ModalBlurStyle() {
  describe('ModalBlurStyle', () => {

    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ModalBlurStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/ModalBlurStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ModalBlurStyle state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ModalBlurStyle pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ModalBlurStyle page error:" + err);
      }
      console.info("ModalBlurStyle beforeEach end");
    });


    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('blurStyle_init'));
      await ((button?.click()) as Promise<void>)
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /*
     * @tc.number    ModalBlurStyle_static_0100
     * @tc.name      ModalBlurStyle_static_0100
     * @tc.desc      ModalBlurStyle_static_0100
     * @tc.level     2
     */
    it('ModalBlurStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0100 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('blurStyle_1'));
      await ((button?.click()) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blurStyle_1');

      console.info("[ModalBlurStyle_0100] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalBlurStyle_0100] bindSheet: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('bindSheet')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 1');
      console.info('[ModalBlurStyle_0100] END');
      done();
    });

    /*
     * @tc.number    ModalBlurStyle_static_0200
     * @tc.name      ModalBlurStyle_static_0200
     * @tc.desc      ModalBlurStyle_static_0200
     * @tc.level     2
     */
    it('ModalBlurStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0200 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('blurStyle_2'));
      await ((button?.click()) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blurStyle_2');
      console.info("[ModalBlurStyle_0200] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalBlurStyle_0200] bindSheet: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('bindSheet')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 2');
      console.info('[ModalBlurStyle_0200] END');
      done();
    });

    /*
     * @tc.number    ModalBlurStyle_static_0300
     * @tc.name      ModalBlurStyle_static_0300
     * @tc.desc      ModalBlurStyle_static_0300
     * @tc.level     2
     */
    it('ModalBlurStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0300 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('blurStyle_3'));
      await ((button?.click()) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blurStyle_3');
      console.info("[ModalBlurStyle_0300] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalBlurStyle_0300] bindSheet: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('bindSheet')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 3');
      console.info('[ModalBlurStyle_0300] END');
      done();
    });

    /*
     * @tc.number    ModalBlurStyle_static_0400
     * @tc.name      ModalBlurStyle_static_0400
     * @tc.desc      ModalBlurStyle_static_0400
     * @tc.level     2
     */
    it('ModalBlurStyle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0400 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = (await driver.findComponent(ON.type('Scroll'))) as Component;
      let button = await scrollBar.scrollSearch(ON.id('blurStyle_4'));
      await ((button?.click()) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blurStyle_4');
      console.info("[ModalBlurStyle_0400] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalBlurStyle_0400] bindSheet: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('bindSheet')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 4');
      console.info('[ModalBlurStyle_0400] END');
      done();
    });

    /*
     * @tc.number    ModalBlurStyle_static_0500
     * @tc.name      ModalBlurStyle_static_0500
     * @tc.desc      ModalBlurStyle_static_0500
     * @tc.level     2
     */
    it('ModalBlurStyle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0500 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let scrollBar: Component = (await driver.findComponent(ON.type('Scroll'))) as Component;
      let button = await scrollBar.scrollSearch(ON.id('blurStyle_5'));
      await ((button?.click()) as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('blurStyle_5');
      console.info("[ModalBlurStyle_0500] component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[ModalBlurStyle_0500] bindSheet: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('bindSheet')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 5');
      console.info('[ModalBlurStyle_0500] END');
      done();
    });
  })
}