/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webCookieManagerError() {

  describe('webCookieManagerErrorTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webCookieManagerError',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webCookieManagerError state success ' + JSON.stringify(pages));
        if (!('webCookieManagerError' == pages.name)) {
          console.info('get webCookieManagerError state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webCookieManagerError page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webCookieManagerError page error: ' + err);
      }
      await waitForComponent("webCookieManagerErrorButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webCookieManagerError beforeEach start');
      done();
    })

    /**
     * @tc.name   testGetCookieError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_001
     * @tc.desc   test getCookie with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetCookieError001', 134000);
      Utils.registerBaseEvent('testGetCookieError001', '401', 134010, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetCookieError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_002
     * @tc.desc   test getCookie with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetCookieError002', 134000);
      Utils.registerBaseEvent('testGetCookieError002', '401', 134020, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testGetCookieError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_003
     * @tc.desc   test getCookie with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetCookieError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitGetCookieError003', 134000);
      Utils.registerBaseEvent('testGetCookieError003', '17100002', 134030, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieSyncError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_004
     * @tc.desc   test fetchCookieSync with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSyncError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieSyncError001', 134000);
      Utils.registerBaseEvent('testFetchCookieSyncError001', '401', 134040, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieSyncError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_005
     * @tc.desc   test fetchCookieSync with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSyncError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieSyncError002', 134000);
      Utils.registerBaseEvent('testFetchCookieSyncError002', '401', 134050, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieSyncError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_006
     * @tc.desc   test fetchCookieSync with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieSyncError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieSyncError003', 134000);
      Utils.registerBaseEvent('testFetchCookieSyncError003', '17100002', 134060, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookiePromiseUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_007
     * @tc.desc   test fetchCookie promise with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseUrlError001', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseUrlError001', '401', 134070, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookiePromiseUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_008
     * @tc.desc   test fetchCookie promise with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseUrlError002', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseUrlError002', '401', 134080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookiePromiseUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_009
     * @tc.desc   test fetchCookie promise with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseUrlError003', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseUrlError003', 17100002, 134090, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testFetchCookiePromiseValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_007
     * @tc.desc   test fetchCookie promise with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseValueError001', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseValueError001', '401', 134070, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookiePromiseValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_008
     * @tc.desc   test fetchCookie promise with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseValueError002', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseValueError002', '401', 134080, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookiePromiseValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_009
     * @tc.desc   test fetchCookie promise with value empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookiePromiseValueError003', 134000);
      Utils.registerBaseEvent('testFetchCookiePromiseValueError003', 17100002, 134090, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieCallbackUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_010
     * @tc.desc   test fetchCookie callback with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackUrlError001', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackUrlError001', '401', 134100, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieCallbackUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_011
     * @tc.desc   test fetchCookie callback with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackUrlError002', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackUrlError002', '401', 134110, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieCallbackUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_012
     * @tc.desc   test fetchCookie callback with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackUrlError003', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackUrlError003', 17100002, 134120, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieCallbackParamError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_013
     * @tc.desc   test fetchCookie callback with callback null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackParamError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackParamError001', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackParamError001', '401', 134130, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieCallbackParamError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_014
     * @tc.desc   test fetchCookie callback with callback undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieCallbackParamError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieCallbackParamError002', 134000);
      Utils.registerBaseEvent('testFetchCookieCallbackParamError002', '401', 134140, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_015
     * @tc.desc   test setCookie with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieUrlError001', 134000);
      Utils.registerBaseEvent('testSetCookieUrlError001', '401', 134150, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_016
     * @tc.desc   test setCookie with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieUrlError002', 134000);
      Utils.registerBaseEvent('testSetCookieUrlError002', '401', 134160, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_017
     * @tc.desc   test setCookie with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieUrlError003', 134000);
      Utils.registerBaseEvent('testSetCookieUrlError003', '17100002', 134170, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_018
     * @tc.desc   test setCookie with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieValueError001', 134000);
      Utils.registerBaseEvent('testSetCookieValueError001', '401', 134180, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_019
     * @tc.desc   test setCookie with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieValueError002', 134000);
      Utils.registerBaseEvent('testSetCookieValueError002', '401', 134190, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testSetCookieValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_020
     * @tc.desc   test setCookie with value empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSetCookieValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitSetCookieValueError003', 134000);
      Utils.registerBaseEvent('testSetCookieValueError003', '17100005', 134200, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_021
     * @tc.desc   test configCookieSync with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncUrlError001', '401', 134210, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_022
     * @tc.desc   test configCookieSync with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncUrlError002', '401', 134220, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_023
     * @tc.desc   test configCookieSync with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncUrlError003', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncUrlError003', '17100002', 134230, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_024
     * @tc.desc   test configCookieSync with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncValueError001', '401', 134240, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_025
     * @tc.desc   test configCookieSync with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncValueError002', '401', 134250, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieSyncValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_026
     * @tc.desc   test configCookieSync with value empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSyncValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieSyncValueError003', 134000);
      Utils.registerBaseEvent('testConfigCookieSyncValueError003', '17100005', 134260, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testFetchCookieIncognitoPromiseError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_027
     * @tc.desc   test fetchCookie incognito promise with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookiePromiseError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieIncognitoPromiseError001', 134000);
      Utils.registerBaseEvent('testFetchCookieIncognitoPromiseError001', '401', 134270, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieIncognitoPromiseError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_028
     * @tc.desc   test fetchCookie incognito promise with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieIncognitoPromiseError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieIncognitoPromiseError002', 134000);
      Utils.registerBaseEvent('testFetchCookieIncognitoPromiseError002', '401', 134280, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testFetchCookieIncognitoPromiseError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_029
     * @tc.desc   test fetchCookie incognito  promise with url empty string parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieIncognitoPromiseError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitFetchCookieIncognitoPromiseError003', 134000);
      Utils.registerBaseEvent('testFetchCookieIncognitoPromiseError003', 17100002, 134290, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookiePromiseError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_030
     * @tc.desc   test configCookie promise with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseError001', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseError001', '17100005', 134300, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookiePromiseError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_031
     * @tc.desc   test configCookie promise with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookiePromiseError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookiePromiseError002', 134000);
      Utils.registerBaseEvent('testConfigCookiePromiseError002', '17100005', 134310, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_032
     * @tc.desc   test configCookie callback with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackUrlError001', '17100005', 134320, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_033
     * @tc.desc   test configCookie callback with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackUrlError002', '17100005', 134330, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_034
     * @tc.desc   test configCookie callback with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackValueError001', '17100005', 134340, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_035
     * @tc.desc   test configCookie callback with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackValueError002', '17100005', 134350, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieCallbackValueError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_036
     * @tc.desc   test configCookie callback with value empty parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieCallbackValueError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieCallbackValueError003', 134000);
      Utils.registerBaseEvent('testConfigCookieCallbackValueError003', '17100005', 134360, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyUrlError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_037
     * @tc.desc   test configCookie includeHttpOnly with url null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyUrlError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyUrlError001', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyUrlError001', '17100005', 134370, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyUrlError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_038
     * @tc.desc   test configCookie includeHttpOnly with url undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyUrlError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyUrlError002', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyUrlError002', '17100005', 134380, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyUrlError003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_039
     * @tc.desc   test configCookie includeHttpOnly with url empty parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyUrlError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyUrlError003', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyUrlError003', '17100005', 134390, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyValueError001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_040
     * @tc.desc   test configCookie includeHttpOnly with value null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyValueError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyValueError001', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyValueError001', '17100005', 134400, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })
    /**
     * @tc.name   testConfigCookieIncludeHttpOnlyValueError002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_ERROR_041
     * @tc.desc   test configCookie includeHttpOnly with value undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieIncludeHttpOnlyValueError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitConfigCookieIncludeHttpOnlyValueError002', 134000);
      Utils.registerBaseEvent('testConfigCookieIncludeHttpOnlyValueError002', '17100005', 134410, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('webCookieManagerErrorButton', 10, '');
    })

  })
}
