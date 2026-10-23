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
import { expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webOnPermissionRequest() {

  describe('WebOnPermissionRequestTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnPermissionRequest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnPermissionRequest state success " + JSON.stringify(pages));
        if (!("WebOnPermissionRequest" == pages.name)) {
          console.info("get WebOnPermissionRequest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnPermissionRequest page success " + JSON.stringify(result));
        }
        await Utils.sleep(3000);
      } catch (err) {
        console.error("push WebOnPermissionRequest page error: " + err);
      }
      console.log("waitForComponent WebOnPermissionRequestTestButton");
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


    /**
     * @tc.name   testPermissionRequestDenyGroup001
     * @tc.number SUB_WEB_PERMISSIONREQUESTDENY_GROUP_0100
     * @tc.desc   test permissionRequest deny
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPermissionRequestDenyGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.registerBaseEvent("testPermissionRequestDeny001", '"deny"', 160870,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("emitPermissionRequestDeny001", 160860);
      await Utils.sleep(300);
    })

    /**
     * @tc.name   testPermissionRequestGrantGroup001
     * @tc.number SUB_WEB_PERMISSIONREQUESTGRANT_GROUP_0100
     * @tc.desc   test permissionRequest grant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGrantGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent("testPermissionRequestGrant001", '"grant"', 160880,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("emitPermissionRequestGrant001", 160860);
      await Utils.sleep(300);
    })

    /**
     * @tc.name   testPermissionRequestGrantGroup002
     * @tc.number SUB_WEB_PERMISSIONREQUESTGRANT_GROUP_0200
     * @tc.desc   test permissionRequest grant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGrantGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent("testPermissionRequestGrantGroup002", '"grant"', 160900,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("emitPermissionRequestGrant002", 160860);
      await Utils.sleep(300);
    })
	

    /**
     * @tc.name   testPermissionRequestGrantGroup003
     * @tc.number SUB_WEB_PERMISSIONREQUESTGRANT_GROUP_0300
     * @tc.desc   test permissionRequest grant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGrantGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.registerBaseEvent("testPermissionRequestGrantGroup003", '"grant"', 160920,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.emitEvent("emitPermissionRequestGrant003", 160860);
      await Utils.sleep(300);
    })

    /**
     * @tc.name   testPermissionRequestGrantGroup004
     * @tc.number SUB_WEB_PERMISSIONREQUESTGRANT_GROUP_0400
     * @tc.desc   test permissionRequest grant
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestGrantGroup004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: Function) =>{
      let isReturn = false;
      Utils.registerEvent("testPermissionRequestGrantGroup004",'"grant"', 160940, () => { isReturn = true });
      Utils.emitEvent("emitPermissionRequestGrant004", 160860);
      await Utils.waitForExist(() => isReturn, "testPermissionRequestGrantGroup004" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testPermissionRequestConstructor001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_6200
     * @tc.desc   test PermissionRequest constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.registerBaseEvent('testPermissionRequestConstructor001', true, 160950,
          done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('emitPermissionRequestConstructor001', 160860);
        await Utils.sleep(300);
      })

    /**
     * @tc.name   testPermissionRequestConstructorReturn001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_RETURN_6300
     * @tc.desc   test PermissionRequest constructor return value instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestConstructorReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.registerBaseEvent('testPermissionRequestConstructorReturn001', true, 160951,
          done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('emitPermissionRequestConstructorReturn001', 160860);
        await Utils.sleep(300);
      })

    /**
     * @tc.name   testPermissionRequestClass001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CLASS_6400
     * @tc.desc   test PermissionRequest class export accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPermissionRequestClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.registerBaseEvent('testPermissionRequestClass001', true, 160952,
          done, (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        Utils.emitEvent('emitPermissionRequestClass001', 160860);
        await Utils.sleep(300);
      })

  })
}
