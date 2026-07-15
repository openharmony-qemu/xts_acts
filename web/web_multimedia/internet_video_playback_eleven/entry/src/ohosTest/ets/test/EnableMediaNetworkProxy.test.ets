/*
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

import { describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level }
  from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import { waitForComponents } from './WaitTest.test';
import { Driver } from '@kit.TestKit';

const driver = Driver.create();

export default function enableMediaNetworkProxyTestJsunit() {
  describe('enableMediaNetworkProxyTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/EnableMediaNetworkProxy'
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('EnableMediaNetworkProxy' == pages.name)) {
          await router.push(options);
        }
      } catch (err) {
        console.error('push EnableMediaNetworkProxy page error: ' + err);
      }
      await waitForComponents('enableMediaNetworkProxyButton');
      done();
    });

    beforeEach(async (done: Function) => {
      console.info('enableMediaNetworkProxy beforeEach start');
      done();
    });

    afterEach(async (done: Function) => {
      console.info('enableMediaNetworkProxy afterEach start');
      done();
    });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TRUE_0100
     * @tc.name   enableMediaNetworkProxyTrue
     * @tc.desc   enableMediaNetworkProxy(true) applies without error (HLS).
     */
    it('enableMediaNetworkProxyTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('enableMediaNetworkProxyTrue', 132860);
        Utils.registerBaseEvent('enableMediaNetworkProxyTrue', 'true', 132870, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'enableMediaNetworkProxyButton');
      });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_FALSE_0100
     * @tc.name   enableMediaNetworkProxyFalse
     * @tc.desc   enableMediaNetworkProxy(false) applies without error.
     */
    it('enableMediaNetworkProxyFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('enableMediaNetworkProxyFalse', 132860);
        Utils.registerBaseEvent('enableMediaNetworkProxyFalse', 'false', 132870, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'enableMediaNetworkProxyButton');
      });

    /**
     * @tc.number SUB_WEB_ENABLE_MEDIA_NETWORK_PROXY_TOGGLE_0100
     * @tc.name   enableMediaNetworkProxyToggle
     * @tc.desc   Toggle proxy true then false ends with false.
     */
    it('enableMediaNetworkProxyToggle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enableMediaNetworkProxyToggle', 132860);
        Utils.registerBaseEvent('enableMediaNetworkProxyToggle', 'false', 132870, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'enableMediaNetworkProxyButton');
      });
  });
}
