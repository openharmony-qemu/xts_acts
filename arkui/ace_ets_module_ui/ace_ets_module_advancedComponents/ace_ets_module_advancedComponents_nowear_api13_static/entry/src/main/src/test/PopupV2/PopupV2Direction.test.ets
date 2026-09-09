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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function PopupV2DirectionTest() {
  describe('PopupV2DirectionTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("PopupV2DirectionTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/PopupV2/PopupV2Direction",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PopupV2DirectionTest state pages:" + JSON.stringify(pages));
        if (!("PopupV2DirectionTest" == pages.name)) {
          console.info("get PopupV2DirectionTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push PopupV2DirectionTest page error:" + err);
      }
      console.info("PopupV2DirectionTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("PopupV2DirectionTest after each called");
    });

    /**
     * @tc.number   SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100
     * @tc.name     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100
     * @tc.desc     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100] START');
      await CommonFunc.sleep(1000);
      const driver = Driver.create();
      const PopupV2List = await driver.findComponents(ON.type('Image').within(ON.id('PopupV2DirectionExample')));
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100] length '+PopupV2List?.length);
      expect(PopupV2List?.length).assertEqual(4);
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200
     * @tc.name     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200
     * @tc.desc     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]

      console.info("[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200] component direction is: " + Btn.getElement('$attrs').getString('direction'));
      expect(Btn.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300
     * @tc.name     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300
     * @tc.desc     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]

      console.info("[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300] component direction is: " + Btn.getElement('$attrs').getString('direction'));
      expect(Btn.getElement('$attrs').getString('direction')).assertEqual('Direction.Auto');
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400
     * @tc.name     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400
     * @tc.desc     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]

      console.info("[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400] component direction is: " + Btn.getElement('$attrs').getString('direction'));
      expect(Btn.getElement('$attrs').getString('direction')).assertEqual('Direction.Ltr');
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500
     * @tc.name     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500
     * @tc.desc     SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
      console.info("[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500] component direction is: " + Btn.getElement('$attrs').getString('direction'));
      expect(Btn.getElement('$attrs').getString('direction')).assertEqual('Direction.Rtl');
      console.info('[SUB_ACE_ARKUI_POPUPV2DIRECTION_STATIC_0500] END');
      done();
    });
  })
}