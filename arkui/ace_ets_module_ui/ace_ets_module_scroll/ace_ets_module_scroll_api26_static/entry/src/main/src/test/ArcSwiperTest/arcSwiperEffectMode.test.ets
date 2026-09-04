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
  beforeEach,
  afterEach
} from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function arcSwiperEffectMode() {
  describe('arcSwiperEffectMode', () => {
    beforeEach(async (): Promise<void> => {
      console.info('arcSwiperEffectMode beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcSwiper/arcSwiperEffectMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get arcSwiperEffectMode state pages:' + JSON.stringify(pages));
        if (!('arcSwiperEffectMode' == pages.name)) {
          console.info('get arcSwiperEffectMode pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push arcSwiperEffectMode page error:' + err);
      }
      console.info('arcSwiperEffectMode beforeEach end');
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_EFFECT_0100
     * @tc.number SUB_ARKUI_ARCSWIPER_EFFECT_0100
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_EFFECT_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEffectMode_0100] START');
      let driver = Driver.create()
      let selectEffect1: Component = await driver.findComponent(ON.id('select_Effect')) as Component;
      await selectEffect1.click();
      await CommonFunc.sleep(500);
      let textEffect1: Component = await driver.findComponent(ON.text('动效:spring')) as Component;
      await textEffect1.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_Effect');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperEffectMode_0100] str' + JSON.stringify(strJson));
      console.info('[arcSwiperEffectMode_0100] effectMode: ' +
      JSON.stringify(obj.getElement('$attrs').getString('effectMode')));

      expect(obj.getElement('$attrs').getString('effectMode')).assertEqual('EdgeEffect.Spring');
      console.info('[arcSwiperEffectMode_0100] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_EFFECT_0200
     * @tc.number SUB_ARKUI_ARCSWIPER_EFFECT_0200
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_EFFECT_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEffectMode_0200] START');
      let driver = Driver.create()
      let selectEffect2: Component = await driver.findComponent(ON.id('select_Effect')) as Component;
      await selectEffect2.click();
      await CommonFunc.sleep(500);
      let textEffect2: Component = await driver.findComponent(ON.text('动效:fade')) as Component;
      await textEffect2.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_Effect');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperEffectMode_0200] str' + JSON.stringify(strJson));
      console.info('[arcSwiperEffectMode_0200] effectMode: ' +
      JSON.stringify(obj.getElement('$attrs').getString('effectMode')));

      expect(obj.getElement('$attrs').getString('effectMode')).assertEqual('EdgeEffect.Fade');
      console.info('[arcSwiperEffectMode_0200] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_EFFECT_0300
     * @tc.number SUB_ARKUI_ARCSWIPER_EFFECT_0300
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_EFFECT_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEffectMode_0300] START');
      let driver = Driver.create()
      let selectEffect3: Component = await driver.findComponent(ON.id('select_Effect')) as Component;
      await selectEffect3.click();
      await CommonFunc.sleep(500);
      let textEffect3: Component = await driver.findComponent(ON.text('动效:none')) as Component;
      await textEffect3.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_Effect');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperEffectMode_0300] str' + JSON.stringify(strJson));
      console.info('[arcSwiperEffectMode_0300] effectMode: ' +
      JSON.stringify(obj.getElement('$attrs').getString('effectMode')));

      expect(obj.getElement('$attrs').getString('effectMode')).assertEqual('EdgeEffect.None');
      console.info('[arcSwiperEffectMode_0300] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_ARCSWIPER_EFFECT_0400
     * @tc.number SUB_ARKUI_ARCSWIPER_EFFECT_0400
     * @tc.desc   ArcSwiper custom switching animation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_ARCSWIPER_EFFECT_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[arcSwiperEffectMode_0400] START');
      let driver = Driver.create()
      let selectEffect4: Component = await driver.findComponent(ON.id('select_Effect')) as Component;
      await selectEffect4.click();
      await CommonFunc.sleep(500);
      let textEffect4: Component = await driver.findComponent(ON.text('动效:undefined')) as Component;
      await textEffect4.click();
      await CommonFunc.sleep(500);
      let strJson = inspector.getInspectorByKey('arcSwiper_Effect');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[arcSwiperEffectMode_0400] str' + JSON.stringify(strJson));
      console.info('[arcSwiperEffectMode_0400] effectMode: ' +
      JSON.stringify(obj.getElement('$attrs').getString('effectMode')));

      expect(obj.getElement('$attrs').getString('effectMode')).assertEqual('EdgeEffect.Spring');
      console.info('[arcSwiperEffectMode_0400] END');
      done();
    });
  })
}