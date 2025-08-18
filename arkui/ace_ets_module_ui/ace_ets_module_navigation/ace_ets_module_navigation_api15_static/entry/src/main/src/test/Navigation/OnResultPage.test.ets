/*
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
export default function OnResultPage() {
  describe('OnResultPage', () => {
    beforeAll(() => {

      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("OnResultPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/OnResultPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnResultPage state pages:" + JSON.stringify(pages));
        if (!("OnResultPage" == pages.name)) {
          console.info("get OnResultPage pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnResultPage page error:" + err);
      }
      console.info("OnResultPage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("OnResultPage after each called");
    });


    /**
     * @tc.number    OnResultPage_static_0100
     * @tc.name      OnResultPage_static_0100
     * @tc.desc      Test OnResult pop
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('pushId')) as Promise<Component>);
      await btn1.click()
      console.info('[OnResultPage_static_0100] btn1 click');
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0100] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('popId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0100] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('test');

      console.info('OnResultPage_static_0100 END');
      done();
    });

    /**
     * @tc.number    OnResultPage_static_0200
     * @tc.name      OnResultPage_static_0200
     * @tc.desc      Test OnResult popToIndex
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0200',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0200] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('popIndexId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0200] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0200] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');

      console.info('OnResultPage_static_0200 END');
      done();
    });

    /**
     * @tc.number    OnResultPage_static_0300
     * @tc.name      OnResultPage_static_0300
     * @tc.desc      Test OnResult popToName
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0300',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0300 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0300] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('popNameId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0300] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0300] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0300] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('popToName');

      console.info('OnResultPage_static_0300 END');
      done();
    });

    /**
     * @tc.number    OnResultPage_static_0400
     * @tc.name      OnResultPage_static_0400
     * @tc.desc      Test OnResult undefined
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0400',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0400 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0400] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('popUndefinedId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0400] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0400] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0400] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('undefined');

      console.info('OnResultPage_static_0400 END');
      done();
    });

    /**
     * @tc.number    OnResultPage_static_0500
     * @tc.name      OnResultPage_static_0500
     * @tc.desc      Test OnResult popToName
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0500',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0500 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushTwoId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0500] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('popNullId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0500] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0500] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0500] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('null');

      console.info('OnResultPage_static_0500 END');
      done();
    });


    /**
     * @tc.number    OnResultPage_static_0600
     * @tc.name      OnResultPage_static_0600
     * @tc.desc      Test push dialog page pop
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0600',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0600 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushDialogId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0600] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('dialogPopId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0600] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0600] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0600] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('test');

      console.info('OnResultPage_static_0600 END');
      done();
    });

    /**
     * @tc.number    OnResultPage_static_0700
     * @tc.name      OnResultPage_static_0700
     * @tc.desc      Test push dialog page popToIndex
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0700',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0700 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushDialogId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0700] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('dialogPopIndexId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0700] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0700] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0700] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('popToIndex');

      console.info('OnResultPage_static_0700 END');
      done();
    });

    /**
     * @tc.number    OnResultPage_static_0800
     * @tc.name      OnResultPage_static_0800
     * @tc.desc      Test push dialog page popToName
     * @tc.level     Level 2
     */
    it('OnResultPage_static_0800',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnResultPage_static_0800 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn2 = await (driver.findComponent(ON.id('pushDialogId')) as Promise<Component>);
      await btn2.click()
      console.info('[OnResultPage_static_0800] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await (driver.findComponent(ON.id('dialogPopNameId')) as Promise<Component>);
      await btn3.click()
      console.info('[OnResultPage_static_0800] btn3 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('infoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[OnResultPage_static_0800] component obj is: ' + JSON.stringify(obj));
      console.info('[OnResultPage_static_0800] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('popToName');

      console.info('OnResultPage_static_0800 END');
      done();
    });
  })
}