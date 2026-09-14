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
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { fileUri, fileIo as fs } from '@kit.CoreFileKit';
import { dragController } from '@kit.ArkUI';
import nativeDragEvent from "libnativeDragEvent.so";
import nativeDragAction from "libnativeDragAction.so";

@Entry
@Component
struct DragDataLoadCombined {
  @State name: string = 'DragDataLoadCombined';
  @State isOk1: boolean = false;
  @State isOk2: boolean = false;
  @State isOk3: boolean = false;
  @State isOk4: boolean = false;
  @State intervalNum: number = 0;
  @State allOk: boolean = false;
  uiContext = this.getUIContext();

  @State stepTips: string = '操作步骤:\n' +
    '1.长按图片(DragEvent)浮起拖拽，观察角标数量\n' +
    '2.长按按钮(DragAction)浮起拖拽，观察角标数量\n' +
    '3.长按原生组件1(CapiDragEvent)浮起拖拽，观察角标数量\n' +
    '4.长按原生组件2(CapiDragAction)浮起拖拽，观察角标数量\n' +
    '预期结果：\n' +
    '每个组件拖拽后角标数均为100(recordCount参数设置)\n';

  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  aboutToDisappear(): void {
    clearInterval(this.intervalNum);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      try {
        if (nativeDragEvent && nativeDragEvent.isDragEventCompleted()) {
          this.isOk3 = true;
        }
        if (nativeDragAction && nativeDragAction.isDragActionCompleted()) {
          this.isOk4 = true;
        }
      } catch (e) {
        console.error('nativeDrag poll error: ' + JSON.stringify(e));
      }
      this.allOk = this.isOk1 && this.isOk2 && this.isOk3 && this.isOk4;
    }, 500);
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.allOk }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .opacity(this.allOk ? 1 : 0.4)
    .enabled(this.allOk)
    .onClick(() => {
      globalThis.arkResult = 'true ';
      globalThis.arkTitle = this.name;
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: { result: 'true ', title: this.name }
      });
      promptAction.showToast({ message: '通过', duration: 1000 });
    })
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      globalThis.arkTitle = this.name;
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: { result: 'false', title: this.name }
      });
      promptAction.showToast({ message: '失败', duration: 1000 });
    })
  }

  @Builder
  DraggingBuilder() {
    Column() {
      Text('拖拽预览')
    }
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          globalThis.arkTitle = this.name;
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          });
        })
        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('8%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Scroll() {
        Column({ space: 10 }) {
          Text('1. DragEvent (长按图片拖拽)').fontSize(12).fontColor(Color.Black)
          Image($r('app.media.icon'))
            .width('30%')
            .height('10%')
            .borderWidth(1)
            .draggable(true)
            .onDragStart((event: DragEvent) => {
              const context: Context | undefined = this.uiContext.getHostContext();
              if (context) {
                let data = context.resourceManager.getMediaContentSync($r('app.media.icon').id, 120);
                const arrayBuffer: ArrayBuffer = data.buffer.slice(data.byteOffset, data.byteLength + data.byteOffset);
                let filePath = context.filesDir + '/test.png';
                let file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
                fs.writeSync(file.fd, arrayBuffer);
                let uri = fileUri.getUriFromPath(filePath);
                let image: unifiedDataChannel.Image = new unifiedDataChannel.Image();
                image.imageUri = uri;
                let imagePng = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PNG, image);
                let dragData: unifiedDataChannel.UnifiedData = new unifiedDataChannel.UnifiedData(image);
                for (let i = 0; i < 100; i++) {
                  dragData.addRecord(imagePng);
                }
                (event as DragEvent).setData(dragData);
                let loadHandler: unifiedDataChannel.DataLoadHandler = () => {
                  return dragData;
                };
                (event as DragEvent).setDataLoadParams({
                  loadHandler: loadHandler,
                  dataLoadInfo: { types: new Set(['test']), recordCount: 100 }
                });
                this.isOk1 = true;
              }
            })

          Text('2. DragAction (长按按钮拖拽)').fontSize(12).fontColor(Color.Black).margin({ top: 10 })
          Button('touch to execute drag')
            .width('60%')
            .height('8%')
            .onTouch((event?: TouchEvent) => {
              if (event && event.type == TouchType.Down) {
                let text = new unifiedDataChannel.PlainText();
                text.textContent = 'drag text';
                text.abstract = 'abstract';
                let unifiedData = new unifiedDataChannel.UnifiedData(text);
                let loadHandler: unifiedDataChannel.DataLoadHandler = () => {
                  return unifiedData;
                };
                let dragInfo: dragController.DragInfo = {
                  pointerId: 0,
                  data: unifiedData,
                  extraParams: '',
                  dataLoadParams: {
                    loadHandler: loadHandler,
                    dataLoadInfo: { types: new Set(['test']), recordCount: 100 }
                  }
                };
                    this.getUIContext().getDragController().executeDrag(() => {
                      this.DraggingBuilder()
                    }, dragInfo, (err, eve) => {
                    this.isOk2 = true;
                  });
              }
            })

          Text('3. CapiDragEvent (长按原生组件拖拽)').fontSize(12).fontColor(Color.Black).margin({ top: 10 })
          XComponent({
            id: 'dragStart',
            type: "node",
            libraryname: 'nativeDragEvent'
          })
            .onAppear(() => {
              try {
                nativeDragEvent.nativeDragEvent("dragStart", this.getUIContext());
              } catch (e) {
                console.error('nativeDragEvent not supported: ' + JSON.stringify(e));
              }
            })
            .width('100%')
            .height('25%')
            .backgroundColor('#FFFAFA')

          Text('4. CapiDragAction (长按原生组件拖拽)').fontSize(12).fontColor(Color.Black).margin({ top: 10 })
          XComponent({
            id: 'dragStart',
            type: "node",
            libraryname: 'nativeDragAction'
          })
            .onAppear(() => {
              try {
                nativeDragAction.nativeDragAction("dragStart", this.getUIContext());
              } catch (e) {
                console.error('nativeDragAction not supported: ' + JSON.stringify(e));
              }
            })
            .width('100%')
            .height('20%')
            .backgroundColor('#FFFAFA')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .height('82%')
      .width('100%')
      .scrollBar(BarState.On)

      Text('isOk1:' + this.isOk1 + ' isOk2:' + this.isOk2 + ' isOk3:' + this.isOk3 + ' isOk4:' + this.isOk4)
        .fontSize(10)
        .fontColor(Color.Black)
        .margin({ bottom: 5 })

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show({
            title: '操作提示',
            message: this.stepTips,
            confirm: { value: 'OK', action: () => {} }
          });
        });
        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}