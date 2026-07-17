/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

const PAGE_PREFIX: string = 'MainAbility/pages/decoratorCover/';

async function pushCoverPage(pageName: string): Promise<void> {
  const options: router.RouterOptions = { url: PAGE_PREFIX + pageName };
  try {
    router.clear();
    const pages = router.getState();
    if (pages.name !== pageName) {
      await router.pushUrl(options);
      await CommonFunc.sleep(1500);
    }
  } catch (err) {
    console.error(`[DecoratorNullUndefined] push ${pageName} error: ${err}`);
  }
}

async function assertTextContains(driver: Driver, componentId: string, expected: string): Promise<void> {
  const component = await driver.findComponent(ON.id(componentId));
  const text: string = await component.getText();
  expect(text.indexOf(expected) >= 0).assertTrue();
}

export default function decoratorNullUndefinedTest() {
  describe('DecoratorNullUndefinedTest', () => {
    beforeEach(() => {
      console.info('[DecoratorNullUndefinedTest] beforeEach');
    });
    afterEach(() => {
      console.info('[DecoratorNullUndefinedTest] afterEach');
    });

    /**
     * @tc.number EntryOptions_page_load_001
     * @tc.name EntryOptions_page_load_001
     * @tc.desc Cover Entry/EntryOptions/storage by loading page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('EntryOptions_page_load_001', Level.LEVEL2, async () => {
      console.info('[EntryOptions_page_load_001] START');
      try {
        await pushCoverPage('EntryOptionsCover');
        const driver: Driver = await Driver.create();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'entry_options_cover_title', 'EntryOptionsCover');
        await assertTextContains(driver, 'entry_options_cover_prop', 'EntryProp:');
        const btn = await driver.findComponent(ON.id('entry_options_cover_btn'));
        await btn.click();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'entry_options_cover_prop', 'EntryProp:');
      } catch (err) {
        console.error('[EntryOptions_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[EntryOptions_page_load_001] END');
    });

    /**
     * @tc.number StorageProp_StorageLink_Watch_page_load_001
     * @tc.name StorageProp_StorageLink_Watch_page_load_001
     * @tc.desc Cover @StorageProp/@StorageLink/@Watch by loading page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('StorageProp_StorageLink_Watch_page_load_001', Level.LEVEL2, async () => {
      console.info('[StorageProp_StorageLink_Watch_page_load_001] START');
      try {
        await pushCoverPage('StorageDecoratorsCover');
        const driver: Driver = await Driver.create();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'storage_deco_cover_title', 'StorageDecoratorsCover');
        await assertTextContains(driver, 'storage_deco_cover_prop', 'Prop:');
        await assertTextContains(driver, 'storage_deco_cover_link', 'Link:');
        const btn = await driver.findComponent(ON.id('storage_deco_cover_btn'));
        await btn.click();
        await CommonFunc.sleep(500);
        await assertTextContains(driver, 'storage_deco_cover_link', 'Link:');
        await assertTextContains(driver, 'storage_deco_cover_watch', 'Watch:');
      } catch (err) {
        console.error('[StorageProp_StorageLink_Watch_page_load_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[StorageProp_StorageLink_Watch_page_load_001] END');
    });

    /**
     * @tc.number EnvDecorator_page_load_001
     * @tc.name EnvDecorator_page_load_001
     * @tc.desc Cover EnvDecorator (@Env) by loading page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('EnvDecorator_page_load_001', Level.LEVEL2, async () => {
      console.info('[EnvDecorator_page_load_001] START');
      try {
        await pushCoverPage('EnvDecoratorCover');
        const driver: Driver = await Driver.create();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'env_deco_cover_title', 'EnvDecoratorCover');
        await assertTextContains(driver, 'env_deco_cover_w', 'w:');
        await assertTextContains(driver, 'env_deco_cover_h', 'h:');
      } catch (err) {
        console.error('[EnvDecorator_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[EnvDecorator_page_load_001] END');
    });

    /**
     * @tc.number ReuseOptions_page_load_001
     * @tc.name ReuseOptions_page_load_001
     * @tc.desc Cover ReuseOptions by loading page
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('ReuseOptions_page_load_001', Level.LEVEL2, async () => {
      console.info('[ReuseOptions_page_load_001] START');
      try {
        await pushCoverPage('ReuseOptionsCover');
        const driver: Driver = await Driver.create();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'reuse_options_cover_title', 'ReuseOptionsCover');
        await assertTextContains(driver, 'reuse_cover_child_A', 'child:A');
        const btn = await driver.findComponent(ON.id('reuse_options_cover_btn'));
        await btn.click();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'reuse_options_cover_title', 'ReuseOptionsCover');
      } catch (err) {
        console.error('[ReuseOptions_page_load_001] Error: ' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[ReuseOptions_page_load_001] END');
    });

    /**
     * @tc.number MonitorDecorator_IMonitor_value_null_undefined_001
     * @tc.name MonitorDecorator_IMonitor_value_null_undefined_001
     * @tc.desc Cover @Monitor and IMonitor.value(null/undefined)
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('MonitorDecorator_IMonitor_value_null_undefined_001', Level.LEVEL2, async () => {
      console.info('[MonitorDecorator_IMonitor_value_null_undefined_001] START');
      try {
        await pushCoverPage('MonitorValueCover');
        const driver: Driver = await Driver.create();
        await CommonFunc.sleep(300);
        await assertTextContains(driver, 'monitor_value_cover_title', 'MonitorValueCover');
        const btn = await driver.findComponent(ON.id('monitor_value_cover_btn'));
        await btn.click();
        await CommonFunc.sleep(500);
        await assertTextContains(driver, 'monitor_value_cover_name', 'Bob');
        await assertTextContains(driver, 'monitor_value_cover_null', 'name');
        await assertTextContains(driver, 'monitor_value_cover_undef', 'name');
      } catch (err) {
        console.error('[MonitorDecorator_IMonitor_value_null_undefined_001] Error: ' +
          JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[MonitorDecorator_IMonitor_value_null_undefined_001] END');
    });
  });
}
