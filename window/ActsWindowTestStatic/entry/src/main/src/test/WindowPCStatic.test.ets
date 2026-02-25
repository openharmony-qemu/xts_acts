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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { Callback } from '@ohos.base'
import common from '@ohos.app.ability.common';
import bundleManager from '@ohos.bundle.bundleManager';
import Utils from './Util.test';
import { Driver,ON,Component, Point } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';

let windowStage: window.WindowStage | undefined;
let win: window.Window | undefined;
let context: common.UIAbilityContext | undefined;

export default function WindowPCStaticTest() {

    describe("WindowPCStaticTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPCStaticTest describe start');
        let driver: Driver = Driver.create();

        beforeAll(() => {
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
        })

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETWINDOWTITLEBUTTONVISIBLE_001
         * @tc.name      testSetWindowTitleButtonVisible001
         * @tc.desc      Test setWindowTitleButtonVisible function with three parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTitleButtonVisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testSetWindowTitleButtonVisible001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setWindowTitleButtonVisible(false, false, false);
                hilog.info(domain, tag, msgStr + 'setWindowTitleButtonVisible false success');
                windowClass.setWindowTitleButtonVisible(true, true, true);
                hilog.info(domain, tag, msgStr + 'setWindowTitleButtonVisible true success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETWINDOWTITLEBUTTONVISIBLE_002
         * @tc.name      testSetWindowTitleButtonVisible002
         * @tc.desc      Test setWindowTitleButtonVisible with error code 1300004.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTitleButtonVisible002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowTitleButtonVisible002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            let windowConfig: window.Configuration = {
                name: "testSetWindowTitleButtonVisible002",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context!,
            };
            let tempWnd: window.Window | undefined;

            try {
                tempWnd = await window.createWindow(windowConfig);
                expect(!!tempWnd).assertTrue();
                hilog.info(domain, tag, msgStr + 'create window success');
                await tempWnd!.setUIContent("pages/index2");
                await tempWnd!.showWindow();

                tempWnd!.setWindowTitleButtonVisible(true, true, true);
                hilog.error(domain, tag, msgStr + 'setWindowTitleButtonVisible should throw error');
                expect(false).assertTrue();
                done();
            } catch (exception) {
                exception = exception as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                if (exception.code === 801) {
                    hilog.info(domain, tag, msgStr + '此设备不支持setWindowTitleButtonVisible能力.');
                    if (tempWnd) {
                        await tempWnd!.destroyWindow();
                    }
                    done();
                } else {
                    expect(exception.code).assertEqual(1300004);
                    if (tempWnd) {
                        await tempWnd!.destroyWindow();
                    }
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_001
         * @tc.name      testStartMoving001
         * @tc.desc      Test startMoving function without parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMoving001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMoving001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.startMoving();
                hilog.info(domain, tag, msgStr + 'startMoving success');
                await windowClass.stopMoving();
                hilog.info(domain, tag, msgStr + 'stopMoving success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else if(error.code === 1300004){
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_003
         * @tc.name      testStartMovingErrCode1300002
         * @tc.desc      Test startMoving with error code 1300002.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMovingErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMovingErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testStartMovingErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                await subWin.startMoving();
                hilog.error(domain, tag, msgStr + 'startMoving should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else if(e.code === 1300002) {
                    done();
                } else{
                    expect(false).assertTrue();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_002
         * @tc.name      testStartMoving002
         * @tc.desc      Test startMoving function with offset parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMoving002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMoving002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.startMoving(100, 50);
                hilog.info(domain, tag, msgStr + 'startMoving with offset success');
                await windowClass.stopMoving();
                hilog.info(domain, tag, msgStr + 'stopMoving success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_WMS_START_MOVING_REPEAT_0100
         * @tc.name       teststartMovingRepeated
         * @tc.desc       teststartMovingRepeated
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 1
         */
        it('teststartMovingStaticRepeated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'teststartMovingStaticRepeated';
            console.log(caseName + 'begin');
            let windowClass = windowStage!.getMainWindowSync()
            let isFreeMode = windowClass.isInFreeWindowMode();
            console.log(`${caseName} isFreeMode: ${isFreeMode}`);
            let subWindowClass: window.Window | undefined;
            try {
                subWindowClass = await windowStage!.createSubWindow('teststartMovingRepeated');
                AppStorage.setOrCreate('windowClass1', subWindowClass);
                let windowLimits = subWindowClass!.getWindowLimits();
                console.info(`${caseName} windowLimits = ${JSON.stringify(windowLimits)}`);
                let width = windowLimits.minWidth;
                let height = windowLimits.maxHeight;
                await subWindowClass.resize(width!+100, height!+150);
                await Utils.msSleep(200)
                await subWindowClass.setUIContent("pages/StartMoving8");
                await Utils.msSleep(200)
                await subWindowClass.showWindow();
                await Utils.msSleep(200)
                await subWindowClass.moveWindowTo(100, 100);
                await Utils.msSleep(200)
                let windowPoint = subWindowClass.getWindowProperties().windowRect;
                console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`);
                await Utils.msSleep(1000)
                let blank = await driver.findComponent(ON.id('startMoving'))
                await Utils.msSleep(1000)
                console.info(`${caseName} blank = ${JSON.stringify(blank)}`);
                let point = await blank!.getBoundsCenter();
                console.info(`${caseName} point = ${JSON.stringify(point)}`);
                await driver.drag(point!.x, point!.y, point!.x + 50, point!.y + 50, 200);
                await Utils.msSleep(1000)
                let text = await driver.findComponent(ON.id('startMovingText'));
                await Utils.msSleep(1000)
                console.info(`${caseName} text = ${JSON.stringify(text)}`);
                let textDragged = await text!.getText();
                await Utils.msSleep(5000)
                console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                if (textDragged == 'startMoving success') {
                    expect().assertFail();
                } else if (textDragged == 'startMoving 801') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else if (textDragged == 'startMoving 1300001') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else {
                    console.error(`${caseName} Error.`);
                    expect(true).assertFalse()
                }
                await subWindowClass.destroyWindow();
                done();
            } catch (err) {
                console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
                await subWindowClass!.destroyWindow()
                if (err.code === 801) {
                    done();
                } else {
                    expect().assertFail();
                    done()
                }
            }
        });

        /**
         * @tc.number     SUB_WMS_START_MOVING_WITH_OFFSETX_OFFSETY_REPEAT_0100
         * @tc.name       teststartMovingwithOffsetXandOffsetYRepeated
         * @tc.desc       teststartMovingwithOffsetXandOffsetYRepeated
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 1
         */
        it('teststartMovingParamStaticRepeated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'teststartMovingParamStaticRepeated';
            console.log(caseName + 'begin');
            let windowClass = windowStage!.getMainWindowSync()
            let isFreeMode = windowClass.isInFreeWindowMode();
            console.log(`${caseName} isFreeMode: ${isFreeMode}`);
            let subWindowClass: window.Window | undefined;
            try {
                subWindowClass = await windowStage!.createSubWindow('teststartMovingwithOffsetXandOffsetYRepeated');
                AppStorage.setOrCreate('windowClass2', subWindowClass);
                let windowLimits = subWindowClass.getWindowLimits();
                console.info(`${caseName} windowLimits = ${JSON.stringify(windowLimits)}`);
                let width = windowLimits.minWidth;
                let height = windowLimits.maxHeight;
                await subWindowClass!.resize(width!+100, height!+150);
                await Utils.msSleep(200)
                await subWindowClass.setUIContent("pages/StartMoving9");
                await Utils.msSleep(200)
                await subWindowClass.showWindow();
                await Utils.msSleep(200)
                await subWindowClass.moveWindowTo(100, 100);
                await Utils.msSleep(200)
                let windowPoint = subWindowClass.getWindowProperties().windowRect;
                console.info(`${caseName} windowPoint = ${JSON.stringify(windowPoint)}`);
                await Utils.msSleep(1000)
                let blank = await driver.findComponent(ON.id('startMoving'))
                await Utils.msSleep(1000)
                console.info(`${caseName} blank = ${JSON.stringify(blank)}`);
                let point = await blank!.getBoundsCenter();
                console.info(`${caseName} point = ${JSON.stringify(point)}`);
                await driver.drag(point.x, point.y, point.x + 50, point.y + 50, 200);
                await Utils.msSleep(1000)
                let text = await driver.findComponent(ON.id('startMovingText'));
                await Utils.msSleep(1000)
                console.info(`${caseName} text = ${JSON.stringify(text)}`);
                let textDragged = await text!.getText();
                await Utils.msSleep(5000)
                console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                if (textDragged == 'startMoving success') {
                    expect().assertFail();
                } else if (textDragged == 'startMoving 801') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else if (textDragged == 'startMoving 1300001') {
                    console.info(`${caseName} textDragged = ${JSON.stringify(textDragged)}`);
                } else {
                    console.error(`${caseName} Error.`);
                    expect(true).assertFalse()
                }
                await subWindowClass.destroyWindow();
                done();
            } catch (err) {
                console.error(`${caseName} :Failed. Cause code: ${err.code}, message: ${err.message}`);
                await subWindowClass!.destroyWindow()
                if (err.code === 801) {
                    done()
                } else {
                    expect().assertFail();
                    done()
                }
            }
        });

         /**
          * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_007
          * @tc.name      testStartMovingWithOffsetErrCode1300002
          * @tc.desc      Test startMoving(offsetX, offsetY) with error code 1300002 (abnormal window state).
          * @tc.size      MediumTest
          * @tc.type      Function
          * @tc.level     Level3
          */
        it('testStartMovingWithOffsetErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMovingWithOffsetErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testStartMovingWithOffsetErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                await subWin.startMoving(100, 50);
                hilog.error(domain, tag, msgStr + 'startMoving with offset should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STARTMOVING_009
         * @tc.name      testStartMovingWithOffsetErrCode401
         * @tc.desc      Test startMoving(offsetX, offsetY) with error code 401 (invalid parameter < 0).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStartMovingWithOffsetErrCode401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStartMovingWithOffsetErrCode401';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.startMoving(-1, 50);
                hilog.error(domain, tag, msgStr + 'startMoving with offset should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(401);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STOPMOVING_001
         * @tc.name      testStopMoving001
         * @tc.desc      Test stopMoving function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStopMoving001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStopMoving001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.stopMoving();
                hilog.info(domain, tag, msgStr + 'stopMoving success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_STOPMOVING_002
         * @tc.name      testStopMovingErrCode1300002
         * @tc.desc      Test stopMoving with error code 1300002.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testStopMovingErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testStopMovingErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testStopMovingErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                await subWin.stopMoving();
                hilog.error(domain, tag, msgStr + 'stopMoving should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONWINDOWTITLEBUTTONRECTCHANGE_001
         * @tc.name      testOnWindowTitleButtonRectChange001
         * @tc.desc      Test onWindowTitleButtonRectChange function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnWindowTitleButtonRectChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOnWindowTitleButtonRectChange001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                let callbackInvoked: boolean = false;

                let callback: Callback<window.TitleButtonRect> = (titleButtonRect: window.TitleButtonRect) => {
                    callbackInvoked = true;
                    hilog.info(domain, tag, msgStr + 'onWindowTitleButtonRectChange callback invoked: ' + JSON.stringify(titleButtonRect));
                };

                windowClass.onWindowTitleButtonRectChange(callback);
                hilog.info(domain, tag, msgStr + 'onWindowTitleButtonRectChange registered success');

                windowClass.offWindowTitleButtonRectChange(callback);
                hilog.info(domain, tag, msgStr + 'offWindowTitleButtonRectChange success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETPARENTWINDOW_002
         * @tc.name      testSetParentWindowErrCode1300004
         * @tc.desc      Test setParentWindow with error code 1300004 (main window cannot set parent).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetParentWindowErrCode1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetParentWindowErrCode1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let parentWindowId: int = mainWindow.getWindowProperties().id;
                await mainWindow.setParentWindow(parentWindowId);
                hilog.error(domain, tag, msgStr + 'setParentWindow should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETPARENTWINDOW_003
         * @tc.name      testSetParentWindowErrCode1300009
         * @tc.desc      Test setParentWindow with error code 1300009 (sub window cannot set main window as parent).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetParentWindowErrCode1300009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetParentWindowErrCode1300009';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            let subWin: window.Window | undefined;
            try {
                subWin = await windowStage!.createSubWindow('testSetParentWindowErrCode1300009');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let mainWindowId: int = mainWindow.getWindowProperties().id;

                await subWin.setParentWindow(mainWindowId);
                hilog.error(domain, tag, msgStr + 'setParentWindow should throw error');
                expect(false).assertTrue();
                await subWin.destroyWindow();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (subWin) {
                    await subWin.destroyWindow();
                }
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300009);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_GETPARENTWINDOW_001
         * @tc.name      testGetParentWindow001
         * @tc.desc      Test getParentWindow function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetParentWindow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetParentWindow001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testGetParentWindow001');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let parentWindowId: int = mainWindow.getWindowProperties().id;

                let parentWindow: window.Window = subWin.getParentWindow();
                hilog.info(domain, tag, msgStr + 'getParentWindow success, parentWindowId: ' + parentWindow.getWindowProperties().id);

                expect(parentWindow.getWindowProperties().id).assertEqual(parentWindowId);

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_GETPARENTWINDOW_002
         * @tc.name      testGetParentWindowErrCode1300004
         * @tc.desc      Test getParentWindow with error code 1300004 (main window cannot get parent).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testGetParentWindowErrCode1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testGetParentWindowErrCode1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let parentWindow: window.Window = mainWindow.getParentWindow();
                hilog.error(domain, tag, msgStr + 'getParentWindow should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETTITLEANDDOCKHOVERSHOWN_001
         * @tc.name      testSetTitleAndDockHoverShown001
         * @tc.desc      Test setTitleAndDockHoverShown function with two parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetTitleAndDockHoverShown001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetTitleAndDockHoverShown001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                await windowClass.setTitleAndDockHoverShown(false, false);
                hilog.info(domain, tag, msgStr + 'setTitleAndDockHoverShown success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETWINDOWDELAYRAISEONDRAG_001
         * @tc.name      testSetWindowDelayRaiseOnDrag001
         * @tc.desc      Test setWindowDelayRaiseOnDrag function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowDelayRaiseOnDrag001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testSetWindowDelayRaiseOnDrag001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();
                windowClass.setWindowDelayRaiseOnDrag(false);
                hilog.info(domain, tag, msgStr + 'setWindowDelayRaiseOnDrag success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ISINFREEWINDOWMODE_002
         * @tc.name      testIsInFreeWindowModeErrCode1300002
         * @tc.desc      Test isInFreeWindowMode with error code 1300002 (abnormal window state).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testIsInFreeWindowModeErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testIsInFreeWindowModeErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testIsInFreeWindowModeErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();
                let isFreeMode: boolean = subWin.isInFreeWindowMode();
                hilog.error(domain, tag, msgStr + 'isInFreeWindowMode should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFFREEWINDOWMODECHANGE_001
         * @tc.name      testOffFreeWindowModeChange001
         * @tc.desc      Test offFreeWindowModeChange function with callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffFreeWindowModeChange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOffFreeWindowModeChange001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();

                let callback1: Callback<boolean> = (isInFreeWindowMode: boolean) => {
                    hilog.info(domain, tag, msgStr + 'callback1 invoked, isInFreeWindowMode: ' + isInFreeWindowMode);
                };

                let callback2: Callback<boolean> = (isInFreeWindowMode: boolean) => {
                    hilog.info(domain, tag, msgStr + 'callback2 invoked, isInFreeWindowMode: ' + isInFreeWindowMode);
                };

                windowClass.onFreeWindowModeChange(callback1);
                windowClass.onFreeWindowModeChange(callback2);
                hilog.info(domain, tag, msgStr + 'onFreeWindowModeChange registered 2 callbacks');

                windowClass.offFreeWindowModeChange(callback1);
                hilog.info(domain, tag, msgStr + 'offFreeWindowModeChange with callback1 success');

                windowClass.offFreeWindowModeChange(callback2);
                hilog.info(domain, tag, msgStr + 'offFreeWindowModeChange with callback2 success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });


        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETSUPPORTEDWINDOWMODES_001
         * @tc.name      testSetSupportedWindowModes001
         * @tc.desc      Test setSupportedWindowModes function with one parameter.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSupportedWindowModes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSupportedWindowModes001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let modes: Array<bundleManager.SupportWindowMode> = [

                ];
                await windowStage!.setSupportedWindowModes(modes);
                hilog.info(domain, tag, msgStr + 'setSupportedWindowModes success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(error.code).assertEqual(401);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETSUPPORTEDWINDOWMODES_002
         * @tc.name      testSetSupportedWindowModes002
         * @tc.desc      Test setSupportedWindowModes function with two parameters.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSupportedWindowModes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSupportedWindowModes002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let modes: Array<bundleManager.SupportWindowMode> = [

                ];
                await windowStage!.setSupportedWindowModes(modes, true);
                hilog.info(domain, tag, msgStr + 'setSupportedWindowModes with grayOutMaximizeButton success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(error.code).assertEqual(1300016);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_SETSUPPORTEDWINDOWMODES_004
         * @tc.name      testSetSupportedWindowModes003
         * @tc.desc      Test setSupportedWindowModes function with grayOutMaximizeButton false.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetSupportedWindowModes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetSupportedWindowModes003';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let modes: Array<bundleManager.SupportWindowMode> = [
                    bundleManager.SupportWindowMode.FULL_SCREEN,
                    bundleManager.SupportWindowMode.SPLIT,
                    bundleManager.SupportWindowMode.FLOATING
                ];
                await windowStage!.setSupportedWindowModes(modes, false);
                hilog.info(domain, tag, msgStr + 'setSupportedWindowModes with grayOutMaximizeButton false success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONSUBWINDOWCLOSE_001
         * @tc.name      testOnSubWindowClose001
         * @tc.desc      Test onSubWindowClose function.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnSubWindowClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnSubWindowClose001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOnSubWindowClose001');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'onSubWindowClose callback invoked');
                };

                subWin.onSubWindowClose(callback);
                hilog.info(domain, tag, msgStr + 'onSubWindowClose registered success');

                subWin.offSubWindowClose(callback);
                hilog.info(domain, tag, msgStr + 'offSubWindowClose success');

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONSUBWINDOWCLOSE_002
         * @tc.name      testOnSubWindowCloseErrCode1300002
         * @tc.desc      Test onSubWindowClose with error code 1300002 (abnormal window state).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnSubWindowCloseErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnSubWindowCloseErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOnSubWindowCloseErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'onSubWindowClose callback invoked');
                };

                subWin.onSubWindowClose(callback);
                hilog.error(domain, tag, msgStr + 'onSubWindowClose should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_ONSUBWINDOWCLOSE_003
         * @tc.name      testOnSubWindowCloseErrCode1300004
         * @tc.desc      Test onSubWindowClose with error code 1300004 (main window unauthorized).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOnSubWindowCloseErrCode1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOnSubWindowCloseErrCode1300004';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let mainWindow: window.Window = windowStage!.getMainWindowSync();
                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'onSubWindowClose callback invoked');
                };

                mainWindow.onSubWindowClose(callback);
                hilog.error(domain, tag, msgStr + 'onSubWindowClose should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_001
         * @tc.name      testOffSubWindowClose001
         * @tc.desc      Test offSubWindowClose function with callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowClose001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOffSubWindowClose001');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let callback1: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback1 invoked');
                };

                let callback2: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback2 invoked');
                };

                subWin.onSubWindowClose(callback1);
                subWin.onSubWindowClose(callback2);
                hilog.info(domain, tag, msgStr + 'onSubWindowClose registered 2 callbacks');

                subWin.offSubWindowClose(callback1);
                hilog.info(domain, tag, msgStr + 'offSubWindowClose with callback1 success');

                subWin.offSubWindowClose(callback2);
                hilog.info(domain, tag, msgStr + 'offSubWindowClose with callback2 success');

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_002
         * @tc.name      testOffSubWindowClose002
         * @tc.desc      Test offSubWindowClose function without callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowClose002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOffSubWindowClose002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.setUIContent('pages/index2');
                await subWin.showWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback invoked');
                };

                subWin.onSubWindowClose(callback);
                hilog.info(domain, tag, msgStr + 'onSubWindowClose registered success');

                subWin.offSubWindowClose();
                hilog.info(domain, tag, msgStr + 'offSubWindowClose without callback success');

                await subWin.destroyWindow();
                hilog.info(domain, tag, msgStr + 'destroyWindow success');
                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFSUBWINDOWCLOSE_003
         * @tc.name      testOffSubWindowCloseErrCode1300002
         * @tc.desc      Test offSubWindowClose with error code 1300002 (abnormal window state).
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffSubWindowCloseErrCode1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testOffSubWindowCloseErrCode1300002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let subWin: window.Window = await windowStage!.createSubWindow('testOffSubWindowCloseErrCode1300002');
                hilog.info(domain, tag, msgStr + 'create subWindow success');
                await subWin.destroyWindow();

                let callback: Callback<void> = () => {
                    hilog.info(domain, tag, msgStr + 'callback invoked');
                };

                subWin.offSubWindowClose(callback);
                hilog.error(domain, tag, msgStr + 'offSubWindowClose should throw error');
                expect(false).assertTrue();
                done();
            } catch (e) {
                e = e as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(e));
                if (e.code === 801) {
                    done();
                } else {
                    expect(e.code).assertEqual(1300002);
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFWINDOWWILLCLOSE_001
         * @tc.name      testOffWindowWillClose001
         * @tc.desc      Test offWindowWillClose function with callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffWindowWillClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOffWindowWillClose001';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();

                const callback1 = () => {
                    // ...
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = true;
                        resolve(result);
                    });
                }

                const callback2 = () => {
                    // ...
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = false;
                        resolve(result);
                    });
                }

                windowClass.onWindowWillClose(callback1);
                windowClass.onWindowWillClose(callback2);
                hilog.info(domain, tag, msgStr + 'onWindowWillClose registered 2 callbacks');

                windowClass.offWindowWillClose(callback1);
                hilog.info(domain, tag, msgStr + 'offWindowWillClose with callback1 success');

                windowClass.offWindowWillClose(callback2);
                hilog.info(domain, tag, msgStr + 'offWindowWillClose with callback2 success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number    SUB_WINDOW_PC_STATIC_OFFWINDOWWILLCLOSE_002
         * @tc.name      testOffWindowWillClose002
         * @tc.desc      Test offWindowWillClose function without callback.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testOffWindowWillClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: () => void): void => {
            let caseName: string = 'testOffWindowWillClose002';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');

            try {
                let windowClass: window.Window = windowStage!.getMainWindowSync();

                const callback = () => {
                    // ...
                    return new Promise<boolean>((resolve, reject) => {
                        // 是否关闭该窗口
                        let result: boolean = false;
                        resolve(result);
                    });
                }

                windowClass.onWindowWillClose(callback);
                hilog.info(domain, tag, msgStr + 'onWindowWillClose registered success');

                windowClass.offWindowWillClose();
                hilog.info(domain, tag, msgStr + 'offWindowWillClose without callback success');

                done();
            } catch (error) {
                error = error as BusinessError;
                hilog.error(domain, tag, msgStr + 'Failed. Cause:' + JSON.stringify(error.code) + JSON.stringify(error));
                if (error.code === 801) {
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

    })
}
