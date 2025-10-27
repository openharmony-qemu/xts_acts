/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import Utils from '../../../ets/MainAbility/common/Utils'

import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function lazyForEachOnDataAddJsunit() {
  describe('lazyForEachOnDataAddTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("lazyForEachOnDataAddTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/lazyForEachOnDataAddTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get lazyForEachOnDataAddTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get lazyForEachOnDataAddTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push lazyForEachOnDataAddTest page error:" + err);
      }
      console.info("lazyForEachOnDataAddTest beforeEach end");
    });


    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("lazyForEachOnDataAdd after each called");
    });


    /*
     * @tc.number    testlazyForEachOnDataAdd_static_0001
     * @tc.name      testlazyForEachOnDataAdd_static_0001
     * @tc.desc      testlazyForEachOnDataAdd_static_0001
     * @tc.level     2
     */
    it('testlazyForEachOnDataAdd_static_0001', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 START');

      let innerEvent1: events_emitter.InnerEvent = {
        eventId: 60212,
        priority: events_emitter.EventPriority.LOW
      }
      let callback1 = (eventData: events_emitter.EventData) => {

        try {
          console.info("callback1 success");
          console.info("Lazy_101 eventData.data?.result1 result is: " +
          ((eventData.data) as ESObject).getProperty('result1'));
          expect(((eventData.data) as ESObject).getProperty('result1')).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 END');
        } catch (err) {
          console.info("Lazy_101 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_101 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemOne', 10, "")));
        events_emitter.on(innerEvent1, callback1);
      } catch (err) {
        console.info("Lazy_101 on events_emitter err : " + JSON.stringify(err));
      }
    });


    /*
     * @tc.number    testlazyForEachOnDataAdd_static_0002
     * @tc.name      testlazyForEachOnDataAdd_static_0002
     * @tc.desc      testlazyForEachOnDataAdd_static_0002
     * @tc.level     2
     */
    it('testlazyForEachOnDataAdd_static_0002', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 START');

      let innerEvent2: events_emitter.InnerEvent = {
        eventId: 60213,
        priority: events_emitter.EventPriority.LOW
      }
      let callback2 = (eventData: events_emitter.EventData) => {

        try {
          console.info("callback2 success");
          console.info("Lazy_102 eventData.data?.result2 result is: " +
          ((eventData.data) as ESObject).getProperty('result2'));
          expect(((eventData.data) as ESObject).getProperty('result2')).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0002 END');
        } catch (err) {
          console.info("Lazy_102 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_102 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemTwo', 10, "")));
        events_emitter.on(innerEvent2, callback2);
      } catch (err) {
        console.info("Lazy_102 on events_emitter err : " + JSON.stringify(err));
      }
    });


    /*
     * @tc.number    testlazyForEachOnDataAdd_static_0003
     * @tc.name      testlazyForEachOnDataAdd_static_0003
     * @tc.desc      testlazyForEachOnDataAdd_static_0003
     * @tc.level     2
     */
    it('testlazyForEachOnDataAdd_static_0003', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 START');

      let innerEvent3: events_emitter.InnerEvent = {
        eventId: 60214,
        priority: events_emitter.EventPriority.LOW
      }
      let callback3 = (eventData: events_emitter.EventData) => {

        try {
          console.info("callback3 success");
          console.info("Lazy_103 eventData.data?.result3 result is: " +
          ((eventData.data) as ESObject).getProperty('result3'));
          expect(((eventData.data) as ESObject).getProperty('result3')).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0003 END');
        } catch (err) {
          console.info("Lazy_103 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_103 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemThree', 10, "")));
        events_emitter.on(innerEvent3, callback3);
      } catch (err) {
        console.info("Lazy_103 on events_emitter err : " + JSON.stringify(err));
      }
    });


    /*
     * @tc.number    testlazyForEachOnDataAdd_static_0004
     * @tc.name      testlazyForEachOnDataAdd_static_0004
     * @tc.desc      testlazyForEachOnDataAdd_static_0004
     * @tc.level     2
     */
    it('testlazyForEachOnDataAdd_static_0004', Level.LEVEL0, async () => {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 START');

      let innerEvent4: events_emitter.InnerEvent = {
        eventId: 60215,
        priority: events_emitter.EventPriority.LOW
      }
      let callback4 = (eventData: events_emitter.EventData) => {

        try {
          console.info("callback4 success");
          console.info("Lazy_104 eventData.data?.result4 result is: " +
          ((eventData.data) as ESObject).getProperty('result4'));
          expect(((eventData.data) as ESObject).getProperty('result4')).assertEqual(true);
          console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0004 END');
        } catch (err) {
          console.info("Lazy_104 on events_emitter err : " + JSON.stringify(err));
        }

      }
      try {
        console.info("Lazy_104 click result is:" + JSON.stringify(inspector.sendEventByKey('listItemFour', 10, "")));
        events_emitter.on(innerEvent4, callback4);
      } catch (err) {
        console.info("Lazy_104 on events_emitter err : " + JSON.stringify(err));
      }
    });
  })
}
