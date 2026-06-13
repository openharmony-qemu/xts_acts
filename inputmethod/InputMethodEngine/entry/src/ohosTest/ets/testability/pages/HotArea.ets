/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import keyboardController from '../../InputMethodEngineHotArea/KeyboardControllerNew';
const TAG: string = 'InputDemo';

@Entry
@Component
struct hotArea {
  @State keyBgc: string = '#fff';
  @State keyFontColor: string = '#000';

  onPageShow() {
    this.initConfig();
  }

  async initConfig() {
    let config = await getContext(this).resourceManager.getConfiguration();
    console.info(TAG + '====>Imsakit onchange' + JSON.stringify(config));
  }

  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        Flex({ justifyContent: FlexAlign.Start }){
          Text('Test1').fontSize(20)
            .id('text1')
            .fontColor(this.keyFontColor)
            .backgroundColor(this.keyBgc)
            .borderRadius(6)
            .margin({right: '5vp'})
            .onClick(() => {
              console.info('====>click  text1');
              keyboardController.insertText('1');
            })
        }
        .padding({ top: '1%', left: '2%'})

        Flex({ justifyContent: FlexAlign.End }){
          Text('Test2').fontSize(20)
            .id('text2')
            .fontColor(this.keyFontColor)
            .backgroundColor(this.keyBgc)
            .borderRadius(6)
            .margin({right: '5vp'})
            .onClick(() => {
              console.info('====>click  text2');
              keyboardController.insertText('2');
            })
        }
        .padding({ top: '1%', left: '2%'})
      }
      .width('100%')
      Blank()
      Flex({ alignItems: ItemAlign.End }) {
        Flex({ justifyContent: FlexAlign.Start }){
          Text('Test3').fontSize(20)
            .id('text3')
            .fontColor(this.keyFontColor)
            .backgroundColor(this.keyBgc)
            .borderRadius(6)
            .margin({right: '5vp'})
            .onClick(() => {
              console.info('====>click  text3');
              keyboardController.insertText('3');
            })
        }
        .padding({ top: '1%', left: '2%'})

        Flex({ justifyContent: FlexAlign.End }){
          Text('Test4').fontSize(20)
            .id('text4')
            .fontColor(this.keyFontColor)
            .backgroundColor(this.keyBgc)
            .borderRadius(6)
            .margin({right: '5vp'})
            .onClick(() => {
              console.info('====>click  text4');
              keyboardController.insertText('4');
            })
        }
        .padding({ top: '1%', left: '2%'})
      }
      .width('100%')
    }
    .backgroundColor('#5FFF00FF')
    .width('100%')
    .height('100%')
  }
}