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

import { expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export async function pushPage(url: string, pageName: string): Promise<void> {
  const options: router.RouterOptions = { url: url };
  try {
    router.clear();
    const pages = router.getState();
    if (pages.name !== pageName) {
      await router.pushUrl(options);
      await CommonFunc.sleep(1500);
    }
  } catch (err) {
    // 页面装饰器/JS 崩溃时 pushUrl 会失败（如 code 100001）；必须抛出，禁止吞错假绿
    // ArkTS arkts-limited-throw：只能 throw Error，不能 throw catch 得到的任意类型
    console.error('[PagePushHelper] push ' + pageName + ' error: ' + JSON.stringify(err));
    throw new Error('[PagePushHelper] push ' + pageName + ' failed: ' + JSON.stringify(err));
  }
}

export async function assertTitleVisible(titleId: string): Promise<void> {
  const driver: Driver = await Driver.create();
  await CommonFunc.sleep(300);
  const title = await driver.findComponent(ON.id(titleId));
  const text: string = await title.getText();
  expect(text.length > 0).assertTrue();
}

export async function sleepMs(ms: number): Promise<void> {
  await CommonFunc.sleep(ms);
}
