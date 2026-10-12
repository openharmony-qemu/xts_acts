/**
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
import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct ImageAnimatorInterpolationPage {
  @State interpolation: ImageInterpolation = ImageInterpolation.None
  messageManager: MessageManager = new MessageManager()

  onPageShow() {
    console.info('ImageAnimatorInterpolation onPageShow')
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    }
    let callback: Callback = (message: ESObject) => {
      console.error('message = ' + message.name + '--' + message.value)
      if (message.name == 'interpolation') {
        this.interpolation = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column({ space: 10 }) {
      // 默认值基准组件：未设置 interpolation 属性，默认值为 ImageInterpolation.Low
      ImageAnimator()
        .images([
          {
            src: $rawfile('img1.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img2.png'),
            width: 30,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img3.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          }
        ])
        .width('100%')
        .height('35%')
        .key('imageAnimatorDefault')

      // 动态属性组件：interpolation 绑定到状态变量，通过 MessageManager 动态修改
      ImageAnimator()
        .images([
          {
            src: $rawfile('img1.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img2.png'),
            width: 30,
            height: 20,
            top: 20,
            left: 20
          },
          {
            src: $rawfile('img3.png'),
            width: 20,
            height: 20,
            top: 20,
            left: 20
          }
        ])
        .interpolation(this.interpolation)
        .width('100%')
        .height('35%')
        .key('imageAnimatorInterpolation')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 12, bottom: 12 })
  }
}
