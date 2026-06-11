/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file expect in compliance with the License.
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
import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import StartOptions from '@ohos.app.ability.StartOptions';
import deviceInfo from '@ohos.deviceInfo';
import { bundleManager } from '@kit.AbilityKit';

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) {
  let want: Want = {
    bundleName: AppStorage.get('bundleName'),
    abilityName: 'StartTestAbility'
  };
  if (options) {
    await context.startAbility(want, options).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  } else {
    await context.startAbility(want).then(() => {
      console.info(`${caseName} Succeeded in starting ability.`);
    }).catch((err: BusinessError) => {
      console.info(`${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
    });
  }
  await sleep(1000)
  let windowStageStart = AppStorage.get('windowStageStartTest') as window.WindowStage;
  return windowStageStart
}

async function terminateAbility(caseName: string) {
  let pageContext = AppStorage.get('contextTest') as common.UIAbilityContext
  await pageContext.terminateSelf().then(() => {
    console.log(`${caseName} terminateSelf success`);
  }).catch((err: BusinessError) => {
    console.error(`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
  });
  await sleep(1000)
}

export default function windowLayoutTest2() {
  describe('windowLayoutTest2', () => {
    console.log('describe window_api_test start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isFreeWindowMode = false;
    let isSyscapSessionManagerSupported = false;
    let isSupportFreeWindowMode = false;
    let deviceType: string = deviceInfo.deviceType;
    console.info(`deviceType: ${deviceType}`);
    let driver: Driver = Driver.create();
    beforeAll(async () => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      let windowClass = windowStage.getMainWindowSync();
      isFreeWindowMode = windowClass.isInFreeWindowMode();
      //isFreeWindowMode == true 自由窗口模式
      //isFreeWindowMode == false 非自由窗口模式
      console.info(`isFreeWindowMode: ${isFreeWindowMode}`);
      isSyscapSessionManagerSupported = canIUse('SystemCapability.Window.SessionManager');
      console.info(`beforeAll isSyscapSessionManagerSupported:  + isSyscapSessionManagerSupported`);
      let promise = windowClass.getWindowStateSnapshot();
      promise.then((data) => {
        let jsonObj: object = JSON.parse(data);
        console.info(`beforeAll: Succeeded. data=${data}, isPcMod=${jsonObj["isPcMode"]},isSupportFreeWindowMode=${jsonObj["isSupportFreeWindowMode"]}`);
        isSupportFreeWindowMode = jsonObj["isSupportFreeWindowMode"];
      }).catch((err: BusinessError) => {
        console.error(`beforeAll: getWindowStateSnapshot Failed. Cause code: ${err.code}, cancel message: ${err.message}`);
      });
    })
    afterEach(async () => {
      try {
        await sleep(1000)
        let mainWindowClass = windowStage.getMainWindowSync()
        let mainID = mainWindowClass.getWindowProperties().id
        let lastWindow = await window.getLastWindow(context)
        let lastID = lastWindow.getWindowProperties().id
        while (mainID != lastID) {
          await lastWindow.destroyWindow()
          await sleep(1000)
          lastWindow = await window.getLastWindow(context)
          lastID = lastWindow.getWindowProperties().id
        }
      } catch (error) {
        console.log('afterEach fail cause' + error)
      }
    })

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_NULL_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_NULL_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_NULL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_NULL_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_NULL_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        await mainWindow.setSupportedWindowModes([null])
        console.info(msgStr + 'Succeeded in setting window support modes');
        expect(true).assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code) + ` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message !== '').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_NULL_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_NULL_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_NULL_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_NULL_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_NULL_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        await mainWindow.setSupportedWindowModes(null)
        console.info(msgStr + 'Succeeded in setting window support modes');
        expect(true).assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code) + ` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message !== '').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_UNDEFINED_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_UNDEFINED_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_UNDEFINED_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_UNDEFINED_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_UNDEFINED_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        await mainWindow.setSupportedWindowModes([undefined])
        console.info(msgStr + 'Succeeded in setting window support modes');
        expect(true).assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code) + ` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message !== '').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_UNDEFINED_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_UNDEFINED_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_UNDEFINED_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_UNDEFINED_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_UNDEFINED_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        await mainWindow.setSupportedWindowModes(undefined)
        console.info(msgStr + 'Succeeded in setting window support modes');
        expect(true).assertFail();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code) + ` message:${exception.message}`);
        expect(exception.code).assertEqual(401);
        expect(exception.message !== '').assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let subWindow =
          await windowStage.createSubWindow('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_ARRAY_EMPTY_0100');
        try {
          subWindow.setSupportedWindowModes([]).then(async () => {
            console.info('Succeed in setting window support modes');
            expect(true).assertFail();
            await subWindow.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
              console.error(msgStr + `The device not support setSupportedWindowModes`);
            } else {
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
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let subWindow =
          await windowStage.createSubWindow('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_destroy_SubWindow_0100');
        await subWindow.destroyWindow();
        await sleep(300)
        try {
          subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]).then(async () => {
            console.info('Succeed in setting window support modes');
            expect(true).assertFail();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message !== '').assertTrue();
            done();
          });
        } catch (err) {
          console.error(`Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          expect(true).assertFail();
          done();
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_notSupportWindow_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let config: window.Configuration = {
          name: "SetSupportedWindowModes_notSupportWindow_0100",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context
        };
        let windowClass: window.Window = await window.createWindow(config);
        await sleep(300)
        try {
          windowClass.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]).then(async () => {
            console.info('Succeed in setting window support modes');
            expect(true).assertFail();
            await windowClass.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
            } else {
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
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_MainWindow_Only_SPLIT_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let windowStageStart = await startAbility(caseName, context)
        let mainWindow = windowStageStart.getMainWindowSync();
        await sleep(300)
        try {
          mainWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.SPLIT]).then(async () => {
            console.info('Succeed in setting window support modes');
            expect(true).assertFail();
            await terminateAbility(caseName);
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes1. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
            } else {
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
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_SPLIT_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let subWindow = await windowStage.createSubWindow('SetSupportedWindowModes_SubWindow_SPLIT_0100');
        try {
          subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
            bundleManager.SupportWindowMode.SPLIT, bundleManager.SupportWindowMode.FLOATING]).then(async () => {
            console.info('Succeed in setting window support modes');
            expect(true).assertFail();
            await subWindow.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
            } else {
              expect(err.code).assertEqual(1300016);
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
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FLOATTING_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let options: window.SubWindowOptions = {
          title: caseName,
          decorEnabled: true,
          maximizeSupported: true
        };
        try {
          let subWindow =
            await windowStage.createSubWindowWithOptions('SetSupportedWindowModes_FLOATTING_0100', options);
          await subWindow.setUIContent('testability/pages/Index2');
          await subWindow.showWindow();
          await sleep(300)
          subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FLOATING]).then(async () => {
            console.info(msgStr + 'Succeed in setting window support modes');
            let windowStatus = subWindow.getWindowStatus();
            console.info(`${msgStr} Succeeded in getWindowStatus ${windowStatus}.isFreeWindowMode:${isFreeWindowMode}`);
            expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
            await subWindow.maximize();
            await sleep(200)
            let windowStatus2 = subWindow!.getWindowStatus();
            console.info(`${msgStr} Succeeded in getWindowStatus2 ${windowStatus2}.`);
            expect(windowStatus2).assertEqual(window.WindowStatusType.FLOATING);
            await subWindow.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
            } else {
              expect(err.code).assertEqual(1300004);
            }
            expect(err.message !== '').assertTrue();
            await subWindow.destroyWindow();
            done();
          });
        } catch (err) {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSyscapSessionManagerSupported) {
            expect(err.code).assertEqual(1300002);
            expect(err.message !== '').assertTrue();
          } else {
            expect(true).assertFail();
          }
          done();
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let options: window.SubWindowOptions = {
          title: caseName,
          decorEnabled: true,
          maximizeSupported: true
        };
        try {
          let subWindow =
            await windowStage.createSubWindowWithOptions('SetSupportedWindowModes_FULL_SCREEN_0100', options);
          await subWindow.setUIContent('testability/pages/Index2');
          subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN]).then(async () => {
            console.info(msgStr + 'Succeed in setting window support modes');
            await subWindow.showWindow();
            await sleep(300)
            let windowStatus = subWindow!.getWindowStatus();
            console.info(`${msgStr} Succeeded in getWindowStatus ${windowStatus}.`);
            if (isFreeWindowMode) {
              expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
              await subWindow.recover();
            } else {
              expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
            }
            await subWindow.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
            } else {
              expect(err.code).assertEqual(1300002);
            }
            expect(err.message !== '').assertTrue();
            await subWindow.destroyWindow();
            done();
          });
        } catch (err) {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSyscapSessionManagerSupported) {
            expect(err.code).assertEqual(1300002);
            expect(err.message !== '').assertTrue();
          } else {
            expect(true).assertFail();
          }
          done();
        }
        ;
      });

    /**
     * @tc.name   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_0100
     * @tc.number SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_0100
     * @tc.desc   SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let caseName = "SUB_WINDOW_WINDOWCLASS_SetSupportedWindowModes_SubWindow_FULL_SCREEN_FLOATTING_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin.');
        let options: window.SubWindowOptions = {
          title: caseName,
          decorEnabled: true,
          maximizeSupported: true,
        };
        try {
          let subWindow =
            await windowStage.createSubWindowWithOptions('SetSupportedWindowModes_FULL_SCREEN_FLOATTING_0100', options);
          await subWindow.setUIContent('testability/pages/Index2');
          subWindow.setSupportedWindowModes([bundleManager.SupportWindowMode.FULL_SCREEN,
            bundleManager.SupportWindowMode.FLOATING]).then(async () => {
            console.info(msgStr + 'Succeed in setting window support modes');
            await subWindow.showWindow();
            await sleep(300)
            await subWindow.maximize();
            let windowStatus = subWindow!.getWindowStatus();
            console.info(`${msgStr} Succeeded in getWindowStatus ${windowStatus}.`);
            if (isFreeWindowMode) {
              expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
              await sleep(300)
              await subWindow.recover();
              await sleep(200)
              let windowStatus2 = subWindow!.getWindowStatus();
              console.info(`${msgStr} Succeeded in getWindowStatus2 ${windowStatus2}.`);
              expect(windowStatus2).assertEqual(window.WindowStatusType.FLOATING);
            } else {
              expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
            }
            await subWindow.destroyWindow();
            done()
          }).catch(async (err: BusinessError) => {
            console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
            if (!isSupportFreeWindowMode || !isSyscapSessionManagerSupported) {
              expect(err.code).assertEqual(801);
              expect(err.message !== '').assertTrue();
            } else {
              expect(true).assertFail();
            }
            await subWindow.destroyWindow();
            done();
          });
        } catch (err) {
          console.error(`${msgStr} Failed to set window support modes. Cause code:${err.code}, messege:${err.message}`);
          if (!isSyscapSessionManagerSupported) {
            expect(err.code).assertEqual(1300002);
            expect(err.message !== '').assertTrue();
          } else {
            expect(true).assertFail();
          }
          done();
        }
        ;
      });

  })
}