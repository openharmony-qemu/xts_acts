/**
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
import dlpPermission from '@ohos.dlpPermission';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

const TAG = "DLP_ENTERPRISE_SERVICE_PERMISSION_XTS ";

function generateArray(len: number) {
  let arr = new Array<string>(len);
  for (let i = 0; i < len; i++) {
    arr[i] = "a";
  }
  return arr;
}

function generateString(len: number) {
  let str: string = "a";
  return str.repeat(len);
}

export default function DlpEnterpriseServicePermissionTest() {
  describe('DlpEnterpriseServicePermissionTest', () => {

    beforeAll(() => {
      console.info(TAG + 'beforeAll called');
    })

    beforeEach(() => {
      console.info(TAG + 'beforeEach called');
    })

    afterEach(() => {
      console.info(TAG + 'afterEach called');
    })

    afterAll(() => {
      console.info(TAG + 'afterAll called');
    })

    /**
     * @tc.name   SUB_SECURITY_DLP_setControlledAppLists_permission_1500
     * @tc.number Test_setControlledAppLists_015
     * @tc.desc   setControlledAppLists permission test, return 201 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_setControlledAppLists_permission_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_setControlledAppLists_015";
        console.info(curTag, "start");
        let appLists = ["0", "1"];
        try {
          await dlpPermission.setControlledAppLists(appLists);
          expect(null).assertFail();
        } catch (err) {
          if (err.code === 801) {
            console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
            expect(err.code).assertEqual(801);
          } else {
            console.info(curTag, "setControlledAppLists failed," + err.code + err.message);
            expect(err.code).assertEqual(201);
          }
        }
        done();
      })
    /**
     * @tc.name   SUB_SECURITY_DLP_getControlledAppLists_permission_0200
     * @tc.number Test_getControlledAppLists_002
     * @tc.desc   getControlledAppLists permission test, return 201 or 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_DLP_getControlledAppLists_permission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let curTag = TAG + "Test_getControlledAppLists_002";
        console.info(curTag, "start");
        try {
          await dlpPermission.getControlledAppLists();
          expect(null).assertFail();
        } catch (err) {
          if (err.code === 801) {
            console.info(curTag, "getControlledAppLists failed," + err.code + err.message);
            expect(err.code).assertEqual(801);
          } else {
            console.info(curTag, "getControlledAppLists failed," + err.code + err.message);
            expect(err.code).assertEqual(201);
          }
        }
        done();
      })
  })
}
