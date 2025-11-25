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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function arcDotIndicator() {
  describe('arcDotIndicator', () => {
    beforeAll(() => {
      console.info("arcDotIndicator beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.arcScroll_api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("arcDotIndicator beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcDotIndicator",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get arcDotIndicator state pages:" + JSON.stringify(pages));
        if (!("arcDotIndicator" == pages.name)) {
          console.info("get arcDotIndicator pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push arcDotIndicator page error:" + err);
      }
      console.info("arcDotIndicator beforeEach end");
    });

    
    /*
     * @tc.number   arcDotIndicator_static_0100
     * @tc.name     arcDotIndicator_static_0100
     * @tc.desc     arcDotIndicator_static_0100
     * @tc.level    Level.LEVEL0
     */
it('arcDotIndicator_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcDotIndicator_static_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('arcs_arcDirection');
      console.info('arcDotIndicator_static_0100 :' + JSON.stringify(strJson));
      let obj= JSON.parseJsonElement(strJson);
      console.info("arcDotIndicator_static_0100 component obj is: " + JSON.stringify(obj));
      console.info("arcDotIndicator_static_0100 component obj.getElement('$attrs') is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("arcDotIndicator_static_0100 getString('indicator') is: " + JSON.stringify(obj.getElement('$attrs').getString('indicator')));
      let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info("arcDotIndicator_static_0100 arcDirection is: " + JSON.stringify(obj2.getString('arcDirection')));
      expect(obj2.getString('arcDirection')).assertEqual("ArcDirection.SIX_CLOCK_DIRECTION");
      expect(obj2.getString('itemColor')).assertEqual("#FF808080");
      expect(obj2.getString('selectedItemColor')).assertEqual("#FF008000");
      console.info('arcDotIndicator_static_0100 END ');
      done();
    });

    
    /*
     * @tc.number   arcDotIndicator_static_0200
     * @tc.name     arcDotIndicator_static_0200
     * @tc.desc     arcDotIndicator_static_0200
     * @tc.level    Level.LEVEL0
     */
it('arcDotIndicator_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcDotIndicator_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let btn1 = await driver.findComponent(ON.id('arcs_arcDirection_3'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('arcs_arcDirection');
      console.info('arcDotIndicator_static_0200 :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("arcDotIndicator_static_0200 component obj is: " + JSON.stringify(obj));
      console.info("arcDotIndicator_static_0200 component obj.getElement('$attrs') is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("arcDotIndicator_static_0200 getString('indicator') is: " + JSON.stringify(obj.getElement('$attrs').getString('indicator')));
      let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info("arcDotIndicator_static_0200 arcDirection is: " + JSON.stringify(obj2.getString('arcDirection')));
      expect(obj2.getString('arcDirection')).assertEqual("ArcDirection.THREE_CLOCK_DIRECTION");
      expect(obj2.getString('itemColor')).assertEqual("#FF0000FF");
      expect(obj2.getString('selectedItemColor')).assertEqual("#FFFFFF00");
      console.info('[arcDotIndicator_static_0200] END');
      done();
    });

    
    /*
     * @tc.number   arcDotIndicator_static_0300
     * @tc.name     arcDotIndicator_static_0300
     * @tc.desc     arcDotIndicator_static_0300
     * @tc.level    Level.LEVEL0
     */
it('arcDotIndicator_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcDotIndicator_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let btn1 = await driver.findComponent(ON.id('arcs_arcDirection_9'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('arcs_arcDirection');
      console.info('arcDotIndicator_static_0300 :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info("arcDotIndicator_static_0300 component obj is: " + JSON.stringify(obj));
      console.info("arcDotIndicator_static_0300 component obj.getElement('$attrs') is: " + JSON.stringify(obj.getElement('$attrs')));
      console.info("arcDotIndicator_static_0300 getString('indicator') is: " + JSON.stringify(obj.getElement('$attrs').getString('indicator')));
      let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info("arcDotIndicator_static_0300 arcDirection is: " + JSON.stringify(obj2.getString('arcDirection')));
      expect(obj2.getString('arcDirection')).assertEqual("ArcDirection.NINE_CLOCK_DIRECTION");
      expect(obj2.getString('itemColor')).assertEqual("#FFFFEC8B");
      expect(obj2.getString('selectedItemColor')).assertEqual("#FFFF0000");
      console.info('[arcDotIndicator_static_0300] END');
      done();
    });
  })
}
