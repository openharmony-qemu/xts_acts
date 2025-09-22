/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError, RecordData } from '@ohos.base';
import { UtilsTest } from '../Util.test';
import emitter from "@ohos.events.emitter"
import Utils from "../../../ets/MainAbility/common/Utils"
let emitKey = "emitUserAgent"
export default function webJsunit() {
    describe("ActsAceWebDevTest1", () => {
        
        
        
        
        beforeAll(() => {
            console.info("ActsAceWebDevTest1 beforeAll start");
            await UtilsTest.msSleep(4000)
            await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
            await UtilsTest.msSleep(4000)
        });

        beforeEach(async (): Promise<void> => {
            console.info("ActsAceWebDevTest1 beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/web/webapi9',
            }
            try {
                const routerInstance = AppStorage.get<Router>("router") as Router
                routerInstance.clear();
                let pages = routerInstance.getState();
                console.info("get ActsAceWebDevTest1 state pages:" + JSON.stringify(pages));
                if (!("webapi9" == pages.name)) {
                    console.info("get ActsAceWebDevTest1 pages.name:" + JSON.stringify(pages.name));
                    
                    
                    routerInstance.pushUrl(options);
                    await CommonFunc.sleep(2000);
                    
                }
            } catch (err) {
                console.error("push ActsAceWebDevTest1 page error:" + err);
            }
            console.info("ActsAceWebDevTest1 beforeEach end");
        });
        afterEach(async () => {
            console.info("web afterEach start:" + emitKey)
            try {
                let backData: emitter.EventData = {
                    data: {
                        "ACTION": emitKey,
                    } as Record<String, RecordData>,
                }
                let backEvent: emitter.InnerEvent = {
                    eventId: 10,
                    priority: emitter.EventPriority.LOW,
                }
                console.info("start send emitKey")
                emitter.emit(backEvent, backData)
            } catch (err) {
                console.info("emit emitKey  err: " + JSON.stringify(err))
            }
            await Utils.sleep(2000)
        })
        

        /*
     * @tc.number   testmultiWindow_static_01
     * @tc.name     testmultiWindow_static_01
     * @tc.desc     testmultiWindow_static_01
     * @tc.level    Level.LEVEL0
     */
    it('testmultiWindow_static_01', Level.LEVEL0, async () => {
            console.info("testmultiWindow_static_01  START")
            await Utils.sleep(2000)
            let strJson = inspector.getInspectorByKey("multiwindow")
            console.info("[multiwindow] component strJson:" + strJson)
            let obj = JSON.parseJsonElement(strJson)
            expect(obj.getElement('$type')).assertEqual("web")
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('multiWindow')).assertTrue()
            console.info(
                "[testmultiWindow_static_0010]  value :" +
                JSON.parseJsonElement(strJson).getElement('$attrs').getString('multiWindow')
            )
        })

        /*
     * @tc.number   testonWindowExit_static_02
     * @tc.name     testonWindowExit_static_02
     * @tc.desc     testonWindowExit_static_02
     * @tc.level    Level.LEVEL0
     */
    it('testonWindowExit_static_02', Level.LEVEL0, async () => {
            try {
                
                inspector.sendEventByKey("multiwindow", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })

        /*
     * @tc.number   testweb_static_03
     * @tc.name     testweb_static_03
     * @tc.desc     testweb_static_03
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_03', Level.LEVEL0, async () => {
            
            try {
                
                inspector.sendEventByKey("onWindowNew", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })

        /*
     * @tc.number   testweb_static_04
     * @tc.name     testweb_static_04
     * @tc.desc     testweb_static_04
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_04', Level.LEVEL0, async () => {
            try {
                
                inspector.sendEventByKey("onWindowNew", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })

        /*
     * @tc.number   testweb_static_05
     * @tc.name     testweb_static_05
     * @tc.desc     testweb_static_05
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_05', Level.LEVEL0, async () => {
            try {
                
                inspector.sendEventByKey("onSslErrorEventReceive", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_06
     * @tc.name     testweb_static_06
     * @tc.desc     testweb_static_06
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_06', Level.LEVEL0, async () => {
            console.info("testmultiWindow_static_016 START")
            await Utils.sleep(2000)
            let strJson = inspector.getInspectorByKey("web2")
            console.info("[multiwindow] component strJson:" + strJson)
            let obj = JSON.parseJsonElement(strJson)
            expect(obj.getElement('$type')).assertEqual("web")
            expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('atio')).assertEqual(150)
            console.info(
                "[testmultiWindow_static_0016]  value :" +
                JSON.parseJsonElement(strJson).getElement('$attrs').getString('multiWindow')
            )
        })
        

        /*
     * @tc.number   testweb_static_071
     * @tc.name     testweb_static_071
     * @tc.desc     testweb_static_071
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_071', Level.LEVEL0, async () => {
            try {
                emitKey = "emitGeturl"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_072
     * @tc.name     testweb_static_072
     * @tc.desc     testweb_static_072
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_072', Level.LEVEL0, async () => {
            try {
                emitKey = "emitclearClientAuthenticationCache"
                
                
                
                
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_08
     * @tc.name     testweb_static_08
     * @tc.desc     testweb_static_08
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_08', Level.LEVEL0, async () => {
            try {
                emitKey = "emitclearSslCache"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_09
     * @tc.name     testweb_static_09
     * @tc.desc     testweb_static_09
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_09', Level.LEVEL0, async () => {
            
            try {
                emitKey = "emitsearchNext"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_10
     * @tc.name     testweb_static_10
     * @tc.desc     testweb_static_10
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_10', Level.LEVEL0, async () => {
            try {
                emitKey = "emitclearMatches"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

    /*
     * @tc.number   testweb_static_11
     * @tc.name     testweb_static_11
     * @tc.desc     testweb_static_11
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_11', Level.LEVEL0, async () => {
            try {
                emitKey = "emitDefaultUserAgent"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_12
     * @tc.name     testweb_static_12
     * @tc.desc     testweb_static_12
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_12', Level.LEVEL0, async () => {
            try {
                emitKey = "emitgetWebId"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_13
     * @tc.name     testweb_static_13
     * @tc.desc     testweb_static_13
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_13', Level.LEVEL0, async () => {
            try {
                emitKey = "emitcreateWebMessagePorts"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_14
     * @tc.name     testweb_static_14
     * @tc.desc     testweb_static_14
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_14', Level.LEVEL0, async () => {
            try {
                emitKey = "emitdeleteSessionCookie"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_15
     * @tc.name     testweb_static_15
     * @tc.desc     testweb_static_15
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_15', Level.LEVEL0, async () => {
            try {
                emitKey = "emitdeleteExpiredCookie"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_16
     * @tc.name     testweb_static_16
     * @tc.desc     testweb_static_16
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_16', Level.LEVEL0, async () => {
            try {
                emitKey = "emitexistCookie"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_17
     * @tc.name     testweb_static_17
     * @tc.desc     testweb_static_17
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_17', Level.LEVEL0, async () => {
            try {
                emitKey = "emitgetCookie"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_18
     * @tc.name     testweb_static_18
     * @tc.desc     testweb_static_18
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_18', Level.LEVEL0, async () => {
            try {
                emitKey = "emitsetCookie"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_19
     * @tc.name     testweb_static_19
     * @tc.desc     testweb_static_19
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_19', Level.LEVEL0, async () => {
            try {
                emitKey = "emitsaveCookie"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_20
     * @tc.name     testweb_static_20
     * @tc.desc     testweb_static_20
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_20', Level.LEVEL0, async () => {
            try {
                emitKey = "emitputAcceptFileURICookieEnabled"
                
                
                
                
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_21
     * @tc.name     testweb_static_21
     * @tc.desc     testweb_static_21
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_21', Level.LEVEL0, async () => {
            try {
                emitKey = "emitputAcceptThirdPartyCookieEnabled"
                
                
                
                
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_22
     * @tc.name     testweb_static_22
     * @tc.desc     testweb_static_22
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_22', Level.LEVEL0, async () => {
            try {
                emitKey = "emitisFileURICookieAllowed"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_23
     * @tc.name     testweb_static_23
     * @tc.desc     testweb_static_23
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_23', Level.LEVEL0, async () => {
            try {
                emitKey = "hasImage"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_24
     * @tc.name     testweb_static_24
     * @tc.desc     testweb_static_24
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_24', Level.LEVEL0, async () => {
            try {
                emitKey = "hasImageTwo"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_25
     * @tc.name     testweb_static_25
     * @tc.desc     testweb_static_25
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_25', Level.LEVEL0, async () => {
            try {
                emitKey = "setNetworkAvailable"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_26
     * @tc.name     testweb_static_26
     * @tc.desc     testweb_static_26
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_26', Level.LEVEL0, async () => {
            try {
                emitKey = "getFavicon"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_27
     * @tc.name     testweb_static_27
     * @tc.desc     testweb_static_27
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_27', Level.LEVEL0, async () => {
            try {
                emitKey = "getOriginalUrl"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_28
     * @tc.name     testweb_static_28
     * @tc.desc     testweb_static_28
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_28', Level.LEVEL0, async () => {
            try {
                emitKey = "history"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_29
     * @tc.name     testweb_static_29
     * @tc.desc     testweb_static_29
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_29', Level.LEVEL0, async () => {
            try {
                emitKey = "pageUp"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
        

        /*
     * @tc.number   testweb_static_30
     * @tc.name     testweb_static_30
     * @tc.desc     testweb_static_30
     * @tc.level    Level.LEVEL0
     */
    it('testweb_static_30', Level.LEVEL0, async () => {
            try {
                emitKey = "pageUp"
                
                inspector.sendEventByKey("webcomponentapi9", 10, "")
            } catch(ERROR) {
                expect().assertFail();
            }
        })
    })
}
