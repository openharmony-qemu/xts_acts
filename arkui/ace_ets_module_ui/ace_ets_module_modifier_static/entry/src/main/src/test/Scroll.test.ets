/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../hypium/index"
import Utils from './Utils'
import events_emitter from '@ohos.events.emitter';
import { Driver, Component, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
import CommonFunc from '../../ets/MainAbility/common/Common';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function scrollOnScrollBeginJsunit() {
  describe('scrollTest', () => {

    beforeAll(() => {
      console.info("scroll beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await startAbility("com.open.harmony.acetest.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("scroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/scroll",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get scroll state pages:" + JSON.stringify(pages));
        if (pages == null || !("scroll" == pages.name)) {
          console.info("get scroll pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push scroll page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scroll page error:" + err);
      }
      console.info("scroll beforeEach end");
    });

    /**
     * @tc.number testScroll0001
     * @tc.name testScroll_static_0001
     * @tc.desc Set scrollSnapAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0001 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0001] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('scrollSnapAlign')).assertEqual("ScrollSnapAlign.NONE");
      console.info('testScroll_static_0001 END');
      done();
    });

    /**
     * @tc.number testScroll0002
     * @tc.name testScroll_static_0002
     * @tc.desc Set friction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0002 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0002] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getInteger('friction')).assertEqual(1);
      console.info('testScroll_static_0001 END');
      done();
    });

    /**
     * @tc.number testScroll0003
     * @tc.name testScroll_static_0003
     * @tc.desc Set enableScrollInteraction values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0003 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0003] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getBoolean('enableScrollInteraction')).assertEqual(true);
      console.info('testScroll_static_0003 END');
      done();
    });

    /**
     * @tc.number testScroll0005
     * @tc.name testScroll_static_0005
     * @tc.desc Set scrollable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0005 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0005] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('scrollable')).assertEqual("ScrollDirection.Vertical");
      console.info('testScroll_static_0005 END');
      done();
    });

    /**
     * @tc.number testScroll0006
     * @tc.name testScroll_static_0006
     * @tc.desc Set scrollBar values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0006 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0006] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('scrollBar')).assertEqual("BarState.Auto");
      console.info('testScroll_static_0006 END');
      done();
    });

    /**
     * @tc.number testScroll0007
     * @tc.name testScroll_static_0007
     * @tc.desc Set scrollBarWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0007 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0007] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('scrollBarWidth')).assertEqual("5.00vp");
      console.info('testScroll_static_0007 END');
      done();
    });

    /**
     * @tc.number testScroll0008
     * @tc.name testScroll_static_0008
     * @tc.desc Set edgeEffect values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0008 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0008] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('edgeEffect')).assertEqual("EdgeEffect.None");
      console.info('testScroll_static_0008 END');
      done();
    });

    /**
     * @tc.number testScroll0009
     * @tc.name testScroll_static_0009
     * @tc.desc Set scrollBarColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0009 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0009] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF123456");
      console.info('testScroll_static_0009 END');
      done();
    });

    /**
     * @tc.number testScroll0010
     * @tc.name testScroll_static_0010
     * @tc.desc Set enablePaging values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0010 START');
      let strJson = inspector.getInspectorByKey('ScrollKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testScroll_static_0010] obj is: " + obj.getElement('$attrs'));
      expect(obj.getElement('$attrs').getString('enablePaging')).assertEqual(undefined);
      console.info('testScroll_static_0010 END');
      done();
    });

    /**
     * @tc.number testScroll0011
     * @tc.name testScroll_static_0011
     * @tc.desc Change scrollBarColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('testScroll_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testScroll_static_0011 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      button!.click();
      await Utils.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('ScrollKey1');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("testScroll_static_0011 component  is: " + objNew.getElement('$attrs'));
      expect(objNew.getElement('$attrs').getString('scrollBarColor')).assertEqual("#FF222222");
      console.info('testScroll_static_0011 END');
      done();
    });
  })
}
