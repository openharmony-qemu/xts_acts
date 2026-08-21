/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils.test';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist } from '../../test/WaitTest.test';
const driver: Driver = Driver.create();
@Entry
@Component
struct fullScreenVideoOverlay {
    controller: WebController = new WebController();
    @State str: string = "emitOnBeforeUnloadWebC";
    @State isPageEnd: number = -1;
    @State isReceive: number = -1;
    @State enableParams:boolean = true

    onPageShow() {
        let valueChangeEvent: events_emitter.InnerEvent = {
            eventId: 181214,
            priority: events_emitter.EventPriority.LOW
        }
        events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    }

    private valueChangeCallBack = (eventData: ESObject) => {
        console.info("webOnBeforeUnload page valueChangeCallBack");
        if (eventData != null) {
            console.info("valueChangeCallBack:" + JSON.stringify(eventData));
            if (eventData.data.ACTION != null) {
                this.str = eventData.data.ACTION;
                this.isReceive = 1;
            }
        }
    }


    build() {
        Column() {
            Row() {
                Button("web click").key('FullScreenVideoOverlayButton').onClick(async () => {
                    console.info("key==>" + this.str)
                    await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
                    await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 0, 1000);
                    switch (this.str) {
                        case "emitEnableFullscreenVideoOverlay01": {
                            try {
                                this.enableParams = true;
                                let buttonOne = await driver.findComponent(ON.text('进入全屏模式'));
                                console.log('pppp' + buttonOne)
                                await buttonOne?.click();
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }

                        case "emitEnableFullscreenVideoOverlay02": {
                            try {
                                this.enableParams = false;
                                this.isPageEnd = -1;
                                this.controller.refresh();
                                await Utils.waitForExist(() => this.isPageEnd, this.str, 0);
                                let buttonOne = await driver.findComponent(ON.text('进入全屏模式'));
                                await buttonOne.click();
                            } catch (error) {
                                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                            }
                            break;
                        }

                    }
                })
            }

            // Text('显示').fontSize(18).margin(20)
            Web({ src: $rawfile('Video.html'), controller: this.controller })
                .fileAccess(true)
                .imageAccess(true)
                .onlineImageAccess(true)
                .domStorageAccess(true)
                .javaScriptAccess(true)
                .enableFullscreenVideoOverlay(this.enableParams)
                .mediaPlayGestureAccess(false)
                .width("100%")
                .layoutWeight(1)
                .onFullScreenEnter((event) => {
                    console.log('onFullScreenEnter99932545');
                    if(this.str == 'emitEnableFullscreenVideoOverlay01') {
                        // if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                        //     Utils.emitEvent(true, 20260819)
                        // } else {
                        // let buttonTwo = driver.findComponent(ON.text('显示'));
                        // console.log('99999977745446' + JSON.stringify(buttonTwo));
                        // console.log('999999777' + JSON.stringify(buttonTwo).length);
                        Utils.emitEvent(true, 20260819)
                        // }
                    } else if(this.str == 'emitEnableFullscreenVideoOverlay02') {

                        let buttonTwo = driver.findComponent(ON.text('显示'));
                        console.log('pppp' + JSON.stringify(buttonTwo));
                        console.log('9999991111' + JSON.stringify(buttonTwo).length);
                        Utils.emitEvent(true, 20260820)
                    }

                })
                .onPageEnd((event) => {
                    console.log('web pageEnd==>' + event.url);
                    this.isPageEnd = 0;
                })

        }
    }
}