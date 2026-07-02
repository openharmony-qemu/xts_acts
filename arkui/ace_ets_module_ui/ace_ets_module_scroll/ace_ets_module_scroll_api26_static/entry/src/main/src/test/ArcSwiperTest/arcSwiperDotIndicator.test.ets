'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  it,
  expect,
  Level,
  beforeAll,
  beforeEach,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';

export default function arcSwiperDotIndicator() {
  describe('arcSwiperDotIndicator', () => {
    beforeAll(async (): Promise<void> => {
      console.info('arcSwiperDotIndicator beforeEach start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api26.static', 'EntryAbility')
    });


    beforeEach(async (): Promise<void> => {
      console.info('arcSwiperDotIndicator beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/arcSwiperDotIndicator',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get arcSwiperDotIndicator state pages:' + JSON.stringify(pages));
        if (!('arcSwiperDotIndicator' == pages.name)) {
          console.info('get arcSwiperDotIndicator pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push arcSwiperDotIndicator page error:' + err);
      }
      console.info('arcSwiperDotIndicator beforeEach end');
    });


    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0100
     * @tc.number SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0100
     * @tc.desc   The direction of the arc-shaped indicator is the 6 o'clock direction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperDotIndicator_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('arcs_arcDirection');
      console.info('arcSwiperDotIndicator_0100 :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('arcSwiperDotIndicator_0100 component obj is: ' + JSON.stringify(obj));
      console.info('arcSwiperDotIndicator_0100 component obj.$attrs is: ' + JSON.stringify(obj.getElement('$attrs')));
      console.info('arcSwiperDotIndicator_0100 indicator is: ' +
      JSON.stringify(obj.getElement('$attrs').getElement('indicator')));
      let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info('arcSwiperDotIndicator_0100 arcDirection is: ' + JSON.stringify(obj2.getString('arcDirection')));
      expect(obj2.getString('arcDirection')).assertEqual('ArcDirection.SIX_CLOCK_DIRECTION');
      expect(obj2.getString('itemColor')).assertEqual('#FF808080');
      expect(obj2.getString('selectedItemColor')).assertEqual('#FF008000');
      console.info('arcSwiperDotIndicator_0100 END ');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0200
     * @tc.number SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0200
     * @tc.desc   The direction of the arc-shaped indicator is the 3 o'clock direction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperDotIndicator_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('arcs_arcDirection_3')) as Component;
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('arcs_arcDirection');
      console.info('arcSwiperDotIndicator_0200 :' + JSON.stringify(strJson1));
      let obj3 = JSON.parseJsonElement(strJson1);
      console.info('arcSwiperDotIndicator_0200 component obj is: ' + JSON.stringify(obj3));
      console.info('arcSwiperDotIndicator_0200 component obj.$attrs is: ' + JSON.stringify(obj3.getElement('$attrs')));
      console.info('arcSwiperDotIndicator_0200 indicator is: ' +
      JSON.stringify(obj3.getElement('$attrs').getElement('indicator')));
      await CommonFunc.sleep(1500);
      let obj4 = JSON.parseJsonElement(obj3.getElement('$attrs').getString('indicator'));
      console.info('arcSwiperDotIndicator_0200 arcDirection is: ' + JSON.stringify(obj4.getString('arcDirection')));
      await CommonFunc.sleep(1500);
      expect(obj4.getString('arcDirection')).assertEqual('ArcDirection.THREE_CLOCK_DIRECTION');
      expect(obj4.getString('itemColor')).assertEqual('#FF0000FF');
      expect(obj4.getString('selectedItemColor')).assertEqual('#FFFFFF00');
      console.info('[arcSwiperDotIndicator_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0300
     * @tc.number SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0300
     * @tc.desc   The direction of the arc-shaped indicator is the 9 o'clock direction.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_DOTINDICATOR_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperDotIndicator_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      let btn2: Component = await driver.findComponent(ON.id('arcs_arcDirection_9')) as Component;
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson = inspector.getInspectorByKey('arcs_arcDirection');
      console.info('arcSwiperDotIndicator_0300 :' + JSON.stringify(strJson));
      let obj = JSON.parseJsonElement(strJson);
      console.info('arcSwiperDotIndicator_0300 component obj is: ' + JSON.stringify(obj));
      console.info('arcSwiperDotIndicator_0300 component obj.$attrs is: ' + JSON.stringify(obj.getElement('$attrs')));
      console.info('arcSwiperDotIndicator_0300 indicator is: ' +
      JSON.stringify(obj.getElement('$attrs').getElement('indicator')));
      await CommonFunc.sleep(1500);
      let obj2 = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info('arcSwiperDotIndicator_0300 arcDirection is: ' + JSON.stringify(obj2.getString('arcDirection')));
      await CommonFunc.sleep(1500);
      expect(obj2.getString('arcDirection')).assertEqual('ArcDirection.NINE_CLOCK_DIRECTION');
      expect(obj2.getString('itemColor')).assertEqual('#FFFFEC8B');
      expect(obj2.getString('selectedItemColor')).assertEqual('#FFFF0000');
      console.info('[arcSwiperDotIndicator_0300] END');
      done();
    });
  })
}