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
import { Entry,Column,Component,Position,Button,FlexAlign,XComponentType,LocalStorage,XComponentParameters,VideoController,XComponent,XComponentController,SurfaceRect,ImageFit,Video,VerticalAlign,ImageAnalyzerType,ColumnOptions,Row,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

let para: Record<string,string> = {
  'onSurfaceCreated': 'Init',
  'onSurfaceChanged': 'Init',
  'onSurfaceDestroyed': 'Init',
  } as Record<string,string>;
// let storage: LocalStorage = new LocalStorage(para);
class CustomXComponentController extends XComponentController {
  onSurfaceCreated(surfaceId: string): void {
    console.log(`onSurfaceCreated surfaceId: ${surfaceId}`)
    // storage.set('onSurfaceCreated', 'onSurfaceCreated succ');
  }

  onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
    console.log(`onSurfaceChanged surfaceId: ${surfaceId}, rect: ${JSON.stringify(rect)}`)
    // storage.set('onSurfaceChanged', 'onSurfaceChanged succ');
  }

  onSurfaceDestroyed(surfaceId: string): void {
    console.log(`onSurfaceDestroyed surfaceId: ${surfaceId}`)
    // storage.set('onSurfaceDestroyed', 'onSurfaceDestroyed succ');
  }
}

@Entry
@Component
struct onSurfaceCreated1 {
  xComponentController: XComponentController = new CustomXComponentController()
  @State xcWidth: string = "320px";
  @State xcHeight: string = "480px";
  @State createText: string = "Init";
  @State changeText: string = "Init";
  @State destroyText: string = "Init";
  @State flag:boolean = true

  build() {
    Column() {
      Text(this.createText).id('onSurfaceCreated_text')
        .onClick((e: ClickEvent) => {
          // this.createText = storage.get('onSurfaceCreated') as string
        })
      Text(this.changeText).id('onSurfaceChanged_text')
        .onClick((e: ClickEvent) => {
          // this.changeText = storage.get('onSurfaceChanged') as string
        })
      Text(this.destroyText).id('onSurfaceDestroyed_text')
        .onClick((e: ClickEvent) => {
          // this.destroyText = storage.get('onSurfaceDestroyed') as string
        })
      Button("change size").id('onSurfaceChanged_button')
        .onClick((e: ClickEvent) => {
          this.xcWidth = "640px"
          this.xcHeight = "960px"
        })
      Button("Destroyed").id('onSurfaceDestroyed_button')
        .onClick((e: ClickEvent) => {
          this.flag = false
        })
      if(this.flag){
        XComponent({
          id: 'xcomponent_onSurface',
          type: XComponentType.TEXTURE,
          nativeXComponentHandler: ((value0: long): void => {}),
          controller: this.xComponentController
        } as XComponentParameters)
          .width(this.xcWidth)
          .height(this.xcHeight)
      }
    }
    .width("100%")
  }
}