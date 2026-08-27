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
import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../hypium/index"
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { BarState, Color } from '@ohos.arkui.component'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';


export default function GridJsunit() {
  describe('GridJsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("GridJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get GridJsunit state pages: " + JSON.stringify(pages));
        if (!("GridPage" == pages.name)) {
          console.info("get GridJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridJsunit page error: " + err);
      }
    });


    
    
    

/**
     * @tc.number   GridJsunit_static_0100
     * @tc.name     GridJsunit_static_0100
     * @tc.desc     GridJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0100] START');
      let strJson1 = inspector.getInspectorByKey('GridPage' + '_grid1');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[GridJsunit_static_0100] component obj is: " + JSON.stringify(obj));
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('multiSelectable')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('supportAnimation')).assertEqual('false');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('GridPage' + '_grid2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Off');
      expect(obj2.getElement('$attrs').getString('scrollBarColor')).assertEqual('#FF808080');
      expect(obj2.getElement('$attrs').getString('scrollBarWidth')).assertEqual('20.00vp');
      console.info('[GridJsunit_static_0100] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0200
     * @tc.name     GridJsunit_static_0200
     * @tc.desc     GridJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0200] START');
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'columnsGap', value: 15.0
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowsGap', value: 20.0
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<BarState>>('messageManager')?.notify({
        name: 'scrollBar', value: BarState.On
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'scrollBarColor', value: 'Color.Blue'
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'scrollBarWidth', value: 30.0
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'cachedCount', value: 2
      })
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }

      
      let strJson = inspector.getInspectorByKey('GridPage' + '_grid1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('15.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(2);
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('GridPage' + '_grid2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('scrollBarColor'))
        .assertEqual(obj.getElement('$attrs').getString('scrollBarColor'));
      expect(obj2.getElement('$attrs').getString('scrollBarWidth')).assertEqual('30.00vp');
      console.info('[GridJsunit_static_0200] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0300
     * @tc.name     GridJsunit_static_0300
     * @tc.desc     GridJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0300] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'columnsGap', value: 0.0
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'rowsGap', value: -10.0
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<BarState>>('messageManager')?.notify({
        name: 'scrollBar', value: BarState.Auto
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'scrollBarColor', value: 'aaa'
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<number>>('messageManager')?.notify({
        name: 'scrollBarWidth', value: -10.0
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<int>>('messageManager')?.notify({
        name: 'cachedCount', value: 1
      })
            try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }

      
      let strJson = inspector.getInspectorByKey('GridPage' + '_grid1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[GridJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(1);
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('GridPage' + '_grid2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[GridJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Auto');
      expect(obj2.getElement('$attrs').getString('scrollBarColor'))
        .assertEqual(obj.getElement('$attrs').getString('scrollBarColor'));
      expect(obj2.getElement('$attrs').getString('scrollBarWidth')).assertEqual('4.00vp');
      console.info('[GridJsunit_static_0300] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0400
     * @tc.name     GridJsunit_static_0400
     * @tc.desc     GridJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0400] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }

      
      let grid2 = CommonFunc.getComponentRect('GridPage' + '_grid2');
      let top = grid2.top
      let bottom = grid2.bottom
      let left = grid2.left
      let right = grid2.right
      let driver = Driver.create()

            try {
        await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
            try {
        await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let onScrollIndex1:Component = await driver.findComponent(ON.id('GridPage' + '_onScrollIndex')) as Component;
      let text1 = await (onScrollIndex1?.getText() as Promise<string>);
      expect(text1).assertEqual('onScrollIndex:2');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }

            try {
        await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
            try {
        await driver.swipe((Math.round((right - left) / 2)).toInt(),
        (Math.round(bottom - UIContext.resolveUIContext()!.vp2px(10))).toInt(),
        (Math.round((right - left) / 2)).toInt(),
        (Math.round(top + UIContext.resolveUIContext()!.vp2px(10))).toInt());
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let onScrollIndex2:Component = await driver.findComponent(ON.id('GridPage' + '_onScrollIndex')) as Component;
      let text2 = await (onScrollIndex2?.getText() as Promise<string>);
      expect(text2).assertEqual('onScrollIndex:2');


      let button:Component = await driver.findComponent(ON.id('GridPage' + '_button')) as Component;
            try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('GridPage' + '_button');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('label')).assertEqual('clicked');
      console.info('[GridJsunit_static_0400] END');
      done();
    });


/**
     * @tc.number   GridJsunit_static_0500
     * @tc.name     GridJsunit_static_0500
     * @tc.desc     GridJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0500] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('GridPage' + '_grid_default');
      let obj = JSON.parseJsonElement(strJson1);
      console.info("[GridJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[GridJsunit_static_0500] columnsGap: " +
      JSON.stringify(obj.getElement('$attrs').getString('columnsGap')));
      console.info("[GridJsunit_static_0500] rowsGap: " +
      JSON.stringify(obj.getElement('$attrs').getString('rowsGap')));
      console.info("[GridJsunit_static_0500] scrollBar: " +
      JSON.stringify(obj.getElement('$attrs').getString('scrollBar')));
      console.info("[GridJsunit_static_0500] cachedCount: " +
      JSON.stringify(obj.getElement('$attrs').getDouble('cachedCount')));
      console.info("[GridJsunit_static_0500] supportAnimation: " +
      JSON.stringify(obj.getElement('$attrs').getString('supportAnimation')));
      expect(obj.getElement('$attrs').getString('columnsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('rowsGap')).assertEqual('0.00vp');
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual('BarState.Auto');
      expect(obj.getElement('$attrs').getDouble('cachedCount')).assertEqual(1);
      expect(obj.getElement('$attrs').getString('supportAnimation')).assertEqual('false');
      console.info('[GridJsunit_static_0500] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0600
     * @tc.name     GridJsunit_static_0600
     * @tc.desc     GridJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0600] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: '1fr 1fr'
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: '1fr 1fr'
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let gridItem1 = CommonFunc.getComponentRect('0');
      let bottom = gridItem1.bottom
      let gridItem2 = CommonFunc.getComponentRect('2');
      let top = gridItem2.top
      expect(top > bottom).assertTrue();

      
      let driver = Driver.create()
      let grid_1 = await driver.findComponent(ON.id('GridPage' + '_grid1'));
      let result = await (grid_1?.isScrollable() as Promise<boolean>)
      expect(result).assertFalse();
      console.info('[GridJsunit_static_0600] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0700
     * @tc.name     GridJsunit_static_0700
     * @tc.desc     GridJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0700] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: '1fr 1fr 1fr 1fr'
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: ''
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let gridItem1 = CommonFunc.getComponentRect('0');
      let left1 = gridItem1.left
      let gridItem2 = CommonFunc.getComponentRect('4');
      let left2 = gridItem2.left
      expect(left1).assertEqual(left2);
      console.info('[GridJsunit_static_0700] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0800
     * @tc.name     GridJsunit_static_0800
     * @tc.desc     GridJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0800] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: ''
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: '1fr 1fr 1fr 1fr'
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      let gridItem1 = CommonFunc.getComponentRect('0');
      let left1 = gridItem1.left
      let gridItem2 = CommonFunc.getComponentRect('1');
      let left2 = gridItem2.left
      expect(Math.round(left1)).assertEqual(Math.round(left2));
      console.info('[GridJsunit_static_0800] END');
      done();
    });

    
    
    

/**
     * @tc.number   GridJsunit_static_0900
     * @tc.name     GridJsunit_static_0900
     * @tc.desc     GridJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('GridJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      
      console.info('[GridJsunit_static_0900] START');
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'columnsTemplate', value: ''
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.get<MessageManager<string>>('messageManager')?.notify({
        name: 'rowsTemplate', value: ''
      })
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridJsunitTest await err: ' + JSON.stringify(err));
      }
      
      let driver = Driver.create()
      let grid_1 = await driver.findComponent(ON.id('GridPage' + '_grid1'));
      let result = await (grid_1?.isScrollable() as Promise<boolean>)
      expect(result).assertFalse();
      console.info('[GridJsunit_static_0900] END');
      done();
    });
  })
}
