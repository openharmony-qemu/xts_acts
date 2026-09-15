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
 
import { describe, expect, it, Level } from '@ohos/hypium';
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  BLUETOOTH_STATE,
  WIFI_STATE,
  setBluetoothState,
  setWifiState
} from '../commom.ets';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

import adminManager from '@ohos.enterprise.adminManager';
import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import deviceSettings from '@ohos.enterprise.deviceSettings';
import wifiManager from '@ohos.enterprise.wifiManager';

const FULL_VALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [
  deviceSettings.SettingsMenu.ACCOUNT_ID,
  deviceSettings.SettingsMenu.WIFI,
  deviceSettings.SettingsMenu.WIFI_PROXY_SETTINGS,
  deviceSettings.SettingsMenu.WIFI_IP_SETTINGS,
  deviceSettings.SettingsMenu.BLUETOOTH,
  deviceSettings.SettingsMenu.NETWORK,
  deviceSettings.SettingsMenu.MOBILE_NETWORK,
  deviceSettings.SettingsMenu.SUPER_DEVICE,
  deviceSettings.SettingsMenu.MORE_CONNECTIVITY_OPTIONS,
  deviceSettings.SettingsMenu.HOME_SCREEN_STYLE,
  deviceSettings.SettingsMenu.DISPLAY_BRIGHTNESS,
  deviceSettings.SettingsMenu.SOUND_VIBRATION,
  deviceSettings.SettingsMenu.NOTIFICATIONS,
  deviceSettings.SettingsMenu.BIOMETRICS_PASSWORD,
  deviceSettings.SettingsMenu.APPS_AND_SERVICES,
  deviceSettings.SettingsMenu.BATTERY,
  deviceSettings.SettingsMenu.STORAGE,
  deviceSettings.SettingsMenu.PRIVACY_AND_SECURITY,
  deviceSettings.SettingsMenu.DIGITAL_BALANCE,
  deviceSettings.SettingsMenu.SMART_ASSISTANT,
  deviceSettings.SettingsMenu.SYSTEM,
  deviceSettings.SettingsMenu.ABOUT_DEVICE,
  deviceSettings.SettingsMenu.SYSTEM_NAVIGATION,
  deviceSettings.SettingsMenu.LANGUAGE_REGION,
  deviceSettings.SettingsMenu.INPUT_METHODS,
  deviceSettings.SettingsMenu.DATE_TIME,
  deviceSettings.SettingsMenu.DATA_CLONE,
  deviceSettings.SettingsMenu.BACKUP_SETTINGS,
  deviceSettings.SettingsMenu.RESET,
  deviceSettings.SettingsMenu.SUPERHUB,
  deviceSettings.SettingsMenu.USER_EXPERIENCE,
  deviceSettings.SettingsMenu.SCREEN_CAST,
  deviceSettings.SettingsMenu.PRINTERS_SCANNERS,
  deviceSettings.SettingsMenu.MOBILE_DATA,
  deviceSettings.SettingsMenu.PERSONAL_HOTSPOT,
  deviceSettings.SettingsMenu.SIM_MANAGEMENT,
  deviceSettings.SettingsMenu.AIRPLANE_MODE,
  deviceSettings.SettingsMenu.MANAGE_DATA_USAGE,
  deviceSettings.SettingsMenu.VPN_SETTINGS,
  deviceSettings.SettingsMenu.TEXT_DISPLAY_SIZE,
  deviceSettings.SettingsMenu.APP_DUPLICATOR,
  deviceSettings.SettingsMenu.SEARCH
];

export default function beforeAllTest() {
  describe('beforeAll_test', () => {
    /**
     * @tc.name   test_device_settings_add_hidden_settings_menu_0105
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0105
     * @tc.desc   test add hidden settings menu success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0105", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, FULL_VALID_MENUS_TO_HIDE);
        const addResultList: Array<number> = deviceSettings.getHiddenSettingsMenu(SELFWANT) as Array<number>;
        const result = FULL_VALID_MENUS_TO_HIDE.every(menu => addResultList.includes(menu as number));
        expect(result).assertTrue();
      } catch (error) {
        expect(error.code === '801').assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_get_bluetooth_state_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_BLUETOOTH_STATE_0100
     * @tc.desc   test getBluetoothState with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_get_bluetooth_state_0100', Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bluetoothInfo: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        setBluetoothState(bluetoothInfo.state);
        let edmEnable: string = systemParameterEnhance.getSync("persist.edm.edm_enable", "");
        expect(edmEnable == "true").assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   test_get_wifi_state_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GET_WIFI_STATE_0200
     * @tc.desc   test isWifiActiveSync method with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_wifi_state_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let wifiState: boolean = wifiManager.isWifiActiveSync(SELFWANT);
        setWifiState(wifiState);
        let edmEnable: string = systemParameterEnhance.getSync("persist.edm.edm_enable", "");
        expect(edmEnable == "true").assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  })
}