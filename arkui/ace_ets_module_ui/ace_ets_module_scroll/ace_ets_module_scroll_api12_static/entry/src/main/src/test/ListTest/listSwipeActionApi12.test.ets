'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Driver, Component, ON, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import inspector from '@ohos.arkui.inspector'
export default function listSwipeActionApi12Test() {
  describe('listSwipeActionApi12Test', () => {
    beforeEach(async (): Promise<void> => {
      console.info("listSwipeActionApi12Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/listSwipeActionApi12"
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get listSwipeActionApi12Test state pages: " + JSON.stringify(pages));
        if (!("listSwipeActionApi12" == pages.name)) {
          console.info("get listSwipeActionApi12Test state pages.name: " + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push listSwipeActionApi12Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listSwipeActionApi12Test page error: " + err);
        expect().assertFail();
      }
    });


    
    /**
     * @tc.number   listSwipeActionApi12Test_static_001
     * @tc.name     listSwipeActionApi12Test_static_001
     * @tc.desc     listSwipeActionApi12Test_static_001
     * @tc.level    Level.LEVEL1
     */
it('listSwipeActionApi12Test_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('listSwipeActionApi12Test_static_001 START');
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      const uiContext = AppStorage.get<UIContext>('uiContext')!;
      let swipeComp = await driver.findComponent(ON.id('item0'));
      let rect = await swipeComp!.getBounds();
      let displayId = await swipeComp!.getDisplayId();
      await driver.swipeBetween(
        { x: (Math.round(rect.left + uiContext.vp2px(50))).toInt(),
          y: (Math.round((rect.top + rect.bottom) / 2)).toInt(),
          displayId: displayId },
        { x: (Math.round(rect.left + uiContext.vp2px(200))).toInt(),
          y: (Math.round((rect.top + rect.bottom) / 2)).toInt(),
          displayId: displayId });
      console.info('listSwipeActionApi12Test_static_003 START');
      await CommonFunc.sleep(5000);
      let strJson1 = inspector.getInspectorByKey('ListTestApi12_2');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(Math.abs(Math.round(Number(obj1.getElement('$attrs').getString('content'))) - 160) <= 1)
          .assertTrue();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('item0')) as Component;
      btn1.click();
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('ListTestApi12_2');
      let obj2 = JSON.parseJsonElement(strJson2);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      done();
    });
  })
}
