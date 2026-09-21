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
import {
  ENTINFO1,
  SELFWANT,
  SELFHAPNAME,
  BLUETOOTH_STATE,
  WIFI_STATE,
  DEFAULT_USER_ID,
  setBluetoothState,
  setWifiState
} from '../commom.ets';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { osAccount } from '@kit.BasicServicesKit';

import adminManager from '@ohos.enterprise.adminManager';
import applicationManager from '@ohos.enterprise.applicationManager';
import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import common from '@ohos.enterprise.common';
import deviceSettings from '@ohos.enterprise.deviceSettings';
import restrictions from '@ohos.enterprise.restrictions';
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_SUPERHUB_JS_0300
     * @tc.name      : test_set_disallowed_policy_for_account_superhub_0300
     * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub then nonStop
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_set_disallowed_policy_for_account_superhub_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
      try {
        let localId: number =  await osAccountManager.getOsAccountLocalId();
        restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId);
        let userNonStopApps: Array<common.ApplicationInstance> = [
          {
            appIdentifier:"5765880207854114601",
            accountId:DEFAULT_USER_ID,
            appIndex:0
          }
        ];
        applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === '9200010').assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_SUPERHUB_JS_0500
     * @tc.name      : test_set_disallowed_policy_for_account_superhub_0500
     * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub before removeHiddenSettingsMenu
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_set_disallowed_policy_for_account_superhub_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
      try {
        let localId: number =  await osAccountManager.getOsAccountLocalId();
        restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId);

        const VALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [
          deviceSettings.SettingsMenu.SUPERHUB,
          deviceSettings.SettingsMenu.WIFI
        ];
        deviceSettings.addHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
        expect(false).assertTrue();
      } catch (error) {
        if (error.code === 801) {
          expect(error.code === 801).assertTrue();
        } else {
          expect(error.code === '9200010').assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

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

    /**
     * @tc.name   addDockApp_test_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1500
     * @tc.desc   addDockApp with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1500", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1500  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = "";
        let index: number = 5;
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        console.info(' --- addDockApp_test_1500 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1500 error 9201015 is expected, actually catch: ' + error.code);
        if (error.code === '801') {
          expect(error.code === '801').assertTrue();
        } else {
          expect(error.code === '9201015').assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1500  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1600
     * @tc.desc   addDockApp with empty abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1600", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1600  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let index: number = 5;
        let abilityName: string = "";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName, index);
        console.info(' --- addDockApp_test_1600 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1600 error 9200015 is expected, actually catch: ' + error.code);
        if (error.code === '801') {
          expect(error.code === '801').assertTrue();
        } else {
          expect(error.code === '9200015').assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1600  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1700
     * @tc.desc   addDockApp with empty abilityName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1700", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1700  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = SELFHAPNAME;
        let abilityName: string = "";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName);
        console.info(' --- addDockApp_test_1700 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1700 error 9200015 is expected, actually catch: ' + error.code);
        if (error.code === '801') {
          expect(error.code === '801').assertTrue();
        } else {
          expect(error.code === '9200015').assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1700  -------- END --------');
    })

    /**
     * @tc.name   addDockApp_test_1800
     * @tc.number SUB_CUSTOMIZATION_EDM_ADDDOCKAPP_1800
     * @tc.desc   addDockApp with empty bundleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDockApp_test_1800", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDockApp_test_1800  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName: string = "";
        let abilityName: string = "EntryAbility";
        applicationManager.addDockApp(SELFWANT, bundleName, abilityName);
        console.info(' --- addDockApp_test_1800 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDockApp_test_1800 error 9201015 is expected, actually catch: ' + error.code);
        if (error.code === '801') {
          expect(error.code === '801').assertTrue();
        } else {
          expect(error.code === '9201015').assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addDockApp_test_1800  -------- END --------');
    })
  })
}