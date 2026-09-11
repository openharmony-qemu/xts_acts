/*
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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 203000;
const CUSTOM_ERROR_CODE = 32159;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebCustomErrorCode() {
  describe('WebCustomErrorCode', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCustomErrorCode',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('WebCustomErrorCode' == pages.name)) {
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error('push WebCustomErrorCode page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebCustomErrorCode'), 10000);
      done();
    });

    beforeEach(async (done: Function) => {
      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        if (data.connState != wifiMg.ConnState.CONNECTED) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        }
      } catch (err) {
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      });
      done();
    });

    /**
     * @tc.name   testSetGetCustomErrorCode0100
     * @tc.number SUB_WEB_SCHEMEHANDLERRESPONSE_SETGETCUSTOMERRORCODE_0100
     * @tc.desc   test WebSchemeHandlerResponse setCustomErrorCode and getCustomErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetGetCustomErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testSetGetCustomErrorCode0100', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testSetGetCustomErrorCode0100', CUSTOM_ERROR_CODE, 203010, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
      if (await Utils.waitForExist(() => isReturn, 'testSetGetCustomErrorCode0100_returnCheck', 1, 1000)) {
        done();
      }
    });

    /**
     * @tc.name   testDidFailCustomErrorCode0100
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAILCUSTOMERRORCODE_0200
     * @tc.desc   test WebResourceHandler didFail with customErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFailCustomErrorCode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDidFailCustomErrorCode0100', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testDidFailCustomErrorCode0100', CUSTOM_ERROR_CODE, 203020, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
      if (await Utils.waitForExist(() => isReturn, 'testDidFailCustomErrorCode0100_returnCheck', 1, 5000)) {
        done();
      }
    });

    /**
     * @tc.name   testDidFailInvalidHandler0100
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAILINVALIDHANDLER_0300
     * @tc.desc   test WebResourceHandler didFail invalid handler error 17100021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFailInvalidHandler0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDidFailInvalidHandler0100', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testDidFailInvalidHandler0100', '17100021', 203030, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
      if (await Utils.waitForExist(() => isReturn, 'testDidFailInvalidHandler0100_returnCheck', 1, 5000)) {
        done();
      }
    });
  });
}
