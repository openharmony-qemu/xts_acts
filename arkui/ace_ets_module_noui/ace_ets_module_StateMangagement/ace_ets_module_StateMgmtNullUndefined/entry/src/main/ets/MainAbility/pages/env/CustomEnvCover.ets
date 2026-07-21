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

import { uiObserver } from '@kit.ArkUI';

/**
 * Cover CustomEnvKey.create / SystemProperties / @Env(SystemProperties)。
 * @Env(null|undefined) 编不过见 null_undefined_compile_failures.md；
 * Method Env(null|undefined) 已在 EnvDecoratorCover 覆盖。
 */
@Entry
@ComponentV2
struct CustomEnvCover {
  @Env(SystemProperties.BREAK_POINT) bp: uiObserver.WindowSizeLayoutBreakpointInfo;
  @Local keyReady: string = 'init';

  aboutToAppear(): void {
    try {
      const key = CustomEnvKey.create<string>();
      this.keyReady = key !== undefined ? 'key:ok' : 'key:none';
    } catch (err) {
      console.error('[CustomEnvCover] CustomEnvKey.create error: ' + JSON.stringify(err));
      this.keyReady = 'key:error';
    }
  }

  build() {
    Column() {
      Text('CustomEnvCover')
        .id('custom_env_cover_title')
        .fontSize(16)
        .height('5%')
      Text(`bpW:${this.bp.widthBreakpoint}`)
        .id('custom_env_cover_bp')
        .height('5%')
      Text(this.keyReady)
        .id('custom_env_cover_key')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
