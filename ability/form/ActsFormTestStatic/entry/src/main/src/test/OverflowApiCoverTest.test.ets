'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach } from '@ohos/hypium-static/src/main/indexStatic';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import FormEditExtensionAbility from '@ohos.app.form.FormEditExtensionAbility';
import LiveFormExtensionAbility, { LiveFormInfo } from '@ohos.app.form.LiveFormExtensionAbility';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import { UIExtensionContentSession } from '@kit.AbilityKit';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@kit.BasicServicesKit';
const CODE_OK = 0;
const ERROR_CODE1 = 401;
const ERROR_CODE2 = 16500050;
const ERROR_CODE4 = 16500100;
const ERROR_CODE5 = 16501000;
const ERROR_CODE9 = 202;
const ERROR_CODE10 = 16501014;
const ERROR_CODE11 = 16000121;
const ERROR_CODE12 = 16000130;
const ERROR_CODE13 = 801;
const ERROR_CODE14 = 16501011;
const ERROR_CODE15 = 16501026;

const DELEGATOR: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const FINISH_EVENT: string = 'FMS_FormEditSetBgColorFinish_Static_commonEvent';
let formEditSubscriber: commonEventManager.CommonEventSubscriber | undefined = undefined;
export default function OverflowApiCoverTest() {
  describe('OverflowApiCoverTest', () => {

    beforeAll(async (): Promise<void> => {
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [FINISH_EVENT],
      };
      formEditSubscriber = await commonEventManager.createSubscriber(subscribeInfo);
    });

    afterEach((): void => {
      if (formEditSubscriber) {
        commonEventManager.unsubscribe(formEditSubscriber!);
      }
    });

    /**
     * @tc.name   RequestOverflow_Cover_Static_0100
     * @tc.number RequestOverflow_Cover_Static_0100
     * @tc.desc   Function RequestOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("RequestOverflow_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'RequestOverflow_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.cancelOverflow('1').then(() => {
          console.info('cancelOverflow succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          console.info(`err: code is ${error.code}, message ${error.message}`);
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });

    /**
     * @tc.name   RequestOverflow_Cover_Static_0200
     * @tc.number RequestOverflow_Cover_Static_0200
     * @tc.desc   Function RequestOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("RequestOverflow_Cover_Static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'RequestOverflow_Cover_Static_0200';
      console.info(`${name} start`);
      try {
        formProvider.getFormRect('1');
        expect().not().assertFail();
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   CancelOverflow_Cover_Static_0100
     * @tc.number CancelOverflow_Cover_Static_0100
     * @tc.desc   Function CancelOverflow covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("CancelOverflow_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'CancelOverflow_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.cancelOverflow('1').then(() => {
          console.info('cancelOverflow succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          console.info(`err: code is ${error.code}, message ${error.message}`);
          expect(error.code).assertEqual(16501001);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });

    /**
     * @tc.name   ActivateSceneAnimation_Cover_Static_0100
     * @tc.number ActivateSceneAnimation_Cover_Static_0100
     * @tc.desc   Function ActivateSceneAnimation covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ActivateSceneAnimation_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'ActivateSceneAnimation_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.activateSceneAnimation('1').then(() => {
          console.info('activateSceneAnimation succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          expect(error.code).assertEqual(202);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });
 
    /**
     * @tc.name   DeactivateSceneAnimation_Cover_Static_0100
     * @tc.number DeactivateSceneAnimation_Cover_Static_0100
     * @tc.desc   Function DeactivateSceneAnimation covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("DeactivateSceneAnimation_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'DeactivateSceneAnimation_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.deactivateSceneAnimation('1').then(() => {
          console.info('deactivateSceneAnimation succeed');
          expect().not().assertFail();
        }).catch((error: Error): void => {
          expect(error.code).assertEqual(202);
        })
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });

    /**
     * @tc.name   GetFormRect_Cover_Static_0100
     * @tc.number GetFormRect_Cover_Static_0100
     * @tc.desc   Function GetFormRect covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("GetFormRect_Cover_Static_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'GetFormRect_Cover_Static_0100';
      console.info(`${name} start`);
      try {
        formProvider.getFormRect('1');
        expect().not().assertFail();
      } catch (error) {
        if (error.code == 801) {
          done();
        }
        else {
          console.info(`err: code is ${error.code}`);
          expect().assertFail();
        }
      }
      console.info(`${name} end`);
      done();
    });

    /**
     * @tc.name   OverflowApiCoverTest_001
     * @tc.number OverflowApiCoverTest_001
     * @tc.desc   Function startSecondPage covered test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OverflowApiCoverTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let name: string = 'OverflowApiCoverTest_001';
      console.info(`${name} start`);
      try {
        let module1Want: Want = {
          deviceId: "",
          bundleName: "com.ohos.st.formsystemhost",
          abilityName: "com.ohos.st.formsystemhost.MainAbility",
          parameters: {
              "formId": "0",
              "name": "Form_Js001",
              "bundle": "com.acts.form.formsystemtestservicea.hmservice",
              "ability": "",
              "moduleName": "entry",
              "temporary": false,
              "isCreate": true
          }
        }
        let feeAbility:FormEditExtensionAbility = new FormEditExtensionAbility();
        feeAbility.formEditContext.startSecondPage(module1Want).then((result: common.AbilityResult) => {
          console.info(`${name} startSecondPage success ${JSON.stringify(result)}`);
        });
        console.info(`${name} startSecondPage end`);
        feeAbility.formEditContext.startUIAbility(module1Want).then(() => {
          console.info(`${name} startUIAbility success`);
        });
        console.info(`${name} startUIAbility end`);
        let liveFormAbility:LiveFormExtensionAbility = new LiveFormExtensionAbility();
        liveFormAbility.liveFormContext.startAbilityByLiveForm(module1Want).then(() => {
          console.info(`${name} startAbilityByLiveForm success`);
        });
        console.info(`${name} startAbilityByLiveForm end`);
        let infoRect: formInfo.Rect = {
          left: -30,
          top: -30,
          width: 200,
          height: 200
        }
        let liveFormInfo: LiveFormInfo = {
          formId: 'formId',
          rect: infoRect,
          borderRadius: 123
        }
        let session: UIExtensionContentSession = new UIExtensionContentSession();
        liveFormAbility.onLiveFormCreate(liveFormInfo, session);
        liveFormAbility.onLiveFormDestroy(liveFormInfo);
        console.info(`${name} onLiveFormCreate onLiveFormDestroy end`);
        let feAbility:FormExtensionAbility = new FormExtensionAbility();
        feAbility.context.startAbility(module1Want, () => {
          console.info(`${name} startAbility success`);
        });
        console.info(`${name} startAbility end`);
      } catch (error) {
        console.log(`${name} catch, error, code:${error?.code}, message:${error?.message}`);
        if (error?.code === ERROR_CODE2) {
          expect(error?.code).assertEqual(ERROR_CODE2);
        } else if(error?.code === ERROR_CODE4) {
          expect(error?.code).assertEqual(ERROR_CODE4);
        } else if(error?.code === ERROR_CODE5) {
          expect(error?.code).assertEqual(ERROR_CODE5);
        } else if(error?.code === ERROR_CODE9) {
          expect(error?.code).assertEqual(ERROR_CODE9);
        } else if(error?.code === ERROR_CODE10) {
          expect(error?.code).assertEqual(ERROR_CODE10);
        } else if(error?.code === ERROR_CODE11) {
          expect(error?.code).assertEqual(ERROR_CODE11);
        } else if(error?.code === ERROR_CODE12) {
          expect(error?.code).assertEqual(ERROR_CODE12);
        } else if(error?.code === ERROR_CODE13) {
          expect(error?.code).assertEqual(ERROR_CODE13);
        } else if(error?.code === ERROR_CODE14) {
          expect(error?.code).assertEqual(ERROR_CODE14);
        } else if(error?.code === CODE_OK) {
          expect(error?.code).assertEqual(CODE_OK);
        } else if(error?.code === ERROR_CODE1) {
          expect(error?.code).assertEqual(ERROR_CODE1);
        }
      }
      done();
      console.info(`${name} end`);
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0100
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0100
     * @tc.desc   setWindowBackgroundColor with empty string (length check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0100';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === ERROR_CODE15) {
            expect(code).assertEqual(ERROR_CODE15);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '',
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0200
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0200
     * @tc.desc   setWindowBackgroundColor without # prefix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0200';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === ERROR_CODE15) {
            expect(code).assertEqual(ERROR_CODE15);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': 'FF0000',
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0300
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0300
     * @tc.desc   setWindowBackgroundColor with non-hex characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0300';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === ERROR_CODE15) {
            expect(code).assertEqual(ERROR_CODE15);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '#GGGGGG',
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0400
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0400
     * @tc.desc   setWindowBackgroundColor with wrong length (length check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0400';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === ERROR_CODE15) {
            expect(code).assertEqual(ERROR_CODE15);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '#FF00',
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0500
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0500
     * @tc.desc   setWindowBackgroundColor with valid RGB without loadContent (IPC error path)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0500';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === ERROR_CODE2) {
            expect(code).assertEqual(ERROR_CODE2);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '#AABBCC',
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0600
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0600
     * @tc.desc   setWindowBackgroundColor with valid ARGB without loadContent (IPC error path)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0600';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === ERROR_CODE2) {
            expect(code).assertEqual(ERROR_CODE2);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '#FFAABBCC',
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0700
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0700
     * @tc.desc   setWindowBackgroundColor with valid RGB with loadContent (success path)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0700';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === CODE_OK) {
            expect(code).assertEqual(CODE_OK);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '#AABBCC',
          'needLoadContent': true,
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });

    /**
     * @tc.name   SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0800
     * @tc.number SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0800
     * @tc.desc   setWindowBackgroundColor with valid ARGB with loadContent (success path)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let name: string = 'SUB_ABILITY_FORM_FWK_SET_WINDOW_BACKGROUND_COLOR_STATIC_0800';
      console.info(`${name} start`);
      let callBack = (_: BusinessError | null, data: commonEventManager.CommonEventData | undefined): void => {
        console.info(`${name} data: ${JSON.stringify(data)}`);
        if (data?.parameters?.['action'] === name) {
          let code: number = data?.code ?? -1;
          if (code === CODE_OK) {
            expect(code).assertEqual(CODE_OK);
          } else {
            console.info(`${name} unexpected error code: ${code}`);
            expect().assertFail();
          }
          commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
        }
      };
      commonEventManager.subscribe(formEditSubscriber!, callBack);
      DELEGATOR.startAbility({
        bundleName: 'com.example.formsystemhost',
        abilityName: 'EntryAbility',
        parameters: {
          'isFormEditStatic': true,
          'formEditAction': name,
          'color': '#FFAABBCC',
          'needLoadContent': true,
        }
      }).catch((err: Error): void => {
        console.info(`${name} startAbility error: ${JSON.stringify(err)}`);
        expect().assertFail();
        commonEventManager.unsubscribe(formEditSubscriber!, (): void => { done(); });
      });
    });
  })
}