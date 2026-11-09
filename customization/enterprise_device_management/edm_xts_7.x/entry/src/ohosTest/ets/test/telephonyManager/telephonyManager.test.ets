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

import { describe, expect, it, Level } from '@ohos/hypium-dynamic';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
import telephonyManager from '@ohos.enterprise.telephonyManager';

export default function telephonyManagerTest() {
  describe('telephonyManager_test', () => {
    testGetCallLogs();
  })
}

function testGetCallLogs() {
  /**
   * @tc.name   test_get_call_logs_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0100
   * @tc.desc   test getCallLogs without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_call_logs_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400 });
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200001);
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0200
   * @tc.desc   test getCallLogs with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_call_logs_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400 });
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200002);
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0300
   * @tc.desc   test getCallLogs with null queryConfig
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_call_logs_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await telephonyManager.getCallLogs(null);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0400
   * @tc.desc   test getCallLogs with undefined queryConfig
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_call_logs_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await telephonyManager.getCallLogs(undefined);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0500
   * @tc.desc   test getCallLogs with empty queryConfig
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_call_logs_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await telephonyManager.getCallLogs({} as telephonyManager.TelephonyQueryConfig);
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0600
   * @tc.desc   test getCallLogs with startTime greater than endTime
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_call_logs_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await telephonyManager.getCallLogs({ startTime: 1000000000, endTime: 0 });
      expect().assertFail();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code).assertEqual(801);
      } else {
        expect(error.code).assertEqual(9200012);
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0700
   * @tc.desc   test getCallLogs success with specific number
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_call_logs_0700", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400, telephoneNumber: '10000000000' });
      expect(result.length >= 0).assertEqual(true);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0800
   * @tc.desc   test getCallLogs success without specific number
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_call_logs_0800", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400 });
      expect(result.length >= 0).assertEqual(true);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_call_logs_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CALL_LOGS_JS_0900
   * @tc.desc   test getCallLogs success with empty number
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_call_logs_0900", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400, telephoneNumber: '' });
      expect(result.length >= 0).assertEqual(true);
    } catch (error) {
      expect(error.code).assertEqual(801);
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
