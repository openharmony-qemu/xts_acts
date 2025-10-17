/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import screenshot from '@ohos.screenshot';
import { image } from '@kit.ImageKit';
import display from '@ohos.display';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ErrorCode201() {

    describe("ErrorCode201", (): void => {
        hilog.info(domain, tag, '%{public}s', 'ErrorCode201 describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
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
         * @tc.number     : testSetWindowPrivacyModePromiseErrCode201_0100
         * @tc.name       : testSetWindowPrivacyModePromiseErrCode201_static_0100
         * @tc.desc       : testSetWindowPrivacyModePromiseErrCode201_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetWindowPrivacyModePromiseErrCode201_static_0100', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowPrivacyModePromiseErrCode201_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let win: window.Window = windowStage.getMainWindowSync();
            try {
                win!.setWindowPrivacyMode(true).then(async () => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowPrivacyMode.');
                    expect().assertFail();
                    done()
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(201);
                    done()
                });

            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
                expect().assertFail();
                done()
            }
        })
        /**
         * @tc.number     : testSetWindowPrivacyModeCallbackErrCode201_0100
         * @tc.name       : testSetWindowPrivacyModeCallbackErrCode201_static_0200
         * @tc.desc       : testSetWindowPrivacyModeCallbackErrCode201_static_0200
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetWindowPrivacyModeCallbackErrCode201_static_0200', Level.LEVEL3,  async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowPrivacyModeCallbackErrCode201_static_0200";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let win: window.Window = windowStage.getMainWindowSync();
            try {
                win!.setWindowPrivacyMode(false,(err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(err));
                        expect(errCode).assertEqual(201);
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0010
         * @tc.name      : testCreateFloatWindowPermission_Promise_static_0100
         * @tc.desc      : create Floating window permission check
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testCreateFloatWindowPermission_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName : string = 'testCreateFloatWindowPermission_Promise';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let windowConfig: window.Configuration = {
                name: "testCreateFloatWindowPermission_Promise_static_0100",
                windowType: window.WindowType.TYPE_FLOAT,
                ctx: context,
            };
            try {
                 window.createWindow(windowConfig).then((data:window.Window) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    expect().assertFail();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to create the Window. Cause:' + JSON.stringify(err));
                    expect(err.code).assertEqual(201);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
                expect(exception.code).assertEqual(201);
                done();
            }
        })
        /**
         /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0020
         * @tc.name      : testCreateFloatWindowPermission_Callback_static_0100
         * @tc.desc      : create Floating window permission check
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testCreateFloatWindowPermission_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = 'testCreateFloatWindowPermission_Callback';
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let windowConfig: window.Configuration = {
                name: "testCreateFloatWindowPermission_Callback_static_0100",
                windowType: window.WindowType.TYPE_FLOAT,
                ctx: context,
            };
            try {
                window.createWindow(windowConfig, (err: BusinessError<void>|null, data:window.Window|undefined):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
                        expect(err!.code).assertEqual(201);
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data: ' + JSON.stringify(data));
                    expect().assertFail();
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(201);
                done()
            }
        })
        /**
         * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1200
         * @tc.name      testSetWindowTopmost201_static
         * @tc.desc      Set the window to be top most.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level3
         */
        it('testSetWindowTopmost201_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testSetWindowTopmost201_static';
            try {
                let windowClass:window.Window = windowStage.getMainWindowSync();
                windowClass.setWindowTopmost(false).then(() => {
                    hilog.info(domain, tag,caseName+'Succeeded in setting the window to be top most.' );
                    expect(true).assertTrue();
                    done();
                }).catch((err: BusinessError) :PromiseLike<void>|undefined=> {
                    hilog.error(domain, tag,`${caseName} Failed to set the window to be top most. Cause code: ${err!.code}, message: ${err!.message}`);
                    if (err!.code === 801) {
                        done();
                    } else if(err!.code === 201){
                        expect(true).assertTrue();
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception: BusinessError) {
                if (exception.code === 801) {
                    hilog.error(domain, tag,`${caseName} The current device type does not support to setWindowTopmost`);
                    done();
                } else {
                    hilog.error(domain, tag,`${caseName} Failed  to be top most. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })

        /**
         * @tc.number    SUB_BASIC_WMS_CREATE_VIRTUALSCREEN_ERRORCODE_0200
         * @tc.name      test_CreateVirtualScreen_ErrorCode201_static
         * @tc.desc      test_CreateVirtualScreen_ErrorCode201 when without permissions
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('test_CreateVirtualScreen_ErrorCode201_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_CreateVirtualScreen_ErrorCode201_static ';
            let config : display.VirtualScreenConfig = {
                name: 'screen01',
                width: 1,
                height: 2340,
                density: 2,
                surfaceId: ''
            };
            try {
                display.createVirtualScreen(config).then((screenId: Long) => {
                    hilog.info(domain, tag,caseName + 'succeeded in create virtual screen, data : ' + JSON.stringify(screenId));
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,caseName + 'failed to create the virtual screen, err : ' + JSON.stringify(err.code)+',msg:'+ JSON.stringify(err!.message));
                    expect(err!.code == 201).assertTrue();
                    expect(err!.message!=null).assertTrue();
                    done();
                })
            } catch (err: BusinessError) {
                hilog.error(domain, tag,caseName + 'error in createVirtualScreen, err : ' + JSON.stringify(err)+',msg:'+ JSON.stringify(err!.message));
                if (err!.code != 801) {
                    expect(err.message!=null).assertTrue();
                    expect(false).assertTrue();
                }
                done();
            }
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_SCREEN_SHOT_CAPTURE_ERRORCODE_static_0100
         * @tc.name      : tesScreenShot_Capture_ErrorCode201_static
         * @tc.desc      : tesScreenShot_Capture_ErrorCode201 when without permission
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('tesScreenShot_Capture_ErrorCode201_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'tesScreenShot_Capture_ErrorCode201_static';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin');
            try {
                let captureOptions: screenshot.CaptureOption = {
                    "displayId": 0
                }
                let promise = screenshot.capture(captureOptions)
                 promise.then((pixelMap: image.PixelMap) => {
                    hilog.info(domain, tag,caseName + 'Succeeded in capture')
                    expect(false).assertTrue()
                    done()
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                     hilog.info(domain, tag,caseName + 'Failed to capture, err: ' + JSON.stringify(err));
                     expect(err.code == 801 || err.code == 201).assertTrue()
                     done();
                 })
            } catch (exception: BusinessError) {
                hilog.error(domain, tag,caseName + 'Failed to pick Code: ' + JSON.stringify(exception.code)+':msg:'+ JSON.stringify(exception.message));
                expect(exception.message!=null).assertTrue();
                expect(exception.code == 801 || exception.code == 201).assertTrue()
                done()
            };
        })
















    })

}