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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
import { canIUse } from '@internal.full.global';
import { Driver,ON,Component, Point } from '@ohos.UiTest';

// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowFocusTest() {

    describe("WindowFocusTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowFocusTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let canIUseRes: boolean = false;
        let driver: Driver = Driver.create();
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                // let win = windowStage.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
            canIUseRes = canIUse('SystemCapability.Window.SessionManager');
            console.log(`canIUse SystemCapability.Window.SessionManager: ${canIUseRes}`);
            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_static_0300
         * @tc.name      test_shiftAppWindowPointerEvent_window_destroyed_static
         * @tc.desc      test_shiftAppWindowPointerEvent_window_destroyed_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_shiftAppWindowPointerEvent_window_destroyed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_shiftAppWindowPointerEvent_window_destroyed_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            try{
                let promise1 = windowStage!.createSubWindow('test_shiftAppWindowPointerEvent_window_destroyed_static');
                promise1.then((data:window.Window) => {
                    let subWindowClass:window.Window = data;
                    hilog.info(domain, tag,caseName+ ' Succeeded in creating the subwindow. Data: ' + data);
                    let subWindowId = subWindowClass.getWindowProperties().id;
                    let mainWindowId = mainWindow.getWindowProperties().id;
                    hilog.info(domain, tag,caseName+ ' subWindowId: ' + JSON.stringify(subWindowId) +','+' mainWindowId: ' + JSON.stringify(mainWindowId) );
                    subWindowClass.destroyWindow().awaitSync()
                    let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,subWindowId);
                    promise2.then(() => {
                        hilog.info(domain, tag,caseName+ ' Succeeded in shifting app window pointer event');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
                        if(err.code == 801){
                            done();
                        }else if(err.code == 1300002){
                            done();
                        } else{
                            expect(false).assertTrue();
                            done();
                        }
                    });
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 401){
                    done();
                }else{
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number    SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_static_0400
         * @tc.name      test_shiftAppWindowPointerEvent_Dialog_window_static
         * @tc.desc      test_shiftAppWindowPointerEvent_Dialog_window_static
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_shiftAppWindowPointerEvent_Dialog_window_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_shiftAppWindowPointerEvent_Dialog_window_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            let mainWindow:window.Window = windowStage!.getMainWindowSync();
            try{
                let config: window.Configuration = {
                    name: "test",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context!,
                    decorEnabled:true,
                    title:'dialog Window'
                };
                let promise1 = window.createWindow(config);
                promise1.then((data:window.Window) => {
                    (async () => {
                    let dialogWindowClass:window.Window = data;
                    hilog.info(domain, tag,caseName+ ' Succeeded in creating the subwindow. Data: ' + data);
                    await dialogWindowClass.setUIContent('pages/index2');
                    await dialogWindowClass.showWindow();
                    await Utils.msSleep(1000)
                    let dialogWindowId = dialogWindowClass.getWindowProperties().id;
                    let mainWindowId = mainWindow.getWindowProperties().id;
                    hilog.info(domain, tag,caseName+ ' dialogWindowId: ' + JSON.stringify(dialogWindowId) +','+' mainWIndowId: ' + JSON.stringify(mainWindowId) );
                    let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,dialogWindowId);
                    promise2.then(() => {
                        hilog.info(domain, tag,caseName+ ' Succeeded in shifting app window pointer event');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: Error):PromiseLike<void>|undefined => {
                        (async () => {
                        hilog.error(domain, tag,`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
                        await dialogWindowClass.destroyWindow();
                        if(err.code == 801){
                            done();
                        }else if(err.code == 1300004){
                            done();
                        } else{
                            expect(false).assertTrue();
                            done();
                        }
                        })().awaitSync()
                    });
                    })().awaitSync()
                }).catch((err: Error):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} :Failed to create the dialogwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                });
            }catch(err) {
                err = err as BusinessError;
                hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                if(err.code == 401){
                    done();
                }else{
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.name   testTouchOutsideBaseTest_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_2360
         * @tc.desc   Enable listening for click events outside the area of this window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL4
         */
        it('testTouchOutsideBaseTest_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testTouchOutsideBaseTest_static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            let mainWin: window.Window = await windowStage!.getMainWindow();
            let callback = () => {
                console.log('windowTest on/off touchOutside callback success');
            }
            try {
                mainWin!.onTouchOutside(callback);
            } catch (err) {
                console.log(msgStr + 'window on touchOutside failed');
                expect(true).assertFail();
                done();
            }
            await Utils.msSleep(900);
            try {
                mainWin!.offTouchOutside(callback);
                done();
            } catch (err) {
                console.log(msgStr + 'window off touchOutside failed');
                expect(true).assertFail();
                done();
            }
        });
        /**
         * @tc.name   testOnScreenShotAppEventwithDestoryedSubWindow_static
         * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_static_0100
         * @tc.desc   验证子窗销毁后监听on_screenshotAppEvent返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testOnScreenShotAppEventwithDestoryedSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName:string = "testOnScreenShotAppEventwithDestoryedSubWindow_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testOnScreenShotAppEventwithDestoryedSubWindow_static');
            await windowClass.destroyWindow();
            try {
                const callback = (data: window.ScreenshotEventType) => {
                    console.log(`${caseName} callback data: ${JSON.stringify(data)}`);
                }
                windowClass.onScreenshotAppEvent(callback);
                console.info(msgStr + 'Succeeded in calling on screenshotAppEvent.');
                expect(true).assertFail();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300002);
                expect(exception.message!=null).assertTrue();
                done()
            }
        })

        /**
         * @tc.name   testOffScreenShotAppEventwithDestoryedSubWindow_static
         * @tc.number SUB_BASIC_WMS_ONSCREENSHOTAPPEVENT_static_0200
         * @tc.desc   验证子窗销毁后取消监听off_screenshotAppEvent返回1300002错误码
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testOffScreenShotAppEventwithDestoryedSubWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName:string = "testOffScreenShotAppEventwithDestoryedSubWindow_static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testOffScreenShotAppEventwithDestoryedSubWindow_static');
            await windowClass.destroyWindow();
            try {
                const callback = (data: window.ScreenshotEventType) => {
                    console.log(`${caseName} callback data: ${JSON.stringify(data)}`);
                }
                windowClass.offScreenshotAppEvent(callback);
                console.info(msgStr + 'Succeeded in calling off screenshotAppEvent.');
                expect(true).assertFail();
                done()
            } catch (exception) {
                exception = exception as BusinessError;
                console.error(msgStr + 'Failed. Cause:' + JSON.stringify(exception.code)+',errMessage: '+ exception.message);
                expect(exception.code).assertEqual(1300002)
                expect(exception.message!=null).assertTrue();
                done()
            }
        })
        /**
         * @tc.name   testWindowOffDialogTargetTouch_RepeatOff_static
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_static_3650
         * @tc.desc   Turns off listening for click events on the target window of the modal window
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testWindowOffDialogTargetTouch_RepeatOff_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testWindowOffDialogTargetTouch_RepeatOff_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            console.log(msgStr + 'begin');
            let win: window.Window = await windowStage!.createSubWindow('testWindowOffDialogTargetTouch_RepeatOff_static');
            console.log(msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            try {
                (win as window.Window).onDialogTargetTouch(() => {
                    console.info(msgStr + 'touch dialog target');
                });
            } catch (exception) {
                console.error(msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
            try {
                (win as window.Window).offDialogTargetTouch();
            } catch (exception) {
                console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
            try {
                (win as window.Window).offDialogTargetTouch();
                await (win as window.Window).destroyWindow();
                done();
            } catch (exception) {
                console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                await (win as window.Window).destroyWindow();
                expect(true).assertFail();
                done();
            }
        })
        /**
         * @tc.name   testisSeparationTouchEnabledwithDestoryedWindow_static
         * @tc.number SUB_BASIC_WMS_FUNCTION_isSeparationTouchEnabled_static_0200
         * @tc.desc   验证moveWindowToGlobalDisplay接口窗口状态异常调用
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testisSeparationTouchEnabledwithDestoryedWindow_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testisSeparationTouchEnabledwithDestoryedWindow_static';
            console.log(caseName + 'begin.');
            let windowClass:window.Window = await windowStage!.createSubWindow('testisSeparationTouchEnabledwithDestoryedWindow_static')
            await windowClass.destroyWindow();
            try {
                windowClass.isSeparationTouchEnabled();
                await Utils.msSleep(200);
                expect(true).assertFail();
                done();
            } catch (err) {
                err = err as BusinessError;
                console.error(`${caseName} failed, err: ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(1300002)
                expect(err.message != null).assertTrue();
                done();
            }
        })
        
  /**
   * @tc.name SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_One_Static_0100
   * @tc.number SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_One_Static_0100
   * @tc.desc 监听一次应用焦点变化
   * @tc.type FUNCTION
   * @tc.size MEDIUMTEST
   * @tc.level LEVEL0
   */
  it('SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_One_Static_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_One_Static_0100 ';
      console.log(caseName + 'begin');
      let flag = true;
      window.onApplicationFocusStateChange((data) => {
        console.info(`${caseName} onApplicationFocusStateChange1 ${data}`);
        flag = data;
      })
      try {
        let windowClass: window.Window = windowStage!.getMainWindowSync();
        await windowClass.setWindowFocusable(false);
        await Utils.msSleep(500)
        if (canIUseRes) {
          expect(flag).assertFalse();
        }
        await windowClass.setWindowFocusable(true);
        let subWindowClass = await windowStage!.createSubWindow('ApplicationFocus1');
        console.error(`${caseName} Succeeded in creating the sub window.`);
        await subWindowClass.setUIContent('pages/index2');
        await subWindowClass.showWindow();
        await Utils.msSleep(500)
        if (canIUseRes) {
          expect(flag).assertTrue();
        }
        await subWindowClass.destroyWindow();
        window.offApplicationFocusStateChange();
        done();
      } catch (err) {
        console.info(`${caseName} setWindowFocusable err, message: ${err.message} code:${err.code}`);
        expect(true).assertFail();
        done();
      }
    });

  /**
   * @tc.name   SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_Two_Static_0100
   * @tc.number SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_Two_Static_0100
   * @tc.desc   监听两次应用焦点变化
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_WINDOW_FOCUS_OnApplicationFocusStateChange_Two_Static_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'testOnApplicationFocusStateChange_Two_0100 ';
      console.log(caseName + 'begin');
      let count = 0;

      window.onApplicationFocusStateChange((focusStateChange) => {
        console.info(`${caseName} onApplicationFocusStateChange1 ${focusStateChange}`);
        if (focusStateChange) {
          count++;
        } else {
          count--;
        }
      })

      window.onApplicationFocusStateChange((focusStateChange) => {
        console.info(`${caseName} onApplicationFocusStateChange1 ${focusStateChange}`);
        if (focusStateChange) {
          count++;
        } else {
          count--;
        }
      })
      try {
        let windowClass: window.Window = windowStage!.getMainWindowSync();
        await windowClass.setWindowFocusable(false);
        await Utils.msSleep(500)
        if (canIUseRes) {
          expect(count).assertEqual(-2);
        }
        await windowClass.setWindowFocusable(true);
        let subWindowClass = await windowStage!.createSubWindow('ApplicationFocus2');
        console.error(`${caseName} Succeeded in creating the sub window.`);
        await subWindowClass.setUIContent('pages/index2');
        await subWindowClass.showWindow();
        await Utils.msSleep(500)
        if (canIUseRes) {
          expect(count).assertEqual(0);
        }
        await subWindowClass.destroyWindow();
        window.offApplicationFocusStateChange();
        done();
      } catch (err) {
        console.info(`${caseName} setWindowFocusable err, message: ${err.message} code:${err.code}`);
        expect(true).assertFail();
        done();
      }
    });


  /**
   * @tc.name   SUB_WINDOW_FOCUS_OffApplicationFocusStateChange_One_Static_0100
   * @tc.number SUB_WINDOW_FOCUS_OffApplicationFocusStateChange_One_Static_0100
   * @tc.desc   取消监听一次应用焦点变化
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('SUB_WINDOW_FOCUS_OffApplicationFocusStateChange_One_Static_0100',
    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_WINDOW_FOCUS_OffApplicationFocusStateChange_One_Static_0100 ';
      console.log(caseName + 'begin');
      let count = 0;

      let callback1 = (data: boolean) => {
        console.info(`${caseName} onApplicationFocusStateChange1 ${data}`);
        if (data) {
          count++;
        } else {
          count--;
        }
      };

      let callback2 = (data: boolean) => {
        console.info(`${caseName} onApplicationFocusStateChange2 ${data}`);
        if (data) {
          count++;
        } else {
          count--;
        }
      }
      window.onApplicationFocusStateChange(callback1);
      window.onApplicationFocusStateChange(callback2);
      window.offApplicationFocusStateChange(callback2);
      try {
        let windowClass: window.Window = windowStage!.getMainWindowSync();
        await windowClass.setWindowFocusable(false);
        await Utils.msSleep(500)
        if (canIUseRes) {
          expect(count).assertEqual(-1);
        }
        await windowClass.setWindowFocusable(true);
        let subWindowClass = await windowStage!.createSubWindow('ApplicationFocus3');
        console.error(`${caseName} Succeeded in creating the sub window.`);
        await subWindowClass.setUIContent('pages/index2');
        await subWindowClass.showWindow();
        await Utils.msSleep(500)
        if (canIUseRes) {
          expect(count).assertEqual(0);
        }
        await subWindowClass.destroyWindow();
        window.offApplicationFocusStateChange();
        done();
      } catch (err) {
        console.info(`${caseName} setWindowFocusable err, message: ${err.message} code:${err.code}`);
        expect().assertFail();
        done();
      }
    });

/**
     @tc.name SUB_WINDOW_ENV_IS_FOCUSED_HIGHLIGHTED_Static_0100
     @tc.number SUB_WINDOW_ENV_IS_FOCUSED_HIGHLIGHTED_Static_0100
     @tc.desc SUB_WINDOW_ENV_IS_FOCUSED_HIGHLIGHTED_Static_0100
     @tc.type FUNCTION
     @tc.size MEDIUMTEST
     @tc.level LEVEL0
     */
    it('SUB_WINDOW_ENV_IS_FOCUSED_HIGHLIGHTED_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_ENV_IS_FOCUSED_HIGHLIGHTED_Static_0100';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let isSubWindowFocused: boolean = true;
        let isSubWindowHighlighted: boolean = true;
        let callback = (isHighlighted: boolean) => {
          console.log(msgStr + 'windowHighlightChange, isHighlighted = ' + isHighlighted)
          isSubWindowHighlighted = isHighlighted
        }
        let callback2 = (windowEventType: window.WindowEventType) => {
          console.log(msgStr + 'subWindow, windowEventType = ' + windowEventType)
          if (windowEventType === window.WindowEventType.WINDOW_ACTIVE) {
            isSubWindowFocused = true;
          }
          if (windowEventType === window.WindowEventType.WINDOW_INACTIVE) {
            isSubWindowFocused = false;
          }
        }
        let subWindow: window.Window =
          await windowStage!.createSubWindow('SUB_WINDOW_ENV_IS_FOCUSED_HIGHLIGHTED_Static_0100');
        try {
          await subWindow.setUIContent('pages/Index5');
          let displayInfo: display.Display = display.getDefaultDisplaySync()
          console.log(`${caseName} getDefaultDisplaySync: ${JSON.stringify(displayInfo)}`);
          let resizeWidth = Double.toInt(displayInfo.width)
          let resizeHeight = Double.toInt(displayInfo.height)
          await subWindow.resize(resizeWidth, resizeHeight)
          await subWindow.showWindow();
          await Utils.msSleep(1000);
          subWindow.onWindowHighlightChange(callback)
          subWindow.onWindowEvent(callback2);
          let mainWin: window.Window = windowStage!.getMainWindowSync();
          let mainWindowId = mainWin.getWindowProperties().id;
          let subWindowId = subWindow.getWindowProperties().id;
          console.info(`${msgStr},mainWindowId：${mainWindowId},subWindowId:${subWindowId}`);
          await window.shiftAppWindowFocus(subWindowId, mainWindowId);
          await Utils.msSleep(500);
          let envSystemPropertiesIsFocused = await driver.findComponent(ON.id('EnvSystemPropertiesIsFocused'));
          let envSystemPropertiesIsHighlighted = await driver.findComponent(ON.id('EnvSystemPropertiesIsHighlighted'));
          console.info(`${msgStr} envSystemPropertiesIsFocused:${JSON.stringify(envSystemPropertiesIsFocused)},envSystemPropertiesIsHighlighted:${envSystemPropertiesIsHighlighted}`);
          let envIsFocusedStr = await envSystemPropertiesIsFocused!.getText();
          let envIsHighlightedStr = await envSystemPropertiesIsHighlighted!.getText();
          console.info(`${msgStr} envIsFocusedStr:${envIsFocusedStr},envIsHighlightedStr:${envIsHighlightedStr},isSubWindowFocused:${isSubWindowFocused},isSubWindowHighlighted:${isSubWindowHighlighted}`);
          expect(envIsFocusedStr === 'false' && !isSubWindowFocused).assertTrue()
          expect(envIsHighlightedStr === 'false' && !isSubWindowHighlighted).assertTrue()
          await window.shiftAppWindowFocus(mainWindowId, subWindowId);
          await Utils.msSleep(500);
          let envIsFocusedStr2 = await envSystemPropertiesIsFocused!.getText();
          let envIsHighlightedStr2 = await envSystemPropertiesIsHighlighted!.getText();
          console.info(`${msgStr} envIsFocusedStr2:${envIsFocusedStr2},envIsHighlightedStr2:${envIsHighlightedStr2},isSubWindowFocused:${isSubWindowFocused},isSubWindowHighlighted:${isSubWindowHighlighted}`);
          expect(envIsFocusedStr2 === 'true' && isSubWindowFocused).assertTrue()
          expect(envIsHighlightedStr2 === 'true' && isSubWindowHighlighted).assertTrue()
          subWindow.offWindowHighlightChange()
          subWindow.offWindowEvent()
          await subWindow.destroyWindow();
          done()
        } catch (exception) {
          console.error(msgStr +
            `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
          if (canIUseRes) {
            expect(true).assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            expect(exception.code).assertEqual(801);
          }
          subWindow.offWindowHighlightChange()
          subWindow.offWindowEvent()
          await subWindow.destroyWindow();
          done();
        }
      })

    })

}