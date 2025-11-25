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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function arcSwiperContent() {
  describe('arcSwiperContent', () => {
    beforeAll(() => {
      console.info("arcSwiperContent beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.arcScroll_api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("arcSwiperContent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcSwiperContent",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get arcSwiperContent state pages:" + JSON.stringify(pages));
        if (!("arcSwiperContent" == pages.name)) {
          console.info("get arcSwiperContent pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push arcSwiperContent page error:" + err);
      }
      console.info("arcSwiperContent beforeEach end");
    });

    
    /*
     * @tc.number   arcSwiperContent_static_0100
     * @tc.name     arcSwiperContent_static_0100
     * @tc.desc     arcSwiperContent_static_0100
     * @tc.level    Level.LEVEL0
     */
it('arcSwiperContent_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperContent_static_0100] START');
      let swipeTabs = CommonFunc.getComponentRectOnScreen('arcs_customContent');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("arcSwiperContent value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await (driver.drag((Math.round(left + width*0.8) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('1'));
      let strJson = inspector.getInspectorByKey('onAnimationStart_arcs_content');
      console.info("[arcSwiperContent_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[arcSwiperContent_static_0100] getString('content'): " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('onAnimationStartIndex: 0');
      let strJson1 = inspector.getInspectorByKey('index1_arcs_content');
      console.info("[arcSwiperContent_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[arcSwiperContent_static_0100] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('index: 1');
      console.info('[arcSwiperContent_static_0100] END');
      done();
    });
  })
}
