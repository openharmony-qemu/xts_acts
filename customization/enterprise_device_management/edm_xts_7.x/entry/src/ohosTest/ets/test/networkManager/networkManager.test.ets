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

import { describe, expect, it, Level } from '@ohos/hypium-dynamic';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import networkManager from '@ohos.enterprise.networkManager';

export default function networkManagerTest() {
  describe('networkManager_test', () => {
    testGetSharedList();
  })
}

function testGetSharedList() {
  /**
   * @tc.name   test_get_shared_list_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SHARED_LIST_JS_0100
   * @tc.desc   test networkManager getSharedList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_shared_list_0100", Level.LEVEL2, async (done: Function) => {
    try {
      networkManager.getSharedList();
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_shared_list_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SHARED_LIST_JS_0200
   * @tc.desc   test networkManager getSharedList with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_shared_list_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      networkManager.getSharedList();
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_shared_list_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SHARED_LIST_JS_0300
   * @tc.desc   test networkManager getSharedList success with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_shared_list_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let sharedList: Array<networkManager.PathSharedData> = networkManager.getSharedList();
      expect(Array.isArray(sharedList)).assertTrue();
      for (let i = 0; i < sharedList.length; i++) {
        expect(typeof (sharedList[i].shareName) === 'string').assertTrue();
        expect(typeof (sharedList[i].shareUri) === 'string').assertTrue();
        expect(Array.isArray(sharedList[i].userPathInfoList)).assertTrue();
        for (let j = 0; j < sharedList[i].userPathInfoList.length; j++) {
          expect(typeof (sharedList[i].userPathInfoList[j].userName) === 'string').assertTrue();
          expect(typeof (sharedList[i].userPathInfoList[j].userPermission) === 'string').assertTrue();
        }
        expect(typeof (sharedList[i].shareLimit) === 'number').assertTrue();
      }
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(false).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
