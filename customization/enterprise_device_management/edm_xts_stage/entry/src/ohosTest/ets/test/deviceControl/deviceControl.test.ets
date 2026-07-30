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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import deviceControl from '@ohos.enterprise.deviceControl';
import restrictions from '@ohos.enterprise.restrictions';

const LOCK_SCREEN: string = "lockScreen";
const OPERATE_DEVICE: string = "operateDevice";
const LABEL_RESET_FACTORY = "resetFactory";

export default function deviceControlTest() {
  describe('deviceControl_test', () => {
    testOperateDevice();
  })
}

function testOperateDevice() {
  /**
   * @tc.name   test_operate_device_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0001
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0001", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0002
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0003
   * @tc.desc   test deviceControl operateDevice unsupported item
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = deviceControl.operateDevice(SELFWANT, LOCK_SCREEN);
      let edmEnable: string = systemParameterEnhance.getSync("persist.edm.edm_enable", "");
      expect(edmEnable == "true").assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0004
   * @tc.desc   test deviceControl operateDevice with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(null, LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0100
   * @tc.desc   test deviceControl operateDevice(2 params) with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(undefined, LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0200
   * @tc.desc   test deviceControl operateDevice(2 params) with null item
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0300
   * @tc.desc   test deviceControl operateDevice(2 params) with undefined item
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0005
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0005", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0006
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0007
   * @tc.desc   test deviceControl operateDevice with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(null, LOCK_SCREEN, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0008
   * @tc.desc   test deviceControl operateDevice with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(undefined, LOCK_SCREEN, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0009
   * @tc.desc   test deviceControl operateDevice with null item
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, null, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0010
   * @tc.desc   test deviceControl operateDevice with undefined item
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, undefined, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0011
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0011
   * @tc.desc   test deviceControl operateDevice with null operateItem
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0011", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0012
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0012
   * @tc.desc   test deviceControl operateDevice with undefined operateItem
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0012", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0013
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0013
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0013", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.DISK_ERASURE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0014
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0014
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0014", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.DISK_ERASURE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0015
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0015
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0015", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY, true);
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.DISK_ERASURE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0016
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0016
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0016", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, true);
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.DISK_ERASURE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0017
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0017
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0017", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.DISK_ERASURE, "test");
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}