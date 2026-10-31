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
  Column, Component, CustomBuilderT, Entry, FlexAlign, MutableBuilder,
  mutableBuilder, State, WrappedBuilder, wrapBuilder
} from '@kit.ArkUI';
import { namespaceBuilder, mutableSourceBuilder } from './wrapBuilderModule01';

const namespaceWrapped: WrappedBuilder<CustomBuilderT<string>> =
  wrapBuilder<CustomBuilderT<string>>(namespaceBuilder);
const mutableWrapped: MutableBuilder<CustomBuilderT<string>> =
  mutableBuilder<CustomBuilderT<string>>(mutableSourceBuilder);

@Entry
@Component
struct WrapBuilder0030 {
  @State message: string = 'Hello World';

  build(): void {
    Column() {
      namespaceWrapped.builder('WrappedBuilder');
      mutableWrapped.builder('MutableBuilder');
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
