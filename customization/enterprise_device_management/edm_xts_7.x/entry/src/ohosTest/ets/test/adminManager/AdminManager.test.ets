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
import Want from '@ohos.app.ability.Want'
import { ENTINFO1, SELFWANT, SELFHAPNAME, SUBSCRIBE_EVENTS, SUBSCRIBE_INVALID_EVENTS,
  BUNDLENAME1, INVALID_WANT, PARAMETERS_LOWER_BOUND, INVALID_PARAMETERS, INVALID_PARAMETERS_LOWER_THAN_UPPER_BOUND,
  OTHER_WANT, NOT_EXIST_WANT, DEFAULT_USER_ID, TEST_BUNDLENAME
} from '../commom.test.ets';
 
import adminManager from '@ohos.enterprise.adminManager';
import sysDeviceInfo from '@ohos.deviceInfo';
 
const DELEGATED_POLICIES: Array<string> = [ "set_browser_policies" ];
 
export default function adminManagerTest() {
  describe('adminManager_test', () => {
    testSubscribeSmsEvent();
    testUnsubscribeSmsEvent();
  })
}
 
function testSubscribeSmsEvent() {
  /**
   * @tc.name   test_subscribe_sms_event_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBE_SMS_EVENT_JS_0100
   * @tc.desc   test subscribeSmsEvent without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_subscribe_sms_event_0100", Level.LEVEL2, async (done: Function) => {
    try {
      adminManager.subscribeSmsEvent();
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
   * @tc.name   test_subscribe_sms_event_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBE_SMS_EVENT_JS_0200
   * @tc.desc   test subscribeSmsEvent with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_subscribe_sms_event_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      adminManager.subscribeSmsEvent();
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
   * @tc.name   test_subscribe_sms_event_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SUBSCRIBE_SMS_EVENT_JS_0300
   * @tc.desc   test subscribeSmsEvent success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_subscribe_sms_event_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      adminManager.subscribeSmsEvent();
      adminManager.unsubscribeSmsEvent();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
 
function testUnsubscribeSmsEvent() {
  /**
   * @tc.name   test_unsubscribe_sms_event_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBE_SMS_EVENT_JS_0100
   * @tc.desc   test unsubscribeSmsEvent without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_unsubscribe_sms_event_0100", Level.LEVEL2, async (done: Function) => {
    try {
      adminManager.unsubscribeSmsEvent();
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
   * @tc.name   test_unsubscribe_sms_event_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBE_SMS_EVENT_JS_0200
   * @tc.desc   test unsubscribeSmsEvent with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_unsubscribe_sms_event_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      adminManager.unsubscribeSmsEvent();
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
   * @tc.name   test_unsubscribe_sms_event_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_UNSUBSCRIBE_SMS_EVENT_JS_0300
   * @tc.desc   test unsubscribeSmsEvent success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it("test_unsubscribe_sms_event_0300", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      adminManager.subscribeSmsEvent();
      adminManager.unsubscribeSmsEvent();
    } catch (error) {
      expect(error.code === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
