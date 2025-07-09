/*
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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../hypium/index';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function RelativeContainerLocalizedDirectionStartTest() {
  describe('RelativeContainerLocalizedDirectionStartTest', (): void => {
    beforeAll(() => {
      console.info("RelativeContainerLocalizedDirectionStartTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.api12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("RelativeContainerLocalizedDirectionStart beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RelativeContainer/RelativeContainerLocalizedDirectionStartPage',
      }
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainerLocalizedDirectionStart state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerLocalizedDirectionStart" == pages.name)) {
          console.info("get RelativeContainerLocalizedDirectionStart pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          //console.info("push RelativeContainerLocalizedDirectionStart page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainerLocalizedDirectionStart page error:" + err);
      }
      console.info("RelativeContainerLocalizedDirectionStart beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.number RelativeContainerLocalizedDirectionStart_0100
     * @tc.name   testFocus
     * @tc.desc
     */
    it('RelativeContainerLocalizedDirectionStart_static_0100', Level.LEVEL1, async (done: Function) => {
      console.info('RelativeContainerLocalizedDirectionStart_0100 START');
      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeBarrierLocalizedDirectionStart');
      let row1 = CommonFunc.getComponentRect('RelativeBarrierStartButton1');
      let row2 = CommonFunc.getComponentRect('RelativeBarrierStartButton2');
      let row3 = CommonFunc.getComponentRect('RelativeBarrierStartButton3');
      await CommonFunc.sleep(2000);
      const uiContext = new UIContext();
      console.info("[RelativeContainerLocalizedDirectionStart_0100] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(rel.right - row3.right) - Math.round(uiContext.vp2px(150))) <= 1).assertTrue();
      console.info('RelativeContainerLocalizedDirectionStart_0100 END');
    });
  })
}