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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';

import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function listItem_SizeChange() {

  describe('ListItem_SizeChangeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ListItem_SizeChange beforeEach called");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_Space/ListItemChange/ListItem_SizeChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get ListItem_SizeChange state pages:" + JSON.stringify(pages));
        if (!("ListItem_SizeChange" == pages.name)) {
          console.info("get ListItem_SizeChange state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListItem_SizeChange page error:" + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ListItem_SizeChange afterEach called");
    });

    
    
    



/**
     * @tc.number   testListItemSizeChangeHeight120Width300_static
     * @tc.name     testListItemSizeChangeHeight120Width300_static
     * @tc.desc     testListItemSizeChangeHeight120Width300_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight120Width300_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight120Width300 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 120
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 300
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(120))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();

      let driver = Driver.create();
      let swipeComp = await driver.findComponent(ON.id('ListItemSizeChange1'));
      let swipeRect = await swipeComp!.getBounds();
      let displayId = await swipeComp!.getDisplayId();
            await driver.swipeBetween(
        { x: (Math.round(swipeRect.left + (swipeRect.right - swipeRect.left) / 2)).toInt(),
          y: (Math.round(swipeRect.top + (swipeRect.bottom - swipeRect.top) / 2)).toInt(), displayId: displayId },
        { x: (Math.round(swipeRect.left + (swipeRect.right - swipeRect.left) / 2)).toInt(),
          y: (Math.round(swipeRect.top)).toInt(), displayId: displayId });
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight120Width300 END');
      done();
    });

    
    
    



/**
     * @tc.number   testListItemSizeChangeHeight160Width300_static
     * @tc.name     testListItemSizeChangeHeight160Width300_static
     * @tc.desc     testListItemSizeChangeHeight160Width300_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight160Width300_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight160Width300 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 160
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 300
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
  console.log('locationText4.top = ' + locationText4.top + ', locationText3.bottom = ' + locationText3.bottom)
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
  console.log('locationList.bottom = ' + locationList.bottom + ', locationText4.bottom = ' + locationText4.bottom)
  console.log('Math.round(locationList.bottom - locationText4.bottom) = ' + Math.round(locationText4.bottom - locationList.bottom))
  console.log('Math.round(UIContext.resolveUIContext()!.vp2px(20)) = ' + Math.round(UIContext.resolveUIContext()!.vp2px(20)))
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
  console.log('locationText4Again.bottom =')

      let swipeComp2 = await driver.findComponent(ON.id('ListItemSizeChange1'));
      let swipeRect2 = await swipeComp2!.getBounds();
      let displayId2 = await swipeComp2!.getDisplayId();
          await driver.swipeBetween(
        { x: (Math.round(swipeRect2.left + (swipeRect2.right - swipeRect2.left) / 2)).toInt(),
          y: (Math.round(swipeRect2.top + (swipeRect2.bottom - swipeRect2.top) / 2)).toInt(), displayId: displayId2 },
        { x: (Math.round(swipeRect2.left + (swipeRect2.right - swipeRect2.left) / 2)).toInt(),
          y: (Math.round(swipeRect2.top)).toInt(), displayId: displayId2 });
      await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      console.log('locationText4Again.bottom = ' + locationText4Again.bottom + ', locationList.bottom = ' + locationList.bottom)
      expect(Math.floor(Math.abs(locationText4Again.bottom - locationList.bottom)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight160Width300 END');
      done();
    });


    
    



/**
     * @tc.number   testListItemSizeChangeHeight100Width100_static
     * @tc.name     testListItemSizeChangeHeight100Width100_static
     * @tc.desc     testListItemSizeChangeHeight100Width100_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight100Width100_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight100Width100 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 100
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 100
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');

      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      let swipeComp3 = await driver.findComponent(ON.id('ListItemSizeChange1'));
      let swipeRect3 = await swipeComp3!.getBounds();
      let displayId3 = await swipeComp3!.getDisplayId();
            await driver.swipeBetween(
        { x: (Math.round(swipeRect3.left + (swipeRect3.right - swipeRect3.left) / 2)).toInt(),
          y: (Math.round(swipeRect3.top + (swipeRect3.bottom - swipeRect3.top) / 2)).toInt(), displayId: displayId3 },
        { x: (Math.round(swipeRect3.left + (swipeRect3.right - swipeRect3.left) / 2)).toInt(),
          y: (Math.round(swipeRect3.top)).toInt(), displayId: displayId3 });
    await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight100Width100 END');
      done();
    });







/**
     * @tc.number   testListItemSizeChangeHeight100Width380_static
     * @tc.name     testListItemSizeChangeHeight100Width380_static
     * @tc.desc     testListItemSizeChangeHeight100Width380_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight100Width380_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight100Width380 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 100
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 380
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(380))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationText4.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(40))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      let swipeComp4 = await driver.findComponent(ON.id('ListItemSizeChange1'));
      let swipeRect4 = await swipeComp4!.getBounds();
      let displayId4 = await swipeComp4!.getDisplayId();
            await driver.swipeBetween(
        { x: (Math.round(swipeRect4.left + (swipeRect4.right - swipeRect4.left) / 2)).toInt(),
          y: (Math.round(swipeRect4.top + (swipeRect4.bottom - swipeRect4.top) / 2)).toInt(), displayId: displayId4 },
        { x: (Math.round(swipeRect4.left + (swipeRect4.right - swipeRect4.left) / 2)).toInt(),
          y: (Math.round(swipeRect4.top)).toInt(), displayId: displayId4 });
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4.top - locationText4Again.top)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight100Width380 END');
      done();
    });







/**
     * @tc.number   testListItemSizeChangeHeight160Width380_static
     * @tc.name     testListItemSizeChangeHeight160Width380_static
     * @tc.desc     testListItemSizeChangeHeight160Width380_static
     * @tc.level    Level.LEVEL0
     */
it('testListItemSizeChangeHeight160Width380_static', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new testListItemSizeChangeHeight160Width380 START');
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'height', value: 160
      })
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'width', value: 380
      })
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('ListItemSizeChange1');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('List');
      let locationText1: RectValue = CommonFunc.getComponentRect('ListItemTest1');
      let locationText2: RectValue = CommonFunc.getComponentRect('ListItemTest2');
      let locationText3: RectValue = CommonFunc.getComponentRect('ListItemTest3');
      let locationText4: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      let locationList: RectValue = CommonFunc.getComponentRect('ListItemSizeChange1');
      expect(Math.abs(Math.round(locationText1.left - locationText2.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText2.left - locationText3.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText3.left - locationText4.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText4.left - locationList.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(locationText1.top - locationList.top)) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText1.right - locationText1.left) - Math.round(UIContext.resolveUIContext()!.vp2px(380))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText1.bottom - locationText1.top) - Math.round(UIContext.resolveUIContext()!.vp2px(160))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.right - locationText2.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText2.bottom - locationText2.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.right - locationText3.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.bottom - locationText3.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.right - locationText4.left) - Math.round(UIContext.resolveUIContext()!.vp2px(300))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationText4.top) - Math.round(UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationText2.top - locationText1.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText3.top - locationText2.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.top - locationText3.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationText4.bottom - locationList.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();

	  expect(Math.abs(Math.round(locationList.right - locationList.left) - Math.round(UIContext.resolveUIContext()!.vp2px(350))) <= 1).assertTrue();
	  expect(Math.abs(Math.round(locationList.bottom - locationList.top) - Math.round(UIContext.resolveUIContext()!.vp2px(500))) <= 1).assertTrue();
      let driver = Driver.create();
      let swipeComp5 = await driver.findComponent(ON.id('ListItemSizeChange1'));
      let swipeRect5 = await swipeComp5!.getBounds();
      let displayId5 = await swipeComp5!.getDisplayId();
            await driver.swipeBetween(
        { x: (Math.round(swipeRect5.left + (swipeRect5.right - swipeRect5.left) / 2)).toInt(),
          y: (Math.round(swipeRect5.top + (swipeRect5.bottom - swipeRect5.top) / 2)).toInt(), displayId: displayId5 },
        { x: (Math.round(swipeRect5.left + (swipeRect5.right - swipeRect5.left) / 2)).toInt(),
          y: (Math.round(swipeRect5.top)).toInt(), displayId: displayId5 });
      await CommonFunc.sleep(3000);
      let locationText4Again: RectValue = CommonFunc.getComponentRect('ListItemTest4');
      expect(Math.floor(Math.abs(locationText4Again.bottom - locationList.bottom)) <= 1).assertTrue();
      console.info('new testListItemSizeChangeHeight160Width380 END');
      done();
    });
  })
}