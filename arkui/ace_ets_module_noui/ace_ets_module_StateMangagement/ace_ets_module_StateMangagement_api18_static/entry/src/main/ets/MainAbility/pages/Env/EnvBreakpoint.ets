'use static';
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
import { Env, Entry, Component, ComponentV2, Column, Require, Param, ObjectLink, SystemProperties,Text,AppStorage } from '@kit.ArkUI';
import uiObserver from '@ohos.arkui.observer';

@Entry
@Component
struct EnvBreakpoint {
  @Env(SystemProperties.BREAK_POINT) breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo; // 正确写法

  build() {
    Column() {
      CompV2({ breakpoint: this.breakpoint }) // 正确写法
      Comp({ breakpoint: this.breakpoint }) // 正确写法
    }
  }
}

@ComponentV2
struct CompV2 {
  @Require @Param breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo; // 正确写法

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`ComponentV2 breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .id('Env_ComponentV2_001')
        .height('5%')
        .fontSize(10)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`ComponentV2 breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .id('Env_ComponentV2_002')
        .height('5%')
        .fontSize(10)
    }
  }
}


@Component
struct Comp {
  @Require breakpoint: uiObserver.WindowSizeLayoutBreakpointInfo; // 正确写法

  build() {
    Column() {
      // 打印当前窗口宽度所在的布局断点枚举值
      Text(`Component breakpoint width: ${this.breakpoint.widthBreakpoint}`)
        .id('Env_Component_001')
        .height('5%')
        .fontSize(5)
      // 打印当前窗口高度所在的布局断点枚举值
      Text(`Component breakpoint height: ${this.breakpoint.heightBreakpoint}`)
        .id('Env_Component_002')
        .height('5%')
        .fontSize(5)
    }
  }
}