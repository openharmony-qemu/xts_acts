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

export default function WindowPCTest() {

    describe("WindowPCTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowPCTest describe start');
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
         * @tc.number     : testRecoverPromiseErrCode1300002_0100
         * @tc.name       : testRecoverPromiseErrCode1300002_static_0100
         * @tc.desc       : testRecoverPromiseErrCode1300002_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1280
         * @tc.name      : testRecover_static_0100
         * @tc.desc      : test the function of Recover
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level4
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
         * @tc.number     : testMinimizeCallbackErrCode1300002_0100
         * @tc.name       : testMinimizeCallbackErrCode1300002_static_0100
         * @tc.desc       : testMinimizeCallbackErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testMinimizeCallbackErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testMinimizeCallbackErrCode1300002_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let subWin: window.Window;
            windowStage.createSubWindow('testMinimizeCallbackErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.minimize((err: BusinessError<void>|null) :void => {
                            const errCode: number = err!.code;
                            if (errCode) {
                                if(errCode == 801){
                                    done();
                                }else if (errCode == 1300002){
                                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call minimize. Cause:' + JSON.stringify(err));
                                    expect(err!.code).assertEqual(1300002);
                                    done()
                                    return;
                                }
                                else{
                                    expect(false).assertTrue();
                                    done();
                                }
                            }
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling minimize.');
                            expect(false).assertTrue();
                            done();
                        });
                    } catch (exception: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call minimize. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                .catch((err: BusinessError) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })
        /**
         * @tc.number     : testMinimizePromiseErrCode1300002_0100
         * @tc.name       : testMinimizePromiseErrCode1300002_static_0100
         * @tc.desc       : testMinimizePromiseErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testMinimizePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testMinimizePromiseErrCode1300002_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testMinimizePromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        (subWin! as window.Window).minimize().then(() => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling minimize.');
                            expect(false).assertTrue();
                        }).catch((err: BusinessError) :PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call minimize. Cause: ' + JSON.stringify(err));
                            expect(err!.code).assertEqual(1300002);
                        });
                        done()
                    } catch (exception: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call minimize. Cause:' + JSON.stringify(exception));
                        expect(false).assertTrue();
                        done()
                    }
                })
                .catch((err: BusinessError) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })

        /**
         * @tc.number     : testMaximizePromiseErrCode1300002_0100
         * @tc.name       : testMaximizePromiseErrCode1300002_static_0100
         * @tc.desc       : testMaximizePromiseErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testMaximizePromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testMaximizePromiseErrCode1300002_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testMaximizePromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        (subWin! as window.Window).maximize(window.MaximizePresentation.EXIT_IMMERSIVE).then(() => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling maximize.');
                            expect(false).assertTrue();
                        }).catch((err: BusinessError) :PromiseLike<void>|undefined => {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
                            expect(false).assertTrue();
                        });
                        done()
                    } catch (exception: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call maximize. Cause:' + JSON.stringify(exception));
                        expect(exception!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });

        })

        /**
         * @tc.number     : testMaximizePromiseErrCode1300004_0100
         * @tc.name       : testMaximizePromiseErrCode1300004_static_0100
         * @tc.desc       : testMaximizePromiseErrCode1300004_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testMaximizePromiseErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testMaximizePromiseErrCode1300004_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let windowConfig: window.Configuration = {
                name: "testMaximizePromiseErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context,
            };
            let win: window.Window;
            try {
                win = await window.createWindow(windowConfig);
                expect(!!win).assertTrue();
                try {
                    win!.maximize(window.MaximizePresentation.EXIT_IMMERSIVE).then(() => {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling maximize.');
                        await (win! as window.Window).destroyWindow();
                        expect(false).assertTrue();
                        done()
                    }).catch((err: BusinessError) :PromiseLike<void>|undefined => {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call maximize. Cause: ' + JSON.stringify(err));
                        await (win! as window.Window).destroyWindow();
                        expect(false).assertTrue();
                        done()
                    });
                } catch (exception: BusinessError) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call maximize. Cause:' + JSON.stringify(exception));
                    expect(exception!.code).assertEqual(1300004);
                    await (win! as window.Window).destroyWindow();
                    done()
                }
            } catch (err: BusinessError) {
                hilog.info(0x0000, '[ANI]',msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
                expect(false).assertTrue();
                done()
            }
            
        })




    })

}