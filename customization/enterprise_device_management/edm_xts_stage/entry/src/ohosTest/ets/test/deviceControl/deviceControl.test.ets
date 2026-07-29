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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import deviceControl from '@ohos.enterprise.deviceControl';
import restrictions from '@ohos.enterprise.restrictions';
import systemParameterEnhance from "@ohos.systemParameterEnhance";

const LOCK_SCREEN: string = "lockScreen";
const OPERATE_DEVICE: string = "operateDevice";
const LABEL_RESET_FACTORY = "resetFactory";

export default function deviceControlTest() {
  describe('deviceControl_test', () => {
    testOperateDevice();
    testOperateDeviceWithOperation();
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
      expect(Number(error.code) == 9200001).assertTrue();
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
      expect(Number(error.code) == 9200002).assertTrue();
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
      expect(ret == null).assertTrue();
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
      expect(Number(error.code) == 9200001).assertTrue();
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
      expect(Number(error.code) == 9200002).assertTrue();
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
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200001).assertTrue();
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
      if (error.code === 801) {
        expect(error.code === 801).assertTrue();
      } else {
        expect(error.code === 9200010).assertTrue();
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

function testOperateDeviceWithOperation() {
  /**
   * @tc.name   test_operate_device_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0101
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0101", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0102
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0103
   * @tc.desc   test deviceControl operateDevice with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(null, deviceControl.Operation.LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0104
   * @tc.desc   test deviceControl operateDevice with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(undefined, deviceControl.Operation.LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0105
   * @tc.desc   test deviceControl operateDevice with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(INVALID_WANT, deviceControl.Operation.LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0106
   * @tc.desc   test deviceControl operateDevice success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL0
   */
  it("test_operate_device_0106", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN);
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
   * @tc.name   test_operate_device_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0107
   * @tc.desc   test deviceControl operateDevice with addition without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0107", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0108
   * @tc.desc   test deviceControl operateDevice with addition with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0109
   * @tc.desc   test deviceControl operateDevice with addition and null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(null, deviceControl.Operation.LOCK_SCREEN, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0110
   * @tc.desc   test deviceControl operateDevice with addition and undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0110", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(undefined, deviceControl.Operation.LOCK_SCREEN, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0111
   * @tc.desc   test deviceControl operateDevice with addition and invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0111", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(INVALID_WANT, deviceControl.Operation.LOCK_SCREEN, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0112
   * @tc.desc   test deviceControl operateDevice with addition null
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0113
   * @tc.desc   test deviceControl operateDevice with addition undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0114
   * @tc.desc   test deviceControl operateDevice with addition success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL0
   */
  it("test_operate_device_0114", Level.LEVEL0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_SCREEN, '');
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
   * @tc.name   test_operate_device_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0115
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0115", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.RESET_FACTORY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0116
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0116", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.REBOOT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0117
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0117", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.SHUT_DOWN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0118
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0118", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.LOCK_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0119
   * @tc.desc   test deviceControl operateDevice without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level   LEVEL2
   */
  it("test_operate_device_0119", Level.LEVEL2, async (done: Function) => {
    try {
      deviceControl.operateDevice(SELFWANT, deviceControl.Operation.UNLOCK_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code === 9200001).assertTrue();
    }
    done();
  });
}
