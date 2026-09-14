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

import { describe, beforeEach, afterEach, it, expect, Level, Size, TestType } from '../../../../hypium/index';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function swipeRefresherV2PageTest() {
  describe('swipeRefresherV2Page', () => {

    beforeEach(async (): Promise<void> => {
      console.info("swipeRefresherV2Page beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swipeRefresherV2/swipeRefresherV2Page',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get swipeRefresherV2Page state pages:" + JSON.stringify(pages));
        if (!("swipeRefresherV2Page" == pages.name)) {
          console.info("get swipeRefresherV2Page pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("swipeRefresherV2Page beforeEach error:" + JSON.stringify(err));
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('swipeRefresherV2Page afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("swipeRefresherV2Page afterEach start");
    });

    /**
     * @tc.number   swipeRefresherV2Page_static_0100
     * @tc.name     swipeRefresherV2Page_static_0100
     * @tc.desc     Verify SwipeRefresherV2 component basic rendering
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('swipeRefresherV2Page_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[swipeRefresherV2Page_static_0100] START");
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(2000);
        let component = await driver.findComponent(ON.id('swipeRefresherV2_component'));
        expect(component != null).assertTrue();
        console.info("[swipeRefresherV2Page_static_0100] END");
      } catch (error) {
        console.error("[swipeRefresherV2Page_static_0100] error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   swipeRefresherV2Page_static_0200
     * @tc.name     swipeRefresherV2Page_static_0200
     * @tc.desc     Verify SwipeRefresherV2 isLoading property when true
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('swipeRefresherV2Page_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[swipeRefresherV2Page_static_0200] START");
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let isLoadingButton = await driver.findComponent(ON.id('isLoading_true_button'));
        expect(isLoadingButton != null).assertTrue();
        await isLoadingButton?.click();
        await CommonFunc.sleep(500);
        
        let component = await driver.findComponent(ON.id('swipeRefresherV2_component'));
        expect(component != null).assertTrue();
        
        let rect = CommonFunc.getComponentRect('swipeRefresherV2_component');
        expect(rect != null).assertTrue();
        console.info("[swipeRefresherV2Page_static_0200] END");
      } catch (error) {
        console.error("[swipeRefresherV2Page_static_0200] error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   swipeRefresherV2Page_static_0300
     * @tc.name     swipeRefresherV2Page_static_0300
     * @tc.desc     Verify SwipeRefresherV2 isLoading property when false
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('swipeRefresherV2Page_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[swipeRefresherV2Page_static_0300] START");
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let isLoadingButton = await driver.findComponent(ON.id('isLoading_false_button'));
        expect(isLoadingButton != null).assertTrue();
        await isLoadingButton?.click();
        await CommonFunc.sleep(500);
        
        let component = await driver.findComponent(ON.id('swipeRefresherV2_component'));
        expect(component != null).assertTrue();
        
        let rect = CommonFunc.getComponentRect('swipeRefresherV2_component');
        expect(rect != null).assertTrue();
        console.info("[swipeRefresherV2Page_static_0300] END");
      } catch (error) {
        console.error("[swipeRefresherV2Page_static_0300] error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.number   swipeRefresherV2Page_static_0400
     * @tc.name     swipeRefresherV2Page_static_0400
     * @tc.desc     Verify SwipeRefresherV2 content property with custom text
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('swipeRefresherV2Page_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[swipeRefresherV2Page_static_0400] START");
      try {
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
       
        let isLoadingButton = await driver.findComponent(ON.id('isLoading_true_button'));
        expect(isLoadingButton != null).assertTrue();
        await isLoadingButton?.click();
        await CommonFunc.sleep(500);
        
        let component = await driver.findComponent(ON.id('swipeRefresherV2_component'));
        expect(component != null).assertTrue();
        console.info("[swipeRefresherV2Page_static_0400] END");
      } catch (error) {
        console.error("[swipeRefresherV2Page_static_0400] error: " + JSON.stringify(error));
        expect(false).assertTrue();
      }
      done();
    });

    
  });
}