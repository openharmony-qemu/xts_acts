'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function swiperSystemMaterial() {

  describe('swiperSystemMaterial', () => {
    beforeAll(async (): Promise<void> => {
      console.info('swiperSystemMaterial beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.nowear.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('swiperSystemMaterial beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/swiper/swiperSystemMaterial',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('swiperSystemMaterial state pages: ' + JSON.stringify(pages));
        if (!('swiperSystemMaterial' == pages.name)) {
          console.info('get swiperSystemMaterial pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('swiperSystemMaterial replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0100
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0100
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with ULTRA_THIN style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[swiperSystemMaterial_static_0100] START');
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray("$children")[1]
        .getArray("$children")[1]
      console.info("[swiperSystemMaterial_static_0100] tree systemMaterial is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial')));
      console.info("[swiperSystemMaterial_static_0100] material style is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('style')));
      console.info("[swiperSystemMaterial_static_0100] material materialColor is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('materialColor')));
      console.info("[swiperSystemMaterial_static_0100] material colorInvert is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('colorInvert')));
      console.info("[swiperSystemMaterial_static_0100] material applyShadow is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('applyShadow')));
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('style')).assertEqual("ImmersiveStyle.ULTRA_THIN");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('materialColor')).assertEqual("#6000FFFF");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('colorInvert')).assertEqual("true");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('applyShadow')).assertEqual("true");
      console.info('[swiperSystemMaterial_static_0100] END');
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0200
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0200
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with THIN style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[swiperSystemMaterial_static_0200] START');
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray("$children")[3]
        .getArray("$children")[1]
      console.info("[swiperSystemMaterial_static_0200] tree systemMaterial is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial')));
      console.info("[swiperSystemMaterial_static_0200] material style is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('style')));
      console.info("[swiperSystemMaterial_static_0200] material materialColor is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('materialColor')));
      console.info("[swiperSystemMaterial_static_0200] material colorInvert is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('colorInvert')));
      console.info("[swiperSystemMaterial_static_0200] material applyShadow is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('applyShadow')));
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('style')).assertEqual("ImmersiveStyle.THIN");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('materialColor')).assertEqual("#80FF0000");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('colorInvert')).assertEqual("false");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('applyShadow')).assertEqual("false");
      console.info('[swiperSystemMaterial_static_0200] END');
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0300
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0300
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with REGULAR style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[swiperSystemMaterial_static_0300] START');
      await CommonFunc.sleep(1000);
      let tree = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray('$children')[0]
        .getArray("$children")[5]
        .getArray("$children")[1]
      console.info("[swiperSystemMaterial_static_0300] tree systemMaterial is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial')));
      console.info("[swiperSystemMaterial_static_0300] material style is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('style')));
      console.info("[swiperSystemMaterial_static_0300] material materialColor is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('materialColor')));
      console.info("[swiperSystemMaterial_static_0300] material colorInvert is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('colorInvert')));
      console.info("[swiperSystemMaterial_static_0300] material applyShadow is: " +
        JSON.stringify(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
          .getElement('immersiveOptions').getString('applyShadow')));
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('style')).assertEqual("ImmersiveStyle.REGULAR");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('colorInvert')).assertEqual("false");
      expect(tree.getElement('$attrs').getElement('systemMaterial').getElement('material')
        .getElement('immersiveOptions').getString('applyShadow')).assertEqual("true");
      console.info('[swiperSystemMaterial_static_0300] END');
      done();
    });
  })
}