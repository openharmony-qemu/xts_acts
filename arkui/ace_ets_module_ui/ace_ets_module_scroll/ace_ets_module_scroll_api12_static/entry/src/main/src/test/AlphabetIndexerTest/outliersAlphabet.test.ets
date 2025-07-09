/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
// import { resourceManager } from '@kit.LocalizationKit';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import {UtilsTest} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

// function alphabetDefaultPopupSize(sysWidth: Resource) {
//   let resourcePopupSize = getContext().resourceManager.getNumber(sysWidth.id)
//   let newPopupSize: string = Math.round(px2vp(resourcePopupSize)) + '.00vp'
//   return newPopupSize;
// }
//
// function spliceBgColor(sysColor: Resource, sysColor1: Resource) {
//   let resourceColor = getContext().resourceManager.getColorSync(sysColor.id)
//   let resourceColor1 = getContext().resourceManager.getNumber(sysColor1.id)
//   let numColor1 = Math.round(resourceColor1 * 255)
//   console.info("resourceColor is: " + JSON.stringify(resourceColor.toString(16)));
//   console.info("numColor1 is: " + JSON.stringify(numColor1));
//   let newArgb: string = '#' + numColor1.toString(16).toUpperCase() + resourceColor.toString(16).toUpperCase().slice(2)
//   return newArgb;
// }

export default function outliersAlphabet() {
  describe('outliersAlphabet', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("outliersAlphabet beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AlphabetIndexer/outliersAlphabet",
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get outliersAlphabet state pages:" + JSON.stringify(pages));
        if (!("outliersAlphabet" == pages.name)) {
          console.info("get outliersAlphabet pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push outliersAlphabet page result:");
        }
      } catch (err) {
        console.error("push outliersAlphabet page error:" + err);
      }
      console.info("outliersAlphabet beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("outliersAlphabet after each called");
    });

    /**
     * @tc.number    outliersAlphabet_static_001
     * @tc.name      outliersAlphabet_static_0100
     * @tc.desc      Set the outlier of the AlphabetIndexer for selectedFont.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[outliersAlphabet_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[outliersAlphabet_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[outliersAlphabet_static_0100] selectedFont: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedFont')));
      console.info("[outliersAlphabet_static_0100] fontSize: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedFont').getString('fontSize')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('selectedFont').getString('fontSize')).assertEqual("10.00vp");
      console.info('[outliersAlphabet_static_0100] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_static_002
     * @tc.name      outliersAlphabet_static_0200
     * @tc.desc      Set the outlier of the AlphabetIndexer for popupFont.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[outliersAlphabet_static_0200] START');
      await CommonFunc.sleep(3000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.text('A'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[outliersAlphabet_static_0200] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[outliersAlphabet_static_0200] popupFont: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupFont')));
      console.info("[outliersAlphabet_static_0200] fontSize: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupFont').getString('fontSize')));
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupFont').getString('fontSize')).assertEqual(alphabetDefaultPopupSize($r('sys.float.ohos_id_text_size_headline7')));
      console.info('[outliersAlphabet_static_0200] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_static_003
     * @tc.name      outliersAlphabet_static_0300
     * @tc.desc      Set the outlier of the AlphabetIndexer for popupPosition.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[outliersAlphabet_static_0300] START');
      await CommonFunc.sleep(5000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.text('B'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_static_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[outliersAlphabet_static_0300] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[outliersAlphabet_static_0300] popupPosition: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupPosition')));
      console.info("[outliersAlphabet_static_0300] popupPositionX: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupPosition').getString('popupPositionX')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('popupPosition').getString('popupPositionX')).assertEqual("0.00px");
      console.info('[outliersAlphabet_static_0300] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_static_004
     * @tc.name      outliersAlphabet_static_0400
     * @tc.desc      Set the outlier of the AlphabetIndexer for selected.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[outliersAlphabet_static_0400] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_static_0400] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[outliersAlphabet_static_0400] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[outliersAlphabet_static_0400] selected: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selected')).assertEqual('0');
      console.info('[outliersAlphabet_static_0400] END');
      done();
    });

    /**
     * @tc.number    outliersAlphabet_static_005
     * @tc.name      outliersAlphabet_static_0500
     * @tc.desc      Set the outlier of the AlphabetIndexer for selectedColor and selectedBackgroundColor.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('outliersAlphabet_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('[outliersAlphabet_static_0500] START');
      await CommonFunc.sleep(3000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.text('C'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('alphabetIndexer_outliers');
      console.info("[outliersAlphabet_static_0500] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[outliersAlphabet_static_0500] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[outliersAlphabet_static_0500] selectedColor: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')));
      console.info("[outliersAlphabet_static_0500] selectedBackgroundColor: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBackgroundColor')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedColor')).assertEqual("#FFFFFFFF");
      // expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('selectedBackgroundColor'))
        // .assertEqual(spliceBgColor($r('sys.color.ohos_id_color_text_highlight_bg'), $r('sys.float.ohos_id_alpha_normal_bg')));
      console.info('[outliersAlphabet_static_0500] END');
      done();
    });
  })
}
