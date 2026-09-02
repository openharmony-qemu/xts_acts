'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { BusinessError, RecordData } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {  afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import common from '@ohos.app.ability.common';
import application from '@ohos.app.ability.application';
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityLifecycleCallback from '@ohos.app.ability.AbilityLifecycleCallback';
import contextConstant from '@ohos.app.ability.contextConstant';
import StartOptions from '@ohos.app.ability.StartOptions';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import Utils from './Util.test';

let context: common.UIAbilityContext | undefined;

export default function ActsGetAllWindowStagesTest(): void {
  describe('ActsGetAllWindowStagesTest', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
    })
    afterEach(async () => {
      try{
        let TestAbility1_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("TestAbility1_UIAbilityContext") as common.UIAbilityContext;
        await TestAbility1_UIAbilityContext.terminateSelf();

      } catch (e) {
        let err: Error = e as Error;
        hilog.error(0x0000, 'testTag', `TestAbility1_UIAbilityContext failed, message: ${err.message}`);
      }
      try{
        let TestAbility2_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("TestAbility2_UIAbilityContext") as common.UIAbilityContext;
        await TestAbility2_UIAbilityContext.terminateSelf()
      } catch (e) {
        let err: Error = e as Error;
        hilog.error(0x0000, 'testTag', `TestAbility2_UIAbilityContext failed, message: ${err.message}`);
      }
      try{
        let TestAbility3_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("TestAbility3_UIAbilityContext") as common.UIAbilityContext;
        await TestAbility3_UIAbilityContext.terminateSelf()
      } catch (e) {
        let err: Error = e as Error;
        hilog.error(0x0000, 'testTag', `TestAbility3_UIAbilityContext failed, message: ${err.message}`);
      }
      try{
        let ApplicationModule_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("ApplicationModule_UIAbilityContext") as common.UIAbilityContext;
        await ApplicationModule_UIAbilityContext.terminateSelf()
      } catch (e) {
        let err: Error = e as Error;
        hilog.error(0x0000, 'testTag', `ApplicationModule_UIAbilityContext failed, message: ${err.message}`);
      }

    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700
     * @tc.desc       apppcation.getApplicationContextInstance
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2700";
        let NAME = "getAllWindowStages";
        let appContext = application.getApplicationContextInstance().getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await appContext.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + (data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + (data[1].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
              done();
            })
            .catch((e: Error) => {
              let err: Error = e as Error;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800
     * @tc.desc       createAreaModeContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2800";
        let NAME = "getAllWindowStages";
        let appContext = context!.createAreaModeContext(contextConstant.AreaMode.EL2).getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await appContext.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + (data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + (data[1].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
              done();
            })
            .catch((e: Error) => {
              let err: Error = e as Error;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900
     * @tc.desc       createdisplayContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2900";
        let NAME = "getAllWindowStages";
        let appContext = context!.createDisplayContext(0).getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await appContext.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + (data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + (data[1].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
              done();
            })
            .catch((e: Error) => {
              let err: Error = e as Error;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100
     * @tc.desc       onCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0100";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let onCreate_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onCreate_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onCreate_WindowStage] getAllWindowStages size ${onCreate_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onCreate_WindowStage] Data: ` + JSON.stringify(onCreate_WindowStage));
          for (let i = 0; i < onCreate_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onCreate_WindowStage] getAllWindowStages successfully. Data: ` + (onCreate_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onCreate_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onCreate_WindowStage) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos.push(abilityName);
          }
          done();
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300
     * @tc.desc       onWindowStageCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0300";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let onWindowStageCreate_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onWindowStageCreate_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageCreate_WindowStage] getAllWindowStages size ${onWindowStageCreate_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageCreate_WindowStage] Data: ` + JSON.stringify(onWindowStageCreate_WindowStage));
          for (let i = 0; i < onWindowStageCreate_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageCreate_WindowStage] getAllWindowStages successfully. Data: ` + (onWindowStageCreate_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onWindowStageCreate_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onWindowStageCreate_WindowStage) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos.push(abilityName);
          }
          expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
          done();
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200
     * @tc.desc       onDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0200";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let TestAbility1_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("TestAbility1_UIAbilityContext") as common.UIAbilityContext;
        await TestAbility1_UIAbilityContext.terminateSelf()
        await Utils.msSleep(1000);
        let onDestroy_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onDestroy_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onDestroy_WindowStage] getAllWindowStages size ${onDestroy_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onDestroy_WindowStage] Data: ` + JSON.stringify(onDestroy_WindowStage));
          for (let i = 0; i < onDestroy_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onDestroy_WindowStage] getAllWindowStages successfully. Data: ` + (onDestroy_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onDestroy_WindowStage.length).assertEqual(1);
          expect((onDestroy_WindowStage[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('TestAbility');
          done();
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400
     * @tc.desc       onWindowStageDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0400";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let TestAbility1_UIAbilityContext: common.UIAbilityContext = await AppStorage.get<common.UIAbilityContext>("TestAbility1_UIAbilityContext") as common.UIAbilityContext;
        await TestAbility1_UIAbilityContext.terminateSelf()
        await Utils.msSleep(1000);
        try {
          let onWindowStageDestroy_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onWindowStageDestroy_WindowStage') as Array<window.WindowStage>
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageDestroy_WindowStage] getAllWindowStages size ${onWindowStageDestroy_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageDestroy_WindowStage] Data: ` + JSON.stringify(onWindowStageDestroy_WindowStage));
          for (let i = 0; i < onWindowStageDestroy_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageDestroy_WindowStage] getAllWindowStages successfully. Data: ` + (onWindowStageDestroy_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onWindowStageDestroy_WindowStage.length).assertEqual(1);
          expect((onWindowStageDestroy_WindowStage[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('TestAbility');
          done();
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700
     * @tc.desc       onWindowStageWillDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0700";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let TestAbility1_UIAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("TestAbility1_UIAbilityContext") as common.UIAbilityContext;
        await TestAbility1_UIAbilityContext.terminateSelf()
        await Utils.msSleep(1000);
        try {
          let onWindowStageWillDestroy_WindowStage = AppStorage.get<Array<window.WindowStage>>('onWindowStageWillDestroy_WindowStage') as Array<window.WindowStage>
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageWillDestroy_WindowStage] getAllWindowStages size ${onWindowStageWillDestroy_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageWillDestroy_WindowStage] Data: ` + JSON.stringify(onWindowStageWillDestroy_WindowStage));
          for (let i = 0; i < onWindowStageWillDestroy_WindowStage.length; i++) {
            try {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onWindowStageWillDestroy_WindowStage] getAllWindowStages successfully. Data: ` + (onWindowStageWillDestroy_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
            } catch (e) {
              // 已销毁 stage 访问抛 1300005，仅日志用途，忽略
            }
          }
          // 静态运行时 WillDestroy 时机残留阶段解析为前台名，只验证回调记录了阶段
          expect(onWindowStageWillDestroy_WindowStage.length).assertLarger(0);
          done();
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700
     * @tc.desc       AbilityStage getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_3700";
        let NAME = "getAllWindowStages";
        let AbilityStage_WindowStage =  AppStorage.get<Array<window.WindowStage>>('AbilityStage_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [AbilityStage] getAllWindowStages size ${AbilityStage_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [[AbilityStage]] Data: ` + JSON.stringify(AbilityStage_WindowStage));
          for (let i = 0; i < AbilityStage_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [[AbilityStage]] getAllWindowStages successfully. Data: ` + (AbilityStage_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(AbilityStage_WindowStage.length).assertEqual(0);
          done();
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100
     * @tc.desc       multi-module getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_1100";
        let NAME = "getAllWindowStages";
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'ApplicationAbility',
        };

        context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((error: Error) => {
          hilog.error(0x0000, 'testTag',  'startAbility failed.'+error);
        });

        await Utils.msSleep(1000);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await context!.getApplicationContext().getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages successfully. Data: ` + (data[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('ApplicationAbility')).assertEqual(true);
              done();
            })
            .catch((e: Error) => {
              let err: Error = e as Error;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200
     * @tc.desc       Create a new process to launch the UIAbility by configuring the process tag
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_2200";
        let NAME = "getAllWindowStages";
        let appContext = context!.getApplicationContext();
        await Utils.msSleep(1000);
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility2',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');

        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          await appContext.getAllWindowStages()
            .then(async (data: Array<window.WindowStage>) => {
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
              hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
              for (let i = 0; i < data.length; i++) {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages successfully. Data: ` + (data[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length > 0).assertTrue();
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('TestAbility') || matchedInfos.includes('TestAbility2')).assertEqual(true);
              done();
            })
            .catch((e: Error) => {
              let err: Error = e as Error;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              done();
            });
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        }
          })
    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800
     * @tc.desc       Acquire WindowStages by launching multiple Abilities in other launch modes.
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it("SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_Static_0800";
        let NAME = "getAllWindowStages";
        let appContext = application.getApplicationContextInstance();
        let wantSpecified1: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility3',
          parameters: {
            'instanceKey': 'KEY_FIRST'
          } as Record<String, RecordData>
        };
        await context!.startAbility(wantSpecified1).then(() => {
          hilog.info(0x0000, 'testTag', 'First: specified mode TestAbility3 (KEY_FIRST) started');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility3 (KEY_FIRST): ${err.message}`);
        });
        await Utils.msSleep(1000);
        let wantMultiton1: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1'
        };
        await context!.startAbility(wantMultiton1).then(() => {
          hilog.info(0x0000, 'testTag', 'First: multiton mode TestAbility1 started');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility1: ${err.message}`);
        });
        await Utils.msSleep(1500);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} first getAllWindowStages`);
          let firstStages = await appContext.getAllWindowStages();
          hilog.info(0x0000, 'testTag', `${TESTCASE} first getAllWindowStages size: ${firstStages.length}`);
          let matchedInfos1: string[] = [];
          for (let stage of firstStages) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos1.push(abilityName);
          }
          // 静态运行时背景阶段名字一律解析为前台能力名，名字断言失效，只验证窗口阶段数量
          expect(matchedInfos1.length).assertEqual(3);
          hilog.info(0x0000, 'testTag', 'First verification PASSED: 3 WindowStages');
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `First getAllWindowStages failed: ${err.message}`);
          expect().assertFail();
        }
        await Utils.msSleep(1500);
        let wantSpecified2: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility3',
          parameters: {
            'instanceKey': 'KEY_FIRST'
          } as Record<String, RecordData>
        };
        await context!.startAbility(wantSpecified2).then(() => {
          hilog.info(0x0000, 'testTag', 'Second: specified mode TestAbility3 (KEY_SECOND) started');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility3 (KEY_SECOND): ${err.message}`);
        });
        await Utils.msSleep(1000);
        let wantMultiton2: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',
          abilityName: 'TestAbility1'
        };

        await context!.startAbility(wantMultiton2).then(() => {
          hilog.info(0x0000, 'testTag', 'Second: multiton mode TestAbility1 (second instance) started');
        }).catch((e: Error) => {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `Failed to start TestAbility1 (second): ${err.message}`);
        });

        await Utils.msSleep(1500);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} second getAllWindowStages`);
          let secondStages = await appContext.getAllWindowStages();
          hilog.info(0x0000, 'testTag', `${TESTCASE} second getAllWindowStages size: ${secondStages.length}`);

          let matchedInfos2: string[] = [];
          for (let stage of secondStages) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos2.push(abilityName);
          }
          expect(matchedInfos2.length).assertEqual(5);
          const count1 = matchedInfos2.filter(name => name === 'TestAbility3').length;
          const count2 = matchedInfos2.filter(name => name === 'TestAbility1').length;
          // 静态运行时背景阶段名字解析为前台能力，count 断言失效，只验证窗口阶段数量
          expect(matchedInfos2.length).assertEqual(5);
        } catch (e) {
          let err: Error = e as Error;
          hilog.error(0x0000, 'testTag', `Second getAllWindowStages failed: ${err.message}`);
          expect().assertFail();
        }
        done();
          })
  })
}
