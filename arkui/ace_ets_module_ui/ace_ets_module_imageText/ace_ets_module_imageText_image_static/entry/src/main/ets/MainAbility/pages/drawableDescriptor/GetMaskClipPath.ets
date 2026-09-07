'use static';
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

import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Row,
  RowOptions,
  Component,
  Button,
  ClickEvent,
  Scroll,
  FontWeight,
  Color,
  Image,
  Path,
  Builder,
  $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { LayeredDrawableDescriptor } from '@ohos.arkui.drawableDescriptor'

@Entry
@Component
struct GetMaskClipPathTest {
  @State testResult001: string = '';
  @State testResult002: string = '';
  @State testResult003: string = '';
  @State testResult004: string = '';
  @State testResult005: string = '';
  @State testResult006: string = '';
  @State testResult007: string = '';
  @State testResult008: string = '';
  @State testResult009: string = '';
  @State testResult010: string = '';
  @State clipPathStr: string = '';

  build() {
    Scroll() {
      Column({ space: 10 } as ColumnOptions) {
        Text('LayeredDrawableDescriptor getMaskClipPath')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)

        this.BuildSectionTitle('1. return type')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath returnType')
            .id('btnTest001')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test001())
          Text(this.testResult001)
            .id('txtTestResult001')
            .fontSize(10)
        }

        this.BuildSectionTitle('2. return value not empty')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath notEmpty')
            .id('btnTest002')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test002())
          Text(this.testResult002)
            .id('txtTestResult002')
            .fontSize(10)
        }

        this.BuildSectionTitle('3. valid SVG path command format')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath validCommand')
            .id('btnTest003')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test003())
          Text(this.testResult003)
            .id('txtTestResult003')
            .fontSize(10)
        }

        this.BuildSectionTitle('4. multiple calls consistency')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath consistency')
            .id('btnTest004')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test004())
          Text(this.testResult004)
            .id('txtTestResult004')
            .fontSize(10)
        }

        this.BuildSectionTitle('5. static call without instance')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath staticCall')
            .id('btnTest005')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test005())
          Text(this.testResult005)
            .id('txtTestResult005')
            .fontSize(10)
        }

        this.BuildSectionTitle('6. contains numeric coordinates')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath hasCoordinates')
            .id('btnTest006')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test006())
          Text(this.testResult006)
            .id('txtTestResult006')
            .fontSize(10)
        }

        this.BuildSectionTitle('7. construct Path object')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath constructPath')
            .id('btnTest007')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test007())
          Text(this.testResult007)
            .id('txtTestResult007')
            .fontSize(10)
        }

        this.BuildSectionTitle('8. apply clipShape to Image')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath applyClipShape')
            .id('btnTest008')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test008())
          Text(this.testResult008)
            .id('txtTestResult008')
            .fontSize(10)
        }

        Image($r('app.media.startIcon'))
          .width(100)
          .height(100)
          .id('imgClipShape')
          .clipShape(new Path({ commands: LayeredDrawableDescriptor.getMaskClipPath() }))

        this.BuildSectionTitle('9. call after creating instance')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath afterInstance')
            .id('btnTest009')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test009())
          Text(this.testResult009)
            .id('txtTestResult009')
            .fontSize(10)
        }

        this.BuildSectionTitle('10. contains path closing command')

        Row({ space: 5 } as RowOptions) {
          Button('getMaskClipPath hasCloseCommand')
            .id('btnTest010')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test010())
          Text(this.testResult010)
            .id('txtTestResult010')
            .fontSize(10)
        }

        Text(`clipPath: ${this.clipPathStr}`)
          .id('txtClipPathStr')
          .fontSize(10)
          .padding({ left: 20, right: 20 })
      }
      .width('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }

  @Builder
  BuildSectionTitle(title: string) {
    Text(title)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Color.Black)
      .width('100%')
  }

  Test001() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (typeof result === 'string') {
        this.testResult001 = 'PASS';
      } else {
        this.testResult001 = `FAIL: return type is ${typeof result}`;
      }
    } catch (e) {
      this.testResult001 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test002() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (result.length > 0) {
        this.testResult002 = `PASS: length=${result.length}`;
      } else {
        this.testResult002 = 'FAIL: return value is empty';
      }
    } catch (e) {
      this.testResult002 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test003() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      let firstChar: string = result.charAt(0);
      let validCommands: string = 'MmLlHhVvCcSsQqTtAaZz';
      if (validCommands.includes(firstChar)) {
        this.testResult003 = `PASS: starts with ${firstChar}`;
      } else {
        this.testResult003 = `FAIL: starts with invalid char ${firstChar}`;
      }
    } catch (e) {
      this.testResult003 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test004() {
    try {
      let result1: string = LayeredDrawableDescriptor.getMaskClipPath();
      let result2: string = LayeredDrawableDescriptor.getMaskClipPath();
      let result3: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (result1 === result2 && result2 === result3) {
        this.testResult004 = 'PASS: consistent across calls';
      } else {
        this.testResult004 = 'FAIL: results differ across calls';
      }
    } catch (e) {
      this.testResult004 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test005() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (result.length > 0) {
        this.testResult005 = 'PASS: static call succeeds without instance';
      } else {
        this.testResult005 = 'FAIL: static call returns empty';
      }
    } catch (e) {
      this.testResult005 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test006() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      let hasNumber: boolean = false;
      for (let i = 0; i < result.length; i++) {
        let ch: string = result.charAt(i);
        if (ch >= '0' && ch <= '9') {
          hasNumber = true;
          break;
        }
      }
      if (hasNumber) {
        this.testResult006 = 'PASS: contains numeric coordinates';
      } else {
        this.testResult006 = 'FAIL: no numeric coordinates found';
      }
    } catch (e) {
      this.testResult006 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test007() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      let pathObj: Path = new Path({ commands: result });
      if (pathObj !== undefined && pathObj !== null) {
        this.testResult007 = 'PASS: Path object constructed';
      } else {
        this.testResult007 = 'FAIL: Path object is null or undefined';
      }
    } catch (e) {
      this.testResult007 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test008() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      let pathObj: Path = new Path({ commands: result });
      this.clipPathStr = result;
      this.testResult008 = 'PASS: clipShape applied without crash';
    } catch (e) {
      this.testResult008 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test009() {
    try {
      let result1: string = LayeredDrawableDescriptor.getMaskClipPath();
      let layered: LayeredDrawableDescriptor = new LayeredDrawableDescriptor();
      let result2: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (result1 === result2) {
        this.testResult009 = 'PASS: same result before and after instance';
      } else {
        this.testResult009 = 'FAIL: results differ after creating instance';
      }
    } catch (e) {
      this.testResult009 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test010() {
    try {
      let result: string = LayeredDrawableDescriptor.getMaskClipPath();
      if (result.includes('Z') || result.includes('z')) {
        this.testResult010 = 'PASS: contains path closing command';
      } else {
        this.testResult010 = 'FAIL: no path closing command found';
      }
    } catch (e) {
      this.testResult010 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }
}
