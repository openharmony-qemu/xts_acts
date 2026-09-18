/*
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

import { ContentFormCard, FormType, uniformDataStruct } from '@kit.ArkData'
import { common } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { CommonView } from '../../componet/CommonView';

@Entry
@Component
struct ContentCardTest2 {
  @State contentForm: uniformDataStruct.ContentForm = {
    uniformDataType: 'general.content-form',
    title: ''
  };
  @State startToShow: boolean = false;

  aboutToAppear(): void {
    // 2. 初始化数据
    this.initData();
  }

  async initData() {
    let context = getContext(this) as common.UIAbilityContext;
    try {
      let appIcon = await context.resourceManager.getMediaContent($r('app.media.startIcon').id);
      let thumbImage = await context.resourceManager.getMediaContent($r('app.media.foreground').id);
      this.contentForm = {
        uniformDataType: 'general.content-form',
        title: 'Content form title',
        thumbData: appIcon,
        description: 'Content form description',
        appIcon: thumbImage,
        appName: 'com.test.demo'
      }; 
    } catch (err) {
      console.info('Init data error' + err.code + err.message);
    }
  }

  build() {
    Stack() {
      Column() {
        Button('card')
        .onClick(() => {
          // 3. 点击后startToShow变为true，页面重新渲染
          this.startToShow = true;
          console.info('ContentCardTest2 startToShow' + this.startToShow);
        })
        .id('card')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        if (this.startToShow) {
          // 4. 使用内容卡片，传入对应的参数
          ContentFormCard({
            contentFormData: this.contentForm,
            formType: FormType.TYPE_MID,
            formWidth: 110,
            formHeight: 50,
            handleOnClick: () => {
              console.info('Clicked card');
            }
          }).id('midCard')
        }
      }
    }
    .width('100%')
    .height('100%')
    .alignContent(Alignment.Center)
  }
}