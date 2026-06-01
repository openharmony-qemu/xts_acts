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
import { router } from '@kit.ArkUI';
 
class RouterParams {
  public data1:string

  constructor(data1:string) {
    this.data1 = data1
  }
}

@Entry
@Component
struct RouterTargetPage {
  private params: string = 'init'

  aboutToAppear() {
    try {
      this.params = (router.getParams() as RouterParams).data1;
      console.info('RouterTargetPage params: ' + JSON.stringify(this.params));
    } catch (err) {
      console.error('RouterTargetPage getParams error: ' + JSON.stringify(err));
    }
  }

  build() {
    Column({ space: 5 }) {
      Text('Router Target Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('接收参数: ' + JSON.stringify(this.params))
        .fontSize(16)
        .margin({ top: 10 })
        .id('text_params_display')

      Button('返回')
        .width('80%')
        .onClick(() => {
          router.back();
        })
        .id('button_back')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#FFE0B2')
  }
}