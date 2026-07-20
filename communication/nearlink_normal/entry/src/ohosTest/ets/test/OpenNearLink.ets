/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import manager from '@ohos.nearlink.manager';
import { sleep } from './Sleep';
import {clickOpenNearLinkSwitch} from './Tools'

export async function openNearLink(): Promise<void> {
  try {
    let state = manager.getState();
    let TIME_SLEEP = 2000;
    switch (state) {
      case 0:
        await sleep(TIME_SLEEP);
        let state0 = manager.getState();
        console.info('[nearLink_js] nearLink state: ' + JSON.stringify(state0));
        break;
      case 1:
        console.info('[nearLink_js] nearLink state:' + JSON.stringify(state));
        break;
      case 2:
        await sleep(TIME_SLEEP);
        await clickOpenNearLinkSwitch();
        await sleep(TIME_SLEEP);
        let state2 = manager.getState();
        console.info('[nearLink_js] nearLink state: ' + JSON.stringify(state2));
        break;
      case 3:
        await clickOpenNearLinkSwitch();
        await sleep(TIME_SLEEP);
        let state3 = manager.getState();
        console.info('[nearLink_js] nearLink state: ' + JSON.stringify(state3));
        break;
      default:
        console.info('[nearLink_js] enable success');
    }
  } catch (error) {
    if (error.code === 801) {
      return;
    }
  }
}