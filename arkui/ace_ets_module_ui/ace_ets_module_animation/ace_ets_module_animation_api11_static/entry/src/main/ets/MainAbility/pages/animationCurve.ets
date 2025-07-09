/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import Curves from '@ohos.curves';
import events_emitter from '@ohos.events.emitter';
import { MessageManager, Callback } from '../utils/MessageManager';
import animator, { AnimatorResult, AnimatorOptions, PlayMode, SimpleAnimatorOptions } from '@ohos.animator';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,
  ExpectedFrameRateRange,
  Scroll,
  Margin,
  animateTo,
  Curve,
  ScrollDirection,
  FillMode,
  Flex,
  FlexDirection,
  ItemAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FinishCallbackType
} from '@ohos.arkui.component'
import { State, Watch, Link, StorageLink } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
@Entry
@Component
struct AnimationCurveTest {
  @State widthSize: number = 50;
  @State heightSize: number = 50;

  onFinish() {
  }

  interpolate(fraction: number ): number  {
    return fraction;
  }
  build() {
    Column() {
      Text()
        .key("curvesText")
        .margin({ top: 100 } as Margin)
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Red)
        .onClick((e: ClickEvent) => {
          let fractionCure = Curves.customCurve(this.interpolate).interpolate(0.1)
          AppStorage.setOrCreate<number>('fraction', fractionCure, Type.from<number>());
          this.widthSize = 2 * this.widthSize;
          this.heightSize = 2 * this.heightSize;
        })
        // .animation({ duration: 2000, curve: Curves.customCurve(this.interpolate), onFinish: this.onFinish })
    }
    .width("100%")
    .height("100%")
  }
}