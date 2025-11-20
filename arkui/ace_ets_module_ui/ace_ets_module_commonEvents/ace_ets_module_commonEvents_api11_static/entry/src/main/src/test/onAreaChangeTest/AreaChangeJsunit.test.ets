/**
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
// import config from '@ohos.accessibility.config';
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
//const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function areaChangeJsunit() {
  describe('areaChangeTest', () => {
    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonEvents.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("areaChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onAreaChange/areaChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get areaChangeTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get areaChangeTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push areaChangeTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push areaChangeTest page error:" + err);
      }
      console.info("areaChangeTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("areaChange after each called");
    });

    
    /*
     * @tc.number   areaChangeTest_static_0300
     * @tc.name     areaChangeTest_static_0300
     * @tc.desc     areaChangeTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('areaChangeTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('areaChangeTest_0300 START');
      await CommonFunc.sleep(1000);
      let callback = (backData: emitter.EventData) => {
        const data: Record<String, undefined | null | Object> =
          backData.data as Record<String, undefined | null | Object>
        console.info("areaChangeTest_0300 get state result is: " + JSON.stringify(backData));
        expect(data['value']).assertEqual('TextText');
        done()
      }
      let indexEvent: emitter.InnerEvent = {
        eventId: 61,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent, callback);
      } catch (err: Error) {
        console.info("areaChangeTest_0300 on emitter err : " + JSON.stringify(err));
      }

      console.info('areaChangeTest_0400 START');
      await CommonFunc.sleep(1000);
      let callback1 = (eventData: emitter.EventData) => {
        const data: Record<String, undefined | null | Object> =
          eventData.data as Record<String, undefined | null | Object>
        console.info("areaChangeTest_0400 get state result is: " + JSON.stringify(eventData));
        expect(data['ACTION']).assertEqual(true);
      }
      let indexEvent1: emitter.InnerEvent = {
        eventId: 62,
        priority: emitter.EventPriority.LOW
      }
      try {
        emitter.on(indexEvent1, callback1);
      } catch (err: Error) {
        console.info("areaChangeTest_0400 on emitter err : " + JSON.stringify(err));
      }
      console.info("areaChangeTest_0300 click result is: " + JSON.stringify(inspector.sendEventByKey('text1', 10, "")));
    });
  })
}
