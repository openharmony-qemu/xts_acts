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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function swiperIndicatorIcon() {

  describe('swiperIndicatorIcon', () => {
    beforeAll(async (): Promise<void> => {
      console.info('swiperIndicatorIcon beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('swiperIndicatorIcon beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperController/swiperIndicatorIcon',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('swiperIndicatorIcon state pages: ' + JSON.stringify(pages));
        if (!('swiperIndicatorIcon' == pages.name)) {
          console.info('get swiperIndicatorIcon pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('swiperIndicatorIcon replaceUrl error: ' + err);
        expect().assertFail();
      }
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
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_resourceStr');
      let obj = JSON.parseJsonElement(strJson);
      let indicatorJson = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info('[swiperIndicatorIcon_static_0100] indicator: ' + JSON.stringify(indicatorJson))
      console.info("[xgf] [swiperIndicatorIcon_0100] indicatorIcon[0] : " +
        indicatorJson.getArray('indicatorIcon')[0]);
      console.info("[xgf] [swiperIndicatorIcon_0100] indicatorIcon[0] index: " +
        indicatorJson.getArray('indicatorIcon')[0].getDouble('index'));
      console.info("[xgf] [swiperIndicatorIcon_0100] indicatorIcon[0] sourceType: " +
        indicatorJson.getArray('indicatorIcon')[0].getString('sourceType'));
      expect(indicator).not().assertEqual(undefined);
      expect(indicatorJson.getArray('indicatorIcon')[0].getDouble('index')).assertEqual(0);
      expect(indicatorJson.getArray('indicatorIcon')[0].getString('sourceType')).assertEqual("MEDIA");
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
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_resourceStr');
      let obj = JSON.parseJsonElement(strJson);
      let indicatorJson = JSON.parseJsonElement(obj.getElement('$attrs').getString('indicator'));
      console.info('[swiperIndicatorIcon_static_0200] indicator: ' + JSON.stringify(indicatorJson))
      console.info("[swiperIndicatorIcon_static_0200] indicatorIcon[0] : " +
        indicatorJson.getArray('indicatorIcon')[0]);
      console.info("[swiperIndicatorIcon_static_0200] indicatorIcon[0] index: " +
        indicatorJson.getArray('indicatorIcon')[0].getDouble('index'));
      console.info("[swiperIndicatorIcon_static_0200] indicatorIcon[0] sourceType: " +
        indicatorJson.getArray('indicatorIcon')[0].getString('sourceType'));
      expect(indicatorJson).not().assertEqual(undefined);
      expect(indicatorJson.getArray('indicatorIcon')[0].getDouble('index')).assertEqual(0);
      expect(indicatorJson.getArray('indicatorIcon')[0].getString('sourceType')).assertEqual("SYMBOL");
      done();
    });

    /**
     * @tc.name   swiperIndicatorIcon_static_0300
     * @tc.number SUB_ARKUI_SWIPER_INDICATORICON_STATIC_0300
     * @tc.desc   Test Swiper indicatorIcon property with undefined parameter, should show default dot indicator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIndicatorIcon_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let strJsonCompare = inspector.getInspectorByKey('swiper_indicator_default');
      let objCompare = JSON.parseJsonElement(strJsonCompare);
      let strJson = inspector.getInspectorByKey('swiper_indicator_icon_undefined');
      let obj = JSON.parseJsonElement(strJson);
      let indicatorCompare = objCompare.getElement('$attrs').getElement('indicator');
      let indicatorJson = obj.getElement('$attrs').getElement('indicator');
      console.info('[swiperIndicatorIcon_static_0300] default indicator: ' + JSON.stringify(indicatorCompare))
      console.info('[swiperIndicatorIcon_static_0300] undefined indicator: ' + JSON.stringify(indicatorJson))
      console.info("[swiperIndicatorIcon_static_0300] indicatorIcon[0] indicatorJson: " +
        indicatorJson.getArray('indicatorIcon')[0]);
      console.info("[swiperIndicatorIcon_static_0300] indicatorIcon[0] indicatorCompare: " +
        indicatorCompare.getArray('indicatorIcon')[0]);
      expect(indicatorJson.getArray('indicatorIcon')[0]).assertEqual(indicatorCompare.getArray('indicatorIcon')[0]);
      done();
    });
  })
}