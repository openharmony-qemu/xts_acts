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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '@ohos/hypium-static/src/main/indexStatic';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';

import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ListItem_Delete_End() {
  describe('ListItem_Delete_End', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_Delete_End beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/ListItem_Delete/ListItem_Delete_End',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListItem_Delete_End state pages:" + JSON.stringify(pages));
        if (!("ListItem_Delete_End" == pages.name)) {
          console.info("get ListItem_Delete_End pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListItem_Delete_End page error:" + err);
      }
      console.info("ListItem_Delete_End beforeEach end");
    });
    afterEach(async () => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn!.click();
      await CommonFunc.sleep(3000);
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_static_0200
     * @tc.name     SUB_ACE_ListItem_Delete_End_static_0200
     * @tc.desc     SUB_ACE_ListItem_Delete_End_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_0200] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'actionAreaDistance', value: 50
      });
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let swipeComp = await driver.findComponent(ON.id('ListItem_Delete_End_ListItem_00'));
      let rect = await swipeComp!.getBounds();
      let displayId = await swipeComp!.getDisplayId();
      let width = rect.right - rect.left;
      let height = rect.bottom - rect.top;
      await driver.swipeBetween(
        { x: (Math.round(rect.right - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
          y: (Math.round(rect.top + (rect.bottom - rect.top) / 2)).toInt(), displayId: displayId },
        { x: (Math.round(rect.left + UIContext.resolveUIContext()!.vp2px(5))).toInt(),
          y: (Math.round(rect.top + (rect.bottom - rect.top) / 2)).toInt(), displayId: displayId }
      );
      await CommonFunc.sleep(3000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('4');

      console.log('get Initial ListItem_01 and List_1 value')
      let ListItem_01: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_ListItem_01');
      let List_1: RectValue = CommonFunc.getComponentRect('ListItem_Delete_End_List_1');

      console.log('assert position ')
      expect(ListItem_01.top).assertEqual(List_1.top);
      console.log('ListItem_01.top ' + ListItem_01.top)
      console.log('List_1.top ' + List_1.top)


      console.info('[SUB_ACE_ListItem_Delete_End_0200] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_static_0300
     * @tc.name     SUB_ACE_ListItem_Delete_End_static_0300
     * @tc.desc     SUB_ACE_ListItem_Delete_End_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_0300] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'actionAreaDistance', value: 100
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);
      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn!.click();
      await CommonFunc.sleep(2000);

      console.log('slide ')
      let swipeComp0300 = await driver.findComponent(ON.id('ListItem_Delete_End_ListItem_00'));
      let rect0300 = await swipeComp0300!.getBounds();
      let displayId0300 = await swipeComp0300!.getDisplayId();
      let width = rect0300.right - rect0300.left;
      let height = rect0300.bottom - rect0300.top;
      await driver.swipeBetween(
        { x: (Math.round(rect0300.left + UIContext.resolveUIContext()!.vp2px(80))).toInt(),
          y: (Math.round(rect0300.top + (rect0300.bottom - rect0300.top) / 2)).toInt(),
          displayId: displayId0300 },
        { x: (Math.round(rect0300.left + UIContext.resolveUIContext()!.vp2px(30))).toInt(),
          y: (Math.round(rect0300.top + (rect0300.bottom - rect0300.top) / 2)).toInt(),
          displayId: displayId0300 }
      );
      await CommonFunc.sleep(3000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('not enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0300] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_static_0400
     * @tc.name     SUB_ACE_ListItem_Delete_End_static_0400
     * @tc.desc     SUB_ACE_ListItem_Delete_End_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_0400] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'actionAreaDistance', value: 0
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn!.click();
      await CommonFunc.sleep(2000);

      let swipeComp0400 = await driver.findComponent(ON.id('ListItem_Delete_End_ListItem_00'));
      let rect0400 = await swipeComp0400!.getBounds();
      let displayId0400 = await swipeComp0400!.getDisplayId();
      let width = rect0400.right - rect0400.left;
      let height = rect0400.bottom - rect0400.top;
      await driver.swipeBetween(
        { x: (Math.round(rect0400.left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
          y: (Math.round(rect0400.top + (rect0400.bottom - rect0400.top) / 2)).toInt(),
          displayId: displayId0400 },
        { x: (Math.round(rect0400.left + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
          y: (Math.round(rect0400.top + (rect0400.bottom - rect0400.top) / 2)).toInt(),
          displayId: displayId0400 }
      );
      await CommonFunc.sleep(2000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('not enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0400] END');
      done();
    });

    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_static_0500
     * @tc.name     SUB_ACE_ListItem_Delete_End_static_0500
     * @tc.desc     SUB_ACE_ListItem_Delete_End_static_0500
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_0500] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'actionAreaDistance', value: -100
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn!.click();
      await CommonFunc.sleep(2000);


      let swipeComp0500 = await driver.findComponent(ON.id('ListItem_Delete_End_ListItem_00'));
      let rect0500 = await swipeComp0500!.getBounds();
      let displayId0500 = await swipeComp0500!.getDisplayId();
      let width = rect0500.right - rect0500.left;
      let height = rect0500.bottom - rect0500.top;
      await driver.swipeBetween(
        { x: (Math.round(rect0500.left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
          y: (Math.round(rect0500.top + (rect0500.bottom - rect0500.top) / 2)).toInt(),
          displayId: displayId0500 },
        { x: (Math.round(rect0500.left + UIContext.resolveUIContext()!.vp2px(50))).toInt(),
          y: (Math.round(rect0500.top + (rect0500.bottom - rect0500.top) / 2)).toInt(),
          displayId: displayId0500 }
      );
      await CommonFunc.sleep(2000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('not enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0500] END');
      done();
    });
    
    
    



/**
     * @tc.number   SUB_ACE_ListItem_Delete_End_static_0600
     * @tc.name     SUB_ACE_ListItem_Delete_End_static_0600
     * @tc.desc     SUB_ACE_ListItem_Delete_End_static_0600
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_ListItem_Delete_End_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ACE_ListItem_Delete_End_0600] START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'actionAreaDistance', value: 400
      });
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('ListItem_Delete_End_button1'));
      await btn!.click();
      await CommonFunc.sleep(2000);
      
      let swipeComp0600 = await driver.findComponent(ON.id('ListItem_Delete_End_ListItem_00'));
      let rect0600 = await swipeComp0600!.getBounds();
      let displayId0600 = await swipeComp0600!.getDisplayId();
      let width = rect0600.right - rect0600.left;
      let height = rect0600.bottom - rect0600.top;
      await driver.swipeBetween(
        { x: (Math.round(rect0600.left + UIContext.resolveUIContext()!.vp2px(100))).toInt(),
          y: (Math.round(rect0600.top + (rect0600.bottom - rect0600.top) / 2)).toInt(),
          displayId: displayId0600 },
        { x: (Math.round(rect0600.left + UIContext.resolveUIContext()!.vp2px(10))).toInt(),
          y: (Math.round(rect0600.top + (rect0600.bottom - rect0600.top) / 2)).toInt(),
          displayId: displayId0600 }
      );
      await CommonFunc.sleep(2000);

      let text_011 = inspector.getInspectorByKey('ListItem_Delete_End_text_01');

      expect(JSON.parseJsonElement(text_011).getElement('$attrs').getString('content')).assertEqual('not enterEndDeleteArea');

      let text_022 = inspector.getInspectorByKey('ListItem_Delete_End_text_02');

      expect(JSON.parseJsonElement(text_022).getElement('$attrs').getString('content')).assertEqual('not exitEndDeleteArea');

      let text_033 = inspector.getInspectorByKey('ListItem_Delete_End_text_03');

      expect(JSON.parseJsonElement(text_033).getElement('$attrs').getString('content')).assertEqual('5');

      console.info('[SUB_ACE_ListItem_Delete_End_0600] END');
      done();
    });

  })
}
