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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Component, Driver, UiWindow, ON } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import autoFillManager from '@ohos.app.ability.autoFillManager';
import { BusinessError } from '@ohos.base';

const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';
const PARAM_1: number = 1;
const ERROR_CODE_401: number = 401;

export default function autoFillTest() {
  describe('ActsAutoFillTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0100
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0100
     * @tc.desc   Test requestAutoSave with SaveRequest and callback, uiContext as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0100', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0100';
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
            } as autoFillManager.PageNodeInfo
          ],
          pageRect: {
            left: PARAM_1, top: PARAM_1, width: PARAM_1, height: PARAM_1
          },
          isUserSelected: true,
          isOtherAccount: true
        } as autoFillManager.ViewData
      };
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
        }
      }
      try {
        autoFillManager.requestAutoSave(null, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0200
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0200
     * @tc.desc   Test requestAutoSave with SaveRequest only (no callback), uiContext as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0200', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0200';
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
        }
      };
      try {
        autoFillManager.requestAutoSave(null, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0300
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0300
     * @tc.desc   Test requestAutoSave with valid UIContext and callback, SaveRequest as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0300', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0300';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, null, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0400
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0400
     * @tc.desc   Test requestAutoSave with valid UIContext only (no callback), SaveRequest as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0400', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0400';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      try {
        autoFillManager.requestAutoSave(uiContext, null);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0500
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0500
     * @tc.desc   Test requestAutoSave with valid UIContext, SaveRequest and callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0500', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0500';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
        }
      };
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
          result = true;
          expect(result).assertTrue();
          expect(autoFillManager.AutoFillType.USER_NAME).assertEqual(2);
          done();
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
          expect().assertFail();
          done();
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0600
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0600
     * @tc.desc   Test requestAutoSave with valid UIContext and SaveRequest only (no callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0600', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0600';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        result = true;
        expect(result).assertTrue();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0700
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0700
     * @tc.desc   Test requestAutoFill with null uiContext, valid request and callback, expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0700', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0700';
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.AUTO_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
          } as autoFillManager.AutoFillRect,
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
      let callback: autoFillManager.AutoFillCallback = {
        onSuccess: (viewData: autoFillManager.ViewData) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onSuccess`);
        },
        onFailure: (result: autoFillManager.FillFailureResult) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoFill(null, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0800
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0800
     * @tc.desc   Test requestAutoFill with null uiContext, valid request only (no callback), expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0800', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0800';
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.MANUAL_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      try {
        autoFillManager.requestAutoFill(null, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_0900
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_0900
     * @tc.desc   Test requestAutoFill with valid UIContext, null request and callback, expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_0900', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_0900';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let callback: autoFillManager.AutoFillCallback = {
        onSuccess: (viewData: autoFillManager.ViewData) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onSuccess`);
        },
        onFailure: (result: autoFillManager.FillFailureResult) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoFill(uiContext, null, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1000
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1000
     * @tc.desc   Test requestAutoFill with valid UIContext, null request only (no callback), expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1000', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1000';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      try {
        autoFillManager.requestAutoFill(uiContext, null);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1100
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1100
     * @tc.desc   Test requestAutoFill with valid UIContext, valid request and callback, expects success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1100', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1100';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.PASTE_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      let callback: autoFillManager.AutoFillCallback = {
        onSuccess: (viewData: autoFillManager.ViewData) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onSuccess`);
          result = true;
          expect(result).assertTrue();
          expect(autoFillManager.AutoFillTriggerType.PASTE_REQUEST).assertEqual(2);
          done();
        },
        onFailure: (result: autoFillManager.FillFailureResult) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onFailure`);
          expect().assertFail();
          done();
        }
      };
      try {
        autoFillManager.requestAutoFill(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1200
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1200
     * @tc.desc   Test requestAutoFill with valid UIContext, valid request only (no callback), expects success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1200', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1200';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.AUTO_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      try {
        autoFillManager.requestAutoFill(uiContext, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        result = true;
        expect(result).assertTrue();
        expect(autoFillManager.AutoFillTriggerType.AUTO_REQUEST).assertEqual(0);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1300
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1300
     * @tc.desc   Test requestAutoSave with SaveRequest and callback, uiContext as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1300', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1300';
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
        }
      };
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
        }
      }
      try {
        autoFillManager.requestAutoSave(undefined, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1400
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1400
     * @tc.desc   Test requestAutoSave with SaveRequest and callback, uiContext as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1400', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1400';
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
        }
      };
      try {
        autoFillManager.requestAutoSave(undefined, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1500
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1500
     * @tc.desc   Test requestAutoSave with valid UIContext and callback, SaveRequest as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1500', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1500';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, undefined, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1600
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1600
     * @tc.desc   Test requestAutoSave with valid UIContext only (no callback), SaveRequest as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1600', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1600';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      try {
        autoFillManager.requestAutoSave(uiContext, undefined);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1700
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1700
     * @tc.desc   Test requestAutoFill with undefined uiContext, valid request and callback, expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1700', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1700';
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      let callback: autoFillManager.AutoFillCallback = {
        onSuccess: (viewData: autoFillManager.ViewData) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onSuccess`);
        },
        onFailure: (result: autoFillManager.FillFailureResult) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoFill(undefined, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1800
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1800
     * @tc.desc   Test requestAutoFill with undefined uiContext, valid request only (no callback), expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1800', Level.LEVEL1, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1800';
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      try {
        autoFillManager.requestAutoFill(undefined, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_1900
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_1900
     * @tc.desc   Test requestAutoFill with valid UIContext, undefined request and callback, expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_1900', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_1900';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let callback: autoFillManager.AutoFillCallback = {
        onSuccess: (viewData: autoFillManager.ViewData) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onSuccess`);
        },
        onFailure: (result: autoFillManager.FillFailureResult) => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoFillCallback onFailure`);
        }
      };
      try {
        autoFillManager.requestAutoFill(uiContext, undefined, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_2000
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_2000
     * @tc.desc   Test requestAutoFill with valid UIContext, undefined request only (no callback), expects error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_2000', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_2000';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      try {
        autoFillManager.requestAutoFill(uiContext, undefined);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        expect().assertFail();
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(err.code).assertEqual(ERROR_CODE_401);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_2100
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_2100
     * @tc.desc   Test requestAutoSave with valid UIContext, SaveRequest and callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_2100', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_2100';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
          result = true;
          expect(result).assertTrue();
          expect(autoFillManager.AutoFillType.NEW_PASSWORD).assertEqual(3);
          done();
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
          expect().assertFail();
          done();
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_2200
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_2200
     * @tc.desc   Test requestAutoSave with valid UIContext, SaveRequest and callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_2200', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_2200';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
          result = true;
          expect(result).assertTrue();
          expect(autoFillManager.AutoFillType.PASSWORD).assertEqual(1);
          done();
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
          expect().assertFail();
          done();
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_2300
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_2300
     * @tc.desc   Test requestAutoSave with valid UIContext, SaveRequest and callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_2300', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_2300';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.SaveRequest = {
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
        }
      };
      let callback: autoFillManager.AutoSaveCallback = {
        onSuccess: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onSuccess`);
          result = true;
          expect(result).assertTrue();
          expect(autoFillManager.AutoFillType.UNSPECIFIED).assertEqual(0);
          done();
        },
        onFailure: () => {
          hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} AutoSaveCallback onFailure`);
          expect().assertFail();
          done();
        }
      };
      try {
        autoFillManager.requestAutoSave(uiContext, request, callback);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave success`);
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoSave catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AutoFill_2400
     * @tc.number SUB_Ability_AbilityRuntime_AutoFill_2400
     * @tc.desc   Test requestAutoFill with valid UIContext, valid request only (no callback), expects success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AutoFill_2400', Level.LEVEL0, async (done:Function) => {
      const TESTCASE_NAME = 'SUB_Ability_AbilityRuntime_AutoFill_2400';
      let uiContext: UIContext | undefined = AppStorage.get<UIContext>("UIAbilityContext");
      let result: boolean = false;
      let request: autoFillManager.FillRequest = {
        type: autoFillManager.AutoFillType.USER_NAME,
        triggerType: autoFillManager.AutoFillTriggerType.MANUAL_REQUEST,
        viewData: {
          bundleName: "com.example.autofillsavetest",
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
      try {
        autoFillManager.requestAutoFill(uiContext, request);
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill success`);
        result = true;
        expect(result).assertTrue();
        expect(autoFillManager.AutoFillTriggerType.MANUAL_REQUEST).assertEqual(1);
        done();
      } catch (err) {
        hilog.info(DOMAIN, TAG, `${TESTCASE_NAME} requestAutoFill catch error, code: ${err.code}`);
        expect(result).assertFalse();
        done();
      }
    })
  })
}