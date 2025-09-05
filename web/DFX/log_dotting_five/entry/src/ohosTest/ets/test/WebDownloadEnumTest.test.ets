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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import { Driver,ON } from '@ohos.UiTest';
let driver = Driver.create();

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webDownloadEnumTest() {

  describe('WebDownloadEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadEnumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebDownloadEnumTest state success " + JSON.stringify(pages));
        if (!("WebDownloadEnumTest" == pages.name)) {
          console.info("get WebDownloadEnumTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebDownloadEnumTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDownloadEnumTest page error: " + err);
      }
      await waitForComponent("WebDownloadEnumTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebDownloadEnumTest afterEach start");
      console.info("WebDownloadEnumTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0100
    * @tc.name        : testWebDownloadEnum001
    * @tc.desc        : test the value of WebDownloadErrorCode.ERROR_UNKNOWN is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum001", 119110)
      Utils.registerEvent("testWebDownloadEnum001", 0, 119120, done);
      let component = await driver.findComponent(ON.id("WebDownloadEnumTestButton"));
      await component.click();
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0200
    * @tc.name        : testWebDownloadEnum002
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_FAILED is 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum002", 119110)
      Utils.registerEvent("testWebDownloadEnum002", 1, 119130, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0300
    * @tc.name        : testWebDownloadEnum003
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_ACCESS_DENIED is 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum003", 119110)
      Utils.registerEvent("testWebDownloadEnum003", 2, 119140, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0400
    * @tc.name        : testWebDownloadEnum004
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_NO_SPACE is 3
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum004", 119110)
      Utils.registerEvent("testWebDownloadEnum004", 3, 119150, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0500
    * @tc.name        : testWebDownloadEnum005
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_NAME_TOO_LONG is 5
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum005", 119110)
      Utils.registerEvent("testWebDownloadEnum005", 5, 119160, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0600
    * @tc.name        : testWebDownloadEnum006
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_TOO_LARGE is 6
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum006", 119110)
      Utils.registerEvent("testWebDownloadEnum006", 6, 119170, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0700
    * @tc.name        : testWebDownloadEnum007
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_TRANSIENT_ERROR is 10
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum007", 119110)
      Utils.registerEvent("testWebDownloadEnum007", 10, 119180, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0800
    * @tc.name        : testWebDownloadEnum008
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_BLOCKED is 11
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum008", 119110)
      Utils.registerEvent("testWebDownloadEnum008", 11, 119190, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_0900
    * @tc.name        : testWebDownloadEnum009
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_TOO_SHORT is 13
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum009", 119110)
      Utils.registerEvent("testWebDownloadEnum009", 13, 119200, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1000
    * @tc.name        : testWebDownloadEnum010
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_HASH_MISMATCH is 14
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum010", 119110)
      Utils.registerEvent("testWebDownloadEnum010", 14, 119210, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1100
    * @tc.name        : testWebDownloadEnum011
    * @tc.desc        : test the value of WebDownloadErrorCode.FILE_SAME_AS_SOURCE is 15
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum011", 119110)
      Utils.registerEvent("testWebDownloadEnum011", 15, 119220, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1200
    * @tc.name        : testWebDownloadEnum012
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_FAILED is 20
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum012", 119110)
      Utils.registerEvent("testWebDownloadEnum012", 20, 119230, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1300
    * @tc.name        : testWebDownloadEnum013
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_TIMEOUT is 21
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum013", 119110)
      Utils.registerEvent("testWebDownloadEnum013", 21, 119240, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1400
    * @tc.name        : testWebDownloadEnum014
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_DISCONNECTED is 22
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum014", 119110)
      Utils.registerEvent("testWebDownloadEnum014", 22, 119250, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1500
    * @tc.name        : testWebDownloadEnum015
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_SERVER_DOWN is 23
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum015", 119110)
      Utils.registerEvent("testWebDownloadEnum015", 23, 119260, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1600
    * @tc.name        : testWebDownloadEnum016
    * @tc.desc        : test the value of WebDownloadErrorCode.NETWORK_INVALID_REQUEST is 24
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum016", 119110)
      Utils.registerEvent("testWebDownloadEnum016", 24, 119270, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1700
    * @tc.name        : testWebDownloadEnum017
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_FAILED is 30
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum017", 119110)
      Utils.registerEvent("testWebDownloadEnum017", 30, 119280, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1800
    * @tc.name        : testWebDownloadEnum018
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_NO_RANGE is 31
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum018", 119110)
      Utils.registerEvent("testWebDownloadEnum018", 31, 119290, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_1900
    * @tc.name        : testWebDownloadEnum019
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_BAD_CONTENT is 33
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum019", 119110)
      Utils.registerEvent("testWebDownloadEnum019", 33, 119300, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2000
    * @tc.name        : testWebDownloadEnum020
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_UNAUTHORIZED is 34
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum020", 119110)
      Utils.registerEvent("testWebDownloadEnum020", 34, 119310, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2100
    * @tc.name        : testWebDownloadEnum021
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_CERT_PROBLEM is 35
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum021", 119110)
      Utils.registerEvent("testWebDownloadEnum021", 35, 119320, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2200
    * @tc.name        : testWebDownloadEnum022
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_FORBIDDEN is 36
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum022", 119110)
      Utils.registerEvent("testWebDownloadEnum022", 36, 119330, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2300
    * @tc.name        : testWebDownloadEnum023
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_UNREACHABLE is 37
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum023", 119110)
      Utils.registerEvent("testWebDownloadEnum023", 37, 119340, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2400
    * @tc.name        : testWebDownloadEnum024
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH is 38
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum024", 119110)
      Utils.registerEvent("testWebDownloadEnum024", 38, 119350, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2500
    * @tc.name        : testWebDownloadEnum025
    * @tc.desc        : test the value of WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT is 39
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum025", 119110)
      Utils.registerEvent("testWebDownloadEnum025", 39, 119360, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2600
    * @tc.name        : testWebDownloadEnum026
    * @tc.desc        : test the value of WebDownloadErrorCode.USER_CANCELED is 40
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum026", 119110)
      Utils.registerEvent("testWebDownloadEnum026", 40, 119370, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2700
    * @tc.name        : testWebDownloadEnum027
    * @tc.desc        : test the value of WebDownloadErrorCode.USER_SHUTDOWN is 41
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum027", 119110)
      Utils.registerEvent("testWebDownloadEnum027", 41, 119380, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2800
    * @tc.name        : testWebDownloadEnum028
    * @tc.desc        : test the value of WebDownloadErrorCode.CRASH is 50
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum028", 119110)
      Utils.registerEvent("testWebDownloadEnum028", 50, 119390, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_2900
    * @tc.name        : testWebDownloadEnum029
    * @tc.desc        : test the value of WebDownloadState.IN_PROGRESS is 0
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum029", 119110)
      Utils.registerEvent("testWebDownloadEnum029", 0, 119400, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_3000
    * @tc.name        : testWebDownloadEnum030
    * @tc.desc        : test the value of WebDownloadState.COMPLETED is 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum030", 119110)
      Utils.registerEvent("testWebDownloadEnum030", 1, 119410, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_3100
    * @tc.name        : testWebDownloadEnum031
    * @tc.desc        : test the value of WebDownloadState.CANCELED is 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum031", 119110)
      Utils.registerEvent("testWebDownloadEnum031", 2, 119420, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_3200
    * @tc.name        : testWebDownloadEnum032
    * @tc.desc        : test the value of WebDownloadState.INTERRUPTED is 3
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum032", 119110)
      Utils.registerEvent("testWebDownloadEnum032", 3, 119430, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_3300
    * @tc.name        : testWebDownloadEnum033
    * @tc.desc        : test the value of WebDownloadState.PENDING is 4
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum033", 119110)
      Utils.registerEvent("testWebDownloadEnum033", 4, 119440, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_3400
    * @tc.name        : testWebDownloadEnum034
    * @tc.desc        : test the value of WebDownloadState.PAUSED is 5
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum034", 119110)
      Utils.registerEvent("testWebDownloadEnum034", 5, 119450, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOAD_ENUM_3500
    * @tc.name        : testWebDownloadEnum035
    * @tc.desc        : test the value of WebDownloadState.UNKNOWN is 6
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebDownloadEnum035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebDownloadEnum035", 119110)
      Utils.registerEvent("testWebDownloadEnum035", 6, 119460, done);
      sendEventByKey('WebDownloadEnumTestButton', 10, '');
    })
  })
}
