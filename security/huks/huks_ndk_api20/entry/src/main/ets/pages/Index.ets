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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

// Inlined helper (previously imported from ohosTest/ets/test/common/Utils).
// The main module must not depend on test sources; only this single helper is needed here.
function simulateByShell(cmd: string): Promise<string> {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  return new Promise<string>((resolve, reject) => {
    abilityDelegator.executeShellCommand(cmd, (err, data) => {
      if (err) {
        console.error(`command ${cmd} failed: ${JSON.stringify(err)}`);
        reject("failed");
      } else {
        console.info(`command ${cmd} executed: ${data.stdResult}`);
        resolve("executed");
      }
    });
  });
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Button('keyCodeEvent')
          .defaultFocus(true)
          .onClick(()=>{
            simulateByShell('uinput -K -d 1 -u 1');
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
