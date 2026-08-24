/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility';
import bundle from '@ohos.bundle';
import commonEvent from '@ohos.commonEventManager';

const eventFaDisplayOrientation0100 = 'eventFaDisplayOrientation0100';
const eventFaDisplayOrientation0100LifeCircle = 'eventFaDisplayOrientation0100LifeCircle';
const eventFaDisplayOrientation0200 = 'eventFaDisplayOrientation0200';
const eventFaDisplayOrientation0200LifeCircle = 'eventFaDisplayOrientation0200LifeCircle';
const eventFaDisplayOrientation0300 = 'eventFaDisplayOrientation0300';
const eventFaDisplayOrientation0300LifeCircle = 'eventFaDisplayOrientation0300LifeCircle';
const eventFaDisplayOrientation0400 = 'eventFaDisplayOrientation0400';
const eventFaDisplayOrientation0400LifeCircle = 'eventFaDisplayOrientation0400LifeCircle';
let lifeCircleData: string[] = [];

let publishEvent = (event: string, parameter: boolean | string[]) => {
  commonEvent.publish(event,
    {
      parameters: {
        data: parameter
      }
    }, (e, v) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `publish  event : ${event} , e: ${JSON.stringify(e)}`);
    })
}

class MainAbility {
  onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
    lifeCircleData[0] = 'onCreate';
  }
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  }
  onActive() {
    try {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Application onActive');
      lifeCircleData[1] = 'onActive';

      featureAbility.getWant((err, want) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `get want: ${JSON.stringify(want)}`);
        let number = want.parameters?.data as number;
        switch (number) {
          case 5:
            hilog.info(0x0000, 'testTag', '%{public}s', `case 5 ----->`);
            publishEvent(eventFaDisplayOrientation0100LifeCircle, lifeCircleData);
            setTimeout(() => {
              featureAbility.getContext().getDisplayOrientation((error, data) => {
                hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main data: ${data}, err: ${JSON.stringify(error)}`);
                if (bundle.DisplayOrientation.UNSPECIFIED == data) {
                  featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.FOLLOW_RECENT)
                    .then(() => {
                      hilog.info(0x0000, 'testTag', '%{public}s', 'setDisplayOrientation main data');
                      featureAbility.getContext().getDisplayOrientation()
                        .then(data => {
                          hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main-2 data: ${data},
                            orientation: ${bundle.DisplayOrientation.LANDSCAPE}`);
                          if (bundle.DisplayOrientation.LANDSCAPE == data) {
                            publishEvent(eventFaDisplayOrientation0100, true);
                          } else {
                            publishEvent(eventFaDisplayOrientation0100, false);
                          }
                          featureAbility.terminateSelf();
                        })
                    })
                }
              })
            }, 500)
            break;
          case 6:
            hilog.info(0x0000, 'testTag', '%{public}s', `case 6 ----->`);
            publishEvent(eventFaDisplayOrientation0200LifeCircle, lifeCircleData);
            setTimeout(() => {
              featureAbility.getContext().getDisplayOrientation((error, data) => {
                hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main data: ${data}, err: ${JSON.stringify(error)}`);
                if (bundle.DisplayOrientation.UNSPECIFIED == data) {
                  featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.FOLLOW_RECENT)
                    .then(() => {
                      hilog.info(0x0000, 'testTag', '%{public}s', 'setDisplayOrientation main data');
                      featureAbility.getContext().getDisplayOrientation()
                        .then(data => {
                          hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main-2 data: ${data},
                            orientation: ${bundle.DisplayOrientation.PORTRAIT}`);
                          if (bundle.DisplayOrientation.PORTRAIT == data) {
                            publishEvent(eventFaDisplayOrientation0200, true);
                          } else {
                            publishEvent(eventFaDisplayOrientation0200, false);
                          }
                          featureAbility.terminateSelf();
                        })
                    })
                }
              })
            }, 500)
            break;
        }
      })
    } catch (err) {
      hilog.info(0x0000, 'testTag', '%{public}s', `err------> : ${JSON.stringify(err)}`);
    }
  }
}
export default new MainAbility();