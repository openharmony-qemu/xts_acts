'use static';
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

import { ExtendableRelativeContainer, Length, Entry, Component, Text } from '@kit.ArkUI';

class MyRelativeContainer extends ExtendableRelativeContainer {
  setRelativeContainerOptions(): this{
    super.setRelativeContainerOptions();
    // 添加自定义行为，如打印日志
    console.info('MyRelativeContainer: setRelativeContainerOptions');
    return this;
  }
  width(): this {
    super.width('100%');
    return this;
  }

  height(): this {
    super.height('100%');
    return this;
  }

  newAttribute(): this {
    super.height('50%');
    super.width('50%');
    return this;
  }
}

@Entry
@Component
struct ExtendableRelativeContainerBuiltIn {
  build() {
    MyRelativeContainer() {
      Text('RelativeContainer')
    }
    .border({ width: 2, color: '#6699FF' })
    .newAttribute()
    .id('ExtendableRelativeContainer_001')
  }
}