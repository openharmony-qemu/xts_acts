// /**
//  * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
//  * Licensed under the Apache License, Version 2.0 (the "License");
//  * you may not use this file except in compliance with the License.
//  * You may obtain a copy of the License at
//  *
//  *     http://www.apache.org/licenses/LICENSE-2.0
//  *
//  * Unless required by applicable law or agreed to in writing, software
//  * distributed under the License is distributed on an "AS IS" BASIS,
//  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  * See the License for the specific language governing permissions and
//  * limitations under the License.
//  */
// import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
// import events_emitter from '@ohos.events.emitter';
// import Utils from './Utils';
// import router from '@ohos.router';
// import emitter from '@ohos.events.emitter';
// import { accessibility, config } from '@kit.AccessibilityKit';
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
// const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// let emitKey = ""
// // @ts-nocheck
// export default function WebOnNativeEmbedObjectParamChange() {
//   describe('ActsAceWebOnNativeEmbedObjectParamChange', () => {
//
//     beforeAll(async (done: Function) => {
//       let options: router.RouterOptions = {
//         url: 'testability/pages/WebOnNativeEmbedObjectParamChange',
//       }
//       try {
//         router.clear();
//         let pages = router.getState();
//         console.info("get WebOnNativeEmbedObjectParamChange state success " + JSON.stringify(pages));
//         if (!("WebOnNativeEmbedObjectParamChange" == pages.name)) {
//           console.info("get WebOnNativeEmbedObjectParamChange state success " + JSON.stringify(pages.name));
//           let result = await router.pushUrl(options);
//           console.info("push WebOnNativeEmbedObjectParamChange page success " + JSON.stringify(result));
//         }
//       } catch (err) {
//         console.error("push WebOnNativeEmbedObjectParamChange page error: " + err);
//       }
//       done()
//     });
//
//     beforeEach(async (done: Function) => {
//       config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
//         console.info(`enable success`);
//       }).catch((err: object) => {
//         console.error(`failed to enable, ${err}`);
//       })
//       console.info("web beforeEach start");
//       done();
//     })
//     afterEach(async (done: Function) => {
//       console.info("web afterEach start:" + emitKey);
//       try {
//         let backData: events_emitter.EventData = {
//           data: {
//             "ACTION": emitKey
//           }
//         };
//         let backEvent: events_emitter.InnerEvent = {
//           eventId: 130701,
//           priority: events_emitter.EventPriority.LOW
//         };
//         console.info("start send emitKey");
//         events_emitter.emit(backEvent, backData);
//       } catch (err) {
//         console.info("emit emitKey  err: " + JSON.stringify(err));
//       }
//       done();
//     })
//
//
//     /**
//     * @tc.number     SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0100
//     * @tc.name       emitOnNativeEmbedObjectParamChange001
//     * @tc.desc       emitOnNativeEmbedObjectParamChange001
//     * @tc.size_t     MediumTest
//     * @tc.type       Function
//     * @tc.level      Level 0
//     */
//     it('emitOnNativeEmbedObjectParamChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
//       emitKey = "emitOnNativeEmbedObjectParamChange001";
//       Utils.emitEvent(emitKey, 130701);
//       Utils.registerEvent("emitOnNativeEmbedObjectParamChange001", NativeEmbedParamStatus.ADD, 20250923, done);
//       sendEventByKey('WebOnNativeEmbedObjectParamChangeButton', 10, '');
//     })
//
//     /**
//     * @tc.number     SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0200
//     * @tc.name       emitOnNativeEmbedObjectParamChange002
//     * @tc.desc       emitOnNativeEmbedObjectParamChange002
//     * @tc.size_t     MediumTest
//     * @tc.type       Function
//     * @tc.level      Level 0
//     */
//     it('emitOnNativeEmbedObjectParamChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
//       emitKey = "emitOnNativeEmbedObjectParamChange002";
//       Utils.emitEvent(emitKey, 130701);
//       Utils.registerEvent("emitOnNativeEmbedObjectParamChange002", NativeEmbedParamStatus.UPDATE, 20250924, done);
//       sendEventByKey('WebOnNativeEmbedObjectParamChangeButton', 10, '');
//     })
//
//     /**
//     * @tc.number     SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0300
//     * @tc.name       emitOnNativeEmbedObjectParamChange003
//     * @tc.desc       emitOnNativeEmbedObjectParamChange003
//     * @tc.size_t     MediumTest
//     * @tc.type       Function
//     * @tc.level      Level 0
//     */
//     it('emitOnNativeEmbedObjectParamChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
//       emitKey = "emitOnNativeEmbedObjectParamChange003";
//       Utils.emitEvent(emitKey, 130701);
//       Utils.registerEvent("emitOnNativeEmbedObjectParamChange003", NativeEmbedParamStatus.DELETE, 20250925, done);
//       sendEventByKey('WebOnNativeEmbedObjectParamChangeButton', 10, '');
//     })
//
//
//
//   })
// }


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
import { afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver: Driver = Driver.create();

export default function WebOnNativeEmbedObjectParamChange() {
  describe('ActsAceWebOnNativeEmbedObjectParamChange', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnNativeEmbedObjectParamChange',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebOnNativeEmbedObjectParamChange state success ' + JSON.stringify(pages));
        if (!('WebOnNativeEmbedObjectParamChange' == pages.name)) {
          console.info('get WebOnNativeEmbedObjectParamChange state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebOnNativeEmbedObjectParamChange state success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebOnNativeEmbedObjectParamChange page error:' + err);
      }
      await driver.waitForComponent(ON.id('WebOnNativeEmbedObjectParamChangeButton'), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebOnNativeEmbedObjectParamChange beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebOnNativeEmbedObjectParamChange afterEach start');
      done();
    })

    /**
     * @tc.number     SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0100
     * @tc.name       emitOnNativeEmbedObjectParamChange001
     * @tc.desc       emitOnNativeEmbedObjectParamChange001
     * @tc.size_t     MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */


    it('emitOnNativeEmbedObjectParamChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange001', 130701)
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange001', NativeEmbedParamStatus.ADD, 20250923, done);
        await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedObjectParamChangeButton', 'emitOnNativeEmbedObjectParamChange001');
      })

    /**
     * @tc.number     SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0200
     * @tc.name       emitOnNativeEmbedObjectParamChange002
     * @tc.desc       emitOnNativeEmbedObjectParamChange002
     * @tc.size_t     MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('emitOnNativeEmbedObjectParamChange002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange002', 130701)
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange002', NativeEmbedParamStatus.UPDATE, 20250924, done);
        await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedObjectParamChangeButton', 'emitOnNativeEmbedObjectParamChange002');
      })


    /**
     * @tc.number     SUB_ACE_WEB_EMITONNATIVEEMBEDOBJECTPARAMCHANGE_API_0300
     * @tc.name       emitOnNativeEmbedObjectParamChange003
     * @tc.desc       emitOnNativeEmbedObjectParamChange003
     * @tc.size_t     MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */

    it('emitOnNativeEmbedObjectParamChange003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitOnNativeEmbedObjectParamChange003', 130701)
        Utils.registerEvent('emitOnNativeEmbedObjectParamChange003', NativeEmbedParamStatus.DELETE, 20250925, done);
        await Utils.waitAndClickComponent(driver, 'WebOnNativeEmbedObjectParamChangeButton', 'emitOnNativeEmbedObjectParamChange003');
      })



  })
}

