/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { UIAbility } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium-dynamic';
import { EditorFixture } from '../test/EditorFixture';
import testsuite from '../test/List.test';

export default class TestAbility extends UIAbility {
  onCreate(): void {
    Hypium.hypiumTest(abilityDelegatorRegistry.getAbilityDelegator(),
      abilityDelegatorRegistry.getArguments(), testsuite);
  }

  onWindowStageCreate(stage: window.WindowStage): void {
    try {
      EditorFixture.uiReady = false;
      const host = stage.getMainWindowSync();
      EditorFixture.isWindowFocused = () => EditorFixture.windowActive;
      host.on('windowEvent', (event: window.WindowEventType) => {
        if (event === window.WindowEventType.WINDOW_ACTIVE) {
          EditorFixture.windowActive = true;
        } else if (event === window.WindowEventType.WINDOW_INACTIVE) {
          EditorFixture.windowActive = false;
        }
      });
      stage.loadContent('testability/pages/Index', (error) => {
        if (error.code !== 0) {
          throw new Error(`Cannot create test editor: ${error.code}`);
        }
      });
    } catch (error) {
      const failure = error as Error;
      throw new Error('Test window creation failed: ' + failure.message);
    }
  }

  onForeground(): void {
    EditorFixture.windowActive = true;
  }

  onBackground(): void {
    EditorFixture.windowActive = false;
  }
}
