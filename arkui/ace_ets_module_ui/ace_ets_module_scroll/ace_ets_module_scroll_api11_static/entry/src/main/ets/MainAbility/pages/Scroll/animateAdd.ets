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
import {
  Entry,
  Component,
  Column,
  Button,
  Image,
  Text,
  $r,
  animateTo,
  TransitionEffect,
  Margin,
  ClickEvent,
  TransitionEdge
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct TransitionEffectExample2 {
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
          animateTo({ duration: 2000 }, () => {
            
            
            this.flag = !this.flag;
          });
        })
      if (this.flag) {

        
        
        
        Image($r('app.media.icon')).width(200).height(200)
          .key('keyImageAdd')
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.OPACITY.animation({ duration: 1000 }).combine(
                TransitionEffect.rotate({ z: 1, angle: 180 }).animation({ delay: 1000, duration: 1000 }))
              ,
              TransitionEffect.OPACITY.animation({ delay: 1000, duration: 1000 }).combine(
                TransitionEffect.rotate({ z: 1, angle: 180 }).animation({ duration: 1000 }))
            )
          )
        
        
        Image($r('app.media.icon')).width(200).height(200).margin({ top: 100 } as Margin)
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.scale({ x: 0, y: 0 }),
              TransitionEffect.IDENTITY
            )
          )

        Image($r('app.media.icon')).width(200).height(200).margin({ top: 100 } as Margin)
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.move(TransitionEdge.START),
              TransitionEffect.IDENTITY
            )
          )

        Image($r('app.media.icon')).width(200).height(200).margin({ top: 100 } as Margin)
          .transition(
            TransitionEffect.asymmetric(
              TransitionEffect.move(TransitionEdge.START),
              TransitionEffect.SLIDE
            )
          )
      }
    }.width('100%')
  }
}