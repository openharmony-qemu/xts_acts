/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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

import { beforeAll, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';

const driver = Driver.create();
const EVENT_KEY = 206100;

export default function WebviewControllerDynamicTest() {
  describe('WebviewControllerDynamic', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/WebviewControllerDynamic' });
      await driver.waitForComponent(ON.id('WebviewControllerDynamic'), 10000);
      done();
    });
    /**
     * @tc.name   SUB_WEB_WEBVIEWCONTROLLER_SETURLTRUSTLIST_0100
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SETURLTRUSTLIST_0100
     * @tc.desc   test webviewcontroller seturltrustlist (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBVIEWCONTROLLER_SETURLTRUSTLIST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testSetUrlTrustList', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('setUrlTrustList', true, 206120, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebviewControllerDynamic');
        if (await Utils.waitForExist(() => ok, 'setUrlTrustList', 1, 3000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0100
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0100
     * @tc.desc   test webviewcontroller loadurl (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testLoadUrl', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('loadUrl', true, 206110, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebviewControllerDynamic');
        if (await Utils.waitForExist(() => ok, 'loadUrl', 1, 5000)) { done(); }
      });
  });
}
