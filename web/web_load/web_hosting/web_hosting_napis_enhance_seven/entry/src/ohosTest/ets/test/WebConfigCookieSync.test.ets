/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const  driver = Driver.create();
export default function WebConfigCookieSync() {

  describe('ActsWebWebConfigCookieSyncTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebConfigCookieSync',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebConfigCookieSync state success " + JSON.stringify(pages));
        if (!("WebConfigCookieSync" == pages.name)) {
          console.info("get WebConfigCookieSync state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebConfigCookieSync page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebConfigCookieSync page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebConfigCookieSync beforeEach start");
      done();
    })

    /**
     * @tc.name   testConfigCookieSync001
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0001
     * @tc.desc   test configCookieSync Set the cache value to include \n
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync001", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync001", true, 147550, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync001', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync002
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0002
     * @tc.desc   test configCookieSync Set the cache value to include \t
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync002", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync002", true, 147560, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync002', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync003
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0003
     * @tc.desc   test configCookieSync Set the cache value to include \r
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync003", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync003", true, 147570, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync003', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync004
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0004
     * @tc.desc   test configCookieSync Set the cache value to include \0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync004", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync004", true, 147580, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync004', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync005
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0005
     * @tc.desc   test configCookieSync Set the cache value to include \n httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync005", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync005", true, 147590, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync005', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync006
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0006
     * @tc.desc   test configCookieSync Set the cache value to include \t httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync006", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync006", true, 147600, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync006', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync007
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0007
     * @tc.desc   test configCookieSync Set the cache value to include \r httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync007", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync007", true, 147610, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync007', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync008
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0008
     * @tc.desc   test configCookieSync Set the cache value to include \0 httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync008", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync008", true, 147620, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync008', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync009
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0009
     * @tc.desc   test configCookieSync Set the cache value to include \n clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync009", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync009", true, 147630, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync009', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync010
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0010
     * @tc.desc   test configCookieSync Set the cache value to include \r httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync010", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync010", true, 147640, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync010', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync011
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0011
     * @tc.desc   test configCookieSync Set the cache value to include \0 httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync011", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync011", true, 147650, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync011', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync012
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0012
     * @tc.desc   test configCookieSync Set the cache value to include \n httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync012", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync012", true, 147660, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync012', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync013
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0013
     * @tc.desc   test configCookieSync Set the cache value to include \r httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync013", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync013", true, 147670, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync013', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync014
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0014
     * @tc.desc   test configCookieSync Set the cache value to include \0 httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync014", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync014", true, 147680, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync014', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync015
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0015
     * @tc.desc   test configCookieSync Set the cache value to include \n  enable incognito httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync015", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync015", true, 147690, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync015', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync016
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0016
     * @tc.desc   test configCookieSync Set the cache value to include \t  enable incognito httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync016", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync016", true, 147700, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync016', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync017
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0017
     * @tc.desc   test configCookieSync Set the cache value to include \r  enable incognito httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync017", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync017", true, 147710, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync017', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync018
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0018
     * @tc.desc   test configCookieSync Set the cache value to include \0  enable incognito httpOnly clearAllCookiesSync success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync018", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync018", true, 147720, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync018', true,1000);
      done();
    })

    /**
     * @tc.name   testConfigCookieSync019
     * @tc.number SUB_ACE_WEB_CONFIGCOOKIESYYNC_NAPI_0019
     * @tc.desc   test configCookieSync Set the cache value to include \n enable incognito httpOnly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConfigCookieSync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitConfigCookieSync019", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testConfigCookieSync019", true, 147730, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testConfigCookieSync019', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncPartitioned001
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_0001
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieSync includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitioned001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieSyncPartitioned001", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned001", true, 147740, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieSyncPartitioned001', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncPartitioned002
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_0002
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieSync includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitioned002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieSyncPartitioned002", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned002", true, 147750, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieSyncPartitioned002', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncPartitioned003
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_0003
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieSync includeHttpOnly and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitioned003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieSyncPartitioned003", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned003", true, 147760, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieSyncPartitioned003', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncPartitioned004
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_0004
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieSync incognito and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitioned004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieSyncPartitioned004", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned004", true, 147770, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieSyncPartitioned004', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncPartitionedInvalidUrl005
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_0005
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieSync invalid url error 17100103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedInvalidUrl005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieSyncPartitionedInvalidUrl005", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitionedInvalidUrl005", true, 147780, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieSyncPartitionedInvalidUrl005', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncPartitionedInvalidParam006
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_0006
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieSync nullptr cookieValue error 17100101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedInvalidParam006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieSyncPartitionedInvalidParam006", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitionedInvalidParam006", true, 147790, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieSyncPartitionedInvalidParam006', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieAsyncPartitioned007
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIEASYNC_PARTITIONED_0007
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieAsync includePartitionedCookies true and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieAsyncPartitioned007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieAsyncPartitioned007", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitioned007", true, 147800, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieAsyncPartitioned007', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieAsyncPartitioned008
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIEASYNC_PARTITIONED_0008
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieAsync includePartitionedCookies false and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieAsyncPartitioned008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieAsyncPartitioned008", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitioned008", true, 147810, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieAsyncPartitioned008', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieAsyncPartitionedInvalidUrl009
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIEASYNC_PARTITIONED_0009
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieAsync invalid url callback error 17100103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieAsyncPartitionedInvalidUrl009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieAsyncPartitionedInvalidUrl009", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitionedInvalidUrl009", true, 147820, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieAsyncPartitionedInvalidUrl009', true,1000);
      done();
    })

    /**
     * @tc.name   testFetchCookieAsyncPartitionedNullCallback010
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIEASYNC_PARTITIONED_0010
     * @tc.desc   test OH_ArkWebCookieManager_FetchCookieAsync nullptr callback no crash
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFetchCookieAsyncPartitionedNullCallback010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitFetchCookieAsyncPartitionedNullCallback010", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitionedNullCallback010", true, 147830, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieAsyncPartitionedNullCallback010', true,1000);
      done();
    })


    /**
     * @tc.name   testEtsFetchCookieSyncPartitioned001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0100
     * @tc.desc   test fetchCookieSync includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitioned001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitioned001", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitioned001", true, 147840, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitioned001', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookieSyncPartitioned002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0200
     * @tc.desc   test fetchCookieSync includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitioned002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitioned002", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitioned002", true, 147850, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitioned002', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookieSyncPartitioned003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0300
     * @tc.desc   test fetchCookieSync omit includePartitionedCookies (default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitioned003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitioned003", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitioned003", true, 147860, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitioned003', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookieSyncPartitioned004
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0400
     * @tc.desc   test fetchCookieSync incognito true and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitioned004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitioned004", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitioned004", true, 147870, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitioned004', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookiePartitioned005
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0500
     * @tc.desc   test fetchCookie Promise includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookiePartitioned005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookiePartitioned005", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookiePartitioned005", true, 147880, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookiePartitioned005', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookiePartitioned006
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0600
     * @tc.desc   test fetchCookie Promise includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookiePartitioned006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookiePartitioned006", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookiePartitioned006", true, 147890, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookiePartitioned006', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookiePartitioned007
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_0700
     * @tc.desc   test fetchCookie Promise incognito and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookiePartitioned007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookiePartitioned007", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookiePartitioned007", true, 147900, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookiePartitioned007', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookieSyncPartitionedErrorUrl008
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_0800
     * @tc.desc   test fetchCookieSync invalid url error 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitionedErrorUrl008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitionedErrorUrl008", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitionedErrorUrl008", true, 147910, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitionedErrorUrl008', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookiePartitionedErrorUrl009
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_0900
     * @tc.desc   test fetchCookie invalid url error 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookiePartitionedErrorUrl009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookiePartitionedErrorUrl009", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookiePartitionedErrorUrl009", true, 147920, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookiePartitionedErrorUrl009', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookieSyncPartitionedNull010
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1000
     * @tc.desc   test fetchCookieSync includePartitionedCookies null (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitionedNull010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitionedNull010", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitionedNull010", true, 147930, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitionedNull010', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookieSyncPartitionedUndefined011
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1100
     * @tc.desc   test fetchCookieSync includePartitionedCookies undefined (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookieSyncPartitionedUndefined011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookieSyncPartitionedUndefined011", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookieSyncPartitionedUndefined011", true, 147940, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookieSyncPartitionedUndefined011', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookiePartitionedNull012
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1200
     * @tc.desc   test fetchCookie includePartitionedCookies null (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookiePartitionedNull012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookiePartitionedNull012", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookiePartitionedNull012", true, 147950, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookiePartitionedNull012', true,1000);
      done();
    })

    /**
     * @tc.name   testEtsFetchCookiePartitionedUndefined013
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ERROR_1300
     * @tc.desc   test fetchCookie includePartitionedCookies undefined (401 or default false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEtsFetchCookiePartitionedUndefined013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEtsFetchCookiePartitionedUndefined013", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testEtsFetchCookiePartitionedUndefined013", true, 147960, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testEtsFetchCookiePartitionedUndefined013', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedEtsSyncTrue001
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_0100
     * @tc.desc   set cookie with Partitioned attr, fetchCookieSync includePartitionedCookies true gets it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedEtsSyncTrue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedEtsSyncTrue001", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedEtsSyncTrue001", true, 147970, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedEtsSyncTrue001', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedEtsSyncFalse002
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_0200
     * @tc.desc   set cookie with Partitioned attr, fetchCookieSync includePartitionedCookies false skips it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedEtsSyncFalse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedEtsSyncFalse002", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedEtsSyncFalse002", true, 147980, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedEtsSyncFalse002', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedEtsAsyncTrue003
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_0300
     * @tc.desc   set cookie with Partitioned attr, fetchCookie includePartitionedCookies true gets it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedEtsAsyncTrue003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedEtsAsyncTrue003", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedEtsAsyncTrue003", true, 147990, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedEtsAsyncTrue003', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedEtsAsyncFalse004
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_0400
     * @tc.desc   set cookie with Partitioned attr, fetchCookie includePartitionedCookies false skips it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedEtsAsyncFalse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedEtsAsyncFalse004", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedEtsAsyncFalse004", true, 148000, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedEtsAsyncFalse004', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedNdkSyncTrue005
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_ATTR_0005
     * @tc.desc   set cookie with Partitioned attr, FetchCookieSync includePartitionedCookies true gets it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedNdkSyncTrue005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedNdkSyncTrue005", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedNdkSyncTrue005", true, 148010, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedNdkSyncTrue005', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedNdkSyncFalse006
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIESYNC_PARTITIONED_ATTR_0006
     * @tc.desc   set cookie with Partitioned attr, FetchCookieSync includePartitionedCookies false skips it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedNdkSyncFalse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedNdkSyncFalse006", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedNdkSyncFalse006", true, 148020, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedNdkSyncFalse006', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedNdkAsyncTrue007
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIEASYNC_PARTITIONED_ATTR_0007
     * @tc.desc   set cookie with Partitioned attr, FetchCookieAsync includePartitionedCookies true gets it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedNdkAsyncTrue007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedNdkAsyncTrue007", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedNdkAsyncTrue007", true, 148030, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedNdkAsyncTrue007', true,1000);
      done();
    })

    /**
     * @tc.name   testAttrPartitionedNdkAsyncFalse008
     * @tc.number SUB_ACE_WEB_OH_ARKWEBCOOKIEMANAGER_FETCHCOOKIEASYNC_PARTITIONED_ATTR_0008
     * @tc.desc   set cookie with Partitioned attr, FetchCookieAsync includePartitionedCookies false skips it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedNdkAsyncFalse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitAttrPartitionedNdkAsyncFalse008", 147501)
      let isReturn = false;
      Utils.registerBaseEvent("testAttrPartitionedNdkAsyncFalse008", true, 148040, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("ConfigCookieSync",driver)
      await waitForExist(()=>isReturn, 'testAttrPartitionedNdkAsyncFalse008', true,1000);
      done();
    })

  })
}
