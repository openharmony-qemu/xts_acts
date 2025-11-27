'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,  Level } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import display from '@ohos.display';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
interface optionsObj {
  uri: string
}

export default function ArcSlider004() {
    describe('ArcSlider004', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
            await UtilsTest.startAbility("com.example.myapplication.static", "EntryAbility")
            await UtilsTest.msSleep(4000)
        });
        beforeEach(async (): Promise<void> => {
            console.info("search_caret beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/ArcSlider/ArcSlider3',
            }
            try {
                const routerInstance = AppStorage.get<Router>("router") as Router
                routerInstance.clear();
                let pages = routerInstance.getState();
                console.info("get Arcslider state pages: " + JSON.stringify(pages));
                if (!("Arcslider" == pages.name)) {
                    console.info("get Arcslider state pages.name: " + JSON.stringify(pages.name));
                    routerInstance.pushUrl(options);
                    await CommonFunc.sleep(2000);
                }
            } catch (err) {
                console.error("push Arcslider page error: " + err);
                expect().assertFail();
            }
        });
        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /*
     * @tc.number   arcSliderTest004
     * @tc.name     arcSliderTest004
     * @tc.desc     arcSliderTest004
     * @tc.level    Level.LEVEL0
     */
it('arcSliderTest004', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info('arcSliderTest004 START');
            let driver = Driver.create();
            await CommonFunc.sleep(1000);
            let buttonComponent = await driver.findComponent(ON.id('buttonTest'));
            let flagText000 = await (buttonComponent?.getText() as Promise<string>);
            expect(flagText000).assertEqual('false');
            await (buttonComponent?.click() as Promise<void>);
            await CommonFunc.sleep(1000);
            let size = display.getDefaultDisplaySync().width;
            let flagText = await (buttonComponent?.getText() as Promise<string>);
            expect(flagText).assertEqual('true');
            await (buttonComponent?.click() as Promise<void>);
            await CommonFunc.sleep(1000);
            let flagText001 = await (buttonComponent?.getText() as Promise<string>);
            expect(flagText001).assertEqual('false');
            if(size > 500) {
                await (driver?.click(650, 256) as Promise<void>);
            } else {
                await (driver?.click(416, 123) as Promise<void>);
            }
            await CommonFunc.sleep(1000);
            await (buttonComponent?.click() as Promise<void>);
            await CommonFunc.sleep(1000);
            let flagText002 = await (buttonComponent?.getText() as Promise<string>);
            expect(flagText002).assertEqual('false');
            await CommonFunc.sleep(500);
            console.info('arcSliderTest004 END');
            done();
        });
    })
}