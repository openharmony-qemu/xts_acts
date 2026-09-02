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
import xcomperr from 'libxcomperr.so';
import { NodeContent } from '@kit.ArkUI';

@Entry
@Component
struct XComponentErrorCode {
  @State currentStatus: string = 'init';
  private nodeContent: NodeContent = new NodeContent();
  aboutToAppear():void{
    // 通过C-API创建节点（组件族/触摸族/鼠标族三个 XComponent 节点），挂载到 nodeContent 上。
    // 挂载 XComponent 节点：渲染通道就绪后，触摸/鼠标事件才能注入并命中节点。
    if (xcomperr) {
      xcomperr.XComponentCreate(this.nodeContent);
    }
  }

  build() {
    Column() {
      ContentSlot(this.nodeContent);
    }
    .width('100%')
    .height('100%')
  }
}
