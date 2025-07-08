/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function swiperJsunit() {
  describe('swiperTest', () => {
    beforeAll(() => {
      console.info("swiperTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await startAbility("com.open.harmony.acetest.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      const swiper = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper',
      }
      try {
        swiper.clear();
        let pages = swiper.getState();
        console.info("get swiper state success " + JSON.stringify(pages));
        if (!("swiper" == pages.name)) {
          console.info("get swiper state success " + JSON.stringify(pages.name));
           swiper.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push swiper page error: " + err);
      }
    });

    /**
     * @tc.number swiperTest_static_0001
     * @tc.name swiperTest_static_0001
     * @tc.desc Set nextMargin values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0001 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0001 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('nextMargin')).assertEqual('10.00vp');
      console.info('swiperTest_static_0001 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0002
     * @tc.name swiperTest_static_0002
     * @tc.desc Set prevMargin values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0002 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0002 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('prevMargin')).assertEqual('2.00vp');
      console.info('swiperTest_static_0002 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0003
     * @tc.name swiperTest_static_0003
     * @tc.desc Set displayCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0003 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0003 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('displayCount')).assertEqual(2);
      console.info('swiperTest_static_0003 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0004
     * @tc.name swiperTest_static_0004
     * @tc.desc Set disableSwipe values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0004 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0004 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('disableSwipe')).assertEqual('true');
      console.info('swiperTest_static_0004 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0005
     * @tc.name swiperTest_static_0005
     * @tc.desc Set effectMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0005 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0005 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('effectMode')).assertEqual('EdgeEffect.Spring');
      console.info('swiperTest_static_0005 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0000
     * @tc.name swiperTest_static_0006
     * @tc.desc Set cachedCount values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0006 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0006 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('cachedCount')).assertEqual(2);
      console.info('swiperTest_static_0006 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0007
     * @tc.name swiperTest_static_0007
     * @tc.desc Set displayMode values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0007 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0007 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('displayMode')).assertEqual('SwiperDisplayMode.Stretch');
      console.info('swiperTest_static_0007 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0008
     * @tc.name swiperTest_static_0008
     * @tc.desc Set itemSpace values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0008 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0008 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('itemSpace')).assertEqual('10.00vp');
      console.info('swiperTest_static_0008 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0009
     * @tc.name swiperTest_static_0009
     * @tc.desc Set loop values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0009 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0009 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('loop')).assertEqual('true');
      console.info('swiperTest_static_0009 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0010
     * @tc.name swiperTest_static_0010
     * @tc.desc Set interval values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0010 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0010 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('interval')).assertEqual('4000');
      console.info('swiperTest_static_0010 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0011
     * @tc.name swiperTest_static_0011
     * @tc.desc Set vertical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0011 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0011 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('vertical')).assertEqual('true');
      console.info('swiperTest_static_0011 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0012
     * @tc.name swiperTest_static_0012
     * @tc.desc Set autoPlay values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0012 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0012 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('autoPlay')).assertEqual('true');
      console.info('swiperTest_static_0012 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0013
     * @tc.name swiperTest_static_0013
     * @tc.desc Set index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0013 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0013 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('index')).assertEqual('1');
      console.info('swiperTest_static_0013 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_0014
     * @tc.name swiperTest_static_0014
     * @tc.desc Set indicator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_0014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_0014 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_0014 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      let indicator = objNew.getElement('$attrs').getElement('indicator');
      expect(indicator.getString('color')).assertEqual("#FF123456");
      console.info('swiperTest_static_0014 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_015
     * @tc.name swiperTest_static_015
     * @tc.desc Set curve values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_015 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_015 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('curve')).assertEqual('Curves.Linear');
      console.info('swiperTest_static_015 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_016
     * @tc.name swiperTest_static_016
     * @tc.desc Set duration values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_016 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_016 component is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('duration')).assertEqual('300');
      console.info('swiperTest_static_016 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_017
     * @tc.name swiperTest_static_017
     * @tc.desc Set displayArrow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_017 START');
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_017 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('displayArrow')).assertEqual('false');
      console.info('swiperTest_static_017 END');
      done();
    });

    /**
     * @tc.number swiperTest_static_018
     * @tc.name swiperTest_static_018
     * @tc.desc Change index values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('swiperTest_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('swiperTest_static_018 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('swiper');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("swiperTest_static_018 component  is: " + JSON.stringify(objNew.getElement('$attrs')));
      expect(objNew.getElement('$attrs').getString('index')).assertEqual('5');
      console.info('swiperTest_static_018 END');
      done();
    });
  })
}