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
import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 160000;
let driver = Driver.create();
let emitKey = ""
let tcName = ""
export default function screenCaptureNew() {

  describe('ScreenCaptureNew', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ScreenCaptureNew',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ScreenCaptureNew state success " + JSON.stringify(pages));
        if (!("ScreenCaptureNew" == pages.name)) {
          console.info("get ScreenCaptureNew state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push ScreenCaptureNew page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ScreenCaptureNew page error: " + err);
      }
      // await waitForComponent("MetaViewport");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`screenCaptureNew enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("screenCaptureNew web beforeEach start");
      done();
    })

    /**
     * @tc.name   testScreenCaptureXpath001
     * @tc.number SUB_WEB_SCREENCAPTUREXPATH_0100
     * @tc.desc   test ScreenCaptureXpath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureXpath001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testScreenCaptureXpath001';
      tcName = 'testScreenCaptureXpath001';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 160003, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScreenCaptureNew", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 3000);
      done();
    })

    it('testScreenCaptureNodeid001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testScreenCaptureNodeid001';
      tcName = 'testScreenCaptureNodeid001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 160004, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScreenCaptureNew", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 3000);
      done();
    })

    it('testScreenCaptureAll001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testScreenCaptureAll001';
      tcName = 'testScreenCaptureAll001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 160005, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScreenCaptureNew", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 3000);
      done();
    })
  })
}
