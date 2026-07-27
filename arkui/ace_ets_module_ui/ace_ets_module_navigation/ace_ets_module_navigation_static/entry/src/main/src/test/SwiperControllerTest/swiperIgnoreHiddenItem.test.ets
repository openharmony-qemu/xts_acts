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

export default function swiperIgnoreHiddenItem() {

  describe('swiperIgnoreHiddenItem', () => {
    beforeAll(async (): Promise<void> => {
      console.info('swiperIgnoreHiddenItem beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('swiperIgnoreHiddenItem beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperController/swiperIgnoreHiddenItem',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('swiperIgnoreHiddenItem state pages: ' + JSON.stringify(pages));
        if (!('swiperIgnoreHiddenItem' == pages.name)) {
          console.info('get swiperIgnoreHiddenItem pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('swiperIgnoreHiddenItem replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_static_0100
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_STATIC_0100
     * @tc.desc   Test ignoreHiddenItem(true) with one child Visibility.None, verify hidden item not displayed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIgnoreHiddenItem_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_ignoreHiddenItem_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperIgnoreHiddenItem_static_0100] component is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[swiperIgnoreHiddenItem_static_0100] ignoreHiddenItem: " + JSON.stringify(obj.getElement('$attrs').getBoolen('ignoreHiddenItem')));
      expect(obj.getElement('$attrs').getBoolen('ignoreHiddenItem')).assertEqual(true);
      console.info('[swiperIgnoreHiddenItem_static_0100] END');
      done();
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_static_0200
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_STATIC_0200
     * @tc.desc   Test ignoreHiddenItem(false), hidden child still occupies space in viewport
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIgnoreHiddenItem_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_ignoreHiddenItem_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperIgnoreHiddenItem_static_0200] component is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[swiperIgnoreHiddenItem_static_0200] ignoreHiddenItem: " + JSON.stringify(obj.getElement('$attrs').getBoolen('ignoreHiddenItem')));
      expect(obj.getElement('$attrs').getBoolen('ignoreHiddenItem')).assertEqual(false);
      console.info('[swiperIgnoreHiddenItem_static_0200] END');
      done();
    });

    /**
     * @tc.name   swiperIgnoreHiddenItem_static_0300
     * @tc.number SUB_ARKUI_SWIPER_SYS_IGNOREHIDDENITEM_STATIC_0300
     * @tc.desc   Test ignoreHiddenItem(undefined), hidden child still occupies space in viewport
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('swiperIgnoreHiddenItem_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('swiper_ignoreHiddenItem_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[swiperIgnoreHiddenItem_static_0300] component is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[swiperIgnoreHiddenItem_static_0300] ignoreHiddenItem: " + JSON.stringify(obj.getElement('$attrs').getBoolen('ignoreHiddenItem')));
      expect(obj.getElement('$attrs').getBoolen('ignoreHiddenItem')).assertEqual(false);
      console.info('[swiperIgnoreHiddenItem_static_0300] END');
      done();
    });
  })
}