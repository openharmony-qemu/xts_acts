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
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

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
                windowStage = AppStorage.get<window.WindowStage>('windowStage',Type.from<window.WindowStage>()) as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow',Type.from<window.Window>()) as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context',Type.from<common.UIAbilityContext>()) as common.UIAbilityContext;
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
         * @tc.number     : testSetWindowPrivacyModePromiseErrCode1300002_0100
         * @tc.name       : testSetWindowPrivacyModePromiseErrCode1300002_static_0100
         * @tc.desc       : testSetWindowPrivacyModePromiseErrCode1300002_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
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
                    expect().assertFail();
                    done()
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done()
                });

            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect().assertFail();
                done()
            }
        })
        /**
         * @tc.number     : testSetWindowPrivacyModeCallbackErrCode1300002_0100
         * @tc.name       : testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
         * @tc.desc       : testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
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
                        expect().assertFail();
                        done();
                    }

                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect().assertFail();
                done()
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2910
         * @tc.name      : testIsWindowSupportWideGamut_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : Check whether the current window supports the wide color gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
                    expect().assertFail();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2920
         * @tc.name      : testIsWindowSupportWideGamut_WindowStateAbnormal_Promise_static_0100
         * @tc.desc      : Check whether the current window supports the wide color gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
                    expect().assertFail();
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2940
         * @tc.name      : testSetWindowColorSpace_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
                    expect().assertFail();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done()
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2950
         * @tc.name      : testSetWindowColorSpace_WindowStateAbnormal_Promise_static_0200
         * @tc.desc      : Set the current window to wide gamut mode or default gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
                await (win as window.Window).setWindowColorSpace(window.ColorSpace.WIDE_GAMUT).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting window colorspace.');
                    expect().assertFail();
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2960
         * @tc.name      : testSetWindowBackgroundColor_WindowStateAbnormal_static_0100
         * @tc.desc      : Set the background color of the window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
                expect().assertFail();
                done();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002)
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3010
         * @tc.name      : testSetWindowKeepScreenOn_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : Set whether the screen is steady on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
                    expect().assertFail();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1740
         * @tc.name      : testSetWindowKeepScreenOn_Window_State_Abnorma_static_0200
         * @tc.desc      : Set whether the screen is steady on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level4
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
                    expect().assertFail();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the screen to be always on. catch Cause: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        })



    })

}