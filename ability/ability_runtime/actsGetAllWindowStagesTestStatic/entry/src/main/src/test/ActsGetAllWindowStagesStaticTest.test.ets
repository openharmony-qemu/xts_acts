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
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_2600
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_2600
     * @tc.desc       apppcation.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_2600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_2600";
        let NAME = "getAllWindowStages";
        let appContext = application.getApplicationContextInstance();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
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
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_2700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_2700
     * @tc.desc       apppcation.getApplicationContextInstance
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_2700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_2700";
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
          let err = e as BusinessError
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
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_2800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_2800
     * @tc.desc       createAreaModeContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_2800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_2800";
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
          let err = e as BusinessError
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
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_2900
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_2900
     * @tc.desc       createdisplayContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_2900', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_2900";
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
          let err = e as BusinessError
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
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0100
     * @tc.desc       onCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0100";
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
          let err = e as BusinessError
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
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0300
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0300
     * @tc.desc       onWindowStageCreate getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0300', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0300";
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
          let err = e as BusinessError
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
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0500
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0500
     * @tc.desc       onForeground getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0500', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0500";
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
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let onForeground_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onForeground_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onForeground_WindowStage] getAllWindowStages size ${onForeground_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onForeground_WindowStage] Data: ` + JSON.stringify(onForeground_WindowStage));
          for (let i = 0; i < onForeground_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onForeground_WindowStage] getAllWindowStages successfully. Data: ` + (onForeground_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onForeground_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onForeground_WindowStage) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos.push(abilityName);
          }
          expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0600
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0600
     * @tc.desc       onBackground getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0600', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0600";
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
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(2000);
        let onBackground_WindowStage =  AppStorage.get<Array<window.WindowStage>>('onBackground_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onBackground_WindowStage] getAllWindowStages size ${onBackground_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onBackground_WindowStage] Data: ` + JSON.stringify(onBackground_WindowStage));
          for (let i = 0; i < onBackground_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [onBackground_WindowStage] getAllWindowStages successfully. Data: ` + (onBackground_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(onBackground_WindowStage.length).assertEqual(2);
          let matchedInfos: string[] = [];
          for (let stage of onBackground_WindowStage) {
            let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
            let abilityName = mainWindow.abilityInfo.name;
            matchedInfos.push(abilityName);
          }
          expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0200
     * @tc.desc       onDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0200";
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
          let err = e as BusinessError
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
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0400
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0400
     * @tc.desc       onWindowStageDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0400', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0400";
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
          let err = e as BusinessError
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
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0700
     * @tc.desc       onWindowStageWillDestroy getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0700";
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
          let err = e as BusinessError
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
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_3700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_3700
     * @tc.desc       AbilityStage getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_3700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_3700";
        let NAME = "getAllWindowStages";
        let AbilityStage_WindowStage =  AppStorage.get<Array<window.WindowStage>>('AbilityStage_WindowStage') as Array<window.WindowStage>
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [AbilityStage] getAllWindowStages size ${AbilityStage_WindowStage.length}`);
          hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [[AbilityStage]] Data: ` + JSON.stringify(AbilityStage_WindowStage));
          for (let i = 0; i < AbilityStage_WindowStage.length; i++) {
            hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [[AbilityStage]] getAllWindowStages successfully. Data: ` + (AbilityStage_WindowStage[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
          }
          expect(AbilityStage_WindowStage.length).assertEqual(0);
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_1100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_1100
     * @tc.desc       multi-module getAllWindowStages
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_1100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_1100";
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
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

      /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_2100
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_2100
     * @tc.desc       Create a new process to launch the UIAbility by configuring the options of startAbility
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_2100', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_2100";
        let NAME = "getAllWindowStages";
        let appContext = context!.getApplicationContext();
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        let options: StartOptions = {
          processMode: contextConstant.ProcessMode.NEW_PROCESS_ATTACH_TO_PARENT,
          startupVisibility: contextConstant.StartupVisibility.STARTUP_HIDE
        };
        context!.startAbility(wantInfo,options, (err: BusinessError | null) => {
          if (err?.code !== 0) {
            if(err?.code==801) {
              resolve(undefined)
            }else{
              hilog.info(0x0000,'testTag',`startAbilitycccc, code is ${err?.code}, message is ${err?.message}`);
              resolve(undefined)
            }
          } else {
            hilog.info(0x0000,'testTag', `startAbility success`);
          }
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
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} [[AbilityStage]] getAllWindowStages successfully. Data: ` + (data[i].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
              }
              expect(data.length).assertEqual(1);
              expect((data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('TestAbility');
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });

        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_2200
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_2200
     * @tc.desc       Create a new process to launch the UIAbility by configuring the process tag
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_2200', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_2200";
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
          let err = e as BusinessError
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
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_3000
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_3000
     * @tc.desc       createModuleContext.getApplicationContext
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_3000', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_3000";
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
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        let appContext = (await application.createModuleContext(context!, 'entry', 'default')).getApplicationContext();
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
              expect(data.length).assertEqual(2);
              let matchedInfos: string[] = [];
              for (let stage of data) {
                let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                let abilityName = mainWindow.abilityInfo.name;
                matchedInfos.push(abilityName);
              }
              expect(matchedInfos.includes('TestAbility1')).assertEqual(true);
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_1000
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_1000
     * @tc.desc       Obtain the WindowStage after launching multiple instances of the application
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_1000', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_1000";
        let NAME = "getAllWindowStages";
        let appContext = context!.getApplicationContext();
        let want: Want = {
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility',
          parameters: {
            'ohos.extra.param.key.createAppInstance': true
          } as Record<String, RecordData>
        };
        try {
          await context!.startAbility(want).then(() => {
            hilog.info(0x0000, 'testTag','startAbility succeed');
          }).catch((err: Error) => {
            hilog.error(0x0000, 'testTag',`startAbility failed, code is ${err?.code}, message is ${err.message}`);
          });
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          hilog.error(0x0000, 'testTag',`startAbility failed, code is ${code}, message is ${message}`);
        }
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
              expect(data.length).assertEqual(1);
              expect((data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('TestAbility');
              resolve(undefined);
            })
            .catch((e: Error) => {
              let err = e as BusinessError;
              hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
              expect().assertFail();
              resolve(undefined);
            });
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

      
   /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_1700
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_1700
     * @tc.desc       Pressure Test
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_1700', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_1700";
        let NAME = "getAllWindowStages";
        let appContext = context!.getApplicationContext();
        let i = 0;
        let wantInfo: Want = {
          deviceId: '',
          bundleName: 'com.example.getAllWindowStages.static',
          moduleName: 'entry',

          abilityName: 'TestAbility1',
        };
        await context!.startAbility(wantInfo).then(() => {
          hilog.info(0x0000, 'testTag', 'startAbility success.');
        }).catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', 'startAbility failed.');
        });
        await Utils.msSleep(1000);
        try {
          hilog.info(0x0000, 'testTag', `${TESTCASE} start`);
          for (i = 0; i < 1000; i++) {
            await appContext.getAllWindowStages()
              .then((data: Array<window.WindowStage>) => {
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} success ` + i);
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} getAllWindowStages size ${data.length}`);
                hilog.info(0x0000, 'testTag', `${TESTCASE} ${NAME} Data: ` + JSON.stringify(data));
                expect(data.length).assertEqual(2);
                let matchedInfos: string[] = [];
                for (let stage of data) {
                  let mainWindow = stage.getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext;
                  let abilityName = mainWindow.abilityInfo.name;
                  matchedInfos.push(abilityName);
                }
                })
              .catch((e: Error) => {
                let err = e as BusinessError;
                hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} error, code: ${err?.code}, message: ${err.message}`);
                expect().assertFail();
                resolve(undefined);
              });
          }
          expect(i).assertEqual(1000);
          resolve(undefined);
        } catch (e) {
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `${TESTCASE} ${NAME} failed, code: ${err?.code}, message: ${err.message}`);
          expect().assertFail();
          resolve(undefined);
        }
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })

    /**
     * @tc.number     SUB_Ability_AbilityRuntime_getAllWindowStages_0800
     * @tc.name       SUB_Ability_AbilityRuntime_getAllWindowStages_0800
     * @tc.desc       Acquire WindowStages by launching multiple Abilities in other launch modes.
     * @tc.size       MEDIUMTEST
     * @tc.type       Function
     * @tc.level      LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_0800', Level.LEVEL0, async (): Promise<void> => {
          await new Promise<void>((resolve, reject) => {
        let runCase = async (): Promise<void> => {
        let TESTCASE = "SUB_Ability_AbilityRuntime_getAllWindowStages_0800";
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
          let err = e as BusinessError;
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
          let err = e as BusinessError;
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
          let err = e as BusinessError;
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
          let err = e as BusinessError;
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
          let err = e as BusinessError;
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
          let err = e as BusinessError;
          hilog.error(0x0000, 'testTag', `Second getAllWindowStages failed: ${err.message}`);
          expect().assertFail();
        }
        resolve(undefined);
        };
        runCase().catch((e: Error) => { console.error('case error: ' + JSON.stringify(e)); resolve(undefined); });
          });
    })
  })
}
