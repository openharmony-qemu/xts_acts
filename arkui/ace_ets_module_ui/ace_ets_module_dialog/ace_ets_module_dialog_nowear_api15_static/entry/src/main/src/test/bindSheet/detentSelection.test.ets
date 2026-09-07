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
import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function detentSelection() {
  describe('detentSelection', () => {
    beforeEach(async () => {
      console.info("detentSelection beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/detentSelection",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get detentSelection state pages: " + JSON.stringify(pages));
        if (!("detentSelection" == pages.name)) {
          console.info("get detentSelection state pages.name: " + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push detentSelection page error: " + err);
        expect().assertFail();
      }
    });

    
    

    /**
     * @tc.number   detentSelection_static_0100
     * @tc.name     detentSelection_static_0100
     * @tc.desc     detentSelection_static_0100
     * @tc.level    Level.LEVEL1
     */
it('detentSelection_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('detentSelection_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('detentSelection_static_0100 sleep err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet')) as Component;
      btn!.click();
      console.info('[detentSelection_static_0100] bindSheet click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('detentSelection_static_0100 sleep err: ' + JSON.stringify(err));
      }

      let strJson1 = inspector.getInspectorByKey('text');
      let dent1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')

      let btn1: Component = await driver.findComponent(ON.id('changeBtn')) as Component;
      btn1!.click();
      console.info('[detentSelection_static_0100] changeBtn click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('detentSelection_static_0100 sleep err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('text');
      let dent2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')
      expect(dent1).assertEqual(dent2);
      let btn2: Component = await driver.findComponent(ON.id('close')) as Component;
      btn2!.click();
      console.info('[detentSelection_static_0100] END');
      done();
    });

    
    

    /**
     * @tc.number   detentSelection_static_0200
     * @tc.name     detentSelection_static_0200
     * @tc.desc     detentSelection_static_0200
     * @tc.level    Level.LEVEL1
     */
it('detentSelection_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('detentSelection_static_0200 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('detentSelection_static_0200 sleep err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bindSheet')) as Component;
      btn!.click();
      console.info('[detentSelection_static_0200] bindSheet click');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('detentSelection_static_0200 sleep err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('text');
      let dent1 = JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')

      let btn1: Component = await driver.findComponent(ON.id('changedetent')) as Component;
      btn1!.click();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('detentSelection_static_0200 sleep err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('text');
      let dent2 = JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')
      console.info('[detentSelection_static_0200] dent1 '+ dent1 +'dent2 '+ dent2);
      expect( Number(dent1) -  Number(dent2)!=0  ).assertTrue();
      let btn2: Component = await driver.findComponent(ON.id('close')) as Component;
      btn2!.click();
      console.info('[detentSelection_static_0200] END');
      done();
    });


  })
}
