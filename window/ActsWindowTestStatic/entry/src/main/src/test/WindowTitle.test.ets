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
import { ConfigurationConstant } from '@kit.AbilityKit';
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

export default function WindowTitleTest() {

    describe("WindowTitleTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowTitleTest describe start');
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GETWINDOW_DECORHEIGHT_JS_API_0100
         * @tc.name      : testGetWindowDecorHeight_static_0100
         * @tc.desc      : test the function of GetWindowDecorHeight
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level4
         */
        it('testGetWindowDecorHeight_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetWindowDecorHeight_static_0100';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let load3 = await windowStage.loadContent('pages/index2');
            expect(!Boolean(load3)).assertTrue();
            try {
                let tempWnd: window.Window  = await windowStage.getMainWindow();
                (tempWnd as window.Window).getWindowDecorHeight()
                hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
                expect(true).assertTrue()
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + ' Failed to get the height of window decor. Cause: ' + JSON.stringify(exception));
                if (exception.code == 801 || exception.code == 1300002) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        })
/**
         * @tc.number     : testSetWindowDecorVisibleErrCode1300002_0100
         * @tc.name       : testSetWindowDecorVisibleErrCode1300002_static_0100
         * @tc.desc       : testSetWindowDecorVisibleErrCode1300002_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetWindowDecorVisibleErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "testSetWindowDecorVisibleErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testSetWindowDecorVisibleErrCode1300002_static_0100')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.setWindowDecorVisible(true);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowDecorVisible.');
                        expect(false).assertTrue();
                        done()
                    } catch (e: BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
                        if(e!.code == 1300002){
                            done();
                        }else if(e!.code == 801){
                            done();
                        }else {
                            expect(false).assertTrue();
                            done();
                        }
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number     : testSetWindowDecorHeightErrCode1300002_0100
         * @tc.name       : testSetWindowDecorHeightErrCode1300002_static_0100
         * @tc.desc       : testSetWindowDecorHeightErrCode1300002_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetWindowDecorHeightErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testSetWindowDecorHeightErrCode1300002_static_0100";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testSetWindowDecorHeightErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.setWindowDecorHeight(1);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowDecorHeight.');
                        expect(false).assertTrue();
                        done()
                    } catch (e: BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setWindowDecorHeight. Cause:' + JSON.stringify(e));
                        expect(e.code).assertEqual(1300002);
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
         * @tc.number    : SUB_BASIC_WMS_SET_DECORBUTTON_STYLE_3200
         * @tc.name      : test_setWindowDecorHeight_setDecorButtonStyle_static_0100
         * @tc.desc      : test_setWindowDecorHeight_setDecorButtonStyle_static_0100
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('test_setWindowDecorHeight_setDecorButtonStyle_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_setWindowDecorHeight_setDecorButtonStyle_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let windowClass: window.Window = await windowStage.getMainWindow();
            try {
                windowClass.setWindowDecorHeight(50);
                hilog.info(0x0000, '[ANI]',msgStr+ `Succeeded in setting the height of window decor`);
                expect(true).assertTrue();
                done();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr+ `Failed to set the style of button. Cause code: ${exception.code}, message: ${exception.message}`);
                if(exception.code = 801){
                    done();
                }else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
/**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOW_TITLE_BUTTON_RECT_CHANGE_JS_API_0100
         * @tc.name      : testWindowTitleButtonRectChange_on_Function_Callback_static_0100
         * @tc.desc      : Test the function of windowTitleButtonRectChange
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testWindowTitleButtonRectChange_on_Function_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr: string = 'testWindowTitleButtonRectChange_on_Function_Callback_static_0100';
            hilog.info(0x0000, '[ANI]',msgStr + "begin on")
            try {
                let windowClass: window.Window = await windowStage.getMainWindow();
                windowClass.on('windowTitleButtonRectChange', (titleButtonRect:window.TitleButtonRect) => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window title buttons area changes. Data: ' + JSON.stringify(titleButtonRect));
                    // hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: right' + JSON.stringify(titleButtonRect.right));
                    // hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: top' + JSON.stringify(titleButtonRect.top));
                    hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: width' + JSON.stringify(titleButtonRect.width));
                    // hilog.info(0x0000, '[ANI]',msgStr + 'titleButtonRect Data: height' + JSON.stringify(titleButtonRect.height));
                    expect(true).assertTrue();
                    done();
                });
                windowClass.off('windowTitleButtonRectChange');
                expect(true).assertTrue();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for window title buttons area changes. Cause: ' + JSON.stringify(err));
                if (err!.code == 801) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });


        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOW_TITLE_BUTTON_RECT_CHANGE_JS_API_0200
         * @tc.name      : testWindowTitleButtonRectChange_off_Function_Callback_static_0200
         * @tc.desc      : Test the function of windowTitleButtonRectChange
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testWindowTitleButtonRectChange_off_Function_Callback_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let msgStr: string = 'testWindowTitleButtonRectChange_off_Function_Callback_static_0200';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin off');
            try {
                let windowClass: window.Window = await windowStage.getMainWindow();
                windowClass.off('windowTitleButtonRectChange');
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window title buttons area changes');
                expect(true).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to disable the listener for window title buttons area changes. Cause: ' + JSON.stringify(error));
                if (error!.code == 1300002) {
                    expect(true).assertTrue()
                    done()
                } else {
                    expect(false).assertTrue();
                    done();
                }
            }
        });
        /**
         * @tc.number     : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_WINDOW_TITLE_BUTTON_RECT_CHANGE_JS_API_0300
         * @tc.name       : testOnWindowTitleButtonRectChangeErrCode1300002_static_0300
         * @tc.desc       : testOnWindowTitleButtonRectChangeErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testOnWindowTitleButtonRectChangeErrCode1300002_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "testOnWindowTitleButtonRectChangeErrCode1300002_static_0300";
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testOnWindowTitleButtonRectChangeErrCode1300002_static_0300')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.on("windowTitleButtonRectChange", (res: window.TitleButtonRect) => {
                        });
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling on windowTitleButtonRectChange.');
                        expect(false).assertTrue();
                        done()
                    } catch (e: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call on windowTitleButtonRectChange. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number     : testSetWindowTitleButtonVisibleErrCode1300002_0100
         * @tc.name       : testSetWindowTitleButtonVisibleErrCode1300002_static_0100
         * @tc.desc       : testSetWindowTitleButtonVisibleErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetWindowTitleButtonVisibleErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetWindowTitleButtonVisibleErrCode1300002_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testSetWindowTitleButtonVisibleErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.setWindowTitleButtonVisible(true, true, true);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
                        expect(false).assertTrue();
                        done()
                    } catch (e: BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setWindowTitleButtonVisible. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
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
         * @tc.number     : testSetWindowTitleButtonVisibleErrCode1300004_0100
         * @tc.name       : testSetWindowTitleButtonVisibleErrCode1300004_static_0100
         * @tc.desc       : testSetWindowTitleButtonVisibleErrCode1300004_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetWindowTitleButtonVisibleErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetWindowTitleButtonVisibleErrCode1300004_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testSetWindowTitleButtonVisibleErrCode1300004_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    expect(!!subWin).assertTrue();
                    await (subWin! as window.Window).setUIContent("pages/index2");
                    await (subWin! as window.Window).showWindow();
                    try {
                        (subWin! as window.Window).setWindowTitleButtonVisible(true, true, true);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowTitleButtonVisible.');
                        expect(false).assertTrue();
                        await (subWin!! as window.Window).destroyWindow();
                        done();
                    } catch (exception: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setWindowTitleButtonVisible. Cause:' +
                        JSON.stringify(exception));
                        await (subWin!! as window.Window).destroyWindow();
                        if (exception!.code == 801) {
                            hilog.info(0x0000, '[ANI]',msgStr + '此设备不支持getDecorButtonStyle能力.');
                        } else {
                            expect(exception!.code).assertEqual(1300004);
                        }
                        done();
                    }
                })
                .catch((err: BusinessError) :PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number     : testSetDecorButtonStyleErrCode1300002_0100
         * @tc.name       : testSetDecorButtonStyleErrCode1300002_static_0100
         * @tc.desc       : testSetDecorButtonStyleErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetDecorButtonStyleErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetDecorButtonStyleErrCode1300002_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testSetDecorButtonStyleErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        let param: window.DecorButtonStyle = {
                            buttonBackgroundSize: 1
                        }
                        subWin!.setDecorButtonStyle(param);
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setDecorButtonStyle.');
                        expect(false).assertTrue();
                        done()
                    } catch (e: BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setDecorButtonStyle. Cause:' + JSON.stringify(e));
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
         * @tc.number     : testSetDecorButtonStyleErrCode1300004_0100
         * @tc.name       : testSetDecorButtonStyleErrCode1300004_static_0100
         * @tc.desc       : testSetDecorButtonStyleErrCode1300004_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testSetDecorButtonStyleErrCode1300004_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testSetDecorButtonStyleErrCode1300004_0100";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let style: window.DecorButtonStyle = {
                colorMode: ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT,
                buttonBackgroundSize: 28,
                spacingBetweenButtons: 12,
                closeButtonRightMargin: 20,
                // buttonIconSize: 20,
                // buttonBackgroundCornerRadius: 4
            };
            let windowConfig: window.Configuration = {
                name: "testSetDecorButtonStyleErrCode1300004_0100",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context,
            };
            let tempWnd: window.Window;
            tempWnd = await window.createWindow(windowConfig);
            expect(!!tempWnd).assertTrue();
            await (tempWnd as window.Window).setUIContent("pages/index2");
            await (tempWnd as window.Window).showWindow();
            try {
                // let param: window.DecorButtonStyle = {}
                (tempWnd as window.Window).setDecorButtonStyle(style);
                hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setDecorButtonStyle.');
                await (tempWnd! as window.Window).destroyWindow();
                expect(false).assertTrue();
                done();
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call setDecorButtonStyle. Cause:' + JSON.stringify(exception));
                await (tempWnd! as window.Window).destroyWindow();
                if (exception!.code == 801) {
                    hilog.info(0x0000, '[ANI]',msgStr + '此设备不支持setDecorButtonStyle能力.');
                } else {
                    expect(exception!.code).assertEqual(1300004);
                }
                done();
            }
        })




    })

}