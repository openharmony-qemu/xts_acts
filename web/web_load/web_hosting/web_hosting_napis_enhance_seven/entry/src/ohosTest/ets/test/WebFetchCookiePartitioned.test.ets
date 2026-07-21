/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForExist } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebFetchCookiePartitioned() {

  describe('ActsWebFetchCookiePartitionedTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebFetchCookiePartitioned',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebFetchCookiePartitioned state success " + JSON.stringify(pages));
        if (!("WebFetchCookiePartitioned" == pages.name)) {
          console.info("get WebFetchCookiePartitioned state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebFetchCookiePartitioned page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebFetchCookiePartitioned page error: " + err);
      }
      console.log("waitForComponent FetchCookiePartitioned==>");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebFetchCookiePartitioned beforeEach start");
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
      Utils.emitEvent("emitFetchCookieSyncPartitioned001", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned001", true, 149550, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieSyncPartitioned002", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned002", true, 149560, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieSyncPartitioned003", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned003", true, 149570, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieSyncPartitioned004", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitioned004", true, 149580, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieSyncPartitionedInvalidUrl005", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitionedInvalidUrl005", true, 149590, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieSyncPartitionedInvalidParam006", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieSyncPartitionedInvalidParam006", true, 149600, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieAsyncPartitioned007", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitioned007", true, 149610, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieAsyncPartitioned008", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitioned008", true, 149620, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieAsyncPartitionedInvalidUrl009", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitionedInvalidUrl009", true, 149630, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
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
      Utils.emitEvent("emitFetchCookieAsyncPartitionedNullCallback010", 149501)
      let isReturn = false;
      Utils.registerBaseEvent("testFetchCookieAsyncPartitionedNullCallback010", true, 149640, ()=>{isReturn = true}, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.waitAndClickComponent("FetchCookiePartitioned",driver)
      await waitForExist(()=>isReturn, 'testFetchCookieAsyncPartitionedNullCallback010', true,1000);
      done();
    })
  })
}
