
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
     * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_1100
     * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_1100
     * @tc.desc Function test
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
     * @tc.number settings_uri_test_static_static_001
     * @tc.name settings_uri_test_static_static_001
     * @tc.desc check settings uri
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
     * @tc.number ssettings_uri_test_static_static_002
     * @tc.name settings_uri_test_static_static_002
     * @tc.desc check settings uri
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
     */
    it('settings_uri_test_static_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name = 'settings.screen.brightness';
      let uri = settings.getUriSync(name);
      console.info("[settings_uri_test_static_static_004] uri is: " + uri);
      expect(uri).assertEqual('datashare:///com.ohos.settingsdata/entry/settingsdata/SETTINGSDATA?Proxy=true&key=settings.screen.brightness')
      done();
    });


    /**
     * @tc.number settings_set_value_113
     * @tc.name settings_set_value_113
     * @tc.desc check setValueSync
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
     * @tc.number settings_get_value_static_052
     * @tc.name settings_get_value_static_052
     * @tc.desc check settings get value
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
     */
    it('settings_get_value_static_060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.development_settings_status"
      expect(str).assertEqual(settings.general.DEVELOPMENT_SETTINGS_STATUS);
      done();
    });

    /**
     * @tc.number SUB_Misc_inputMethod_showTextInput_Promise_static_0100
     * @tc.name SUB_Misc_inputMethod_showTextInput_Promise_static_0100
     * @tc.desc Promise mode calls the showTextInput interface without input parameters
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
     */
    it('settings_get_value_static_067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.geolocation_origins_allowed"
      expect(str).assertEqual(settings.general.GEOLOCATION_ORIGINS_ALLOWED);
      done();
    });

    /**
     * @tc.number settings_get_value_static_068
     * @tc.name settings_get_value_static_068
     * @tc.desc check settings get value
     */
    it('settings_get_value_static_068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str = "settings.general.skip_use_hints"
      expect(str).assertEqual(settings.general.SKIP_USE_HINTS);
      done();
    });


    /**
     * @tc.number settings_get_value_static_091
     * @tc.name settings_get_value_static_091
     * @tc.desc check settings get value
     */
    it('settings_get_value_static_091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.sound.sound_effects_status"
      expect(str).assertEqual(settings.sound.SOUND_EFFECTS_STATUS);
      done();
    });

    /** 
      * @tc.number SUB_Misc_inputMethod_showTextInput_Async_static_0400
      * @tc.name SUB_Misc_inputMethod_showTextInput_Async_static_0400
      * @tc.desc Do not bind the input method keyboard, and call the showTextInput interface in Async mode
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
     * @tc.number settings_get_value_static_097
     * @tc.name settings_get_value_static_097
     * @tc.desc check settings get value
     */
    it('settings_get_value_static_097',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_radio"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_RADIO);
      done();
    });

    /**
     * @tc.number SUB_Misc_inputMethod_showTextInput_Async_static_0100
     * @tc.name SUB_Misc_inputMethod_showTextInput_Async_static_0100
     * @tc.desc Async mode calls the showTextInput interface without input parameters
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
     */
    it('settings_get_value_static_099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.nfc_radio"
      expect(str).assertEqual(settings.wireless.NFC_RADIO);
      done();
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_static_0200
     * @tc.name SUB_Misc_inputMethod_attach_Async_static_0200
     * @tc.desc Call the attach interface in Async mode. Optional input parameter showkeyboard=false
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
     * @tc.number settings_get_value_static_101
     * @tc.name settings_get_value_static_101
     * @tc.desc check settings get value
     */
    it('settings_get_value_static_101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_STATUS);
      done();
    });

    /**
     * @tc.number settings_get_value_static_102
     * @tc.name settings_get_value_static_102
     * @tc.desc check settings get value
     */
    it('settings_get_value_static_102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.bluetooth_discoverability_status"
      expect(str).assertEqual(settings.wireless.BLUETOOTH_DISCOVER_ABILITY_STATUS);
      done();
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_static_0100
     * @tc.name SUB_Misc_inputMethod_attach_Async_static_0100
     * @tc.desc Call the attach interface in Async mode. Optional input parameter showkeyboard=true
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
     */
    it('settings_get_value_static_104',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_dhcp_max_retry_count"
      expect(str).assertEqual(settings.wireless.WIFI_DHCP_MAX_RETRY_COUNT);
      done();
    });


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
     * @tc.number settings_get_value_static_106
     * @tc.name settings_get_value_static_106
     * @tc.desc check settings get value
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
     * @tc.number settings_get_value_static_108
     * @tc.name settings_get_value_static_108
     * @tc.desc check settings get value
     */
    it('settings_get_value_static_108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.wifi_radio"
      expect(str).assertEqual(settings.wireless.WIFI_RADIO);
      done();
    });

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
     */
    it('settings_get_value_static_110',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,async (done: () => void): Promise<void> => {
      let str ="settings.wireless.owner_lockdown_wifi_cfg"
      expect(str).assertEqual(settings.wireless.OWNER_LOCKDOWN_WIFI_CFG);
      done();
    });

    /**
     * @tc.number settings_get_value_static_113
     * @tc.name settings_get_value_static_113
     * @tc.desc check settings get value
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
     * @tc.number SUB_Misc_inputMethod_selectByMovement__static_0100
     * @tc.name SUB_Misc_inputMethod_selectByMovement__static_0100
     * @tc.desc Function test
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
     * @tc.number settings_get_value_static_116
     * @tc.name settings_get_value_static_116
     * @tc.desc check settings get value
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
     * @tc.number settings_get_value_static_117
     * @tc.name settings_get_value_static_117
     * @tc.desc check settings get value
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
     * @tc.number settings_get_value_static_122
     * @tc.name settings_get_value_static_122
     * @tc.desc check unregisterKeyObserver
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
     * @tc.number open_manager_settings_static_119
     * @tc.name open_manager_settings_static_119
     * @tc.desc check open manager
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
     * @tc.number SUB_Misc_inputMethod_switchInputMethod__static_1200
     * @tc.name SUB_Misc_inputMethod_switchInputMethod__static_1200
     * @tc.desc Function test
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
     * @tc.number open_manager_settings_static_120
     * @tc.name open_manager_settings_static_120
     * @tc.desc check open manager
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
  })
}
