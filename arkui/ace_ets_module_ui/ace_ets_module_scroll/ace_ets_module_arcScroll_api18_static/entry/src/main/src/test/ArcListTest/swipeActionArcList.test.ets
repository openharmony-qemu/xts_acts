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

export default function swipeActionArcList() {
  describe('swipeActionArcList', () => {

    beforeAll(() => {
      console.info("swipeActionArcList beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.arcScroll_api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("swipeActionArcList beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcList/swipeActionArcList",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get swipeActionArcList state pages:" + JSON.stringify(pages));
        if (!("swipeActionArcList" == pages.name)) {
          console.info("get swipeActionArcList pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push swipeActionArcList page error:" + err);
      }
      console.info("swipeActionArcList beforeEach end");
    });

    
    /*
     * @tc.number   swipeActionArcList_static_0100
     * @tc.name     swipeActionArcList_static_0100
     * @tc.desc     swipeActionArcList_static_0100
     * @tc.level    Level.LEVEL0
     */
it('swipeActionArcList_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[swipeActionArcList_static_0100] START');
      let swipeList = CommonFunc.getComponentRectOnScreen('arcListItem_0');
      let top = swipeList.top;
      let right = swipeList.right;
      let left = swipeList.left;
      let bottom = swipeList.bottom;
      console.info("swipeActionArcList_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await (driver.swipe((Math.round(left + width*0.8) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('arcList_listItemOffset');
      console.info("[swipeActionArcList_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[swipeActionArcList_static_0100] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('swipe end');

      let strJson2 = inspector.getInspectorByKey('arcList_listItemState');
      console.info("[swipeActionArcList_static_0100] component obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[swipeActionArcList_static_0100] content2: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('end EXPANDED');

      await (driver.swipe((Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.7) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[swipeActionArcList_static_0100] END');
      done();
    });

    
    /*
     * @tc.number   swipeActionArcList_static_0200
     * @tc.name     swipeActionArcList_static_0200
     * @tc.desc     swipeActionArcList_static_0200
     * @tc.level    Level.LEVEL0
     */
it('swipeActionArcList_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[swipeActionArcList_static_0200] START');
      let swipeList = CommonFunc.getComponentRectOnScreen('arcListItem_0');
      let top = swipeList.top;
      let right = swipeList.right;
      let left = swipeList.left;
      let bottom = swipeList.bottom;
      console.info("swipeActionArcList_static_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await (driver.swipe((Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.8) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('arcList_listItemOffset');
      console.info("[swipeActionArcList_static_0200] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info("[swipeActionArcList_static_0200] content1: " + JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('swipe start');

      let strJson2 = inspector.getInspectorByKey('arcList_listItemState');
      console.info("[swipeActionArcList_static_0200] component obj2 is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      console.info("[swipeActionArcList_static_0200] content2: " + JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('start EXPANDED');

      await (driver.swipe((Math.round(left + width*0.7) as Int),(Math.round(top + height/2) as Int),(Math.round(left + width*0.2) as Int),(Math.round(top + height/2) as Int)) as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[swipeActionArcList_static_0200] END');
      done();
    });
  })
}
