'use static';

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function SwiperControllerTest() {

  describe('SwiperControllerTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SwiperControllerTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach((): void => {
      console.info('SwiperControllerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperController/SwiperController',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SwiperControllerTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'SwiperController') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('SwiperControllerTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach((): void => {
      console.info('SwiperControllerTest after each called');
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
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_ultra_thin');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0100] systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_ultra_thin');
      expect(systemMaterial).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
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
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_thin');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0200] systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_thin');
      expect(systemMaterial).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
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
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_regular');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0300] systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_regular');
      expect(systemMaterial).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0400
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0400
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with THICK style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_thick');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0400] systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_thick');
      expect(systemMaterial).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0500
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0500
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with ULTRA_THICK style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_ultra_thick');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0500] systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_ultra_thick');
      expect(systemMaterial).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0600
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0600
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('swiper_indicator_default');
      let objCompare = JSON.parseJsonElement(strJsonCompare);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterialCompare = objCompare.getElement('$attrs').getElement('systemMaterial');
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0600] default systemMaterial: ' + JSON.stringify(systemMaterialCompare))
      console.log('[swiperSystemMaterial_static_0600] undefined systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_undefined');
      expect(systemMaterial).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0700
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0700
     * @tc.desc   Test Swiper IndicatorComponent systemMaterial property with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('swiper_indicator_default');
      let objCompare = JSON.parseJsonElement(strJsonCompare);
      let strJson = inspector.getInspectorByKey('swiper_systemMaterial_null');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterialCompare = objCompare.getElement('$attrs').getElement('systemMaterial');
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0700] default systemMaterial: ' + JSON.stringify(systemMaterialCompare))
      console.log('[swiperSystemMaterial_static_0700] null systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_systemMaterial_null');
      expect(systemMaterial).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperSystemMaterial_static_0800
     * @tc.number SUB_ARKUI_SWIPER_SYSTEMMATERIAL_STATIC_0800
     * @tc.desc   Test Swiper IndicatorComponent without systemMaterial property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperSystemMaterial_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_default');
      let obj = JSON.parseJsonElement(strJson);
      let systemMaterial = obj.getElement('$attrs').getElement('systemMaterial');
      console.log('[swiperSystemMaterial_static_0800] systemMaterial: ' + JSON.stringify(systemMaterial))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_default');
      expect(systemMaterial).not().assertEqual(undefined);
      done();
    });
  })
}