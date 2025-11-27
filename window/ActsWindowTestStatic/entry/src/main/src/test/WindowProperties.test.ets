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
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
        let want: Want = {
            bundleName: "com.example.helloworld",
            abilityName: 'StartAbility'
        };
        if (options) {
            context.startAbility(want, options).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        } else {
            context.startAbility(want).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        }
        await Utils.msSleep(1000)
        let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        resolve(windowStageStart);
    })
}
async function terminateAbility(caseName: string) {
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    try {
        if (pageContext !== null && pageContext !== undefined) {
            hilog.info(domain, tag,`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            hilog.info(domain, tag,`${caseName} terminateSelf success`);
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
            hilog.error(domain, tag,`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e: BusinessError) {
        hilog.error(domain, tag,`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function WindowPropertiesTest() {

    describe("WindowPropertiesTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPropertiesTest describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
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

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
        })

        /**
         * @tc.number       testSetWindowPrivacyModePromiseErrCode1300002_0100
         * @tc.name         testSetWindowPrivacyModePromiseErrCode1300002_static_0100
         * @tc.desc         testSetWindowPrivacyModePromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowPrivacyModePromiseErrCode1300002_static_0100', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowPrivacyModePromiseErrCode1300002_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let win: window.Window = await windowStage.createSubWindow('testSetWindowPrivacyModePromiseErrCode1300002_static_0100');
            await win.destroyWindow();
            try {
                win!.setWindowPrivacyMode(true).then(async () => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowPrivacyMode.');
                    expect(false).assertTrue();
                    done()
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });

            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number       testSetWindowPrivacyModeCallbackErrCode1300002_0100
         * @tc.name         testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
         * @tc.desc         testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowPrivacyModeCallbackErrCode1300002_static_0200', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowPrivacyModeCallbackErrCode1300002_static_0200";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let win: window.Window = await windowStage.createSubWindow('testSetWindowPrivacyModeCallbackErrCode1300002_static_0200');
            await win.destroyWindow();
            try {
                win!.setWindowPrivacyMode(false,(err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(err));
                        expect(errCode).assertEqual(1300002);
                        done()
                    }else{
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowPrivacyMode.');
                        expect(false).assertTrue();
                        done();
                    }

                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2910
         * @tc.name        testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Check whether the current window supports the wide color gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testIsWindowSupportWideGamut_WindowStateAbnormal_Callback');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).isWindowSupportWideGamut((err: BusinessError<void>|null, data:Boolean|undefined):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002)
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in checking whether the window support WideGamut Data: ' + JSON.stringify(data));
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2920
         * @tc.name        testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100
         * @tc.desc        Check whether the current window supports the wide color gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testIsWindowSupportWideGamut_WindowStateAbnormal_Promise');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                await (win as window.Window).isWindowSupportWideGamut().then((data:boolean) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in checking whether the window support WideGamut. Data: ' + JSON.stringify(data));
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002)
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to load the content. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2940
         * @tc.name        testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Set the current window to wide gamut mode or default gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testSetWindowColorSpace_WindowStateAbnormal_Callback');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).setWindowColorSpace(window.ColorSpace.WIDE_GAMUT, (err: BusinessError<void>|null) :void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002)
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting window colorspace.');
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2950
         * @tc.name        testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200
         * @tc.desc        Set the current window to wide gamut mode or default gamut mode
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testSetWindowColorSpace_WindowStateAbnormal_Promise');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                await (win as window.Window).setWindowColorSpace(window.ColorSpace.DEFAULT).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting window colorspace.');
                    expect(false).assertTrue();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002)
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2960
         * @tc.name        testSetWindowBackgroundColor_WindowStateAbnormal_static_0100
         * @tc.desc        Set the background color of the window
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowBackgroundColor_WindowStateAbnormal_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testSetWindowBackgroundColor_WindowStateAbnormal_static_0100';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testSetWindowBackgroundColor_WindowStateAbnormal');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            let color: string = '#00ff33';
            try {
                (win as window.Window).setWindowBackgroundColor(color);
                expect(false).assertTrue();
                done();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3010
         * @tc.name        testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100
         * @tc.desc        Set whether the screen is steady on
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testSetWindowKeepScreenOn_WindowStateAbnormal_Callback');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).setWindowKeepScreenOn(true, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting the screen to be always on');
                    expect(false).assertTrue();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1740
         * @tc.name        testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200
         * @tc.desc        Set whether the screen is steady on
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let windowClass: window.Window;
            windowClass = await windowStage.createSubWindow('testSetWindowKeepScreenOn_Window_State_Abnorma');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!windowClass).assertTrue();
            await (windowClass as window.Window).destroyWindow();
            try {
                (windowClass as window.Window).setWindowKeepScreenOn(true).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting the screen to be always on.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. catch Cause: ' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        })
/**
         * @tc.number      SUB_BASIC_WMS_GET_WINDOW_PROPERTIES_0100
         * @tc.name        test_getWindowProperties_mainWindow_static_0100
         * @tc.desc        test_getWindowProperties_mainWindow_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('test_getWindowProperties_mainWindow_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_getWindowProperties_mainWindow_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let mainWindow : window.Window= windowStage.getMainWindowSync();
                await Utils.msSleep(300);
                let properties:window.WindowProperties = mainWindow.getWindowProperties();
                hilog.info(0x0000, '[ANI]',`${caseName} :Succeeded in ogetWindowProperties info. Data: ` + JSON.stringify(properties));
                expect(properties.windowRect.left).assertLargerOrEqual(0);
                expect(properties.windowRect.top).assertLargerOrEqual(0);
                expect(properties.windowRect.width).assertLarger(0);
                expect(properties.windowRect.height).assertLarger(0);
                expect(properties.drawableRect.left).assertLargerOrEqual(0);
                expect(properties.drawableRect.top).assertLargerOrEqual(0);
                expect(properties.drawableRect.width).assertLarger(0);
                expect(properties.drawableRect.height).assertLarger(0);
                expect(properties.isLayoutFullScreen).assertEqual(false);
                expect(properties.focusable).assertEqual(true);
                expect(properties.touchable).assertEqual(true);
                expect(properties.brightness).assertEqual(-1);
                expect(properties.isKeepScreenOn).assertEqual(false);
                expect(properties.isPrivacyMode).assertEqual(false);
                expect(properties.isTransparent).assertEqual(false);
                expect(properties.isFullScreen).assertEqual(false);
                expect(properties.id).assertLarger(0);
                expect(properties.displayId).assertLargerOrEqual(0);
                expect(properties.name != null ).assertTrue();
                // expect(properties.dimBehindValue != null ).assertTrue();
                // expect(properties.isRoundCorner != null ).assertTrue();
                expect(properties.type != null ).assertTrue();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, '[ANI]',`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();

            }

        });

        /**
         * @tc.number      SUB_BASIC_WMS_GET_WINDOW_PROPERTIES_0200
         * @tc.name        test_getWindowProperties_mainWindow_static_0200
         * @tc.desc        test_getWindowProperties_mainWindow_static_0200
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level4
         */
        it('test_getWindowProperties_mainWindow_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_getWindowProperties_mainWindow_static_0200';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let tempWnd: window.Window = await windowStage.createSubWindow('testLoadContent_Callback_static_0200');
            await tempWnd.destroyWindow();
            try {
                tempWnd.getWindowProperties();
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.getWindowProperties: ' + tempWnd);
                expect(false).assertTrue()
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
                if (exception.code == 1300002) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number       testOnDisplayIdChangeErrCode1300002_0100
         * @tc.name         testOnDisplayIdChangeErrCode1300002_static_0100
         * @tc.desc         testOnDisplayIdChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnDisplayIdChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnKeyboardDidHideErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOnDisplayIdChangeErrCode1300002_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.onDisplayIdChange((id) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(id));
                });
                hilog.info(domain, tag,msgStr + 'window.on_keyboardDidHide success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception.code == 1300002 || exception.code == 801).assertTrue();
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })


        /**
         * @tc.number       testOffDisplayIdChangeErrCode1300002_0100
         * @tc.name         testOffDisplayIdChangeErrCode1300002_static_0100
         * @tc.desc         testOffDisplayIdChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffDisplayIdChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffDisplayIdChangeErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOffDisplayIdChangeErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.offDisplayIdChange((id) => {
                    console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(id));
                });
                hilog.info(domain, tag,msgStr + 'window.on_keyboardDidHide success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                expect(exception.code == 1300002 || exception.code == 801).assertTrue();
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })
        /**
         * @tc.number       testOnWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.name         testOnWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.desc         testOnWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnWindowVisibilityChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnWindowVisibilityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window
            await windowStage.createSubWindow('testOnWindowVisibilityChangeErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.on("windowVisibilityChange", (res: boolean) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on windowVisibilityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e:BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call on windowVisibilityChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number       testOffWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.name         testOffWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.desc         testOffWindowVisibilityChangeErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffWindowVisibilityChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOffWindowVisibilityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window
            windowStage.createSubWindow('testOnWindowVisibilityChangeErrCode1300002_SubWindow_Promise')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.off("windowVisibilityChange", (res: boolean) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on windowVisibilityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e:BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call on windowVisibilityChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002);
                    done()
                });

        })
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0100
         * @tc.name        testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100
         * @tc.desc        Enable this window to listen for status change events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
            async (done: () => void): Promise<void> => {
                let caseName: string = 'testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100';
                let msgStr: string = 'jsUnittest ' + caseName + ' ';
                hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
                let win: window.Window
                windowStage.createSubWindow('testWindowOffWindowVisibilityChange_UnregisteredOff_static_0100')
                    .then((data:window.Window)=>{
                        win = data;
                        expect(!!win).assertTrue();
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                        try {
                            (win as window.Window).offWindowVisibilityChange();
                            await (win as window.Window).destroyWindow();
                            expect(true).assertTrue();
                            done();
                        } catch (exception:BusinessError) {
                            await (win as window.Window).destroyWindow();
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' +
                            JSON.stringify(exception));
                            expect(false).assertTrue();
                            done();
                        }
                    })
                    .catch((err: BusinessError):PromiseLike<void>|undefined => {
                        hilog.info(0x0000, '[ANI]',
                            msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                        expect(false).assertTrue();
                        done();
                    });
                
            });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0200
         * @tc.name        testWindowOffWindowVisibilityChange_RepeatOff_static_0200
         * @tc.desc        Enable this window to listen for status change events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testWindowOffWindowVisibilityChange_RepeatOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testWindowOffWindowVisibilityChange_RepeatOff_static_0200';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let win: window.Window
            windowStage.createSubWindow('testWindowOffWindowVisibilityChange_RepeatOff_static_0200')
                .then((data:window.Window)=>{
                    win = data;
                    expect(!!win).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    try {
                        (win as window.Window).onWindowVisibilityChange((flag:boolean) => {
                            hilog.info(0x0000, '[ANI]', msgStr + 'Window visibility changed, isVisible=' + flag);
                        });
                    } catch (exception:BusinessError) {
                        if (exception!.code != 801) {
                            hilog.error(0x0000, '[ANI]','Failed to register callback. Cause: ' + JSON.stringify(exception));
                            expect(false).assertTrue();
                            done();
                        } else {
                            hilog.info(0x0000, '[ANI]','Failed to register callback. Cause: ' + JSON.stringify(exception));
                            hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                            expect(exception.code).assertEqual(801);
                            // done();
                        }
                    }
                    try {
                        (win as window.Window).offWindowVisibilityChange();
                    } catch (exception:BusinessError) {
                        if (exception!.code != 801) {
                            hilog.error(0x0000, '[ANI]','Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                            expect(false).assertTrue();
                            done();
                        } else {
                            hilog.info(0x0000, '[ANI]','Failed to unregister callback. Cause: ' + JSON.stringify(exception));
                            hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                            expect(exception!.code).assertEqual(801);
                            // done();
                        }
                    }
                    try {
                        (win as window.Window).offWindowVisibilityChange();
                        await (win as window.Window).destroyWindow();
                        done();
                    } catch (exception:BusinessError) {
                        await (win as window.Window).destroyWindow();
                        console.error(msgStr + 'Failed to unregister callback Cause: ' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done();
                    }
                })
                .catch((err:BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',
                        msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done();
                });
            
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0300
         * @tc.name        testWindowVisibilityChange_on_Function_Callback_static_0100
         * @tc.desc        window type windowVisibilityChange
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testWindowVisibilityChange_on_Function_Callback_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testWindowVisibilityChange_on_Function_Callback_static_0100";
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            try {
                hilog.info(0x0000, '[ANI]', msgStr + 'try begin.');
                let windowClass:window.Window = await windowStage.getMainWindow();
                windowClass.onWindowVisibilityChange((flag:boolean) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Window visibility changed, isVisible=' + flag);
                });
                expect(true).assertTrue();
                windowClass.offWindowVisibilityChange();
                done();
            } catch (error:BusinessError) {
                hilog.info(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                if (error!.code != 801) {
                    hilog.error(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]','Failed to register callback. Cause: ' + JSON.stringify(error));
                    hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                    expect(error!.code).assertEqual(801);
                    done();
                }
            }
        });
        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_API_WINDOW_VISIBILITY_CHANGE_0400
         * @tc.name        testWindowVisibilityChange_off_Function_Callback_static_0200
         * @tc.desc        window type windowVisibilityChange
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it("testWindowVisibilityChange_off_Function_Callback_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr:string = "testWindowVisibilityChange_off_Function_Callback_static_0200";
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            try {
                hilog.info(0x0000, '[ANI]', msgStr + 'try begin.');
                let windowClass:window.Window = await windowStage.getMainWindow();
                windowClass.offWindowVisibilityChange();
                hilog.info(0x0000, '[ANI]', msgStr + 'Window visibility changed');
                expect(true).assertTrue();
                done();
            } catch (error:BusinessError) {
                hilog.info(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                if (error!.code != 801) {
                    hilog.error(0x0000, '[ANI]', msgStr + 'Failed to register callback. Cause: ' + JSON.stringify(error));
                    expect(false).assertTrue();
                    done();
                } else {
                    hilog.info(0x0000, '[ANI]','Failed to unreegister callback. Cause: ' + JSON.stringify(error));
                    hilog.info(0x0000, '[ANI]',msgStr + 'The device not support SystemCapability.Window.SessionManager');
                    expect(error!.code).assertEqual(801);
                    done();
                }
            }
        });
        /**
         * @tc.number       testOnSystemDensityChangeErrCode1300002_0100
         * @tc.name         testOnSystemDensityChangeErrCode1300002_static_0100
         * @tc.desc         testOnSystemDensityChangeErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOnSystemDensityChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnSystemDensityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window
            windowStage.createSubWindow('testOnSystemDensityChangeErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.onSystemDensityChange((res: number) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr +'Succeeded in calling on systemDensityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e:BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr +'Failed to call on systemDensityChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number       testOffSystemDensityChangeErrCode1300002_0100
         * @tc.name         testOffSystemDensityChangeErrCode1300002_static_0100
         * @tc.desc         testOffSystemDensityChangeErrCode1300002_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testOffSystemDensityChangeErrCode1300002_static_0100', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName:string = "testOffSystemDensityChangeErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let subWin: window.Window
            windowStage.createSubWindow('testOffSystemDensityChangeErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.offSystemDensityChange((res: number) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr +'Succeeded in calling off systemDensityChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e:BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr +'Failed to call off systemDensityChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })

        /**
         * @tc.number      SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1200
         * @tc.name        testOnSetCustomDensity1_static_0100
         * @tc.desc        off systemDensityChange event
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level3
         */
        it('testOnSetCustomDensity1_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName: string = 'testOnSetCustomDensity1_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]', msgStr + 'begin.');
            let g_flag: number = 0
            let windowClass:window.Window = await windowStage.getMainWindow();
            const callback1 = (density: Double) => {
                hilog.info(0x0000, '[ANI]','System density changed, density=' + JSON.stringify(density));
                g_flag += 1
                expect(density).assertEqual(2);
            }
            const callback2 = (density: Double) => {
                hilog.info(0x0000, '[ANI]','System density changed, density=' + JSON.stringify(density));
                g_flag += 1
                expect(density).assertEqual(2);
            }
            try {
                windowClass.onSystemDensityChange(callback1);
                windowClass.onSystemDensityChange(callback2);
                hilog.info(0x0000, '[ANI]', msgStr +`Succeeded on systemDensityChange twice.`);
                windowClass.offSystemDensityChange();
                hilog.info(0x0000, '[ANI]', msgStr + `off all systemDensityChange success`);
            } catch (exception:BusinessError) {
                hilog.error(0x0000, '[ANI]', msgStr +`Failed to on systemDensityChange. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception!.code == 801) {
                    hilog.info(0x0000, '[ANI]', msgStr +`Current device not support API:setCustomDensity`);
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
            done();
        });


        

        /**
         * @tc.number       testSetWindowFocusableErrCode1300002_0100
         * @tc.name         testSetWindowFocusableErrCode1300002_static_0100
         * @tc.desc         testSetWindowFocusableErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowFocusableErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowFocusableErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testSetWindowFocusableErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.setWindowFocusable(true, (err: BusinessError | null) => {
                    hilog.info(domain, tag,msgStr + 'window setWindowFocusable callback err ：' + JSON.stringify(err));
                    expect(err?.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowFocusable. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowFocusablePromiseErrCode1300002_0100
         * @tc.name         testSetWindowFocusablePromiseErrCode1300002_static_0100
         * @tc.desc         testSetWindowFocusablePromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowFocusablePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowFocusablePromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testSetWindowFocusablePromiseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                await tempWnd.setWindowFocusable(true);
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowFocusable promise. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowTouchableErrCode1300002_0100
         * @tc.name         testSetWindowTouchableErrCode1300002_static_0100
         * @tc.desc         testSetWindowTouchableErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowTouchableErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowTouchableErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testSetWindowTouchableErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.setWindowTouchable(true, (err: BusinessError | null) => {
                    hilog.info(domain, tag,msgStr + 'window setWindowFocusable callback err ：' + JSON.stringify(err));
                    expect(err?.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowTouchable. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSetWindowTouchablePromiseErrCode1300002_0100
         * @tc.name         testSetWindowTouchablePromiseErrCode1300002_static_0100
         * @tc.desc         testSetWindowTouchablePromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSetWindowTouchablePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSetWindowTouchablePromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testSetWindowTouchablePromiseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                await tempWnd.setWindowTouchable(true);
                expect(false).assertTrue();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to setWindowTouchable promise. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number       testSnapshotErrCode1300002_0100
         * @tc.name         testSnapshotErrCode1300002_static_0100
         * @tc.desc         testSnapshotErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSnapshotErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSnapshotErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testSnapshotErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.snapshot((err: BusinessError | null, data) => {
                    if(err?.code){
                        hilog.info(domain, tag,msgStr + 'window snapshot callback err ：' + JSON.stringify(err));
                        expect(err?.code).assertEqual(1300002);
                        done();
                    }else{
                        hilog.info(domain, tag,msgStr + 'window after snapshot');
                        expect(false).assertTrue();
                        done();
                    }

                });

            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to snapshot. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })


        /**
         * @tc.number       testSnapshotPromiseErrCode1300002_0100
         * @tc.name         testSnapshotPromiseErrCode1300002_static_0100
         * @tc.desc         testSnapshotPromiseErrCode1300002_static_0100
         * @tc.size         MediumTest
         * @tc.type         Function
         * @tc.level        Level 3
         */
        it('testSnapshotPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testSnapshotPromiseErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testSnapshotPromiseErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                await tempWnd.snapshot();
                hilog.info(domain, tag,msgStr + 'window after snapshot ');
                expect(false).assertTrue();
                done();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to snapshot. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_STATUS_BAR_CONTENT_COLOR_0100
         * @tc.name        testStatusBarContentColor_static_0100
         * @tc.desc        test_statusBarContentColor_static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('testStatusBarContentColor_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_statusBarContentColor_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let a: window.SystemBarStyle = {
                    statusBarContentColor: '#ffffff'
                }
                hilog.info(0x0000, '[ANI]',msgStr + 'a:'+ JSON.stringify(a));
                expect(true).assertTrue();
                done();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr +
                    `Failed to call statusBarContentColor. Cause code: ${exception!.code}, message: ${exception!.message}`);
                expect(false).assertTrue();
                done()
            }
        });

        /**
         * @tc.number      testSetCustomDensityErrCode401_Static_0100
         * @tc.name        testSetCustomDensityErrCode401_Static_0100
         * @tc.desc        testSetCustomDensityErrCode401_Static_0100
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testSetCustomDensityErrCode401_Static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetCustomDensityErrCode401_Static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                windowStage.setCustomDensity(10.0)
                hilog.info(domain, tag,msgStr + 'Succeeded in calling setCustomDensity.');
                expect(false).assertTrue();
                hilog.info(domain, tag,msgStr + 'end.');
                done()
            } catch (e:BusinessError) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(e.code)+` message:${e.message}`);
                expect(e.message!=null).assertTrue();
                if(e.code == 801){
                    done();
                }else{
                    expect(e.code).assertEqual(401);
                    hilog.info(domain, tag,msgStr + 'end.');
                    done()
                }

            }
        })


        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_Static_0300
         * @tc.name       testSetCustomDensityParamCheck1_Static
         * @tc.desc       有效左边界校验
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      LEVEL0
         */
        it('testSetCustomDensityParamCheck1_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck1_Static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                windowStage.setCustomDensity(0.5);
                hilog.info(domain, tag,msgStr + `setCustomDensity 0.5 success`);
                done();
            } catch (exception:BusinessError) {
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_Static_0400
         * @tc.name       testSetCustomDensityParamCheck2_Static
         * @tc.desc       effective right boundary
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      LEVEL0
         */
        it('testSetCustomDensityParamCheck2_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck2_Static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                windowStage.setCustomDensity(4.0);
                hilog.info(domain, tag,msgStr + `setCustomDensity 4.0 success`);
                done();
            } catch (exception:BusinessError) {
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_Static_0500
         * @tc.name       testSetCustomDensityParamCheck5_Static
         * @tc.desc       testGetWindowDensityInfo with aruguments null
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level2
         */
        it('testSetCustomDensityParamCheck5_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_testSetCustomDensityParamCheck5_Static';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                windowStage.setCustomDensity(-2);
                hilog.info(domain, tag,msgStr + `setCustomDensity null`);
                expect(false).assertTrue();
                done();
            } catch (exception:BusinessError) {
                hilog.error(domain, tag,msgStr +
                    `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code == 801) {
                    hilog.info(domain, tag,msgStr + `Current device not support API:setCustomDensity`);
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(exception.code).assertEqual(401);
                    expect(exception.message!=null).assertTrue();
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_Static_6300
         * @tc.name       testSetDefaultDensityEnabledTrue_Static
         * @tc.desc       set window ui context
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetDefaultDensityEnabledTrue_Static',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetDefaultDensityEnabledTrue_Static';
            try {
                windowStage.setDefaultDensityEnabled(true);
                hilog.info(domain, tag,`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception: BusinessError) {
                hilog.error(domain, tag,`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    hilog.info(domain, tag,`${caseName} The current device not support to setDefaultDensityEnabled`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_Static_6400
         * @tc.name       testSetDefaultDensityEnabledFalse_Static
         * @tc.desc       set window ui context
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 3
         */
        it('testSetDefaultDensityEnabledFalse_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string= 'TestSetDefaultDensityEnabledFalse_Static';
            try {
                windowStage.setDefaultDensityEnabled(false);
                hilog.info(domain, tag,`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception: BusinessError) {
                hilog.error(domain, tag,`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code === 801) {
                    hilog.info(domain, tag,`${caseName} The current device not support to setDefaultDensityEnabled`)
                    expect(exception.message!=null).assertTrue();
                    done();
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number     SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_SUBWINDOW_Static
         * @tc.name       testSetWindowContainerColorwithUnsupportedSubwindow_Static
         * @tc.desc       验证不支持的子窗调用setwindowcontainercolor接口抛1300004错误码
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testSetWindowContainerColorwithUnsupportedSubwindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowContainerColorwithUnsupportedSubwindow_Static ';
            hilog.info(domain, tag,caseName + 'begin');
            let subWindowClass:window.Window = await windowStage.createSubWindow('testSetWindowContainerColorwithUnsupportedSubwindow');
            await Utils.msSleep(200)
            try {
                subWindowClass.setWindowContainerColor("#0099FF","#00000000");
                hilog.info(domain, tag,caseName + 'success. ');
                await subWindowClass.destroyWindow()
                expect(false).assertTrue()
                done();
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                await subWindowClass.destroyWindow();
                expect(err.message!=null).assertTrue();
                if (err.code == 801) {
                    done()
                } else {
                    expect(err.code).assertEqual(1300004);
                    done();
                }
            }
        });

        /**
         * @tc.number     SUB_BASIC_WMS_SET_WINDOW_CONTAINER_COLOR_WITH_DESTROYED_MAINWINDOW_Static
         * @tc.name       testSetWindowContainerColorwithDestroyedMainWindow_Static
         * @tc.desc       验证销毁后的主窗调用setwindowcontainercolor接口抛1300002错误码
         * @tc.size       MediumTest
         * @tc.type       Function
         * @tc.level      Level 2
         */
        it('testSetWindowContainerColorwithDestroyedMainWindow_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testSetWindowContainerColorwithDestroyedMainWindow_Static ';
            hilog.info(domain, tag,caseName + 'begin');
            let windowStageStart:window.WindowStage = await startAbility(caseName, context);
            await Utils.msSleep(200)
            let windowClass:window.Window = windowStageStart.getMainWindowSync();
            await terminateAbility(caseName)
            try {
                windowClass.setWindowContainerColor("#0099FF","#00000000");
                hilog.info(domain, tag,caseName + 'success. ');
                expect(false).assertTrue()
                done();
            } catch (err: BusinessError) {
                hilog.error(domain, tag,`${caseName}  Failed. Cause code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(1300002);
                expect(err.message!=null).assertTrue();
                done();
            }
        });


    })

}