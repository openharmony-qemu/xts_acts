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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
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

export default function GridItemJsunit() {
  describe('GridItemJsunit', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridItemJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridItemPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridItemJsunit state pages: " + JSON.stringify(pages));
        if (!("blank3" == pages.name)) {
          console.info("get GridItemJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridItemJsunit page error: " + err);
      }
    });

    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_001
     * @tc.name       GridItemJsunit_static_0100
     * @tc.desc       Test Get GridItem attribute
     */
    it('GridItemJsunit_static_0100', 0, async (done: () => void): Promise<void> => {
      // Get the information of the GridItem component
      console.info('[GridItemJsunit_static_0100] START');
      await CommonFunc.sleep(2000);
      let strJson1 = inspector.getInspectorByKey('gridItem1');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[GridItemJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getDouble('rowStart')).assertEqual('1');
      expect(obj.getElement('$attrs').getDouble('rowEnd')).assertEqual('4');
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual('false');
      // Verify the default value of forceRebuild
      expect(obj.getElement('$attrs').getString('forceRebuild')).assertEqual('false');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('gridItem2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridItemJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getDouble('columnStart')).assertEqual('1');
      expect(obj2.getElement('$attrs').getDouble('columnEnd')).assertEqual('5');
      expect(obj2.getElement('$attrs').getString('forceRebuild')).assertEqual('true');
      // Verify the default value of selectable
      expect(obj2.getElement('$attrs').getString('selectable')).assertEqual('true');
      console.info('[GridItemJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0200
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0200', 0, async (done: () => void): Promise<void> => {
      // Modify the properties of component GridItem
      console.info('[GridItemJsunit_static_0200] START');
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowStart',value:'2'})
      await CommonFunc.sleep(2000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowEnd',value:'5'})
      await CommonFunc.sleep(2000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'columnStart',value:'2'})
      await CommonFunc.sleep(2000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'columnEnd',value:'4'})
      await CommonFunc.sleep(2000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'forceRebuild',value:'false'})
      await CommonFunc.sleep(2000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'selectable',value:'true'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the GridItem component
      let strJson = inspector.getInspectorByKey('gridItem1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridItemJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getDouble('rowStart')).assertEqual('2');
      expect(obj.getElement('$attrs').getDouble('rowEnd')).assertEqual('5');
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('gridItem2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridItemJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getDouble('columnStart')).assertEqual('2');
      expect(obj2.getElement('$attrs').getDouble('columnEnd')).assertEqual('4');
      expect(obj2.getElement('$attrs').getString('forceRebuild')).assertEqual('false');
      console.info('[GridItemJsunit_static_0200] END');
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0300
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0300', 0, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of component gridItem
      console.info('[GridItemJsunit_static_0300] START');
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowStart',value:'test'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowEnd',value:'#'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'columnStart',value:'-10'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'columnEnd',value:'%a'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'forceRebuild',value:'0'})
      await CommonFunc.sleep(200);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'selectable',value:'test'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the GridItem component
      let strJson = inspector.getInspectorByKey('gridItem1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridItemJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(Math.abs(Number(obj.getElement('$attrs').getDouble('rowStart'))) <= 1).assertTrue();
      expect(Math.abs(Number(obj.getElement('$attrs').getDouble('rowEnd'))) <= 1).assertTrue();
      expect(obj.getElement('$attrs').getString('selectable')).assertEqual('true');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('gridItem2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridItemJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      expect(Math.abs(Number(obj.getElement('$attrs').getDouble('columnStart'))) <= 1).assertTrue();
      expect(Math.abs(Number(obj.getElement('$attrs').getDouble('columnEnd'))) <= 1).assertTrue();
      expect(obj2.getElement('$attrs').getString('forceRebuild')).assertEqual('false');
      console.info('[GridItemJsunit_static_0300] END');
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0400
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0400', 0, async (done: () => void): Promise<void> => {
      // Verify the function of onSelect of GridItem component 
      console.info('[GridItemJsunit_static_0400] START');
      let grid1 = CommonFunc.getComponentRect('grid1');
      let left_x = Math.round(grid1.left)
      let bottom_y = Math.round(grid1.bottom / 2)
      let driver = Driver.create()
      const uiContext = new UIContext();
      await driver.swipe(Math.round((AppStorage.get<number>("winLeft", Type.from<number>()) ?? 0) + left_x + uiContext.vp2px(100)), bottom_y, Math.round((AppStorage.get<number>("winLeft", Type.from<number>()) ?? 0) + left_x + uiContext.vp2px(120)), bottom_y);
      await CommonFunc.sleep(500);
      let textComponent = await driver.findComponent(ON.id('onSelect'));
      let text = await (textComponent?.getText() as Promise<string>);
      await CommonFunc.sleep(500);
      expect(text).assertEqual('a');
      console.info('[GridItemJsunit_static_0400] END');
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0500
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0500', 0, async (done: () => void): Promise<void> => {
      // Verify the columnsTemplate of Grid component
      console.info('[GridItemJsunit_static_0500] START');
      let gridItem1 = CommonFunc.getComponentRect('0');
      let right1 = gridItem1.right;
      await CommonFunc.sleep(1000);
      let gridItem3 = CommonFunc.getComponentRect('1');
      let left3 = gridItem3.left;
      const uiContext = new UIContext();
      expect(Math.abs(Math.ceil(left3 - right1) - Math.ceil(uiContext.vp2px(4))) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0500] END');
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0600
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0600', 0, async (done: () => void): Promise<void> => {
      // Verify the rowsTemplate of Grid component 
      console.info('[GridItemJsunit_static_0600] START');
      await CommonFunc.sleep(1000);
      let gridItem1 = CommonFunc.getComponentRect('0');
      let bottom1 = gridItem1.bottom;
      let gridItem3 = CommonFunc.getComponentRect('4');
      let top3 = gridItem3.top;
      const uiContext = new UIContext();
      expect(Math.abs((top3 - bottom1) - uiContext.vp2px(5)) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0600] END');
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0700
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0700', 0, async (done: () => void): Promise<void> => {
      // Verify the columnsGap of Grid component 
      console.info('[GridItemJsunit_static_0700] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let gridItem1 = CommonFunc.getComponentRect('gridItem1');
      let right1 = gridItem1.right;
      let gridItem2 = CommonFunc.getComponentRect('0');
      let left1 = gridItem2.left;
      const uiContext = new UIContext();
	  expect(Math.abs((left1 - right1) - uiContext.vp2px(4)) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0700] END');
      done();
    });
    /**
     * @tc.number     SUB_ARKUI_GRIDITEM_JSAPI_002
     * @tc.name       GridItemJsunit_static_0800
     * @tc.desc       Test Modify GridItem attribute value
     */
    it('GridItemJsunit_static_0800', 0, async (done: () => void): Promise<void> => {
      // Verify the rowsGap of Grid component 
      console.info('[GridItemJsunit_static_0800] START');
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowStart',value:'1'})
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowEnd',value:'4'})
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let gridItem1 = CommonFunc.getComponentRect('gridItem1');
      let bottom1 = gridItem1.bottom;
      let gridItem2 = CommonFunc.getComponentRect('gridItem3');
      let top1 = gridItem2.top;
      const uiContext = new UIContext();
      expect(Math.abs((top1 - bottom1) - uiContext.vp2px(5)) <= 1).assertTrue();
      console.info('[GridItemJsunit_static_0800] END');
      done();
    });

    
  })
}
