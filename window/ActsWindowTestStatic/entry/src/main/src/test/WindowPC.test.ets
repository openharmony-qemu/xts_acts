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
import settings from '@ohos.settings';
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowPCTest() {

    describe("WindowPCTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPCTest describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
        let isPCStatus: string = '';
        let isFreeWindowMode = false;
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                win = windowStage.getMainWindowSync();
                isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
                //isPCStatus == '' 非PC设备
                //isPCStatus == '1' PC设备状态栏dock未融合
                //isPCStatus == '0' PC设备状态栏dock融合
                hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
                isFreeWindowMode = win.isInFreeWindowMode();
                //isFreeWindowMode == true 自由窗口模式
                //isFreeWindowMode == false 非自由窗口模式
                hilog.info(domain, tag,`isFreeWindowMode: ${isFreeWindowMode}`);
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
        })

        /**
         * @tc.number       testRecoverPromiseErrCode1300002_0100
         * @tc.name         testRecoverPromiseErrCode1300002_static_0100
         * @tc.desc         testRecoverPromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testRecoverPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testRecoverPromiseErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testRecoverPromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        (subWin! as window.Window).recover().then(async () => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling recover.');
                            expect(false).assertTrue();
                        }).catch((err: BusinessError):Promise<void>  => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call recover. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300002);
                        });
                        done()
                    } catch (exception: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call recover. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                .catch((err: BusinessError):Promise<void> => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
         * @tc.name        testRecover_static_0100
         * @tc.desc        test the function of Recover
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testRecover_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let msgStr:string = 'testRecover_static_0100';
            hilog.info(0x0000, '[ANI]',msgStr + ' begin');
            try {
                let wnd = await windowStage.getMainWindow();
                hilog.info(0x0000, '[ANI]',msgStr + ' window.getMainWindow wnd: ' + wnd);
                let promise = wnd.recover();
                promise.then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in recovering the window.');
                    expect(true).assertTrue()
                    done();
                }).catch((err: BusinessError):Promise<void> => {
                    if (err!.code == 801 || err!.code == 1300001) {
                        hilog.info(0x0000, '[ANI]',msgStr + ' The current device type does not support calling recover or recover not support ')
                        expect(true).assertTrue()
                        done();
                    } else {
                        hilog.error(0x0000, '[ANI]',msgStr + ' Failed to recover the window. 03Cause: ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to testRecover. 04Cause: ' + JSON.stringify(err))
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number     SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0100
         * @tc.name       testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow_Static
         * @tc.desc       验证子窗销毁后调用接口报1300002
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level2
         */
        it('testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithDestoryedSubWindow');
            await windowClass.destroyWindow();
            try {
                if( isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        expect(false).assertTrue();
                        done();
                    }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(1300002);
                        expect(err.message).assertTrue();
                        done();
                    })
                } else {
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                if(err.code == 801){
                    expect(err.message).assertTrue();
                    done();
                } else{
                    expect(err.code).assertEqual(1300002);
                    expect(err.message).assertTrue();
                    done();
                }
            }
        })


        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0200
         * @tc.name      testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow_Static
         * @tc.desc      验证主窗/dialog窗/float/接口报1300004
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level2
         */
        it('testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithUnsupportedWindow_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            if (isFreeWindowMode == true) {
                // 主窗
                try {
                    let mainWindow:window.Window = windowStage.getMainWindowSync();
                    await mainWindow.setRelativePositionToParentWindowEnabled(true);
                    hilog.info(domain, tag,caseName + 'main window succeed in calling setRelativePositionToParentWindowEnabled');
                    expect(false).assertTrue();
                    done();
                } catch (err: BusinessError) {
                    hilog.error(domain, tag,`${caseName} failed main window, err: ${JSON.stringify(err)}`);
                    if (err.code === 801) {
                        expect(err.message).assertTrue();
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        expect(err.message).assertTrue();
                    }
                }
                // dilog窗
                let config: window.Configuration = {
                    name: "dialogWindow",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                let windowClass2:window.Window = await window.createWindow(config);
                try {
                    await windowClass2.setRelativePositionToParentWindowEnabled(true);
                    hilog.info(domain, tag,caseName + 'dialog window succeed in calling setRelativePositionToParentWindowEnabled');
                    expect(false).assertTrue();
                    await windowClass2.destroyWindow();
                    done();
                } catch (err: BusinessError) {
                    hilog.error(domain, tag,`${caseName} failed dialog window, err: ${JSON.stringify(err)}`);
                    await windowClass2.destroyWindow();
                    if(err.code == 801){
                        expect(err.message).assertTrue();
                        done();
                    } else{
                        expect(err.code).assertEqual(1300004);
                        expect(err.message).assertTrue();
                    }
                }

                // 悬浮窗
                let config2: window.Configuration = {
                    name: "floatWindow",
                    windowType: window.WindowType.TYPE_FLOAT,
                    ctx: context
                };
                let subWindowClass: window.Window;
                hilog.info(domain, tag,`${caseName} Succeeded in creating the float window.`);
                try {
                    window.createWindow(config2).then((data:window.Window) => {
                        subWindowClass = data;
                        await subWindowClass.setRelativePositionToParentWindowEnabled(true);
                        hilog.info(domain, tag,caseName + 'float window succeed in calling setRelativePositionToParentWindowEnabled');
                        await subWindowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,`${caseName} Failed float window. Cause code: ${err.code}, message: ${err.message}`);
                        await subWindowClass.destroyWindow();
                        if (err.code === 801) {
                            expect(err.message!=null).assertTrue();
                            done();
                        } else {
                            expect(err.code).assertEqual(1300004);
                            expect(err.message!=null).assertTrue();
                            done();
                        }
                    });
                } catch (e: BusinessError) {
                    hilog.error(domain, tag,`${caseName} Failed2 float window. Cause: ${JSON.stringify(e)}`);
                    await subWindowClass.destroyWindow();
                    expect(false).assertTrue();
                    done()
                }
            } else {
                done()
            }
        })


        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0400
         * @tc.name      testSetRelativePositionToParentWindowEnabled_Static
         * @tc.desc      验证子窗设置enable=true，子窗和主窗左上角重合
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowEnabled_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabled_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabled');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(mainTop).assertEqual(subTop);
                        expect(mainLeft).assertEqual(subLeft);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError) :PromiseLike<void>|undefined=> {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0500
         * @tc.name      testSetRelativePositionToParentWindowUnEnabled_Static
         * @tc.desc      验证子窗设置enable=false，子窗和主窗左上角不重合
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowUnEnabled_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowUnEnabled_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowUnEnabled');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(false).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        expect(Math.abs(mainWindowProperties.windowRect.left-subWindowProperties.windowRect.left)).assertLarger(0);
                        expect(Math.abs(mainWindowProperties.windowRect.top-subWindowProperties.windowRect.top)).assertLarger(0);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number  SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0600
         * @tc.name    testSetRelativePositionToParentWindowEnabledwithAnchorTopStart_Static
         * @tc.desc    验证子窗设置enable=true，anchor=TOP_START，子窗位于主窗左上角
         * @tc.size    MediumTest
         * @tc.type    Function
         * @tc.level   Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorTopStart_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorTopStart_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTopStart');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(mainTop).assertEqual(subTop);
                        expect(mainLeft).assertEqual(subLeft);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0700
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorTop_Static
         * @tc.desc     验证子窗设置enable=true，anchor=TOP，子窗位于主窗上边界横向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorTop_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorTop_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTop');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(mainTop).assertEqual(subTop);
                        expect(Math.abs(mainLeft - subLeft)).assertEqual(Math.abs((mainWidth + mainLeft)-(subWidth + subLeft)));
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0800
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd_Static
         * @tc.desc     验证子窗设置enable=true，anchor=TOP_END，子窗位于主窗右上角
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorTopEnd');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_END).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(mainTop).assertEqual(subTop);
                        expect(Math.abs((mainLeft + mainWidth)-(subLeft + subWidth))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_0900
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorStart_Static
         * @tc.desc     验证子窗设置enable=true，anchor=START，子窗位于主窗左边界纵向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorStart_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorStart_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorStart');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.START).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(mainLeft).assertEqual(subLeft);
                        expect(Math.abs((subTop+subHeight/2)-(mainTop+mainHeight/2))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1000
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorCenter_Static
         * @tc.desc     验证子窗设置enable=true，anchor=CENTER，子窗位于主窗窗口横向和纵向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorCenter_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorCenter_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorCenter');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.CENTER).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        windowClass.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(Math.abs((mainLeft + mainWidth/2))-(subLeft+subWidth/2)).assertLessOrEqual(1)
                        expect(Math.abs((subTop+subHeight/2)-(mainTop+mainHeight/2))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1100
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorEnd_Static
         * @tc.desc     验证子窗设置enable=true，anchor=END，子窗位于主窗右边界纵向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorEnd_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorEnd_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorEnd');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.END).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(Math.abs((mainLeft + mainWidth)-(subLeft + subWidth))).assertLessOrEqual(1);
                        expect(Math.abs((mainTop + mainHeight/2)-(subTop+subHeight/2))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1200
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart_Static
         * @tc.desc     验证子窗设置enable=true，anchor=BOTTOM_START，子窗位于主窗左下角
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottomStart');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM_START).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(mainLeft).assertEqual(subLeft);
                        expect( Math.abs((mainHeight + mainTop)-(subHeight + subTop))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1300
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithAnchorBottom_Static
         * @tc.desc     验证子窗设置enable=true，anchor=BOTTOM，子窗位于主窗下边界横向居中点
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorBottom_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottom_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottom');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(Math.abs((mainLeft + mainWidth/2)-(subLeft+subWidth/2))).assertLessOrEqual(1);
                        expect(Math.abs((mainHeight + mainTop)-(subHeight + subTop))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1400
         * @tc.name      testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd_Static
         * @tc.desc      验证子窗设置enable=true，anchor=BOTTOM，子窗位于主窗下边界横向右顶点
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithAnchorBottomEnd');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.BOTTOM_END).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(Math.abs((mainWidth + mainLeft)-(subWidth + subLeft))).assertLessOrEqual(1);
                        expect(Math.abs((mainHeight + mainTop)-(subHeight + subTop))).assertLessOrEqual(1);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1500
         * @tc.name      testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY_Static
         * @tc.desc      验证offsetX为正，offsetY为正可以设置成功
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level0
         */
        it('testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithOffsetXOffSetY');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, 100, 100).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left+20,windowRect.top-20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(subLeft).assertEqual(mainLeft + 100);
                        expect(subTop).assertEqual(mainTop + 100);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1600
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY_Static
         * @tc.desc     验证offsetX为正，offsetY为负可以设置成功
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level1
         */
        it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetY');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, 100, -100).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(subLeft).assertEqual(mainLeft + 100);
                        expect(subTop).assertEqual(Math.abs(mainTop - 100));
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1700
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX_Static
         * @tc.desc     验证offsetX为负，offsetY为正可以设置成功
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level1
         */
        it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetX');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, -100, 100).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(subLeft).assertEqual(Math.abs(mainLeft - 100));
                        expect(subTop).assertEqual(mainTop + 100);
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number   SUB_BASIC_WMS_SETRELATIVEPOSITIONTOPARENTWINDOWENALBED_Static_1800
         * @tc.name     testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY_Static
         * @tc.desc     验证offsetX为负，offsetY为负可以设置成功
         * @tc.size     MediumTest
         * @tc.type     Function
         * @tc.level    Level1
         */
        it('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            const caseName:string = 'testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY_Static';
            hilog.info(domain, tag,caseName + 'begin.');
            let mainWindow:window.Window = windowStage.getMainWindowSync();
            let windowClass:window.Window = await windowStage.createSubWindow('testSetRelativePositionToParentWindowEnabledwithNegativeOffsetXOffsetY');
            await windowClass.setUIContent('pages/index2');
            await windowClass.showWindow();
            windowClass.resizeAsync(1000,1000)
            await Utils.msSleep(1000);
            try {
                if(isFreeWindowMode == true) {
                    windowClass.setRelativePositionToParentWindowEnabled(true, window.WindowAnchor.TOP_START, -100, -100).then(() => {
                        hilog.info(domain, tag,caseName + 'Succeed in calling setRelativePositionToParentWindowEnabled');
                        let windowRect = mainWindow.getWindowProperties().windowRect;
                        hilog.info(domain, tag,`${caseName} mainWindowProperties1: ${JSON.stringify(windowRect)}`);
                        mainWindow.moveWindowToAsync(windowRect.left-20,windowRect.top+20)
                        await Utils.msSleep(1000)
                        let mainWindowProperties = mainWindow.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} mainWindowProperties: ${JSON.stringify(mainWindowProperties)}`);
                        let subWindowProperties = windowClass.getWindowProperties();
                        hilog.info(domain, tag,`${caseName} subWindowProperties: ${JSON.stringify(subWindowProperties)}`);
                        let mainLeft = mainWindowProperties.windowRect.left;
                        let mainTop = mainWindowProperties.windowRect.top;
                        let mainWidth = mainWindowProperties.windowRect.width;
                        let mainHeight = mainWindowProperties.windowRect.height;
                        let subLeft = subWindowProperties.windowRect.left;
                        let subTop = subWindowProperties.windowRect.top;
                        let subWidth = subWindowProperties.windowRect.width;
                        let subHeight = subWindowProperties.windowRect.height;
                        expect(subLeft).assertEqual(Math.abs(mainLeft - 100));
                        expect(subTop).assertEqual(Math.abs(mainTop - 100));
                        await windowClass.destroyWindow();
                        done();
                    }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.error(domain, tag,caseName + `Failed. Cause code: ${err.code}, message: ${err.message}`);
                        await windowClass.destroyWindow();
                        expect(false).assertTrue();
                        done();
                    })
                } else {
                    await windowClass.destroyWindow();
                    done();
                }
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName} failed, err: ${JSON.stringify(err)}`);
                await windowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if(err.code == 801){
                    done();
                } else{
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0100
         * @tc.name        testSetDragKeyFramePolicy_EnableWithDefaultValue_Static
         * @tc.desc        Test the function when enable with default value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_EnableWithDefaultValue_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_EnableWithDefaultValue_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true
            };
            try {
                let windowClass: window.Window = windowStage.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(ret.enable).assertEqual(keyFramePolicy.enable);
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0200
         * @tc.name        testSetDragKeyFramePolicy_EnableWithNotDefaultValue_Static
         * @tc.desc        Test the function when enable with not default value_Static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_EnableWithNotDefaultValue_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_EnableWithNotDefaultValue_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true,
                interval: 200,
                distance: 2000,
                animationDuration: 200,
                animationDelay: 200
            };
            try {
                let windowClass: window.Window = windowStage.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(ret.enable).assertEqual(keyFramePolicy.enable);
                    expect(ret.interval).assertEqual(keyFramePolicy.interval);
                    expect(ret.distance).assertEqual(keyFramePolicy.distance);
                    expect(ret.animationDuration).assertEqual(keyFramePolicy.animationDuration);
                    expect(ret.animationDelay).assertEqual(keyFramePolicy.animationDelay);
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0400
         * @tc.name        testSetDragKeyFramePolicy_NegativeValueFail_Static
         * @tc.desc        Test the function when failed with negative value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_NegativeValueFail_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_NegativeValueFail_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true,
                interval: -200,
                distance: -2000,
                animationDuration: -200,
                animationDelay: -200
            };
            try {
                let windowClass: window.Window = windowStage.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(1300016);
                expect(err.message!=null).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0500
         * @tc.name        testSetDragKeyFramePolicy_ZeroValueFail_Static
         * @tc.desc        Test the function when failed with zero value
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_ZeroValueFail_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_ZeroValueFail_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true,
                interval: 0,
                distance: 0,
                animationDuration: 0,
                animationDelay: 0
            };
            try {
                let windowClass: window.Window = windowStage.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(1300016);
                expect(err.message!=null).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0600
         * @tc.name        testSetDragKeyFramePolicy_SubWindowFail_Static
         * @tc.desc        Test the function when failed with subWindow
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_SubWindowFail_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_SubWindowFail_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true
            };
            let subWindowClass: window.Window | undefined = await windowStage.createSubWindow(message);
            if (subWindowClass === undefined) {
                hilog.error(domain, tag,`${message} Fail to createSubWindow`);
                expect(false).assertTrue();
                done();
                return;
            }
            try {
                subWindowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            } finally {
                await Utils.msSleep(1000);
                await subWindowClass.destroyWindow();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0700
         * @tc.name        testSetDragKeyFramePolicy_1300002_Static
         * @tc.desc        Test the function when failed with 1300002
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testSetDragKeyFramePolicy_1300002_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_1300002_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: true
            };
            let subWindowClass: window.Window | undefined = await windowStage.createSubWindow(message);
            if (subWindowClass === undefined) {
                hilog.error(domain, tag,`${message} Fail to createSubWindow`);
                expect(false).assertTrue();
                done();
                return;
            }
            try {
                await subWindowClass.destroyWindow();
                await Utils.msSleep(500);
                subWindowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(false).assertTrue();
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(err.code).assertEqual(1300002);
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      testSetDragKeyFramePolicy_Static_0800
         * @tc.name        testSetDragKeyFramePolicy_Disable_Static
         * @tc.desc        Test the function when disable
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       LEVEL0
         */
        it('testSetDragKeyFramePolicy_Disable_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            const message:string = 'testSetDragKeyFramePolicy_Disable_Static';
            hilog.info(domain, tag,message + ' begin.');
            if (isPCStatus != '') {
                hilog.info(domain, tag,`${message} not pc, skip`);
                expect(true).assertTrue();
                done();
                return;
            }
            let keyFramePolicy: window.KeyFramePolicy = {
                enable: false
            };
            try {
                let windowClass: window.Window = windowStage.getMainWindowSync();
                windowClass.setDragKeyFramePolicy(keyFramePolicy).then((ret: window.KeyFramePolicy) => {
                    hilog.info(domain, tag,`${message} Succeeded in setting key frame: ${JSON.stringify(ret)}`);
                    expect(ret.enable).assertEqual(keyFramePolicy.enable);
                    done();
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${message} Failed to set key frame, error: ${JSON.stringify(err)}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code == 801) {
                        hilog.info(domain, tag,`${message} Capability not supported. Failed to call the API due to limited device capabilities.`);
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }

                });
           } catch (err: BusinessError) {
                hilog.error(domain, tag,`${message} Failed with error: ${JSON.stringify(err)}`);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SET_WINDOW_SHADOW_ENABLED_WITH_DESTROYED_SUBWINDOW_Static
         * @tc.name        testSetWindowShadowEnabledwithDestroyedSubwindow_Static
         * @tc.desc        验证setWindowShadowEnabled接口抛1300002错误码
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testSetWindowShadowEnabledwithDestroyedSubwindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let CaseName:string = 'testSetWindowShadowEnabledwithDestroyedSubwindow_Static';
            let subWindow:window.Window = await windowStage.createSubWindow('testSetWindowShadowEnabledwithDestroyedSubwindow');
            await Utils.msSleep(200);
            await subWindow.destroyWindow();
            try {
                let promise = subWindow.setWindowShadowEnabled(false);
                promise.then(()=>{
                    hilog.info(domain, tag,CaseName + ' setWindowShadowEnabled success ');
                    expect(false).assertTrue();
                    done();
                }).catch((err:BusinessError):PromiseLike<void>|undefined=>{
                    hilog.error(domain, tag,CaseName + ' failed,caused: err.code '+err.code +' ,err.message: '+err.message);
                    expect(err.code).assertEqual(1300002);
                    expect(err.message!=null).assertTrue();
                    done();
                })
            }catch (err:BusinessError) {
                hilog.error(domain, tag,CaseName + ' failed, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number       SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_Static_0100
         * @tc.name         testSetWindowShadowEnabledwithPermission_Static
         * @tc.desc         验证非2in1设备调用接口报801，2in1设备调用成功
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 0
         */
        it('testSetWindowShadowEnabledwithPermission_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowShadowEnabledwithPermission_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let windowClass:window.Window = windowStage.getMainWindowSync();
                windowClass.setWindowShadowEnabled(true).then(() => {
                    hilog.info(domain, tag,`${caseName} Succeeded in calling setWindowShadowEnabled.`);
                    expect(true).assertTrue()
                    done()
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    if (err.code === 801) {
                        expect(err.message!=null).assertTrue();
                        expect(true).assertTrue()
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception:BusinessError) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number       SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_Static_0300
         * @tc.name         testSetWindowShadowEnabledwithUnsupportedSubwindow_Static
         * @tc.desc         验证子窗调用接口报1300004
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 2
         */
        it('testSetWindowShadowEnabledwithUnsupportedSubwindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowShadowEnabledwithUnsupportedSubwindow_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            let windowClass:window.Window = await windowStage.createSubWindow('testSetWindowShadowEnabledwithUnsupportedSubwindow');
            try {
                windowClass.setWindowShadowEnabled(true).then(() => {
                    hilog.info(domain, tag,`${caseName} Succeeded in calling setWindowShadowEnabled.`);
                    await windowClass.destroyWindow()
                    expect(false).assertTrue();
                    done()
                }).catch(async (err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    await windowClass.destroyWindow()
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        expect(true).assertTrue()
                        done();
                    } else {
                        expect(err.code).assertEqual(1300004);
                        done();
                    }
                });
            } catch (exception: BusinessError) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                await windowClass.destroyWindow()
                expect(false).assertTrue();
                done();
            }
        })


    })

}