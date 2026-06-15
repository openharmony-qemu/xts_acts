'use static';
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
import events_emitter from '@ohos.events.emitter';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import systemDateTime from '@ohos.systemDateTime';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default class Utils {
  static async sleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async pushPage(pageTag: string, done?: boolean) {
    let router:Router = AppStorage.get<Router>('router') as Router

    let options: router.RouterOptions = {
      url: `pages/${pageTag}`,
    }
    try {
      router.clear();
      let pages = router.getState();
      console.info(`get ${pageTag} state success 196 ` + JSON.stringify(pages));
      if (pageTag.indexOf(pages.name) < 0) {
        console.info(`get ${pageTag} state success 198 ` + JSON.stringify(pages.name));
        router.pushUrl(options);
        console.info(`get ${pageTag} push success 200 :` + JSON.stringify(pages.name));
        await Utils.sleep(2000);
      }
    } catch (err) {
      console.error(`push ${pageTag} page error 204: ` + err);
    }
    if (done) {
    }
  }
}