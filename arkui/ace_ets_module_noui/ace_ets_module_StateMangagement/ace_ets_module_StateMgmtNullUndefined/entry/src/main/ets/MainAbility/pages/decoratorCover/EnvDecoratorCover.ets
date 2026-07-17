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
 * Cover EnvDecorator (@Env) via page load.
 */
@Entry
@ComponentV2
struct EnvDecoratorCover {
  @Env(SystemProperties.BREAK_POINT) bp: uiObserver.WindowSizeLayoutBreakpointInfo;

  build() {
    Column() {
      Text('EnvDecoratorCover')
        .id('env_deco_cover_title')
        .fontSize(16)
        .height('5%')
      Text(`w:${this.bp.widthBreakpoint}`)
        .id('env_deco_cover_w')
        .height('5%')
      Text(`h:${this.bp.heightBreakpoint}`)
        .id('env_deco_cover_h')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
