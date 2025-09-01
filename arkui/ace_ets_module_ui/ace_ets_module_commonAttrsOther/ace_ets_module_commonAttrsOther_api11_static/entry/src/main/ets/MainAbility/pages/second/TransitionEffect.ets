/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  $$,
  $r,
  Alignment,
  AnimateParam,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  RotateOptions,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TransitionEffect
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';

import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct TransitionEffectExample1 {
  @State flag: boolean = true;
  @State show: string = 'show';

  build() {
    Column() {
      Button(this.show).width(80).height(30).margin(30)
        .onClick((e: ClickEvent) => {

          if (this.flag) {
            this.show = 'hide';
          } else {
            this.show = 'show';
          }
          this.flag = !this.flag;
        })
      if (this.flag) {


        Image($r('app.media.icon'))
          .width(200)
          .height(200)
          .transition(TransitionEffect.OPACITY.animation({ duration: 2000, curve: Curve.Ease } as AnimateParam).combine(
            TransitionEffect.rotate({ z: 1, centerZ: 1, angle: 180 } as RotateOptions)
          ))
      } else {
        Image($r('app.media.icon')).width(200).height(200)
          .transition(TransitionEffect.IDENTITY
            .animation({ duration: 2000, curve: Curve.Ease } as AnimateParam).combine(
              TransitionEffect.rotate({ z: 1, centerZ: 1, angle: 180 } as RotateOptions)
            ))
      }
      Image($r('app.media.icon')).width(200).height(200)
        .transition(
          TransitionEffect.asymmetric(
            TransitionEffect.rotate({ z: 1, centerZ: 1, angle: 180 } as RotateOptions),
            TransitionEffect.rotate({ z: 1, centerZ: 1, angle: 90 } as RotateOptions)
          )
        )
      Image($r('app.media.icon')).width(200).height(200)
        .transition(TransitionEffect.SLIDE_SWITCH)
    }.width('100%')
  }
}