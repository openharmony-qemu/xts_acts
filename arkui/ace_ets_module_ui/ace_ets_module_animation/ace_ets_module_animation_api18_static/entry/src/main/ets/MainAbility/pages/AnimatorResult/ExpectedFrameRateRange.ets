/**
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
import { UIContext } from '@ohos.arkui.UIContext';
import events_emitter from '@ohos.events.emitter';
import { $r, Circle, ClickEvent, Column, Component, Entry, Margin, } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ExpectedFrameRateRange {
  @State myScale: number = 1.0;
  @State expectedNumber: number = 90;
  @State minNumber: number = 60;
  @State maxNumber: number = 120;
  uiContext: UIContext | undefined = undefined;

  aboutToAppear() {
    this.uiContext = this.getUIContext?.();
  }

  build() {
    Column() {
      Circle()
        .id('circleId')
        .width(100)
        .height(100)
        .fill('#46B1E3')
        .margin(100)
        .scale({ x: this.myScale, y: this.myScale })
        .onClick((e: ClickEvent) => {
          if (!this.uiContext) {
            console.info('no uiContext, keyframe failed');
            return;
          }
          this.myScale = 1;
        })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}