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

export default function ArcSlider003() {
    describe('ArcSlider003', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
            await UtilsTest.startAbility("com.example.myapplication.static", "EntryAbility")
            await UtilsTest.msSleep(4000)
        });
        beforeEach(async (): Promise<void> => {
            console.info("search_caret beforeEach start");
            let options: router.RouterOptions = {
                url: 'MainAbility/pages/ArcSlider/ArcSlider2',
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
     * @tc.number   arcSliderTest003
     * @tc.name     arcSliderTest003
     * @tc.desc     arcSliderTest003
     * @tc.level    Level.LEVEL0
     */
it('arcSliderTest003', Level.LEVEL0, async (done: () => void): Promise<void> => {
            console.info('arcSliderTest003 START');
            let driver = Driver.create();
            await CommonFunc.sleep(1000);
            let textComponent = await driver.findComponent(ON.id('textTest001'));
            let actualText = textComponent?.getText();
            expect(actualText).assertEqual('false');
            let size = display.getDefaultDisplaySync().width;
            if(size > 500) {
                await driver.click(653, 260);
            } else {
                await driver.click(416, 123);
            }
            let actualText001 = textComponent?.getText();
            await CommonFunc.sleep(1000);
            expect(actualText001).assertEqual('true');
            await CommonFunc.sleep(3000);
            let actualText002 = textComponent?.getText();
            expect(actualText002).assertEqual('false');
            console.info('arcSliderTest003 END');
            done();
        });
    })
}
