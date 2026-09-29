'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const SLEEP_TIME = 1000;

export default function RouterPushUrlErrTest(): void {
  describe('RouterPushUrlErrTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('RouterPushUrlErrTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.richeditor.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('RouterPushUrlErrTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Coverage/RouterPushUrlErr',
      };
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        if (pages.name !== 'RouterPushUrlErr') {
          routerInstance.replaceUrl(options);
        }
      } catch (err) {
        console.error('RouterPushUrlErrTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      try {
        const routerInstance: Router = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
      } catch (err) {
        console.error('RouterPushUrlErrTest afterEach clear error: ' + err);
      }
      await CommonFunc.sleep(500);
    });

    afterAll(() => {
      AppStorage.delete('pushUrl_100002');
      AppStorage.delete('pushUrl_100003');
      AppStorage.delete('pushUrl_undefined');
      AppStorage.delete('pushUrl_cb_100002');
    });

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_ERR_100002_0100
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_ERR_100002_0100
     * @tc.desc   Test UIContext Router.pushUrl returns BusinessError 100002 for invalid url
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_ERR_100002_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[router_pushUrl_err_100002_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      AppStorage.delete('pushUrl_100002');
      let btn = await driver.findComponent(ON.id('btn_pushUrl_100002'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let code: Int | undefined = AppStorage.get<Int>('pushUrl_100002');
      console.info('[router_pushUrl_err_100002_0100] code=' + code);
      expect(code).assertEqual(100002);
      console.info('[router_pushUrl_err_100002_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_ERR_100003_0100
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_ERR_100003_0100
     * @tc.desc   Test UIContext Router.pushUrl returns BusinessError 100003 when stack overflows
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_ERR_100003_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[router_pushUrl_err_100003_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      AppStorage.delete('pushUrl_100003');
      let btn = await driver.findComponent(ON.id('btn_pushUrl_100003'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      let code: Int | undefined = AppStorage.get<Int>('pushUrl_100003');
      console.info('[router_pushUrl_err_100003_0100] code=' + code);
      expect(code).assertEqual(100003);
      console.info('[router_pushUrl_err_100003_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_ERR_CB_100002_0100
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_ERR_CB_100002_0100
     * @tc.desc   Test UIContext Router.pushUrl callback path returns 100002 for invalid url
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_ERR_CB_100002_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[router_pushUrl_callback_100002_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      AppStorage.delete('pushUrl_cb_100002');
      let btn = await driver.findComponent(ON.id('btn_pushUrl_cb_100002'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let code: Int | undefined = AppStorage.get<Int>('pushUrl_cb_100002');
      console.info('[router_pushUrl_callback_100002_0100] code=' + code);
      expect(code).assertEqual(100002);
      console.info('[router_pushUrl_callback_100002_0100] END');
    });

    /**
     * @tc.name   SUB_ARKUI_ROUTER_PUSHURL_ERR_UNDEF_0100
     * @tc.number SUB_ARKUI_ROUTER_PUSHURL_ERR_UNDEF_0100
     * @tc.desc   Test UIContext Router.pushUrl with undefined options returns parameter error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ARKUI_ROUTER_PUSHURL_ERR_UNDEF_0100', Level.LEVEL2, async (): Promise<void> => {
      console.info('[router_pushUrl_undefined_options_0100] START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(SLEEP_TIME);
      AppStorage.delete('pushUrl_undefined');
      let btn = await driver.findComponent(ON.id('btn_pushUrl_undefined'));
      expect(btn).not().assertUndefined();
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let code: Int | undefined = AppStorage.get<Int>('pushUrl_undefined');
      console.info('[router_pushUrl_undefined_options_0100] code=' + code);
      expect(code).assertEqual(401);
      console.info('[router_pushUrl_undefined_options_0100] END');
    });
  });
}
