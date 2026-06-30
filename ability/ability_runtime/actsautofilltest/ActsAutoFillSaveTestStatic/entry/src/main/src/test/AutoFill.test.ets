'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext';
import autoFillManager from '@ohos.app.ability.autoFillManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';
const PARAM_1: int = 1;

export default function autoFillTest() {
  describe('ActsAutoFillTest', () => {
    beforeAll(async() => {
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.autofillsavetest.static");
      await Utils.msSleep(2000);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFillStatic_0500
     * @tc.number SUB_Ability_AbilityRuntime_AutoFillStatic_0500
     * @tc.desc   Test requestAutoSave with UIContext, SaveRequest and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFillStatic_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TESTCASE_NAME: string = 'SUB_Ability_AbilityRuntime_AutoFillStatic_0500';
      let uiContext: UIContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest.static",
          moduleName: "entry",
          abilityName: "EntryAbility",
          pageUrl: "testPageUrl",
          pageNodeInfos: [
            {
              id: PARAM_1,
              depth: PARAM_1,
              autoFillType: autoFillManager.AutoFillType.PASSWORD,
              tag: "testTag1",
              value: "testValue1",
              placeholder: "testPlaceholder1",
              enableAutoFill: true,
              rect: {
                left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1,
              },
              isFocus: false
            }
          ],
          pageRect: {
            left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1
          },
          isUserSelected: true,
          isOtherAccount: true
        }
      };
      let isSuccess: boolean = false;
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
          isSuccess = true;
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        isSuccess = true;
        expect(isSuccess).assertTrue();
        expect(autoFillManager.AutoFillType.PASSWORD).assertEqual(1);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(isSuccess).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFillStatic_0600
     * @tc.number SUB_Ability_AbilityRuntime_AutoFillStatic_0600
     * @tc.desc   Test requestAutoSave with UIContext and SaveRequest only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFillStatic_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TESTCASE_NAME: string = 'SUB_Ability_AbilityRuntime_AutoFillStatic_0600';
      let uiContext: UIContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest.static",
          moduleName: "entry",
          abilityName: "EntryAbility",
          pageUrl: "testPageUrl",
          pageNodeInfos: [
            {
              id: PARAM_1,
              depth: PARAM_1,
              autoFillType: autoFillManager.AutoFillType.NEW_PASSWORD,
              tag: "testTag1",
              value: "testValue1",
              placeholder: "testPlaceholder1",
              enableAutoFill: true,
              rect: {
                left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1,
              },
              isFocus: false
            }
          ],
          pageRect: {
            left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1
          },
          isUserSelected: true,
          isOtherAccount: true
        }
      };
      let isSuccess: boolean = false;
      try {
        autoFillManager.requestAutoSave(uiContext, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        isSuccess = true;
        expect(isSuccess).assertTrue();
        expect(autoFillManager.AutoFillType.NEW_PASSWORD).assertEqual(3);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(isSuccess).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFillStatic_1100
     * @tc.number SUB_Ability_AbilityRuntime_AutoFillStatic_1100
     * @tc.desc   Test requestAutoFill with UIContext, FillRequest and callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFillStatic_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TESTCASE_NAME: string = 'SUB_Ability_AbilityRuntime_AutoFillStatic_1100';
      let uiContext: UIContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.MANUAL_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest.static",
          moduleName: "entry",
          abilityName: "EntryAbility",
          pageUrl: "testPageUrl",
          pageNodeInfos: [
            {
              id: PARAM_1,
              depth: PARAM_1,
              autoFillType: autoFillManager.AutoFillType.USER_NAME,
              tag: "testTag1",
              value: "testValue1",
              placeholder: "testPlaceholder1",
              enableAutoFill: true,
              rect: {
                left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1,
              },
              isFocus: false
            }
          ],
          pageRect: {
            left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1
          },
          isUserSelected: true,
          isOtherAccount: true
        },
        customData: {
          data: {
            'name': 'testName'
          }
        },
        isPopup: true
      };
      let isSuccess: boolean = false;
      let callback: autoFillManager.AutoFillCallback = {
        onSuccess: (viewData: autoFillManager.ViewData) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onSuccess`);
          isSuccess = true;
        },
        onFailure: (result: autoFillManager.FillFailureResult) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onFailure, errCode: ${result.errCode}`);
        }
      };
      try {
        autoFillManager.requestAutoFill(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        isSuccess = true;
        expect(isSuccess).assertTrue();
        expect(autoFillManager.AutoFillType.USER_NAME).assertEqual(2);
        expect(autoFillManager.AutoFillTriggerType.MANUAL_REQUEST).assertEqual(1);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(isSuccess).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFillStatic_1200
     * @tc.number SUB_Ability_AbilityRuntime_AutoFillStatic_1200
     * @tc.desc   Test requestAutoFill with UIContext and FillRequest only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFillStatic_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TESTCASE_NAME: string = 'SUB_Ability_AbilityRuntime_AutoFillStatic_1200';
      let uiContext: UIContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.UNSPECIFIED,
        triggerType: autoFillManager.AutoFillTriggerType.PASTE_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest.static",
          moduleName: "entry",
          abilityName: "EntryAbility",
          pageUrl: "testPageUrl",
          pageNodeInfos: [
            {
              id: PARAM_1,
              depth: PARAM_1,
              autoFillType: autoFillManager.AutoFillType.UNSPECIFIED,
              tag: "testTag1",
              value: "testValue1",
              placeholder: "testPlaceholder1",
              enableAutoFill: true,
              rect: {
                left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1,
              },
              isFocus: false
            }
          ],
          pageRect: {
            left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1
          },
          isUserSelected: true,
          isOtherAccount: true
        },
        customData: {
          data: {
            'name': 'testName'
          }
        },
        isPopup: true
      };
      let isSuccess: boolean = false;
      try {
        autoFillManager.requestAutoFill(uiContext, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        isSuccess = true;
        expect(isSuccess).assertTrue();
        expect(autoFillManager.AutoFillType.UNSPECIFIED).assertEqual(0);
        expect(autoFillManager.AutoFillTriggerType.PASTE_REQUEST).assertEqual(2);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(isSuccess).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFillStatic_2400
     * @tc.number SUB_Ability_AbilityRuntime_AutoFillStatic_2400
     * @tc.desc   Test requestAutoFill with UIContext and FillRequest only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFillStatic_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TESTCASE_NAME: string = 'SUB_Ability_AbilityRuntime_AutoFillStatic_2400';
      let uiContext: UIContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.AUTO_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest.static",
          moduleName: "entry",
          abilityName: "EntryAbility",
          pageUrl: "testPageUrl",
          pageNodeInfos: [
            {
              id: PARAM_1,
              depth: PARAM_1,
              autoFillType: autoFillManager.AutoFillType.USER_NAME,
              tag: "testTag1",
              value: "testValue1",
              placeholder: "testPlaceholder1",
              enableAutoFill: true,
              rect: {
                left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1,
              },
              isFocus: false
            }
          ],
          pageRect: {
            left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1
          },
          isUserSelected: true,
          isOtherAccount: true
        },
        customData: {
          data: {
            'name': 'testName'
          }
        },
        isPopup: true
      };
      let isSuccess: boolean = false;
      try {
        autoFillManager.requestAutoFill(uiContext, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        isSuccess = true;
        expect(isSuccess).assertTrue();
        expect(autoFillManager.AutoFillTriggerType.AUTO_REQUEST).assertEqual(0);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(isSuccess).assertFalse();
        done();
      }
    })
  })
}