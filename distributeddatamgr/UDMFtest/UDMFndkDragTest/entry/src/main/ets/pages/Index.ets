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
import { unifiedDataChannel, uniformDataStruct, uniformTypeDescriptor } from '@kit.ArkData';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { NodeContent } from '@kit.ArkUI';
import testNapi from 'libentry.so';

/**
 * Main page of the drag test: it shows a draggable icon as the drag source
 * and a native drop area that receives the dragged unified data.
 */
@Entry
@Component
struct Index {
  // Current drag position, recorded when a drag gesture starts.
  @State positionX: number = 0;
  @State positionY: number = 0;
  // Drag anchor recorded at the beginning of a gesture.
  private startX: number = 0;
  private startY: number = 0;
  // Content of the native drop target, rendered below the drag source.
  private readonly nativeDropContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    // Ask the native module to build the drop target attached to this page.
    testNapi.CreateDropTarget_001(this.nativeDropContent);
  }

  /**
   * Create an empty test file with the given suffix inside the application
   * sandbox and return its file URI; returns an empty string on failure.
   */
  private createTestFileUri(fileSuffix: string): string {
    const context = this.getUIContext().getHostContext();
    if (!context) {
      return '';
    }
    try {
      // Create (or reuse) the file, then convert its path into a file URI.
      const path = `${context.filesDir}/test.${fileSuffix}`;
      const file = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
      fileIo.closeSync(file);
      console.log(`DragTest: `, fileUri.getUriFromPath(path));
      return fileUri.getUriFromPath(path);
    } catch (error) {
      console.error(`[DragSummaryDemo] Failed to create the test file URI: ${error}`);
      return '';
    }
  }

  build() {
    Column() {
      // Drag source area: the icon provides the unified data of the drag.
      Row() {
        Column() {
          Image($r('app.media.icon'))
            .id('icon')
            .width(50)
            .height(50)
            .objectFit(ImageFit.Fill)
            .draggable(true)
            .onDragStart((event: DragEvent, extraParams: string) => {
              console.log('DragTest: ', `The icon drag starts`);
              this.startX = this.positionX;
              this.startY = this.positionY;

              let unifiedData = new unifiedDataChannel.UnifiedData();

              // Record 1: an image whose URI carries a complex suffix.
              const imageUri = this.createTestFileUri('photo.png?x=.jpg#y');
              if (imageUri.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the image sandbox path.');
                return {};
              }
              let imageRecord = new unifiedDataChannel.Image();
              imageRecord.imageUri = imageUri;

              // Record 2: an audio file described by a FileUri structure.
              const audioUri = this.createTestFileUri('mp3');
              if (audioUri.length === 0) {
                console.error('[DragSummaryDemo] Failed to obtain the audio sandbox path.');
                return {};
              }
              let audioFileStruct: uniformDataStruct.FileUri = {
                uniformDataType: 'general.file-uri',
                oriUri: audioUri,
                fileType: 'general.audio'
              };
              let audioRecord = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.AUDIO, audioFileStruct);

              // Keep the original record order: audio record first, then image record.
              unifiedData.addRecord(audioRecord);
              unifiedData.addRecord(imageRecord);

              event.setData(unifiedData);
              return {};
            })
        }
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('40%')

      // Native drop area that receives the dragged unified data.
      Stack() {
        ContentSlot(this.nativeDropContent)
      }
      .id('nativeDropArea')
      .width('80%')
      .height(120)
    }
    .height('100%')
    .width('100%')
  }
}
