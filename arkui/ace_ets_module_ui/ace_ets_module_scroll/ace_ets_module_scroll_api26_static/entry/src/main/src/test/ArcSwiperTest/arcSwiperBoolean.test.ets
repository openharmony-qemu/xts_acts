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
} from '@ohos/hypium-binary/src/main/indexStatic';
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

export default function arcSwiperBoolean() {
  describe('arcSwiperBoolean', () => {
    beforeAll(async (): Promise<void> => {
      console.info('arcSwiperBoolean beforeEach start');
      await UtilsTest.startAbility('com.arkui.ace.scroll.api26.static', 'EntryAbility')
    });

    beforeEach(async (): Promise<void> => {
      console.info('arcSwiperBoolean beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/arcSwiperBoolean',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get arcSwiperBoolean state pages:' + JSON.stringify(pages));
        if (!('arcSwiperBoolean' == pages.name)) {
          console.info('get arcSwiperBoolean pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push arcSwiperBoolean page error:' + err);
      }
      console.info('arcSwiperBoolean beforeEach end');
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_BOOLEAN_0100
     * @tc.number SUB_ARKUI_ARCSWIPER_BOOLEAN_0100
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_BOOLEAN_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperBoolean_0100] START');
      let driver = Driver.create()
      let select1: Component = await driver.findComponent(ON.id('select_boolean')) as Component;
      await select1.click();
      await CommonFunc.sleep(500);
      let text1: Component = await driver.findComponent(ON.text('vertical:true')) as Component;
      await text1.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_boolean');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperBoolean_0100] str' + JSON.stringify(strJson));
      console.info('[arcSwiperBoolean_0100] vertical: ' +
      JSON.stringify(obj.getElement('$attrs').getString('vertical')));

      console.info('[arcSwiperBoolean_0100] disableSwipe: ' +
      JSON.stringify(obj.getElement('$attrs').getString('disableSwipe')));

      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('disableSwipe')).assertEqual('true');
      console.info('[arcSwiperBoolean_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_BOOLEAN_0200
     * @tc.number SUB_ARKUI_ARCSWIPER_BOOLEAN_0200
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_BOOLEAN_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperBoolean_0200] START');
      let driver = Driver.create()
      let select2: Component = await driver.findComponent(ON.id('select_boolean')) as Component;
      await select2.click();
      await CommonFunc.sleep(500);
      let text2: Component = await driver.findComponent(ON.text('vertical:false')) as Component;
      await text2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_boolean');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperBoolean_0200] str' + JSON.stringify(strJson));

      console.info('[arcSwiperBoolean_0200] vertical: ' +
      JSON.stringify(obj.getElement('$attrs').getString('vertical')));

      console.info('[arcSwiperBoolean_0200] disableSwipe: ' +
      JSON.stringify(obj.getElement('$attrs').getString('disableSwipe')));

      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('disableSwipe')).assertEqual('false');
      console.info('[arcSwiperBoolean_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_BOOLEAN_0300
     * @tc.number SUB_ARKUI_ARCSWIPER_BOOLEAN_0300
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_BOOLEAN_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperBoolean_0300] START');
      let driver = Driver.create()
      let select2: Component = await driver.findComponent(ON.id('select_boolean')) as Component;
      await select2.click();
      await CommonFunc.sleep(500);
      let text2: Component = await driver.findComponent(ON.text('vertical:undefined')) as Component;
      await text2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_boolean');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperBoolean_0300] str' + JSON.stringify(strJson));

      console.info('[arcSwiperBoolean_0300] vertical: ' +
      JSON.stringify(obj.getElement('$attrs').getString('vertical')));

      console.info('[arcSwiperBoolean_0300] disableSwipe: ' +
      JSON.stringify(obj.getElement('$attrs').getString('disableSwipe')));

      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('disableSwipe')).assertEqual('false');
      console.info('[arcSwiperBoolean_0300] END');
      done();
    });
  })
}
