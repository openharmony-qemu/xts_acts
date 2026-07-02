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

export default function arcSwiperShow() {
  describe('arcSwiperShow', () => {
    beforeAll(async (): Promise<void> => {
      console.info('arcSwiperShow beforeEach start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api26.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      console.info('arcSwiperShow beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/arcSwiperShow',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get arcSwiperShow state pages:' + JSON.stringify(pages));
        if (!('arcSwiperShow' == pages.name)) {
          console.info('get arcSwiperShow pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push arcSwiperShow page error:' + err);
      }
      console.info('arcSwiperShow beforeEach end');
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_SHOW_0100
     * @tc.number SUB_ARKUI_ARCSWIPER_SHOW_0100
     * @tc.desc   ArcSwiper component page flipping.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_SHOW_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperShow_0100] START');
      let driver = Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('arcSwiper_showNext')) as Component;
      await btn1.click();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('2'));
      let strJson1 = inspector.getInspectorByKey('arcSwiper_show_onChange');
      console.info('[arcSwiperShow_0100] component obj1 is: ' + JSON.stringify(JSON.parseJsonElement(strJson1)));
      console.info('[arcSwiperShow_0100] content1: ' +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onChange: 2');

      let strJson2 = inspector.getInspectorByKey('arcSwiper_show_finishAnimation');
      console.info('[arcSwiperShow_0100] content2: ' +
      JSON.stringify(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('finishText: 1');

      let strJson3 = inspector.getInspectorByKey('arcSwiper_show_onAnimationStart');
      console.info('[arcSwiperShow_0100] content3: ' +
      JSON.stringify(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationStart: 1');

      let strJson4 = inspector.getInspectorByKey('arcSwiper_show_onAnimationEnd');
      console.info('[arcSwiperShow_0100] content4: ' +
      JSON.stringify(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
        .assertEqual('onAnimationEnd: 2');
      await CommonFunc.sleep(1000);

      let btn2: Component = await driver.findComponent(ON.id('arcSwiper_showPrevious')) as Component;
      await btn2.click();
      await CommonFunc.sleep(1500);
      await driver.assertComponentExist(ON.text('1'));
      console.info('[arcSwiperShow_0100] END');
      done();
    });
  })
}
