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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../Utils';
import CommonFunc from '../../MainAbility/common/Common';
import {
  SegmentButtonItemOptions
} from '@kit.ArkUI';
export default function SegmentButtonOptionsReturnValue() {
  describe('SegmentButtonOptionsReturnValue', () => {
    beforeEach(async (done: Function) => {
      console.info("SegmentButtonOptionsReturnValue beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButton/SegmentButtonOptionsReturnValue",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("SegmentButtonOptionsReturnValue" == pages.name)) {
          console.info("get SegmentButtonOptionsReturnValue pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SegmentButtonOptionsReturnValue page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SegmentButtonOptionsReturnValue page error:" + err);
      }
      console.info("SegmentButtonOptionsReturnValue beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SegmentButtonOptionsReturnValue after each called");
    });

    /**
     * @tc.number    SegmentButtonOptionsReturnValue_001
     * @tc.name      SegmentButtonOptionsReturnValue_001
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonOptionsReturnValue_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SBOShift"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let res_0011: undefined | SegmentButtonItemOptions = AppStorage.get<undefined | SegmentButtonItemOptions>('SBOShift');
      console.info("[SegmentButtonOptionsReturnValue_001] component res_0011 is: " + JSON.stringify(res_0011));
      expect(res_0011).assertEqual(undefined);
      console.info("[SegmentButtonOptionsReturnValue_003] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[SegmentButtonOptionsReturnValue_001] END');
      done();
    });


    /**
     * @tc.number    SegmentButtonOptionsReturnValue_002
     * @tc.name      SegmentButtonOptionsReturnValue_002
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonOptionsReturnValue_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SBOPop"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let res_0021: undefined | SegmentButtonItemOptions = AppStorage.get<undefined | SegmentButtonItemOptions>('SBOPop');
      console.info("[SegmentButtonOptionsReturnValue_002] component obj is: " + JSON.stringify(obj));
      expect(res_0021).assertEqual(undefined);
      console.info("[SegmentButtonOptionsReturnValue_003] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[SegmentButtonOptionsReturnValue_002] END');
      done();
    });

    /**
     * @tc.number    SegmentButtonOptionsReturnValue_003
     * @tc.name      SegmentButtonOptionsReturnValue_003
     * @tc.desc      Frequently updating and modifying the values of parent components
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('SegmentButtonOptionsReturnValue_003', Level.LEVEL0, async (done: Function) => {
      console.info('[SegmentButtonOptionsReturnValue_003] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id("SegmentButtonOptionsReturnValue03"));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let res_0031: SegmentButtonItemOptions[] = AppStorage.get<SegmentButtonItemOptions[]>('SBOSplice');
      let res_0032: SegmentButtonItemOptions[] = AppStorage.get<SegmentButtonItemOptions[]>('SBOSpliceEmpty');
      console.info("[SegmentButtonOptionsReturnValue_003] component res_0031 is: " + JSON.stringify(res_0031));
      console.info("[SegmentButtonOptionsReturnValue_003] component res_0032 is: " + JSON.stringify(res_0032));
      expect(res_0031.length > 0).assertTrue();
      expect(res_0032.length).assertEqual(0);
      console.info("[SegmentButtonOptionsReturnValue_003] component appstorage.clear: " + JSON.stringify(AppStorage.clear()));
      console.info('[SegmentButtonOptionsReturnValue_003] END');
      done();
    })

  })
}
