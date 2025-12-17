
/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import settings from '@ohos.settings'
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { BusinessError } from '@ohos.base';

let abilityContext: common.UIAbilityContext

export default function settingUiJsunit() {
  beforeAll(() => {
    console.info("beforeAll start");
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    console.info("beforeAll end abilityDelegator");
    abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.settings.static")
    await Utils.msSleep(2000);
    abilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
    console.info("beforeAll end");
  })

  describe('appInfoTest', ()=> {
    console.log("************* settings Test start*************");

    /**
     * @tc.number SUB_BMS_SupportWindowMode_Static_0100
     * @tc.name SUB_BMS_SupportWindowMode_Static_0100
     * @tc.desc Test supportWindowModes as a parameter
     * @tc.level LEVEL1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     */
    it("SUB_BMS_SupportWindowMode_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const subTag: string = 'SUB_BMS_SupportWindowMode_Static_0100';
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.actsbmsenumtest.static',
          abilityName: 'EntryAbility'
        };
        let options: StartOptions = {
          supportWindowModes: [
            bundleManager.SupportWindowMode.SPLIT,
            bundleManager.SupportWindowMode.FLOATING
          ]
        };
        try {
          context.startAbility(want, options, (err: BusinessError<void> | null) => {
            hilog.info(domain, tag, `${subTag} error code: ${err?.code}.`);
            expect(`${err?.code}`).assertEqual('0');
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${subTag} fail.`)
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_1100
     * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_1100
     * @tc.desc Function test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Misc_inputMethod_switchInputMethod__static_1100', Level.LEVEL2, async (done: () => void)  => {
      hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_1100 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_1100 getCurrentInputMethod: " + JSON.stringify(inputM));
      try {
        hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_1100 switchInputMethod permission fail')
        let result = await inputMethod.switchInputMethod(inputM);
        expect(result == true).assertTrue();
        done();
        hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_1100 end");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_1100 switchInputMethod catch err' + JSON.stringify(err))
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_Static_2400
     * @tc.name getBundleNameByUidSyncUnPermissionApi14
     * @tc.desc Test getBundleNameByUidSync unPermission for api14.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('getBundleNameByUidSyncUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        bundle.getBundleNameByUidSync(uid)
        expect().assertFail();
        done();
      } catch (err) {
        if (err instanceof BusinessError) {
          console.info("getBundleNameByUidSyncUnPermissionApi14 1 catch " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      }
    })

    /**
     * @tc.number settings_uri_test_static_static_001
     * @tc.name settings_uri_test_static_static_001
     * @tc.desc check settings uri
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_uri_test_static_static_001',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.test';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_001] uri is: " + uri);
      let uri2 = settings.getUriSync(name);
      console.info("[settings_uri_test_static_001] uri2 is: " + uri2);
      expect(uri).assertEqual(uri2);
      done();
    });

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_Static_2500
     * @tc.name getBundleNameByUidUnPermissionApi14
     * @tc.desc Test getBundleNameByUid unPermission for api14.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('getBundleNameByUidUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await bundle.getBundleNameByUid(uid).then((data: string) => {
          console.info("getBundleNameByUidUnPermissionApi14 promise success " + data);
          expect().assertFail();
        }).catch((err: BusinessError): void => {
          console.info("getBundleNameByUidUnPermissionApi14 promise error " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        })
      } catch (err) {
        if (err instanceof BusinessError) {
          console.info("getBundleNameByUidUnPermissionApi14 1 catch " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
      try {
        bundle.getBundleNameByUid(uid, (err: BusinessError | null, data: string | undefined) => {
          console.info("getBundleNameByUidUnPermissionApi14 callback2 success " + data);
          console.info("getBundleNameByUidUnPermissionApi14 callback2 error " + JSON.stringify(err));
          expect(data).assertUndefined();
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err) {
        if (err instanceof BusinessError) {
          console.info("getBundleNameByUidUnPermissionApi14 callback2 catch " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number ssettings_uri_test_static_static_002
     * @tc.name settings_uri_test_static_static_002
     * @tc.desc check settings uri
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_uri_test_static_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = '';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_002] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=')
      done();
    });

    /**
     * @tc.number settings_uri_test_static_static_004
     * @tc.name settings_uri_test_static_static_004
     * @tc.desc check settings value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_uri_test_static_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_static_004] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=settings.screen.brightness')
      done();
    });

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo2_Static_2600
     * @tc.name getAppCloneIdentityUnPermissionApi14
     * @tc.desc Test getAppCloneIdentity unPermission for api14.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('getAppCloneIdentityUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        bundle.getAppCloneIdentity(uid).then((data: AppCloneIdentity) => {
          console.info("getAppCloneIdentityUnPermissionApi14 success " + data);
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void => {
          console.info("getAppCloneIdentityUnPermissionApi14 promise " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        })
      } catch (err) {
        if (err instanceof BusinessError) {
          console.info("getAppCloneIdentityUnPermissionApi14 1 catch " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    })


    /**
     * @tc.number settings_set_value_113
     * @tc.name settings_set_value_113
     * @tc.desc check setValueSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_set_value_113',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness113';//关键字
      let value = 'brightness113'//值
      try{
        settings.setValue(abilityContext, name, value)
          .then((data)=>{
            expect(data).assertTrue();
            done();
          })
          .catch((err)=>{
            console.info("[settings_set_value_113] error is:" + err);
            expect().assertFail();
            done();
          })
      }catch(err){
        console.info("[settings_set_value_113] error is:" + err);
        expect().assertFail();
        done();
        return;
      }
    });

    /**
     * @tc.number Sub_Bms_Framework_getSignatureInfo_static_04
     * @tc.name Sub_Bms_Framework_getSignatureInfo_static_04
     * @tc.desc Test getSignatureInfo with error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('Sub_Bms_Framework_getSignatureInfo_static_04', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundle.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA).then((data: BundleInfo) => {
        let datas = bundle.getSignatureInfo(0);
        expect().assertFail();
        done();
      }).catch((err: BusinessError): void => {
        hilog.error(domain, tag, `Sub_Bms_Framework_getSignatureInfo_static_04 catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(201);
        done();
      });
    })


    /**
     * @tc.number settings_get_value_static_052
     * @tc.name settings_get_value_static_052
     * @tc.desc check settings get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_get_value_static_052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.setup_wizard_finished"
      expect(str).assertEqual(settings.general.SETUP_WIZARD_FINISHED);
      done();
    });

    /**
     * @tc.number settings_get_value_static_060
     * @tc.name settings_get_value_static_060
     * @tc.desc check settings get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_get_value_static_060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.development_settings_status"
      expect(str).assertEqual(settings.general.DEVELOPMENT_SETTINGS_STATUS);
      done();
    });


    /**
     * @tc.number Sub_Bms_Framework_getAbilityInfo_static_01
     * @tc.name Sub_Bms_Framework_getAbilityInfo_static_01
     * @tc.desc Test getAbilityInfo with error code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('Sub_Bms_Framework_getAbilityInfo_static_01', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let uri = "https://www.example.com";
      let abilityFlags = bundle.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
      bundle.getAbilityInfo(uri, abilityFlags).then((data: Array<bundle.AbilityInfo>) => {
        expect().assertFail();
        done();
      }).catch((err: BusinessError): void => {
        hilog.error(domain, tag, `Sub_Bms_Framework_getAbilityInfo_static_01 catch failed errCode:${err.code} message:${err.message}`);
        expect(err.code).assertEqual(201);
        done();
      });
    })

    /**
     * @tc.number SUB_Misc_inputMethod_showTextInput_Promise_static_0100
     * @tc.name SUB_Misc_inputMethod_showTextInput_Promise_static_0100
     * @tc.desc Promise mode calls the showTextInput interface without input parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Misc_inputMethod_showTextInput_Promise_static_0100', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Promise_static_0100';
      try {
        let data = await inputMethod.getController().showTextInput();
        console.info(`${CASE_NAME} execution success `);
        expect(true).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
      }
    });

    /**
     * @tc.number  settings_get_value_static_067
     * @tc.name  settings_get_value_static_067
     * @tc.desc  check settings get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_get_value_static_067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.geolocation_origins_allowed"
      expect(str).assertEqual(settings.general.GEOLOCATION_ORIGINS_ALLOWED);
      done();
    });

    /**
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200
     * @tc.name Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200
     * @tc.desc Test getLauncherAbilityInfoSync with permission denied return errcode 201.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync("ohos.acts.bms.getlauncherabilityinfo2.test.static", 100);
          expect().assertFail();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
          done();
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_1200",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(201);
            hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
            done();
          }
        }
      });


    /**
     * @tc.number settings_get_value_static_068
     * @tc.name settings_get_value_static_068
     * @tc.desc check settings get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_get_value_static_068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.skip_use_hints"
      expect(str).assertEqual(settings.general.SKIP_USE_HINTS);
      done();
    });

    /**
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.name Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100
     * @tc.desc Test getLauncherAbilityInfoSync with valid value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_static_0100';
      try {
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
        let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME2, 100);
        // hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+' getLauncherAbilityInfoSync success, result is: %{public}s', JSON.stringify(data));
        console.log('getLauncherAbilityInfoSync success');
        expect(data[0].labelId).assertLarger(0.0);
        expect(data[0].iconId).assertLarger(0.0);
        expect(data[0].userId).assertEqual(100);
        expect(data[0].installTime).assertLarger(0.0);
        expect(data[0].elementName.deviceId).assertEqual("");
        expect(data[0].elementName.bundleName).assertEqual(BUNDLE_NAME2);
        expect(data[0].elementName.moduleName).assertEqual("entry");
        expect(data[0].elementName.abilityName).assertEqual('EntryAbility');
        expect(data[0].elementName.shortName).assertEqual('');
        expect(data[0].elementName.uri).assertEqual('/ohos.acts.bms.getlauncherabilityinfo.test.static/entry/EntryAbility');
        done();
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
      } catch (errData) {
        // hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+' getLauncherAbilityInfoSync failed, result is: %{public}s', JSON.stringify(err));
        console.log('getLauncherAbilityInfoSync failed');
        let errMsg = (errData as BusinessError).message;
        let code = (errData as BusinessError).code;
        if (code === 801) {
          expect(code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
        hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
      }
    });


    /**
     * @tc.number settings_get_value_static_091
     * @tc.name settings_get_value_static_091
     * @tc.desc check settings get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_get_value_static_091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.sound.sound_effects_status"
      expect(str).assertEqual(settings.sound.SOUND_EFFECTS_STATUS);
      done();
    });

    /**
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.name Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200
     * @tc.desc Test getLauncherAbilityInfoSync with bundle name is not found return errcode 17700001.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync('ohos.acts.bms.getlauncherabilityinfo.test.static.test200', 100);
          expect().assertFail();
          done();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0200",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(17700001);
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        }
      });


    /**
     * @tc.number SUB_Misc_inputMethod_showTextInput_Async_static_0400
     * @tc.name SUB_Misc_inputMethod_showTextInput_Async_static_0400
     * @tc.desc Do not bind the input method keyboard, and call the showTextInput interface in Async mode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('SUB_Misc_inputMethod_showTextInput_Async_static_0400', Level.LEVEL2, async (done: () => void) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Async_static_0400';
      let CallBack = (error: BusinessError | null) => {
        if (error != null) {
          console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
          expect(error?.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
          done();

        } else {
          console.info(`${CASE_NAME} execution success`);
          expectFalse();
          done();
        }
      };
      try {
        let data = await inputMethod.getController().detach();
        console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
      } catch (error) {
        error = error as BusinessError;
        console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
      }
      try {
        inputMethod.getController().showTextInput(CallBack);
      } catch (error) {
        error = error as BusinessError;
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code === INVALID_INPUT_METHOD_CLIENT_DETACHED).assertTrue();
        done();

      }
    });

    /**
     * @tc.number Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.name Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300
     * @tc.desc Test getLauncherAbilityInfoSync with user ID is not found return errcode 17700004.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it("Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300';
        try {
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case start');
          let data = launcherBundleManager.getLauncherAbilityInfoSync(BUNDLE_NAME2, 111);
          expect().assertFail();
          done();
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        } catch (errData) {
          let errMsg = (errData as BusinessError).message;
          let code = (errData as BusinessError).code;
          hilog.info(0x0000, "Sub_Bms_Framework_GetLauncherAbilityInfoSync_0300",
            `errData is errCode:${code} message:${errMsg}`);
          if (code === 801) {
            expect(code).assertEqual(801);
            done();
          } else {
            expect(code).assertEqual(17700004);
            done();
          }
          hilog.info(0x0000, `${tag}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}`+'test case end');
        }
      });


    /**
     * @tc.number settings_get_value_static_097
     * @tc.name settings_get_value_static_097
     * @tc.desc check settings get value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('settings_get_value_static_097',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_radio"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_RADIO);
      done();
    });

    /**
     * @tc.number Sub_Bms_Framework_getAbilityInfo_static_00
     * @tc.name Sub_Bms_Framework_getAbilityInfo_static_00
     * @tc.desc Test getAbilityInfo normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('Sub_Bms_Framework_getAbilityInfo_static_00', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let uri = "https://www.example.com";
      let abilityFlags = bundleManager.AbilityFlag.GET_ABILITY_INFO_WITH_APPLICATION;
      bundleManager.getAbilityInfo(uri, abilityFlags).then((abilityInfos: Array<bundleManager.AbilityInfo>) => {
        expect(abilityInfos.length).assertLarger(PARAM_0);
        for (let index = 0; index < abilityInfos.length; index++) {
          expect(abilityInfos[index].bundleName).assertEqual("ohos.acts.bms.getlauncherabilityinfo.test.static");
          expect(abilityInfos[index].moduleName).assertEqual("entry");
          expect(abilityInfos[index].name).assertEqual("EntryAbility");
          expect(abilityInfos[index].label).assertEqual("label");
          expect(abilityInfos[index].labelId).assertLarger(PARAM_0);
          expect(abilityInfos[index].description).assertEqual("$string:EntryAbility_desc");
          expect(abilityInfos[index].descriptionId).assertLarger(PARAM_0);
          expect(abilityInfos[index].icon).assertEqual("$media:icon");
          expect(abilityInfos[index].iconId).assertLarger(PARAM_0);
          expect(abilityInfos[index].process).assertEqual("");
          expect(abilityInfos[index].exported).assertEqual(true);
          expect(abilityInfos[index].orientation).assertEqual(PARAM_0);
          expect(abilityInfos[index].launchType).assertEqual(PARAM_0);
          expect(abilityInfos[index].permissions.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].deviceTypes.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].applicationInfo).assertEqual(null);
          expect(abilityInfos[index].metadata.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].enabled).assertEqual(true);
          expect(abilityInfos[index].supportWindowModes.length).assertLarger(PARAM_0);
          expect(abilityInfos[index].windowSize.maxWindowRatio).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.minWindowRatio).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.maxWindowWidth).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.minWindowWidth).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.maxWindowHeight).assertEqual(PARAM_0);
          expect(abilityInfos[index].windowSize.minWindowHeight).assertEqual(PARAM_0);
          expect(abilityInfos[index].excludeFromDock).assertEqual(false);
          expect(abilityInfos[index].skills.length).assertEqual(PARAM_0);
          expect(abilityInfos[index].appIndex).assertEqual(PARAM_0);
          expect(abilityInfos[index].orientationId).assertEqual(PARAM_0);
        }
        done();
      }).catch((err: BusinessError): void => {
        hilog.error(domain, tag, `Sub_Bms_Framework_getAbilityInfo_static_00 catch failed errCode:${err.code} message:${err.message}`);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        }else{
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5400
       * @tc.name testGetProfileByExtensionAbilitySyncByEmptyAbilityName_static
       * @tc.desc Check the empty abilityName (by sync)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('testGetProfileByExtensionAbilitySyncByEmptyAbilityName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          manager.getProfileByExtensionAbilitySync(MODULE_NAME, '', METADATA_NAME);
          expect().assertFail();
          done();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.error(domain, tag, "getProfileByExtensionAbilitySyncByEmptyAbilityName_static failed" + JSON.stringify(err));
            expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
            done();
          }
        }
      })

      /**
       * @tc.number SUB_Misc_inputMethod_showTextInput_Async_static_0100
       * @tc.name SUB_Misc_inputMethod_showTextInput_Async_static_0100
       * @tc.desc Async mode calls the showTextInput interface without input parameters
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('SUB_Misc_inputMethod_showTextInput_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_showTextInput_Async_static_0100';
        let CallBack = (error: BusinessError | null) => {
          if (error?.code != 0) {
            console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
          } else {
            console.info(`${CASE_NAME} execution success`);
          }
          expect(error == null).assertTrue();
          done();
        };
        try {
          inputMethod.getController().showTextInput(CallBack);
        } catch (error) {
          error = error as BusinessError;
          console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
        }
      });

      /**
       * @tc.number settings_get_value_static_099
       * @tc.name settings_get_value_static_099
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.nfc_radio"
        expect(str).assertEqual(settings.wireless.NFC_RADIO);
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5300
       * @tc.name getProfileByExtensionAbilitySyncByEmptyModuleName_static
       * @tc.desc Check the empty moduleName (by sync)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilitySyncByEmptyModuleName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          manager.getProfileByExtensionAbilitySync('', ABILITY_NAME, METADATA_NAME);
          expect().assertFail();
          done();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.error(domain, tag, "getProfileByExtensionAbilitySyncByEmptyModuleName_static failed" + JSON.stringify(err));
            expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST);
            done();
          }
        }
      })

      /**
       * @tc.number SUB_Misc_inputMethod_attach_Async_static_0200
       * @tc.name SUB_Misc_inputMethod_attach_Async_static_0200
       * @tc.desc Call the attach interface in Async mode. Optional input parameter showkeyboard=false
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('SUB_Misc_inputMethod_attach_Async_static_0200', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_static_0200';
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: inputMethod.TextInputType.TEXT,
            enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
          }
        }
        let CallBack = (error: BusinessError | null) => {
          expect(error == null).assertTrue();
          if (error?.code != 0) {
            console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
          } else {
            console.info(`${CASE_NAME} execution success`);
          }
          done();
        };
        try {
          inputMethod.getController().attach(false, ATTRIBUTE, CallBack);
        } catch (error) {
          if (error instanceof BusinessError) {
            console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
            expect().assertFail();
            done();
          }
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5200
       * @tc.name testGetProfileByExtensionAbilitySyncByInvalidMetaData_static
       * @tc.desc Check the invalid abilityName (by sync)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('testGetProfileByExtensionAbilitySyncByInvalidMetaData_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          manager.getProfileByExtensionAbilitySync(MODULE_NAME, ABILITY_NAME, "METADATA_NAME");
          expect().assertFail();
          done();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.error(domain, tag, "getProfileByExtensionAbilitySyncByInvalidAbilityName_static failed" + JSON.stringify(err));
            expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
            done();
          }
        }
      })

      /**
       * @tc.number settings_get_value_static_101
       * @tc.name settings_get_value_static_101
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.bluetooth_status"
        expect(str).assertEqual(settings.wireless.BLUETOOTH_STATUS);
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5100
       * @tc.name testGetProfileByExtensionAbilitySyncByInvalidAbilityName_static
       * @tc.desc Check the invalid abilityName (by sync)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('testGetProfileByExtensionAbilitySyncByInvalidAbilityName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          manager.getProfileByExtensionAbilitySync(MODULE_NAME, 'INVALID_NAME', METADATA_NAME);
          expect().assertFail();
          done();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.error(domain, tag, "testGetProfileByExtensionAbilitySyncByInvalidAbilityName_static failed" + JSON.stringify(err));
            expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
            done();
          }
        }
      })

      /**
       * @tc.number settings_get_value_static_102
       * @tc.name settings_get_value_static_102
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.bluetooth_discoverability_status"
        expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_ABILITY_STATUS);
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_5000
       * @tc.name testGetProfileByExtensionAbilitySyncByInvalidModuleName_static
       * @tc.desc Check the invalid moduleName (by sync)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('testGetProfileByExtensionAbilitySyncByInvalidModuleName_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        try {
          manager.getProfileByExtensionAbilitySync('INVALID_NAME', ABILITY_NAME, METADATA_NAME);
          expect().assertFail();
          done();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.error(domain, tag, "testGetProfileByExtensionAbilitySyncByInvalidModuleName_static failed" + JSON.stringify(err));
            expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
            done();
          }
        }
      })

      /**
       * @tc.number SUB_Misc_inputMethod_attach_Async_static_0100
       * @tc.name SUB_Misc_inputMethod_attach_Async_static_0100
       * @tc.desc Call the attach interface in Async mode. Optional input parameter showkeyboard=true
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('SUB_Misc_inputMethod_attach_Async_static_0100', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_static_0100';
        let attribute: inputMethod.InputAttribute = {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
        }
        let info: inputMethod.CursorInfo = {
          left: 2.0,
          top: 2.0,
          width: 2.0,
          height: 2.0
        }
        let range: inputMethod.Range = {
          start: 1,
          end:2
        }
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: attribute,
          cursorInfo:info,
          selection:range,
          windowId:100
        }
        let CallBack = (error: BusinessError | null) => {
          expect(error == null).assertTrue();
          if (error?.code != 0) {
            console.info(`${CASE_NAME} execution fail,error: [${error?.code}, ${error?.message}]`);
          } else {
            console.info(`${CASE_NAME} execution success`);
          }
          done();
        };
        try {
          inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
        } catch (error) {
          if (error instanceof BusinessError) {
            console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
            expect().assertFail();
            done();
          }
        }
      });


      /**
       * @tc.number settings_get_value_static_104
       * @tc.name settings_get_value_static_104
       * @tc.desc  check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_104',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.wifi_dhcp_max_retry_count"
        expect(str).assertEqual(settings.wireless.WIFI_DHCP_MAX_RETRY_COUNT);
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_4400
       * @tc.name getProfileByExtensionAbilityNoJsonCall_static
       * @tc.desc profile is invalid json format (by callback)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityNoJsonCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4, (err: BusinessError<void> | null, data) => {
          hilog.error(domain, tag, '[getProfileByExtensionAbilityNoJsonCall_static] err: ' + JSON.stringify(err));
          expect(err?.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
          done();
        });
      })


      /**
       * @tc.number  SUB_Misc_inputMethod_onDeleteLeftError_static_0100
       * @tc.name    SUB_Misc_inputMethod_onDeleteLeftError_static_0100
       * @tc.desc    12800009 Function test
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level2
       */
      it('SUB_Misc_inputMethod_onDeleteLeftError_static_0100', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_onDeleteLeftError_static_0100';
        let callback1 = (length: int) => {
          hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        }
        try {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          hilog.info(domain, tag, `${CASE_NAME} deleteLeft detach success`);
          inputMethodController.on('deleteLeft',callback1 );
          hilog.info(domain, tag, `${CASE_NAME} deleteLeft callback1 success`);
          expect().assertFail();
        } catch (error) {
          error = error as BusinessError;
          hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
          expect(error.code).assertEqual(12800009);
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_0600
       * @tc.name getProfileByExtensionAbilityNoJsonPro_static
       * @tc.desc profile is invalid json format (by promise)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityNoJsonPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME4).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, '[getProfileByExtensionAbilityNoJsonPro_static] data is: ' + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, '[getProfileByExtensionAbilityNoJsonPro_static] Operation failed. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
          done();
        })
      })

      /**
       * @tc.number settings_get_value_static_106
       * @tc.name settings_get_value_static_106
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_106',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.wifi_status"
        expect(str).assertEqual(settings.wireless.WIFI_STATUS);
        done();
      });

      /**
       * @tc.number  SUB_Misc_inputMethod_onInsertTextError_static_0100
       * @tc.name    SUB_Misc_inputMethod_onInsertTextError_static_0100
       * @tc.desc    12800009 Function test
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level2
       */
      it('SUB_Misc_inputMethod_onInsertTextError_static_0100', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_onInsertTextError_static_0100';
        let callback1 = (text: string) => {
          hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        }
        try {
          let inputMethodController = inputMethod.getController();
          await inputMethodController.detach();
          hilog.info(domain, tag, `${CASE_NAME} insertText detach success`);
          inputMethodController.on('insertText',callback1 );
          hilog.info(domain, tag, `${CASE_NAME} insertText callback1 success`);
          expect().assertFail();
        } catch (error) {
          error = error as BusinessError;
          hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
          expect(error.code).assertEqual(12800009);
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_4600
       * @tc.name getProfileByExtensionAbilityNoProfilePro_static
       * @tc.desc no profile configured under the ability (by promise)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityNoProfilePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME3).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, '[getProfileByExtensionAbilityNoProfilePro_static] getProfileByExtensionAbility callback data is: ' +
          JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, '[getProfileByExtensionAbilityNoProfilePro_static]Operation failed. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
          done();
        })
      })

      /**
       * @tc.number settings_get_value_static_108
       * @tc.name settings_get_value_static_108
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.wifi_radio"
        expect(str).assertEqual(settings.wireless.WIFI_RADIO);
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_0300
       * @tc.name getProfileByExtensionAbilityInvalidMetaDataPro_static
       * @tc.desc Check the invalid metadataName (by promise)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityInvalidMetaDataPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, '[getProfileByExtensionAbilityInvalidMetaDataPro_static] getProfileByExtensionAbility callback data is: ' +
          JSON.stringify(data));
          expect().assertFail();
          done()
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidMetaDataPro_static]Operation failed. Cause: ' +
          JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
          done();
        })
      })

      /**
       * @tc.number  inputmethodNomal_test_switchInputMethod_static_002
       * @tc.name    inputmethodNomal_test_switchInputMethod_static_002
       * @tc.desc    Test Indicates the input method which will replace the current one.
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level2
       */
      it('inputmethodNomal_test_switchInputMethod_static_002', Level.LEVEL2, async (done: () => void)  => {
        console.info("====>************* inputmethodNomal_test_switchInputMethod_static_002 Test start*************");
        let inputM = inputMethod.getCurrentInputMethod()
        console.info("inputmethodNomal_test_switchInputMethod_static_002 getCurrentInputMethod: " + JSON.stringify(inputM));
        inputMethod.switchInputMethod(inputM, (err : BusinessError | null, data : boolean | undefined) => {
          try {
            if (err?.code) {
              console.info("====>inputmethodNomal_test_switchInputMethod_static_002 switchInputMethod permission fail: " + JSON.stringify(err));
              expect(err?.code).assertEqual(201);
              done();
            } else {
              console.info('====>inputmethodNomal_test_switchInputMethod_static_002 success: ' + data);
              expect().assertFail();
              done();
            }
          } catch (err) {
            err = err as BusinessError;
            console.error("====>inputmethodNomal_test_switchInputMethod_static_002 catch err: " + JSON.stringify(err));
            done();
            console.info("====>inputmethodNomal_test_switchInputMethod_static_002 end");
          }
        });
      });

      /**
       * @tc.number settings_get_value_static_110
       * @tc.name settings_get_value_static_110
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_110',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        let str ="settings.wireless.owner_lockdown_wifi_cfg"
        expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_2400
       * @tc.name getProfileByExtensionAbilityInvalidMetaDataCall_static
       * @tc.desc Check the invalid metadataName (by callback)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityInvalidMetaDataCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME, METADATA_NAME_TEST, (err: BusinessError<void> | null, data) => {
          expect(err?.code).assertEqual(ERROR_PROFILE_NOT_EXIST);
          hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidMetaDataCall_static]Operation failed. Cause: ' +
          JSON.stringify(err));
          done();
        });
      })

      /**
       * @tc.number settings_get_value_static_113
       * @tc.name settings_get_value_static_113
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_113',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> =>{
        try{console.info('test settings_get_value_static_113 start');
          settings.enableAirplaneMode(false,(err,data)=>{
            console.info('settings  test enableAirplaneMode callback ssss');
            if (err) {
              console.info('settings test enableAirplaneMode callback err'+err.code);
              expect(err.code).assertEqual(801);
            }
            done();
          })
        }catch(err) {
          console.info('settings  test enableAirplaneMode try catch err');
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.number  inputmethodNomal_test_switchInputMethod_static_001
       * @tc.name    inputmethodNomal_test_switchInputMethod_static_001
       * @tc.desc    Test Indicates the input method which will replace the current one.
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level2
       */
      it('inputmethodNomal_test_switchInputMethod_static_001', Level.LEVEL2, async (done: () => void)  => {
        console.info("====>************* inputmethodNomal_test_switchInputMethod_static_001 Test start*************");
        let inputM = inputMethod.getCurrentInputMethod()
        let property: inputMethod.InputMethodProperty = {
          name: inputM.name,
          id: inputM.id,
          label: inputM.label,
          labelId: inputM.labelId,
          icon: inputM.icon,
          iconId: inputM.iconId
        }
        console.info("inputmethodNomal_test_switchInputMethod_static_001 getCurrentInputMethod: " + JSON.stringify(inputM));
        try {
          console.info('====>inputmethodNomal_test_switchInputMethod_static_001 switchInputMethod permission fail')
          await inputMethod.switchInputMethod(inputM);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          console.error('====>inputmethodNomal_test_switchInputMethod_static_001 switchInputMethod catch err' + JSON.stringify(err))
          expect(err.code).assertEqual(201);
          expect(err.message).assertContain("the permissions check fails");
          done();
          console.info("====>inputmethodNomal_test_switchInputMethod_static_001 end");
        }
      })

      /**
       * @tc.number settings_get_value_static_115
       * @tc.name settings_get_value_static_115
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_115',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try{
          settings.canShowFloating((err,data)=>{
            if (err) {
              console.info('settings test canShowFloating promise err'+String(err));
              expect(err.code).assertEqual(801);
            }
            done();
          })
        }catch(err){
          console.info('settings test canShowFloating promise err' + String(err));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_02700
       * @tc.name getProfileByExtensionAbilityEmptyAbilityCall_static
       * @tc.desc Check the empty abilityName (by callback)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityEmptyAbilityCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME, (err: BusinessError<void> | null, data) => {
          expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
          hilog.error(domain, tag, '[getProfileByExtensionAbilityEmptyAbilityCall_static]Operation failed. Cause: ' + JSON.stringify(err));
          done();
        });
      })


      /**
       * @tc.number SUB_Misc_inputMethod_selectByMovement__static_0100
       * @tc.name SUB_Misc_inputMethod_selectByMovement__static_0100
       * @tc.desc Function test
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('SUB_Misc_inputMethod_selectByMovement__static_0100', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_selectByMovement__static_0100';
        let callback1 = (movement: inputMethod.Movement) => {
          hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        }
        let callback2 = (movement: inputMethod.Movement) => {
          hilog.info(domain, tag, `${CASE_NAME} success callback2`);
        }
        try {
          let inputMethodSetting = inputMethod.getController();
          inputMethodSetting.on("selectByMovement", callback1);
          inputMethodSetting.on("selectByMovement", callback2);
          inputMethodSetting.on("selectByMovement", callback1);
          inputMethodSetting.off("selectByMovement", callback1);
          inputMethodSetting.off("selectByMovement");
          expect(true).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_2000
       * @tc.name getProfileByExtensionAbilityInvalidAbilityCall_static
       * @tc.desc Check the invalid abilityName (by callback)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityInvalidAbilityCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME, (err: BusinessError<void> | null, data) => {
          expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
          hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidAbilityCall_static]Operation failed. Cause: ' +
          JSON.stringify(err));
          done();
        });
      })


      /**
       * @tc.number settings_get_value_static_116
       * @tc.name settings_get_value_static_116
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_116',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
        try{
          settings.canShowFloating().then((data)=>{
            console.info('settings test canShowFloating promise err' + data);
            // expect(String(err)).assertEqual(str);
            done();
          }).catch((err)=>{
            console.info('settings test canShowFloating promise err' + err);
            if ((err as BusinessError).code) {
              expect(err.code).assertEqual(801);
            }
            done();
          })
          let setTTS1: string = settings.TTS.DEFAULT_TTS_PITCH + ''
          let setTTS2: string = settings.TTS.DEFAULT_TTS_RATE + ''
          let setTTS3: string = settings.TTS.DEFAULT_TTS_SYNTH + ''
          let setTTS4: string = settings.TTS.ENABLED_TTS_PLUGINS + ''
        }catch(err){
          console.info('settings test canShowFloating promise err'+String(err));
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_2700
       * @tc.name getProfileByExtensionAbilityEmptyAbilityPro_static
       * @tc.desc Check the empty abilityName (by promise)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityEmptyAbilityPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility(MODULE_NAME, '', METADATA_NAME).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, "getProfileByExtensionAbilityEmptyAbilityPro_static success" + JSON.stringify(data))
          expect(data).assertFail()
          done()
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, "getProfileByExtensionAbilityEmptyAbilityPro_static failed" + JSON.stringify(err))
          expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
          done()
        })
      })


      /**
       * @tc.number settings_get_value_static_117
       * @tc.name settings_get_value_static_117
       * @tc.desc check settings get value
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
        let name = 'settings.screen.brightness117';//关键字
        let value = 'brightness117';//值
        let domainName = 'secure';
        try{
          settings.setValue(abilityContext, name, value, domainName)
            .then((data)=>{
              console.info("[settings_get_value_static_117] value is:" + data);
            })
            .catch((err)=>{
              console.info("[settings_get_value_static_117] error is:" + err);
              if ((err as BusinessError).code) {
                expect(err.code).assertEqual(201);
              }
            })
          done();
        }catch (err) {
          err = err as Error;
          // if(err.code == 201) {
          //   console.info('权限错误')
          //   expect(err.code == 201).assertTrue();
          // }
          console.error("[settings_set_value_static_117] error = " + String(err));
          expect(err.toString() == "Error: assertion (valueType == napi_object) failed: Wrong argument[0] type. Object expected.")
            .assertTrue();
        }
        done();
      });


      /**
       * @tc.number SUB_Misc_inputMethod_ImeChange__static_0100
       * @tc.name SUB_Misc_inputMethod_ImeChange__static_0100
       * @tc.desc Function test
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('SUB_Misc_inputMethod_ImeChange__static_0100', Level.LEVEL2, async (done: () => void) => {
        const CASE_NAME = 'SUB_Misc_inputMethod_ImeChange__static_0100';
        let callback1 = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodSubtype) => {
          hilog.info(domain, tag, `${CASE_NAME} success callback1`);
        }
        let callback2 = (inputMethodProperty: inputMethod.InputMethodProperty, inputMethodSubtype: InputMethodSubtype) => {
          hilog.info(domain, tag, `${CASE_NAME} success callback2`);
        }
        try {
          let inputMethodSetting = inputMethod.getSetting();
          inputMethodSetting.on("imeChange", callback1);
          inputMethodSetting.on("imeChange", callback2);
          inputMethodSetting.on("imeChange", callback1);
          inputMethodSetting.off("imeChange", callback1);
          inputMethodSetting.off("imeChange");
          expect(true).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          hilog.error(domain, tag, `${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
          expect().assertFail();
          done();
        }
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_1000
       * @tc.name getProfileByExtensionAbilityInvalidAbilityPro_static
       * @tc.desc Check the invalid abilityName (by promise)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityInvalidAbilityPro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility(MODULE_NAME, ABILITY_NAME_TEST, METADATA_NAME).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, "getProfileByExtensionAbilityInvalidAbilityPro_static success" + JSON.stringify(data))
          expect(data).assertFail()
          done()
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, "getProfileByExtensionAbilityInvalidAbilityPro_static failed" + JSON.stringify(err))
          expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
          done()
        })
      })

      /**
       * @tc.number settings_get_value_static_122
       * @tc.name settings_get_value_static_122
       * @tc.desc check unregisterKeyObserver
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('settings_get_value_static_122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let name = 'settings.screen.brightness122';//关键字
        let domainName = settings.domainName.DEVICE_SHARED;
        try{
          let value = settings.registerKeyObserver(abilityContext, name, domainName, (err, ret) => {
            if (err) {
              console.info("[settings_get_value_static_118] error is:" + String(err));
              expect(err.code).assertEqual(201);
            }
            done();
          })
          let value2 = settings.unregisterKeyObserver(abilityContext, name, domainName);
          expect(value2).assertEqual(true);
          done();
        }catch (err) {
          err = err as Error;
          console.error("[settings_set_value_122] error = " + err);
          expect(err.toString() == "Error: assertion (valueType == napi_string) failed: Wrong argument[2] type. String expected.")
            .assertTrue();
        }
        done();
      });

      /**
       * @tc.number  inputmethodNomal_test_hideSoftKeyboard_static_1100
       * @tc.name    inputmethodNomal_test_hideSoftKeyboard_static_1100
       * @tc.desc    Test Indicates the input method which will hide softboard with calback.
       * @tc.size    MediumTest
       * @tc.type    Function
       * @tc.level   Level2
       */
      it('inputmethodNomal_test_hideSoftKeyboard_static_1100', Level.LEVEL2, async (done: () => void)  => {
        hilog.info(domain, tag, "====>*********inputmethodNomal_test_hideSoftKeyboard_static_1100 start************");
        let inputMethodCtrl = inputMethod.getController()
        const ATTRIBUTE: inputMethod.TextConfig = {
          inputAttribute: {
            textInputType: inputMethod.TextInputType.TEXT,
            enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
          }
        }
        try {
          let data = await inputMethodCtrl.attach(true, ATTRIBUTE);
          hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_1100 execution success, data: ${JSON.stringify(data)}`);
        } catch (error) {
          error = error as BusinessError;
          hilog.info(domain, tag, `====>inputmethodNomal_test_hideSoftKeyboard_static_1100 catch error, error: [${error.code}, ${error.message}]`);
          expect().assertFail();
          done();
        }
        inputMethodCtrl.hideSoftKeyboard((error : BusinessError | null) => {
          try {
            if (error != null) {
              hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_1100 hideSoftKeyboard permission fail: " + JSON.stringify(error));
              expect(error?.code == 0).assertTrue();
            } else {
              hilog.info(domain, tag, '====>inputmethodNomal_test_hideSoftKeyboard_static_1100 success: ');
              expect(true).assertTrue();
            }
            done();
          } catch (err) {
            err = err as BusinessError;
            hilog.error(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_1100 catch err: " + JSON.stringify(err));
            expect().assertFail();
            done();
            hilog.info(domain, tag, "====>inputmethodNomal_test_hideSoftKeyboard_static_1100 end");
          }
        });
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_3200
       * @tc.name getProfileByExtensionAbilityEmptyModuleCall_static
       * @tc.desc Check the empty moduleName (by callback)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityEmptyModuleCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME, (err: BusinessError<void> | null, data) => {
          expect(err?.code).assertEqual(ERROR_MODULE_NOT_EXIST);
          hilog.error(domain, tag, '[getProfileByExtensionAbilityEmptyModuleCall_static]Operation failed. Cause: ' + JSON.stringify(err));
          done();
        });
      })

      /**
       * @tc.number open_manager_settings_static_119
       * @tc.name open_manager_settings_static_119
       * @tc.desc check open manager
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('open_manager_settings_static_119', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
        let value = settings.openNetworkManagerSettings(abilityContext)
          .then((status)=>{
            console.info("[open_manager_settings_static_119] value is:" + status);
            expect(status).assertTrue();
          })
          .catch((err)=>{
            console.error("[open_manager_settings_static_119] error = " + err);
            if ((err as BusinessError).code) {
              expect(err.code).assertEqual(14800000);
            }
            done();
          })
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_1500
       * @tc.name getProfileByExtensionAbilityInvalidModuleCall_static
       * @tc.desc Check the invalid moduleName (by callback)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityInvalidModuleCall_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME, (err: BusinessError<void> | null, data) => {
          expect(err?.code).assertEqual(ERROR_ABILITY_NOT_EXIST);
          hilog.error(domain, tag, '[getProfileByExtensionAbilityInvalidModuleCall_static]Operation failed. Cause: ' + JSON.stringify(err));
          done();
        });
      })

      /**
       * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_1200
       * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_1200
       * @tc.desc Function test
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('SUB_Misc_inputMethod_switchInputMethod__static_1200', Level.LEVEL2, async (done: () => void)  => {
        hilog.info(domain, tag, "====>************* SUB_Misc_inputMethod_switchInputMethod__static_1200 Test start*************");
        let inputM = inputMethod.getCurrentInputMethod()
        hilog.info(domain, tag, "SUB_Misc_inputMethod_switchInputMethod__static_1200 getCurrentInputMethod: " + JSON.stringify(inputM));
        inputMethod.switchInputMethod(inputM, (err : BusinessError | null, data : boolean | undefined) => {
          try {
            if (err != null && err.code != 0) {
              hilog.info(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_1200 switchInputMethod permission fail: " + JSON.stringify(err));
              expect().assertFail();
              done();
            } else {
              hilog.info(domain, tag, '====>SUB_Misc_inputMethod_switchInputMethod__static_1200 success: ' + data);
              expect(data == true).assertTrue();
              done();
            }
          } catch (err) {
            err = err as BusinessError;
            hilog.error(domain, tag, "====>SUB_Misc_inputMethod_switchInputMethod__static_1200 catch err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
        });
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_1300
       * @tc.name getProfileByExtensionAbilityEmptyModulePro_static
       * @tc.desc Check the empty moduleName (by promise)
       * @tc.level   0
       */
      it('getProfileByExtensionAbilityEmptyModulePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility('', ABILITY_NAME, METADATA_NAME).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, "getProfileByExtensionAbilityEmptyModulePro_static success" + JSON.stringify(data))
          expect(data).assertFail()
          done()
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, "getProfileByExtensionAbilityEmptyModulePro_static failed" + JSON.stringify(err))
          expect(err.code).assertEqual(ERROR_MODULE_NOT_EXIST)
          done()
          done()
        })
      })

      /**
       * @tc.number open_manager_settings_static_120
       * @tc.name open_manager_settings_static_120
       * @tc.desc check open manager
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('open_manager_settings_static_120', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
        let value = settings.openNetworkManagerSettings(abilityContext)
          .then((status)=>{
            console.info("[open_manager_settings_static_120] value is:" + status);
            expect(status).assertTrue();
          })
          .catch((err)=>{
            console.error("[open_manager_settings_static_120] error = " + err);
            if ((err as BusinessError).code) {
              expect(err.code).assertEqual(14800010);
            }
            done();
          })
        done();
      });

      /**
       * @tc.number Sub_Bms_Framework_Query_Profile_By_Extension_Ability_static_0900
       * @tc.name getProfileByExtensionAbilityInvalidModulePro_static
       * @tc.desc Check the invalid moduleName (by promise)
       * @tc.size MediumTest
       * @tc.type Function
       * @tc.level Level1
       */
      it('getProfileByExtensionAbilityInvalidModulePro_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
        await manager.getProfileByExtensionAbility(MODULE_NAME_TEST, ABILITY_NAME, METADATA_NAME).then((data: Array<string>): void =>  {
          hilog.info(domain, tag, "getProfileByExtensionAbilityInvalidModulePro_static success" + JSON.stringify(data))
          expect(data).assertFail()
          done()
        }).catch((err: BusinessError): void  => {
          hilog.error(domain, tag, "getProfileByExtensionAbilityInvalidModulePro_static failed" + JSON.stringify(err))
          expect(err.code).assertEqual(ERROR_ABILITY_NOT_EXIST)
          done()
        })
      })
    })
  })
}
