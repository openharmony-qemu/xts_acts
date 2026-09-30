/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { image } from '@kit.ImageKit';

@Entry
@Component
struct ImageAttachmentResizable {
  imagePixelMap: image.PixelMap | undefined = undefined;
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  private sliceOpts: ResizableOptions = {
    slice: { left: 2, right: 2, top: 2, bottom: 2 }
  };

  async aboutToAppear() {
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
  }

  private async getPixmapFromMedia(resource: Resource): Promise<image.PixelMap> {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    });
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength));
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    });
    await imageSource.release();
    return createPixelMap;
  }

  private storeAttachmentResizable(
    att: ImageAttachment,
    key: string,
    optsResizable: ResizableOptions | null | undefined,
    useResizable: boolean
  ): void {
    let fromAtt: ResizableOptions | undefined = att.resizable;
    if (fromAtt !== undefined) {
      AppStorage.setOrCreate(key, JSON.stringify(fromAtt));
      return;
    }
    if (useResizable && optsResizable !== null && optsResizable !== undefined) {
      AppStorage.setOrCreate(key, JSON.stringify(optsResizable));
      return;
    }
    AppStorage.setOrCreate(key, 'default');
  }

  private createResourceAttachment(
    resizableValue: ResizableOptions | null | undefined,
    useResizable: boolean
  ): ImageAttachment {
    let opts: ResourceImageAttachmentOptions = {
      resourceValue: $r('app.media.icon'),
      size: { width: 40, height: 40 }
    };
    if (useResizable) {
      opts.resizable = resizableValue as ResizableOptions;
    }
    return new ImageAttachment(opts);
  }

  private createInterfaceAttachment(
    resizableValue: ResizableOptions | null | undefined,
    useResizable: boolean
  ): ImageAttachment | undefined {
    if (this.imagePixelMap === undefined) {
      return undefined;
    }
    let opts: ImageAttachmentInterface = {
      value: this.imagePixelMap,
      size: { width: 40, height: 40 }
    };
    if (useResizable) {
      opts.resizable = resizableValue as ResizableOptions;
    }
    return new ImageAttachment(opts);
  }

  private onResourceClick(
    key: string,
    resizableValue: ResizableOptions | null | undefined,
    useResizable: boolean,
    applyToEditor: boolean
  ): void {
    let att = this.createResourceAttachment(resizableValue, useResizable);
    this.storeAttachmentResizable(att, key, resizableValue, useResizable);
    if (applyToEditor) {
      this.controller.setStyledString(new MutableStyledString(att));
    }
  }

  private onInterfaceClick(
    key: string,
    resizableValue: ResizableOptions | null | undefined,
    useResizable: boolean,
    applyToEditor: boolean
  ): void {
    let att = this.createInterfaceAttachment(resizableValue, useResizable);
    if (att === undefined) {
      AppStorage.setOrCreate(key, 'no_pixelmap');
      return;
    }
    this.storeAttachmentResizable(att, key, resizableValue, useResizable);
    if (applyToEditor) {
      this.controller.setStyledString(new MutableStyledString(att));
    }
  }

  @Builder
  actionButton(btnId: string, label: string, onTap: () => void) {
    Button(label)
      .id(btnId)
      .width('100%')
      .height('5%')
      .onClick(onTap)
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        this.actionButton('btn_imageAttachment_resource_slice', 'Resource slice', () => {
          this.onResourceClick('imageAttachment_resource_slice', this.sliceOpts, true, true);
        })
        this.actionButton('btn_imageAttachment_resource_default', 'Resource default', () => {
          this.onResourceClick('imageAttachment_resource_default', undefined, false, false);
        })
        this.actionButton('btn_imageAttachment_resource_null', 'Resource null', () => {
          this.onResourceClick('imageAttachment_resource_null', null, true, false);
        })
        this.actionButton('btn_imageAttachment_resource_undefined', 'Resource undefined', () => {
          this.onResourceClick('imageAttachment_resource_undefined', undefined, true, false);
        })
        this.actionButton('btn_imageAttachment_interface_slice', 'Interface slice', () => {
          this.onInterfaceClick('imageAttachment_interface_slice', this.sliceOpts, true, true);
        })
        this.actionButton('btn_imageAttachment_interface_default', 'Interface default', () => {
          this.onInterfaceClick('imageAttachment_interface_default', undefined, false, false);
        })
        this.actionButton('btn_imageAttachment_interface_null', 'Interface null', () => {
          this.onInterfaceClick('imageAttachment_interface_null', null, true, false);
        })
        this.actionButton('btn_imageAttachment_interface_undefined', 'Interface undefined', () => {
          this.onInterfaceClick('imageAttachment_interface_undefined', undefined, true, false);
        })
        RichEditor(this.options)
          .id('richEditor_imageAttachment_resizable')
          .width('100%')
          .height('20%')
          .borderWidth(1)
          .borderColor(Color.Gray)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
