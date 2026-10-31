'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {
  BuilderParam, Column, Component, CustomBuilderT, Entry, FlexAlign,
  State, WrappedBuilder, wrapBuilder
} from '@kit.ArkUI';
import { staticBuilder, namespaceBuilder } from './wrapBuilderModule02';

const staticWrapped: WrappedBuilder<CustomBuilderT<string>> =
  wrapBuilder<CustomBuilderT<string>>(staticBuilder);
const identifierBoundWrapped: WrappedBuilder<CustomBuilderT<string>> =
  wrapBuilder<CustomBuilderT<string>>(namespaceBuilder);

@Entry
@Component
struct WrapBuilder0040 {
  @State message: string = 'Hello World';
  @BuilderParam aa: (param: string) => void = staticBuilder;
  @BuilderParam bb: (param: string) => void = namespaceBuilder;

  aboutToAppear(): void {
    this.aa = staticWrapped.builder;
    this.bb = identifierBoundWrapped.builder;
  }

  build(): void {
    Column() {
      this.aa('AA');
      this.bb('BB');
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
