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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';

import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ListItem_Delete_Start_Resource() {
  describe('ListItem_Delete_Start_Resource', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_Delete_Start_Resource beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_Start_Resource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListItem_Delete_Start_Resource state pages:" + JSON.stringify(pages));
        if (!("ListItem_Delete_Start_Resource" == pages.name)) {
          console.info("get ListItem_Delete_Start_Resource pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListItem_Delete_Start_Resource page error:" + err);
      }
      console.info("ListItem_Delete_Start_Resource beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_Resource_button1'));
      await btn!.click();
      await CommonFunc.sleep(1000);
      console.info("ListItem_Delete_Start_Resource after each called");
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_Start_Resource_static_0100
     * @tc.name     SUB_ACE_ListItem_Delete_Start_Resource_static_0100
     * @tc.desc     SUB_ACE_ListItem_Delete_Start_Resource_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_Start_Resource_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_Start_Resource_static_0100] START');
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let swipeComp = await driver.findComponent(ON.id('ListItem_Delete_Start_Resource_ListItem_00'));
      let rect = await swipeComp!.getBounds();
      let displayId = await swipeComp!.getDisplayId();
      let width = rect.right - rect.left;
      let height = rect.bottom - rect.top;
      await driver.swipeBetween(
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(10))).toInt(),
          y: (Math.round(rect.top + (rect.bottom - rect.top) / 2)).toInt(), displayId: displayId },
        { x: (Math.round(rect.right - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
          y: (Math.round(rect.top + (rect.bottom - rect.top) / 2)).toInt(), displayId: displayId }
      );
      await CommonFunc.sleep(3000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_Start_Resource_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_Start_Resource_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_Start_Resource_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('4');

      console.info('[SUB_ACE_ListItem_Delete_Start_Resource_static_0100] END');
      done();
    });
    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_Start_Resource_static_0200
     * @tc.name     SUB_ACE_ListItem_Delete_Start_Resource_static_0200
     * @tc.desc     SUB_ACE_ListItem_Delete_Start_Resource_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_Start_Resource_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_Start_Resource_0200] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_Start_Resource_button1'));
      await btn!.click();
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let swipeComp02 = await driver.findComponent(ON.id('ListItem_Delete_Start_Resource_ListItem_00'));
      let rect02 = await swipeComp02!.getBounds();
      let displayId02 = await swipeComp02!.getDisplayId();
      let width = rect02.right - rect02.left;
      let height = rect02.bottom - rect02.top;
      await driver.swipeBetween(
        { x: (Math.round(rect02.left + UIContext.resolveUIContext()!.vp2px(60))).toInt(),
          y: (Math.round(rect02.top + (rect02.bottom - rect02.top) / 2)).toInt(),
          displayId: displayId02 },
        { x: (Math.round(rect02.left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
          y: (Math.round(rect02.top + (rect02.bottom - rect02.top) / 2)).toInt(),
          displayId: displayId02 }
      );
      await CommonFunc.sleep(3000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_Start_Resource_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('not enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_Start_Resource_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_Start_Resource_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_Start_Resource_0200] END');
      done();
    });
  })
}
