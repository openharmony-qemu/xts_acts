'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'

export default function webGetTitleJsunit() {
  describe('webGetTitleTest', () => {
    beforeAll(() => {
      console.info("webGetTitleJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.globalnowear.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/web/web2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get web state success " + JSON.stringify(pages));
        if (!("web" == pages.name)) {
          console.info("get web state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push web page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("webGetTitle after each called");
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0001
     * @tc.name     testwebGetTitle_static_0001
     * @tc.desc     testwebGetTitle_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0001', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0001 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0001] component height strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual("500.00vp");
        console.info("[testwebGetTitle_static_0001] height value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));
      } else {
        expect('null').assertEqual('null');
      }
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0002
     * @tc.name     testwebGetTitle_static_0002
     * @tc.desc     testwebGetTitle_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0002', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0002 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0002] component fileAccess strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fileAccess')).assertEqual(undefined);
        console.info("[testwebGetTitle_static_0002] fileAccess value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fileAccess'));
      } else {
        expect('null').assertEqual('null');
      }
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0003
     * @tc.name     testwebGetTitle_static_0003
     * @tc.desc     testwebGetTitle_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0003', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('getTitleText');
      console.info("[testwebGetTitle_static_0003] component javaScriptAccess strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('Web');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('javaScriptAccess')).assertEqual(undefined);
      console.info("[testwebGetTitle_static_0003] javaScriptAccess value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('javaScriptAccess'));

    });

    


    /*
     * @tc.number   testwebGetTitle_static_0004
     * @tc.name     testwebGetTitle_static_0004
     * @tc.desc     testwebGetTitle_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0004', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0004 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0004] component padding strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual("20.00vp");
        console.info("[testwebGetTitle_static_0004] padding value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));
      } else {
        expect('null').assertEqual('null');
      }
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0005
     * @tc.name     testwebGetTitle_static_0005
     * @tc.desc     testwebGetTitle_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0005', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0005 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0005] component blur strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('blur')).assertEqual(2);
        console.info("[testwebGetTitle_static_0005] blur value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('blur'));
      } else {
        expect('null').assertEqual('null');
      }
    });


    

    /*
     * @tc.number   testwebGetTitle_static_0006
     * @tc.name     testwebGetTitle_static_0006
     * @tc.desc     testwebGetTitle_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0006', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0006 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0006] component userAgent strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('userAgent')).assertEqual(undefined);
        console.info("[testwebGetTitle_static_0006] userAgent value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('userAgent'));
      } else {
        expect('null').assertEqual('null');
      }
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0007
     * @tc.name     testwebGetTitle_static_0007
     * @tc.desc     testwebGetTitle_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0007', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0007 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0007] component fileFromUrlAccess strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fileFromUrlAccess')).assertEqual(undefined);
        console.info("[testwebGetTitle_static_0007] fileFromUrlAccess value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fileFromUrlAccess'));
      } else {
        expect('null').assertEqual('null');
      }
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0008
     * @tc.name     testwebGetTitle_static_0008
     * @tc.desc     testwebGetTitle_static_0008
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0008', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0008 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0008] component initialScale strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('initialScale')).assertEqual(undefined);
        console.info("[testwebGetTitle_static_0008] initialScale value :" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('initialScale'));
      } else {
        expect('null').assertEqual('null');
      }
    });

    


    /*
     * @tc.number   testwebGetTitle_static_0009
     * @tc.name     testwebGetTitle_static_0009
     * @tc.desc     testwebGetTitle_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testwebGetTitle_static_0009', Level.LEVEL0, async  (): Promise<void>  => {
      console.info('webGetTitle testwebGetTitle_static_0009 START');
      let driver: Driver = Driver.create();
      let size = await driver.getDisplaySize();
      if (size.x != 466 && size.y != 466) {
        await Utils.sleep(2000);
        let strJson = inspector.getInspectorByKey('getTitleText');
        console.info("[testwebGetTitle_static_0009] component strJson:" + strJson);
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getString('$type')).assertEqual('Web');
        console.info("[testwebGetTitle_static_0009] type value :" + obj.getString('$type'));
      } else {
        expect('null').assertEqual('null');
      }
    });
  })
}
