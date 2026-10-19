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

import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
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

    /**
     * @tc.name   testDidFail3Call001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_CALL_0100
     * @tc.desc   test WebResourceHandler didFail 3-param call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3Call001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDidFail3Call001', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testDidFail3Call001', CUSTOM_ERROR_CODE, 203110, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
      if (await Utils.waitForExist(() => isReturn, 'testDidFail3Call001_returnCheck', 1, 5000)) {
        done();
      }
    });

    /**
     * @tc.name   testDidFail3CodeNull001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_CODE_NULL_0100
     * @tc.desc   test WebResourceHandler didFail 3-param code null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDidFail3CodeNull001', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testDidFail3CodeNull001', '401', 203120, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
      if (await Utils.waitForExist(() => isReturn, 'testDidFail3CodeNull001_returnCheck', 1, 5000)) {
        done();
      }
    });

    /**
     * @tc.name   testDidFail3CodeUndefined001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_CODE_UNDEFINED_0100
     * @tc.desc   test WebResourceHandler didFail 3-param code undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('testDidFail3CodeUndefined001', EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerBaseEvent('testDidFail3CodeUndefined001', '401', 203130, () => {
        isReturn = 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
      if (await Utils.waitForExist(() => isReturn, 'testDidFail3CodeUndefined001_returnCheck', 1, 5000)) {
        done();
      }
    });

    /**
     * @tc.name   testDidFail3CompleteIfNoResponseNull001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_COMPLETE_NULL_0100
     * @tc.desc   test WebResourceHandler didFail 3-param completeIfNoResponse null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CompleteIfNoResponseNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testDidFail3CompleteIfNoResponseNull001', EVENT_ID_SET_EMIT_KEY);
        let isReturn = 0;
        Utils.registerBaseEvent('testDidFail3CompleteIfNoResponseNull001', '401', 203140, () => {
          isReturn = 1;
        }, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
        if (await Utils.waitForExist(() => isReturn, 'testDidFail3CompleteIfNoResponseNull001_returnCheck', 1, 5000)) {
          done();
        }
      });

    /**
     * @tc.name   testDidFail3CompleteIfNoResponseUndefined001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_COMPLETE_UNDEFINED_0100
     * @tc.desc   test WebResourceHandler didFail 3-param completeIfNoResponse undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CompleteIfNoResponseUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testDidFail3CompleteIfNoResponseUndefined001', EVENT_ID_SET_EMIT_KEY);
        let isReturn = 0;
        Utils.registerBaseEvent('testDidFail3CompleteIfNoResponseUndefined001', '401', 203150, () => {
          isReturn = 1;
        }, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
        if (await Utils.waitForExist(() => isReturn,
          'testDidFail3CompleteIfNoResponseUndefined001_returnCheck', 1, 5000)) {
          done();
        }
      });

    /**
     * @tc.name   testDidFail3CustomErrorCodeNull001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_CUSTOMERRORCODE_NULL_0100
     * @tc.desc   test WebResourceHandler didFail 3-param customErrorCode null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CustomErrorCodeNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testDidFail3CustomErrorCodeNull001', EVENT_ID_SET_EMIT_KEY);
        let isReturn = 0;
        Utils.registerBaseEvent('testDidFail3CustomErrorCodeNull001', '401', 203160, () => {
          isReturn = 1;
        }, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
        if (await Utils.waitForExist(() => isReturn, 'testDidFail3CustomErrorCodeNull001_returnCheck', 1, 5000)) {
          done();
        }
      });

    /**
     * @tc.name   testDidFail3CustomErrorCodeUndefined001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_CUSTOMERRORCODE_UNDEFINED_0100
     * @tc.desc   test WebResourceHandler didFail 3-param customErrorCode undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CustomErrorCodeUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testDidFail3CustomErrorCodeUndefined001', EVENT_ID_SET_EMIT_KEY);
        let isReturn = 0;
        Utils.registerBaseEvent('testDidFail3CustomErrorCodeUndefined001', '401', 203170, () => {
          isReturn = 1;
        }, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
        if (await Utils.waitForExist(() => isReturn, 'testDidFail3CustomErrorCodeUndefined001_returnCheck', 1, 5000)) {
          done();
        }
      });

    /**
     * @tc.name   testDidFail3CompleteFalse001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_COMPLETE_FALSE_0100
     * @tc.desc   test WebResourceHandler didFail 3-param completeIfNoResponse false param spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CompleteFalse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testDidFail3CompleteFalse001', EVENT_ID_SET_EMIT_KEY);
        let isReturn = 0;
        Utils.registerBaseEvent('testDidFail3CompleteFalse001', 'success', 203111, () => {
          isReturn = 1;
        }, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
        if (await Utils.waitForExist(() => isReturn, 'testDidFail3CompleteFalse001_returnCheck', 1, 5000)) {
          done();
        }
      });

    /**
     * @tc.name   testDidFail3CustomErrorCodeZero001
     * @tc.number SUB_WEB_RESOURCEHANDLER_DIDFAIL3_CUSTOMERRORCODE_ZERO_0100
     * @tc.desc   test WebResourceHandler didFail 3-param customErrorCode zero param spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDidFail3CustomErrorCodeZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testDidFail3CustomErrorCodeZero001', EVENT_ID_SET_EMIT_KEY);
        let isReturn = 0;
        Utils.registerBaseEvent('testDidFail3CustomErrorCodeZero001', 0, 203112, () => {
          isReturn = 1;
        }, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        await Utils.waitAndClickComponent(driver, 'WebCustomErrorCode');
        if (await Utils.waitForExist(() => isReturn, 'testDidFail3CustomErrorCodeZero001_returnCheck', 1, 5000)) {
          done();
        }
      });
  });
}
