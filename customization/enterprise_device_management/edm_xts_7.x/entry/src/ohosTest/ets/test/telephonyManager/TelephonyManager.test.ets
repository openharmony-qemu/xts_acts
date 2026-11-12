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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE, INVALID_WANT } from '../commom.test.ets';
 
import adminManager from '@ohos.enterprise.adminManager';
import telephonyManager from '@ohos.enterprise.telephonyManager';
import restrictions from '@ohos.enterprise.restrictions';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import call from '@ohos.telephony.call';
 
const PARAM_DISABLE_SLOT0: string = "persist.edm.disable_slot_0";
const PARAM_DISABLE_SLOT1: string = "persist.edm.disable_slot_1";
const LABEL_TELEPHONY_CALL: string = "telephoneCall";
const SMS_START_TIME: number = 1609459200;
const SMS_END_TIME: number = 1735689600;
const SMS_PHONE_NUMBER: string = '13800138000';
 
export default function telephonyManagerTest() {
  describe('telephonyManager_test', () => {
    testGetCallLogs();
    testGetSmsMessages();
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
      let result = await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400 });
      expect(result.length >= 0).assertEqual(true);
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
      let result = await telephonyManager.getCallLogs({ startTime: 0, endTime: 86400 });
      expect(result.length >= 0).assertEqual(true);
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
        expect(error.code).assertEqual(401);
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
        expect(error.code).assertEqual(401);
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
        expect(error.code).assertEqual(401);
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
      let result = await telephonyManager.getCallLogs({ startTime: 1000000000, endTime: 0 });
      expect(result.length >= 0).assertEqual(true);
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
 
function testGetSmsMessages() {
  /**
   * @tc.name   test_get_sms_messages_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SMS_MESSAGES_JS_0100
   * @tc.desc   test getSmsMessages without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_sms_messages_0100", Level.LEVEL2, async (done: Function) => {
    try {
      let result = await telephonyManager.getSmsMessages({
        startTime: SMS_START_TIME,
        endTime: SMS_END_TIME,
        telephoneNumber: SMS_PHONE_NUMBER
      });
      expect(Array.isArray(result)).assertTrue();
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
   * @tc.name   test_get_sms_messages_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SMS_MESSAGES_JS_0200
   * @tc.desc   test getSmsMessages with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_sms_messages_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let result = await telephonyManager.getSmsMessages({
        startTime: SMS_START_TIME,
        endTime: SMS_END_TIME,
        telephoneNumber: SMS_PHONE_NUMBER
      });
      expect(Array.isArray(result)).assertTrue();
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
   * @tc.name   test_get_sms_messages_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SMS_MESSAGES_JS_0300
   * @tc.desc   test getSmsMessages with null queryConfig
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_sms_messages_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await telephonyManager.getSmsMessages(null);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_get_sms_messages_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SMS_MESSAGES_JS_0400
   * @tc.desc   test getSmsMessages with undefined queryConfig
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_sms_messages_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await telephonyManager.getSmsMessages(undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
 
  /**
   * @tc.name   test_get_sms_messages_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SMS_MESSAGES_JS_0500
   * @tc.desc   test getSmsMessages success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_get_sms_messages_0500", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = await telephonyManager.getSmsMessages({
        startTime: SMS_START_TIME,
        endTime: SMS_END_TIME,
        telephoneNumber: SMS_PHONE_NUMBER
      });
      expect(Array.isArray(result)).assertTrue();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_sms_messages_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SMS_MESSAGES_JS_0600
   * @tc.desc   test getSmsMessages with startTime greater than endTime
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_sms_messages_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result = await telephonyManager.getSmsMessages({
        startTime: SMS_END_TIME,
        endTime: SMS_START_TIME,
        telephoneNumber: SMS_PHONE_NUMBER
      });
      expect(Array.isArray(result)).assertTrue();
    } catch (error) {
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}