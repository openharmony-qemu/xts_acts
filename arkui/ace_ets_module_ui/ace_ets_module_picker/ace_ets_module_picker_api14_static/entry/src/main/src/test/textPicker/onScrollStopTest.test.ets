'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, it, expect, Level, Size, afterEach, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function onScrollStopTest(){
  describe('onScrollStopTest',  () =>{

    beforeEach(async () =>{
      console.info('onScrollStopTest beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/onScrollStopTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get onScrollStopTest state pages: ' + JSON.stringify(pages));
        if (!('onScrollStopTest' == pages.name)) {
          console.info('get onScrollStopTest state pages.name: ' + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          // let result = await routerInstance.replace(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push onScrollStopTest page error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async () => {
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/index/index',
      }
      routerInstance.replaceUrl(options);
    });
    
    
    
    
    /**
     * @tc.number   onScrollStopTest_static_0100
     * @tc.name     onScrollStopTest_static_0100
     * @tc.desc     onScrollStopTest_static_0100
     * @tc.level    Level.LEVEL3
     */
it('onScrollStopTest_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {

      console.info('onScrollStopTest_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('myTextPicker'));
      let rect = await btn1!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.swipe(Math.round((rect.left+rect.right)/2).toInt(),Math.round((rect.top+rect.bottom)/2).toInt(),
        Math.round((rect.left+rect.right)/2).toInt(),Math.round((rect.top+rect.bottom)/4).toInt(),600);
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('text');
      console.info('[onScrollStopTest_static_0100] onScrollStopTest JSON.parseJsonElement(strJson) is: ' + JSON.stringify(strJson));
      console.info('[onScrollStopTest_static_0100] component JSON.parseJsonElement(strJson) is: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info('[onScrollStopTest_static_0100] title: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('stop');
      await CommonFunc.sleep(1000);
      console.info('[onScrollStopTest_static_0100] END');
      done();
    });

    
    
    
    
    /**
     * @tc.number   onScrollStopTest_static_0200
     * @tc.name     onScrollStopTest_static_0200
     * @tc.desc     onScrollStopTest_static_0200
     * @tc.level    Level.LEVEL3
     */
it('onScrollStopTest_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {

      console.info('onScrollStopTest_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('myTextPicker1'));
      console.log('++++++++++++++++++++++1')
      await btn1!.click()
      console.log('++++++++++++++++++++++2')
      let btn2 = await driver.findComponent(ON.text('确定'));
      console.log('++++++++++++++++++++++3')
      await btn2!.click()
      console.log('++++++++++++++++++++++4')
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('text1');
      console.info('[onScrollStopTest_static_0200] onScrollStopTest JSON.parseJsonElement(strJson) is: ' + JSON.stringify(strJson));
      console.info('[onScrollStopTest_static_0200] component JSON.parseJsonElement(strJson) is: ' + JSON.stringifyJsonElement(JSON.parseJsonElement(strJson)));
      console.info('[onScrollStopTest_static_0200] title: ' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('stop');
      await CommonFunc.sleep(1000);
      console.info('[onScrollStopTest_static_0200] END');
      done();
    });
  })
}

