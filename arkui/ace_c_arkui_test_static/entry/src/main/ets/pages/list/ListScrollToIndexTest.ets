'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { Entry, Component, Column, Text, Margin, ColumnOptions,ContentSlot } from '@ohos.arkui.component'
import { Content, NodeContent } from '@ohos.arkui.node';
import {LibUtil} from '../LibUtil'
import { CommonView } from '../componet/CommonView';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

class ListScrollToIndexData implements jsonx.JsonElementDeserializable, jsonx.JsonElementSerializable {
  pageTag: string;
  index: int;
  alignment: int;

  constructor() {
    this.pageTag = "";
    this.index = 0;
    this.alignment = 0;
  }

  constructor(pageTag: string, index: int, alignment: int) {
    this.pageTag = pageTag;
    this.index = index;
    this.alignment = alignment;
  }

  toJSON(): jsonx.JsonElement {
    let root: Map<string, jsonx.JsonElement> = {
      'pageTag': jsonx.JsonElement.createString(this.pageTag),
      'index': jsonx.JsonElement.createInteger(this.index),
      'alignment': jsonx.JsonElement.createInteger(this.alignment),
    };
    return jsonx.JsonElement.createObject(root)
  }

  fromJSON(jsonElem: jsonx.JsonElement) {
    this.pageTag = jsonElem.tryGetString('pageTag');
    this.index = jsonElem.tryGetInteger('index');
    this.alignment = jsonElem.tryGetInteger('alignment');
  }
}

@Entry
@Component
struct ListScrollToIndexTest {
  PAGE_TAG: string = ''
  private index: int = 0
  private alignment: int = 0
  libUtil:LibUtil = new LibUtil();
  rootSlot: Content = new NodeContent() as Content;

  aboutToAppear(){
    const routerInstance = AppStorage.get<Router>("this.routerInstance.getParams()") as Router
    let params = routerInstance.getParams();
    let data = new ListScrollToIndexData();
    data.fromJSON(params);
    this.PAGE_TAG = data.pageTag;
    this.index = data.index;
    this.alignment = data.alignment;
    this.libUtil.listScrollToIndexTest(this.rootSlot, this.index, this.alignment);
  }

  build() {
    Column() {
      CommonView({
        pageTag: this.PAGE_TAG,
        rootSlot:this.rootSlot
      })
    }
  }
}

export { ListScrollToIndexData }