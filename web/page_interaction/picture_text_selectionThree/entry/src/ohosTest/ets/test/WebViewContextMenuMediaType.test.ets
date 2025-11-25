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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183111;
const driver = Driver.create();

export default function WebViewContextMenuMediaType() {

  describe('WebViewContextMenuMediaTypeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewContextMenuMediaType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewContextMenuMediaType state success " + JSON.stringify(pages));
        if (!("WebViewContextMenuMediaType" == pages.name)) {
          console.info("get WebViewContextMenuMediaType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewContextMenuMediaType page success " + JSON.stringify(result));
          // await driver.waitForComponent(ON.id("WebViewgContextMenuMediaTypeButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewContextMenuMediaType page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewgContextMenuMediaTypeButton"), 10000)
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /*
* @tc.number     : SUB_WEB_GETCONTEXTMENUMEDIATYPE_0100
* @tc.name       : testContextMenuMediaTypeVideo
* @tc.desc       : test getContextMenuMediaType
* @tc.size       : MediumTest
* @tc.type       : Function
* @tc.level      : Level 1
*/
    it('testContextMenuMediaTypeVideo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitContextMenuMediaTypeVideo';
        tcName = 'testContextMenuMediaTypeVideo'
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
        let isReturn = false;
        Utils.registerEvent(tcName, 2, 20251103, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })


    /*
      * @tc.number     : SUB_WEB_GETCONTEXTMENUMEDIATYPE_0200
      * @tc.name       : testContextMenuMediaTypeText
      * @tc.desc       : test getContextMenuMediaType
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testContextMenuMediaTypeText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitGetHitTest002';
      tcName = 'testContextMenuMediaTypeText'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 0, 20251104, () => {
        isReturn = true
      });
      Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
   * @tc.number     : SUB_WEB_GETCONTEXTMENUMEDIATYPE_0300
   * @tc.name       : testContextMenuMediaTypeImage
   * @tc.desc       : test getContextMenuMediaType
   * @tc.size       : MediumTest
   * @tc.type       : Function
   * @tc.level      : Level 1
   */
    it('testContextMenuMediaTypeImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitContextMenuMediaTypeImage';
        tcName = 'testContextMenuMediaTypeImage'
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
        let isReturn = false;
        Utils.registerEvent(tcName, 1, 20251105, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })

    /*
      * @tc.number     : SUB_WEB_GETCONTEXTMENUMEDIATYPE_0400
      * @tc.name       : testContextMenuMediaTypeAudio
      * @tc.desc       : test getContextMenuMediaType
      * @tc.size       : MediumTest
      * @tc.type       : Function
      * @tc.level      : Level 1
      */
    it('testContextMenuMediaTypeAudio', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitContextMenuMediaTypeAudio';
        tcName = 'testContextMenuMediaTypeAudio'
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
        let isReturn = false;
        Utils.registerEvent(tcName, 3, 20251106, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })
    /*
    * @tc.number     : SUB_WEB_GETCONTEXTMENUMEDIATYPE_0500
    * @tc.name       : testContextMenuMediaTypeCanvas
    * @tc.desc       : test getContextMenuMediaType
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testContextMenuMediaTypeCanvas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitContextMenuMediaTypeCanvas';
        tcName = 'testContextMenuMediaTypeCanvas'
        Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
        let isReturn = false;
        Utils.registerEvent(tcName, 4, 20251107, () => {
          isReturn = true
        });
        Utils.waitAndClickComponent(driver, "WebViewgContextMenuMediaTypeButton", tcName);
        await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
        done();
      })
  })
}



