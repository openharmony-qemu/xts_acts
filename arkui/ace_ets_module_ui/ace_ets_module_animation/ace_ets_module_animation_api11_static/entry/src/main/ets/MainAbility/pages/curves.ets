// @ts-nocheck
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
@Entry
@Component
struct ImageComponent {
  @State widthSize: number = 200;
  @State heightSize: number = 200;

  build() {
    Column() {
      Text()
        .margin({ top: 100 } as Margin)
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Red)
        .onClick((e: ClickEvent) => {
          let curve = Curves.cubicBezierCurve(0.25, 0.1, 0.25, 1.0);
          let curve1 = Curves.initCurve();
          let curve2 = Curves.Curve.EaseIn;
          let curve3 = Curves.Curve.EaseOut;
          let curve4 = Curves.Curve.EaseInOut;
          let curve5 = Curves.Curve.FastOutSlowIn;
          let curve6 = Curves.Curve.LinearOutSlowIn;
          let curve7 = Curves.Curve.FastOutLinearIn;
          let curve8 = Curves.Curve.ExtremeDeceleration;
          let curve9 = Curves.Curve.Sharp;
          let curve10 = Curves.Curve.Rhythm;
          let curve11 = Curves.cubicBezierCurve(0.1, 0.0, 0.1, 1.0);
          let curve12 = Curves.springCurve(100, 1, 228, 30);
          this.widthSize = curve.interpolate(0.5) * this.widthSize;
          this.heightSize = curve.interpolate(0.5) * this.heightSize;
        })
        // .animation({ duration: 2000, curve: Curves.springCurve(0.25, 0.1, 0.25, 1.0) })
    }.width("100%").height("100%")
  }
}