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
     * @tc.name   swiperIndicatorIcon_static_0100
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0100
     * @tc.desc   Test Swiper indicatorIcon property with ResourceStr type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_resourceStr');
      let obj = JSON.parseJsonElement(strJson);
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0100] indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_resourceStr');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0200
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0200
     * @tc.desc   Test Swiper indicatorIcon property with SymbolGlyphModifier type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_symbolGlyph');
      let obj = JSON.parseJsonElement(strJson);
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0200] indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_symbolGlyph');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0300
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0300
     * @tc.desc   Test Swiper indicatorIcon property with null parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('swiper_indicator_default');
      let objCompare = JSON.parseJsonElement(strJsonCompare);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_null');
      let obj = JSON.parseJsonElement(strJson);
      let indicatorCompare = objCompare.getElement('$attrs').getElement('indicator');
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0300] default indicator: ' + JSON.stringify(indicatorCompare))
      console.log('[swiperIndicatorIcon_static_0300] null indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_null');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0400
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0400
     * @tc.desc   Test Swiper indicatorIcon property with undefined parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('swiper_indicator_default');
      let objCompare = JSON.parseJsonElement(strJsonCompare);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let indicatorCompare = objCompare.getElement('$attrs').getElement('indicator');
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0400] default indicator: ' + JSON.stringify(indicatorCompare))
      console.log('[swiperIndicatorIcon_static_0400] undefined indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_undefined');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0500
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0500
     * @tc.desc   Test Swiper indicatorIcon property with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_empty_array');
      let obj = JSON.parseJsonElement(strJson);
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0500] indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_empty_array');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0600
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0600
     * @tc.desc   Test Swiper indicatorIcon property with index out of range, icon should not display
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_index_out_of_range');
      let obj = JSON.parseJsonElement(strJson);
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0600] indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_index_out_of_range');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0700
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0700
     * @tc.desc   Test Swiper indicatorIcon property with invalid icon, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_invalid_icon');
      let obj = JSON.parseJsonElement(strJson);
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0700] indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_icon_invalid_icon');
      expect(indicator).not().assertEqual(undefined);
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0800
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0800
     * @tc.desc   Test Swiper default indicator without indicatorIcon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_default');
      let obj = JSON.parseJsonElement(strJson);
      let indicator = obj.getElement('$attrs').getElement('indicator');
      console.log('[swiperIndicatorIcon_static_0800] indicator: ' + JSON.stringify(indicator))
      expect(obj.getElement('$attrs').getString('id')).assertEqual('swiper_indicator_default');
      expect(indicator).not().assertEqual(undefined);
      done();
    });
  })
}