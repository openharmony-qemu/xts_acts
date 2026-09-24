'use static';
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function offsetRemainScroll() {
  describe('offsetRemainScroll', () => {
    beforeEach(async (): Promise<void> => {
      console.info("offsetRemainScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/offsetRemainScroll",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get offsetRemainScroll state pages:" + JSON.stringify(pages));
        if (!("offsetRemainScroll" == pages.name)) {
          console.info("get offsetRemainScroll pages.name:" + '');


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push offsetRemainScroll page error:" + err);
      }
      console.info("offsetRemainScroll beforeEach end");
    });



    
    /**
     * @tc.number   offsetRemainScroll_static_0100
     * @tc.name     offsetRemainScroll_static_0100
     * @tc.desc     offsetRemainScroll_static_0100
     * @tc.level    Level.LEVEL1
     */
it('offsetRemainScroll_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>{

      console.info('[offsetRemainScroll_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let swiperTabs: RectValue = CommonFunc.getComponentRectOnScreen('scroll_offsetRemain');
        let top = swiperTabs.top;
        let right = swiperTabs.right;
        let left = swiperTabs.left;
        let bottom = swiperTabs.bottom;
        console.info("waterFlow6Jsunit_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
        let height = bottom -top;
        let width = right - left;
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
        await driver.swipe((Math.round(left + width/2)).toInt(),(Math.round(top + height*0.8)).toInt(),(Math.round(left + width/2)).toInt(),(Math.round(top + height*0.2)).toInt());
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('scroll_offsetRemain_text');
        console.info("[offsetRemainScroll_static_0100] component obj is: " + strJson);
        console.info("[offsetRemainScrol_static_0100] content: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'));
        await CommonFunc.sleep(1000);
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('scrollPosition: 1');
        console.info('[offsetRemainScroll_static_0100] END');
        done();
      } catch (error) {
        console.error('[offsetRemainScroll_static_0100] error:' + error);
        expect().assertFail();
        done();
      }
    });
  })
}
