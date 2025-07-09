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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SwiperOnSelectedTest() {
  describe('SwiperOnSelectedTest', () => {
    beforeAll(() => {
      console.info("SwiperOnSelectedTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info('SwiperOnSelected beforeEach start');
      const swiperOnSelected = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/SwiperOnSelected',
      }
      try {
        swiperOnSelected.clear();
        let pages = swiperOnSelected.getState();
        console.info('get SwiperOnSelected state pages: ' + JSON.stringify(pages));
        if (!('SwiperOnSelected' == pages.name)) {
          console.info('get SwiperOnSelected pages.name: ' + JSON.stringify(pages.name));
          swiperOnSelected.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push SwiperOnSelected page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('SwiperOnSelected beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SwiperOnSelected after each called');
    })

    /**
     * @tc.number SwiperOnSelectedTest0010
     * @tc.name   SwiperOnSelectedTest0010
     * @tc.desc   onSelected
     * @tc.level  Level 1
     * @tc.type
     * @tc.size
     */
    it('SwiperOnSelectedTest_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'SwiperOnSelectedTest0010_static';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(5000);
        let strJson: string = inspector.getInspectorByKey('TEXT_0010_static');
        console.info("[SwiperOnSelectedTest0010] attrs is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onSelected");
        await CommonFunc.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  
  
      /**
       * @tc.number SwiperOnSelected0020
       * @tc.name   SwiperOnSelected0020
       * @tc.desc   onSelected
       * @tc.level  Level 1
       * @tc.type
       * @tc.size
       */
      it('SwiperOnSelectedTest_static_0020', Level.LEVEL1, async (done: () => void): Promise<void> => {
        let tagName = 'SwiperOnSelectedTest0020_static';
        console.info('[' + tagName + '] START============================');
        await CommonFunc.sleep(5000);
        let strJson: string = inspector.getInspectorByKey('TEXT_0020_static');
        console.info("[SwiperOnSelectedTest0020] attrs is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual("onSelected");
        await CommonFunc.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}