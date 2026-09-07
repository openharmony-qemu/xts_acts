/**
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

import { LayeredDrawableDescriptor } from '@kit.ArkUI';

@Entry
@Component
struct GetMaskClipPathTest {
  @State testResult001: string = '';
  @State testResult002: string = '';
  @State testResult003: string = '';
  @State testResult004: string = '';
  @State testResult005: string = '';

  build() {
    Column({ space: 5 }) {
      Text('LayeredDrawableDescriptor getMaskClipPath')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Column({ space: 2 }) {
        this.BuildAllTestRows()
      }
      .width('100%')
      .height('96%')
    }
    .width('100%')
    .height('100%')
    .padding({ left: 6, right: 6, top: 4, bottom: 4 })
    .backgroundColor(0xF5F5F5)
  }

  @Builder
  BuildAllTestRows() {
    this.BuildTestRow001()
    this.BuildTestRow002()
    this.BuildTestRow003()
    this.BuildTestRow004()
    this.BuildTestRow005()
  }

  @Builder
  BuildTestRow001() {
    Column({ space: 1 }) {
      Button('E2E_001').id('btnTest001').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test001(); })
      Text(this.testResult001).id('GetMaskClipPathTest001').key('GetMaskClipPathTest001').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('80%').height('7.5%')
  }

  @Builder
  BuildTestRow002() {
    Column({ space: 1 }) {
      Button('E2E_002').id('btnTest002').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test002(); })
      Text(this.testResult002).id('GetMaskClipPathTest002').key('GetMaskClipPathTest002').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('80%').height('7.5%')
  }

  @Builder
  BuildTestRow003() {
    Column({ space: 1 }) {
      Button('E2E_003').id('btnTest003').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test003(); })
      Text(this.testResult003).id('GetMaskClipPathTest003').key('GetMaskClipPathTest003').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('80%').height('7.5%')
  }

  @Builder
  BuildTestRow004() {
    Column({ space: 1 }) {
      Button('E2E_004').id('btnTest004').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test004(); })
      Text(this.testResult004).id('GetMaskClipPathTest004').key('GetMaskClipPathTest004').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('80%').height('7.5%')
  }

  @Builder
  BuildTestRow005() {
    Column({ space: 1 }) {
      Button('E2E_005').id('btnTest005').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test005(); })
      Text(this.testResult005).id('GetMaskClipPathTest005').key('GetMaskClipPathTest005').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('80%').height('7.5%')
  }

  Test001() {
    try {
      let clipPath: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (typeof clipPath === 'string') {
        this.testResult001 = 'PASS';
      } else {
        this.testResult001 = 'FAIL: returnType=' + typeof clipPath;
      }
    } catch (e) {
      this.testResult001 = 'FAIL: exception ' + JSON.stringify(e);
    }
  }

  Test002() {
    try {
      let clipPath: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (clipPath.length > 0) {
        this.testResult002 = 'PASS:length=' + clipPath.length;
      } else {
        this.testResult002 = 'FAIL: empty string';
      }
    } catch (e) {
      this.testResult002 = 'FAIL: exception ' + JSON.stringify(e);
    }
  }

  Test003() {
    try {
      let clipPath1: string = LayeredDrawableDescriptor.getMaskClipPath();
      let clipPath2: string = LayeredDrawableDescriptor.getMaskClipPath();
      let clipPath3: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (clipPath1 === clipPath2 && clipPath2 === clipPath3) {
        this.testResult003 = 'PASS';
      } else {
        this.testResult003 = 'FAIL: inconsistent results';
      }
    } catch (e) {
      this.testResult003 = 'FAIL: exception ' + JSON.stringify(e);
    }
  }

  Test004() {
    try {
      let clipPath: string = LayeredDrawableDescriptor.getMaskClipPath();
      let firstChar: string = clipPath.charAt(0);
      let hasDigit: boolean = false;
      for (let i = 0; i < clipPath.length; i++) {
        let c: string = clipPath.charAt(i);
        if (c >= '0' && c <= '9') {
          hasDigit = true;
          break;
        }
      }
      if ((firstChar === 'M' || firstChar === 'm') && hasDigit) {
        this.testResult004 = 'PASS';
      } else {
        this.testResult004 = 'FAIL: firstChar=' + firstChar + ' hasDigit=' + hasDigit;
      }
    } catch (e) {
      this.testResult004 = 'FAIL: exception ' + JSON.stringify(e);
    }
  }

  Test005() {
    try {
      let clipPath: string = LayeredDrawableDescriptor.getMaskClipPath();
      let pathObj = new Path({ commands: clipPath });
      if (pathObj !== null && pathObj !== undefined) {
        this.testResult005 = 'PASS';
      } else {
        this.testResult005 = 'FAIL: Path object is null/undefined';
      }
    } catch (e) {
      this.testResult005 = 'FAIL: exception ' + JSON.stringify(e);
    }
  }
}
