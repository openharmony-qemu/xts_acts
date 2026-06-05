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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import { ColorMetrics, screenshot } from '@kit.ArkUI';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import settings from '@ohos.settings';
import { Driver,ON,Component, Point } from '@ohos.UiTest';
import { canIUse } from '@internal.full.global'
import deviceInfo from '@ohos.deviceInfo';
import {AbilityConstant} from '@kit.AbilityKit';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
        (async () => {
            let want: Want = {
                bundleName: "com.example.actswindowtest.static",
                abilityName: 'StartAbility'
            };
            if (options) {
                context.startAbility(want, options).then(() => {
                    hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
                });
            } else {
                context.startAbility(want).then(() => {
                    hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
                });
            }
            await Utils.msSleep(1000)
            let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
            resolve(windowStageStart);
        })().awaitSync()
    })
}
async function terminateAbility(caseName: string) {
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    try {
        if (pageContext !== null && pageContext !== undefined) {
            console.log(`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            console.log(`${caseName} terminateSelf success`);
        }).catch((err: Error):PromiseLike<void>|undefined => {
            console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        console.error(`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowLayoutTest2() {

    describe("WindowLayoutTest2", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowLayoutTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isFreeWindowMode:boolean = false;
        let driver: Driver = Driver.create();
        let deviceType: string = deviceInfo.deviceType;
        let isSyscapSessionManagerSupported: boolean = false;
        let isSupportFreeWindowMode: boolean  = false;
        console.log(`come in Driver create`);
        beforeAll(() => {
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                // let win = windowStage!.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            let mainWindowClass:window.Window = windowStage!.getMainWindowSync();
            isFreeWindowMode = mainWindowClass.isInFreeWindowMode();
            //isFreeWindowMode == true 自由窗口模式
            //isFreeWindowMode == false 非自由窗口模式
            console.info(`brforeAll isFreeWindowMode: ${isFreeWindowMode}`);
            isSyscapSessionManagerSupported = canIUse('SystemCapability.Window.SessionManager');
            console.info(`brforeAll isSyscapSessionManagerSupported: ${isSyscapSessionManagerSupported}`);
            console.info(`brforeAll deviceType: ${deviceType}`);
            let promiseSnapshot = mainWindowClass.getWindowStateSnapshot();
            promiseSnapshot.then((data) => {
                let str = JSON.parseJsonElement(data);
                isSupportFreeWindowMode = str.getBoolean('isSupportFreeWindowMode')
                hilog.info(domain, tag, `beforeAll: Succeeded. data=${data}, isSupportFreeWindowMode=${isSupportFreeWindowMode}`);
            }).catch((err: Error) => {
                hilog.error(domain, tag, `beforeAll: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
            });
        })

 /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow: window.Window = await windowStage!.createSubWindow('SetSupportedWindowModes_ARRAY_EMPTY_Static_0100');
      try {
        subWindow.setSupportedWindowModes([]).then(async () => {
          console.info('Succeed in setting window support modes');
          expect(true).assertFail();
          await subWindow.destroyWindow();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
            console.error(msgStr + `The device not support setSupportedWindowModes`);
          }else {
            expect(err.code).assertEqual(401);
            console.error(msgStr + `setSupportedWindowModes with null windowmode`);
          }
          expect(err.message !== '').assertTrue();
          await subWindow.destroyWindow();
          done();
        });
      } catch (err) {
        console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect(true).assertFail();
        await subWindow.destroyWindow();
        done();
      };
    });

/**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow: window.Window = await windowStage!.createSubWindow('SetSupportedWindowModes_destroy_SubWindow_Static_0100');
      await subWindow.destroyWindow();
      await Utils.msSleep(300)
      try {
        subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]).then(async () => {
          console.info('Succeed in setting window support modes');
          expect(true).assertFail();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          expect(err.code).assertEqual(1300002);
          expect(err.message !== '').assertTrue();
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect(true).assertFail();
        done();
      };
    });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "SetSupportedWindowModes_notSupportWindow_Static_0100",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass:window.Window = await window.createWindow(config);
      await Utils.msSleep(300)
      try {
        windowClass.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]).then(async () => {
          console.info('Succeed in setting window support modes');
          expect(true).assertFail();
          await windowClass.destroyWindow();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
          }else {
            expect(err.code).assertEqual(1300004);
          }
          expect(err.message !== '').assertTrue();
          await windowClass.destroyWindow();
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect(true).assertFail();
        await windowClass.destroyWindow();
        done();
      };
    });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let windowStageStart = await startAbility(caseName, context!)
      let mainWindow = windowStageStart.getMainWindowSync();
      await Utils.msSleep(300)
      try {
        mainWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.SPLIT]).then(async () => {
          console.info('Succeed in setting window support modes');
          expect(true).assertFail();
          await terminateAbility(caseName);
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes1. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
          }else {
            expect(err.code).assertEqual(401);
          }
          expect(err.message !== '').assertTrue();
          await terminateAbility(caseName);
          done();
        });
      } catch (err) {
        console.error(`Failed to set window support modes2. Cause code:${err.code}, messege:${err.message}`);
        expect(true).assertFail();
        await terminateAbility(caseName);
        done();
      };
    });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow: window.Window = await windowStage!.createSubWindow('SetSupportedWindowModes_SubWindow_SPLIT_Static_0100');
      try {
        subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
          bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING]).then(async () => {
          console.info('Succeed in setting window support modes');
          expect(true).assertFail();
          await subWindow.destroyWindow();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
          }else {
            expect(err.code).assertEqual(1300016);
          }
          await subWindow.destroyWindow();
          done();
        });
      } catch (err) {
        console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        expect(true).assertFail();
        await subWindow.destroyWindow();
        done();
      };
    });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let options: window.SubWindowOptions = {
        title: caseName,
        decorEnabled:true,
        maximizeSupported: true
      };
      try {
        let subWindow: window.Window = await windowStage!.createSubWindowWithOptions('SetSupportedWindowModes_FLOATTING_Static_0100', options);
        await subWindow.setUIContent('pages/index2');
        await subWindow.showWindow();
        await Utils.msSleep(300)
        subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]).then(async () => {
          console.info(msgStr + 'Succeed in setting window support modes');
          let windowStatus = subWindow.getWindowStatus();
          console.info(`${msgStr} Succeeded in getWindowStatus ${windowStatus}.isFreeWindowMode:${isFreeWindowMode}`);
          expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
          await subWindow.maximize();
          await Utils.msSleep(200)
          let windowStatus2 = subWindow!.getWindowStatus();
          console.info(`${msgStr} Succeeded in getWindowStatus2 ${windowStatus2}.`);
          expect(windowStatus2).assertEqual(window.WindowStatusType.FLOATING);
          await subWindow.destroyWindow();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
          }else {
            expect(err.code).assertEqual(1300004);
          }
          expect(err.message !== '').assertTrue();
          await subWindow.destroyWindow();
          done();
        });
      } catch (err) {
        console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        if (!isSyscapSessionManagerSupported){
          expect(err.code).assertEqual(1300002);
          expect(err.message !== '').assertTrue();
        }else {
          expect(true).assertFail();
        }
        done();
      };
    });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let options: window.SubWindowOptions = {
        title: caseName,
        decorEnabled:true,
        maximizeSupported: true
      };
      try {
        let subWindow: window.Window = await windowStage!.createSubWindowWithOptions('SetSupportedWindowModes_FULL_SCREEN_Static_0100', options);
        await subWindow.setUIContent('pages/index2');
        subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN]).then(async () => {
          console.info(msgStr + 'Succeed in setting window support modes');
          await subWindow.showWindow();
          await Utils.msSleep(300)
          let windowStatus = subWindow!.getWindowStatus();
          console.info(`${msgStr} Succeeded in getWindowStatus ${windowStatus}.`);
          if (isFreeWindowMode){
            expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
            await subWindow.recover();
          } else {
            expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
          }
          await subWindow.destroyWindow();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
          }else {
            expect(err.code).assertEqual(1300002);
          }
          expect(err.message !== '').assertTrue();
          await subWindow.destroyWindow();
          done();
        });
      } catch (err) {
        console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        if (!isSyscapSessionManagerSupported){
          expect(err.code).assertEqual(1300002);
          expect(err.message !== '').assertTrue();
        }else {
          expect(true).assertFail();
        }
        done();
      };
    });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_Static_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_Static_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_Static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_Static_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let options: window.SubWindowOptions = {
        title: caseName,
        decorEnabled:true,
        maximizeSupported: true,
      };
      try {
        let subWindow: window.Window = await windowStage!.createSubWindowWithOptions('SetSupportedWindowModes_FULL_SCREEN_FLOATTING_Static_0100', options);
        await subWindow.setUIContent('pages/index2');
        subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN, bundleManager.SupportWindowMode.FLOATING]).then(async () => {
          console.info(msgStr + 'Succeed in setting window support modes');
          await subWindow.showWindow();
          await Utils.msSleep(300)
          await subWindow.maximize();
          let windowStatus = subWindow!.getWindowStatus();
          console.info(`${msgStr} Succeeded in getWindowStatus ${windowStatus}.`);
          if (isFreeWindowMode){
            expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
            await Utils.msSleep(300)
            await subWindow.recover();
            await Utils.msSleep(200)
            let windowStatus2 = subWindow!.getWindowStatus();
            console.info(`${msgStr} Succeeded in getWindowStatus2 ${windowStatus2}.`);
            expect(windowStatus2).assertEqual(window.WindowStatusType.FLOATING);
          } else {
            expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
          }
          await subWindow.destroyWindow();
          done()
        }).catch(async (err: Error) => {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported){
            expect(err.code).assertEqual(801);
            expect(err.message !== '').assertTrue();
          }else {
            expect(true).assertFail();
          }
          await subWindow.destroyWindow();
          done();
        });
      } catch (err) {
        console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
        if (!isSyscapSessionManagerSupported){
          expect(err.code).assertEqual(1300002);
          expect(err.message !== '').assertTrue();
        }else {
          expect(true).assertFail();
        }
        done();
      };
    });

    })

}