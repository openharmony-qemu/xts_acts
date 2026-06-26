'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import { Configuration } from '@ohos.app.ability.Configuration';

const TAG = 'entry MyAbilityStage'

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    console.log(`${TAG} MyAbilityStage.onCreate called`);
  }
  onAcceptWant(want: Want): string {
    console.log(`${TAG} MyAbilityStage.onAcceptWant called`);
    return 'com.example.startselfuiabilityinchildprocesstest';
  }
  onNewProcessRequest(want: Want): string {
    console.log(`${TAG} MyAbilityStage.onNewProcessRequest called`);
    return 'onNewProcessRequest';
  }
  onConfigurationUpdate(config: Configuration): void {
    console.log(`${TAG} onConfigurationUpdate, language: ${config.language}`);
  }
  onMemoryLevel(level: AbilityConstant.MemoryLevel): void {
    console.log(`${TAG} onMemoryLevel, level: ${JSON.stringify(level)}`);
  }
}