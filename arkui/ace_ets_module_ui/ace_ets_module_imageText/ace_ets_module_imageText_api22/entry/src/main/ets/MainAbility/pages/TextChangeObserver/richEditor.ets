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

import { UIObserver, uiObserver } from '@kit.ArkUI';

@Entry
@Component
struct Page {
  controller: RichEditorController = new RichEditorController();
  observer: UIObserver = this.getUIContext().getUIObserver();
  @State globalOutput: string = '';
  @State localOutput: string = '';

  build() {
    Row(){
      Column(){
        Text(this.globalOutput).id('globalOutputRichEditor').fontSize(24).width('80%').margin({ bottom: 10 })

        Text(this.localOutput).id('localOutputRichEditor').fontSize(24).width('80%').margin({ bottom: 10 })

        Text('监听textChange开关按钮').fontSize(18).fontWeight(FontWeight.Bold).margin({ bottom: 10 })

        Row(){
          Button('全局监听(开)')
            .id('全局监听(开)')
            .width('40%')
            .fontSize('20vp')
            .margin({ right: 10 })
            .onClick(()=>{
              this.observer.on('textChange', (info: uiObserver.TextChangeEventInfo)=>{
                console.info('[TEST INFO] [uiObserver] [textChange] [global] [id: ' + JSON.stringify(info.id) + '] [uniqueId: ' + JSON.stringify(info.uniqueId) + '] [content: ' + JSON.stringify(info.content) + ']');
                this.globalOutput = info.content;
              });
            })
          Button('全局监听(关)')
            .id('全局监听(关)')
            .width('40%')
            .fontSize('20vp')
            .margin({ left: 10 })
            .onClick(()=>{
              this.observer.off('textChange');
            })
        }.margin({ bottom: 10 })

        Row(){
          Button('局部richEditor(开)')
            .id('局部richEditor(开)')
            .width('40%')
            .fontSize('20vp')
            .margin({ right: 10 })
            .onClick(()=>{
              this.observer.on('textChange', { id: 'richEditor' }, (info: uiObserver.TextChangeEventInfo)=>{
                console.info('[TEST INFO] [uiObserver] [textChange] [richEditor] [id: ' + JSON.stringify(info.id) + '] [uniqueId: ' + JSON.stringify(info.uniqueId) + '] [content: ' + JSON.stringify(info.content) + ']');
                this.localOutput = info.content;
              });
            })
          Button('局部richEditor(关)')
            .id('局部richEditor(关)')
            .width('40%')
            .fontSize('20vp')
            .margin({ left: 10 })
            .onClick(()=>{
              this.observer.off('textChange', { id: 'richEditor' });
            })
        }.margin({ bottom: 10 })

        Text('RichEditor').margin({ bottom: 5 })
        RichEditor({ controller: this.controller })
		  .id('richEditor')
          .width('80%')
          .draggable(true)
          .draggable(true)
          .onDragStart(()=>{})
          .margin({ bottom: 10 })
          .placeholder('默认输入文本')
      }
      .width('100%')
    }
    .height('100%')
  }
}