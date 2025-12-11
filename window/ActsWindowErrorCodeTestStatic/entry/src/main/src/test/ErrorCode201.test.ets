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
import settings from '@ohos.settings';
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
        let want: Want = {
            bundleName: "com.example.actswindowtest.static",
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
export default function ErrorCode201() {

    describe("ErrorCode201", (): void => {
        hilog.info(domain, tag, '%{public}s', 'ErrorCode201 describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
        let isPCStatus: string = '';
        beforeAll(() => {
            
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
                //isPCStatus == '' 非PC设备
                //isPCStatus == '1' PC设备状态栏dock未融合
                //isPCStatus == '0' PC设备状态栏dock融合
                hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

        })

        /**
         * @tc.name   testSetWindowPrivacyModePromiseErrCode201_static_0100
         * @tc.number testSetWindowPrivacyModePromiseErrCode201_0100
         * @tc.desc   testSetWindowPrivacyModePromiseErrCode201_static_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   testSetWindowPrivacyModeCallbackErrCode201_static_0200
         * @tc.number testSetWindowPrivacyModeCallbackErrCode201_0100
         * @tc.desc   testSetWindowPrivacyModeCallbackErrCode201_static_0200
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   testCreateFloatWindowPermission_Promise_static_0100
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0010
         * @tc.desc   create Floating window permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
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
         * @tc.name   testCreateFloatWindowPermission_Callback_static_0100
         * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_PERMISSION_JS_API_0020
         * @tc.desc   create Floating window permission check
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
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
         * @tc.name   testSetWindowShadowEnabledwithoutPermission_Static
         * @tc.number SUB_BASIC_WMS_SETWINDOWSHADOWENABLED_Static_0200
         * @tc.desc   testSetWindowShadowEnabledwithoutPermission_Static
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testSetWindowShadowEnabledwithoutPermission_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowShadowEnabledwithoutPermission_Static";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag,msgStr + 'begin.');
            try {
                let windowClass:window.Window = windowStage.getMainWindowSync();
                windowClass.setWindowShadowEnabled(true).then(() => {
                    hilog.info(domain, tag,`${caseName} Succeeded in calling setWindowShadowEnabled.`);
                    expect(false).assertTrue();
                    done()
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(domain, tag,`${caseName} Failed. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.message!=null).assertTrue();
                    if (err.code === 801) {
                        done();
                    } else {
                        expect(err.code).assertEqual(201);
                        done()
                    }
                });
            } catch (exception: BusinessError) {
                hilog.error(domain, tag,msgStr + 'Failed. Cause:' + JSON.stringify(exception));
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.name   testMainwindowSetWindowContainerColorNoPermissonCorrectParam_Static
         * @tc.number SUB_BASIC_WMS_SETWINDOWCONTAINERCOLOR_Static_0700
         * @tc.desc   testMainwindowSetWindowContainerColorNoPermissonCorrectParam_Static
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testMainwindowSetWindowContainerColorNoPermissonCorrectParam_Static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testMainwindowSetWindowContainerColorNoPermissonCorrectParam_Static';
            hilog.info(domain, tag,caseName + 'begin');
            let windowStageStart = await startAbility(caseName, context);
            try {
                let windowClass = windowStageStart.getMainWindowSync();
                windowClass.setWindowContainerColor("#0099FF","#CCCCCC");
                await terminateAbility(caseName);
                expect(false).assertTrue()
                done();
            } catch (err: BusinessError) {
                hilog.error(domain, tag,caseName + 'Failed. Cause: ' + JSON.stringify(err));
                await terminateAbility(caseName);
                if (isPCStatus == '') {
                    expect(err.code).assertEqual(801);
                    done()
                } else {
                    expect(err.code).assertEqual(201);
                    done()
                }
        
            }
        });














    })

}