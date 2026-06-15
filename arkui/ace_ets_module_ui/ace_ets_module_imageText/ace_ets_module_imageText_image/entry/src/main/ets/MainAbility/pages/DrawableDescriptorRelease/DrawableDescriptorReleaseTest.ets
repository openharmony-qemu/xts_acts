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
  AnimatedDrawableDescriptor,
  DrawableDescriptor,
  PixelMapDrawableDescriptor,
  LayeredDrawableDescriptor
} from '@kit.ArkUI';
import {
  hasDrawableReleaseApi,
  isDrawableReleased,
  releaseDrawable
} from '../../common/DrawableReleaseCompat';

@Entry
@Component
struct DrawableDescriptorReleaseTest {
  private resManager = this.getUIContext().getHostContext()?.resourceManager;
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
  @State testResult011: string = '';
  @State testResult012: string = '';

  build() {
    Column({ space: 0 }) {
      Text('DrawableDescriptor release/isReleased (API 26+)')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('4%')

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
  this.BuildTestRow006()
  this.BuildTestRow007()
  this.BuildTestRow008()
  this.BuildTestRow009()
  this.BuildTestRow010()
  this.BuildTestRow011()
  this.BuildTestRow012()
  }

  @Builder
  BuildTestRow001() {
    Column({ space: 1 }) {
      Button('E2E_001').id('btnTest001').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test001(); })
      Text(this.testResult001).id('txtTestResult001').key('txtTestResult001').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow002() {
    Column({ space: 1 }) {
      Button('E2E_002').id('btnTest002').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test002(); })
      Text(this.testResult002).id('txtTestResult002').key('txtTestResult002').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow003() {
    Column({ space: 1 }) {
      Button('E2E_003').id('btnTest003').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test003(); })
      Text(this.testResult003).id('txtTestResult003').key('txtTestResult003').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow004() {
    Column({ space: 1 }) {
      Button('E2E_004').id('btnTest004').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test004(); })
      Text(this.testResult004).id('txtTestResult004').key('txtTestResult004').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow005() {
    Column({ space: 1 }) {
      Button('E2E_005').id('btnTest005').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test005(); })
      Text(this.testResult005).id('txtTestResult005').key('txtTestResult005').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow006() {
    Column({ space: 1 }) {
      Button('E2E_006').id('btnTest006').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test006(); })
      Text(this.testResult006).id('txtTestResult006').key('txtTestResult006').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow007() {
    Column({ space: 1 }) {
      Button('E2E_007').id('btnTest007').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test007(); })
      Text(this.testResult007).id('txtTestResult007').key('txtTestResult007').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow008() {
    Column({ space: 1 }) {
      Button('E2E_008').id('btnTest008').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test008(); })
      Text(this.testResult008).id('txtTestResult008').key('txtTestResult008').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow009() {
    Column({ space: 1 }) {
      Button('E2E_009').id('btnTest009').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test009(); })
      Text(this.testResult009).id('txtTestResult009').key('txtTestResult009').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow010() {
    Column({ space: 1 }) {
      Button('E2E_010').id('btnTest010').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test010(); })
      Text(this.testResult010).id('txtTestResult010').key('txtTestResult010').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow011() {
    Column({ space: 1 }) {
      Button('E2E_011').id('btnTest011').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test011(); })
      Text(this.testResult011).id('txtTestResult011').key('txtTestResult011').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  @Builder
  BuildTestRow012() {
    Column({ space: 1 }) {
      Button('E2E_012').id('btnTest012').width('100%').height('55%')
        .constraintSize({ minHeight: 28 }).fontSize(11).onClick((): void => { this.Test012(); })
      Text(this.testResult012).id('txtTestResult012').key('txtTestResult012').width('100%').height('45%')
        .fontSize(9).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
    }.width('100%').height('7.5%')
  }

  private getErrorCode(e: Object): number {
    try {
      let code = (e as Record<string, Object>)['code'];
      if (typeof code === 'number') {
        return code;
      }
      if (typeof code === 'string') {
        return parseInt(code, 10);
      }
      return -1;
    } catch (err) {
      return -1;
    }
  }

  private createDrawableFromRes(): DrawableDescriptor | null {
    if (!this.resManager) {
      return null;
    }
    try {
      return this.resManager.getDrawableDescriptor($r('app.media.tree').id);
    } catch (e) {
      return null;
    }
  }

  private createAnimatedDrawable(): AnimatedDrawableDescriptor {
    return new AnimatedDrawableDescriptor($r('app.media.tree'), { iterations: 1 });
  }

  Test001() {
    const id = 'E2E_001';
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult001 = 'FAIL: 无法创建 DrawableDescriptor';
        return;
      }
      if (!hasDrawableReleaseApi(drawable as ESObject)) {
        this.testResult001 = 'FAIL: DrawableDescriptor 未提供 release/isReleased API';
        return;
      }
      let beforeRelease = isDrawableReleased(drawable as ESObject);
      releaseDrawable(drawable as ESObject);
      let afterRelease = isDrawableReleased(drawable as ESObject);
      if (!beforeRelease && afterRelease) {
        this.testResult001 = 'PASS';
      } else {
        this.testResult001 = `FAIL: beforeRelease=${beforeRelease}, afterRelease=${afterRelease}`;
      }
    } catch (e) {
      this.testResult001 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test002() {
    const id = 'E2E_002';
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult002 = 'FAIL: 无法创建 DrawableDescriptor';
        return;
      }
      releaseDrawable(drawable as ESObject);
      try {
        drawable.getPixelMap();
        this.testResult002 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult002 = 'PASS: error 111002';
        } else {
          this.testResult002 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult002 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test003() {
    const id = 'E2E_003';
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult003 = 'FAIL: 无法创建 DrawableDescriptor';
        return;
      }
      releaseDrawable(drawable as ESObject);
      releaseDrawable(drawable as ESObject);
      if (isDrawableReleased(drawable as ESObject)) {
        this.testResult003 = 'PASS';
      } else {
        this.testResult003 = 'FAIL: 第二次 release 后 isReleased 为 false';
      }
    } catch (e) {
      this.testResult003 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test004() {
    const id = 'E2E_004';
    try {
      let drawable = new LayeredDrawableDescriptor();
      releaseDrawable(drawable as ESObject);
      try {
        drawable.getForeground();
        this.testResult004 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult004 = 'PASS: error 111002';
        } else {
          this.testResult004 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult004 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test005() {
    const id = 'E2E_005';
    try {
      let drawable = new LayeredDrawableDescriptor();
      releaseDrawable(drawable as ESObject);
      try {
        drawable.getBackground();
        this.testResult005 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult005 = 'PASS: error 111002';
        } else {
          this.testResult005 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult005 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test006() {
    const id = 'E2E_006';
    try {
      let drawable = new LayeredDrawableDescriptor();
      releaseDrawable(drawable as ESObject);
      try {
        drawable.getMask();
        this.testResult006 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult006 = 'PASS: error 111002';
        } else {
          this.testResult006 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult006 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test007() {
    const id = 'E2E_007';
    try {
      let drawable = new PixelMapDrawableDescriptor();
      releaseDrawable(drawable as ESObject);
      try {
        drawable.getPixelMap();
        this.testResult007 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult007 = 'PASS: error 111002';
        } else {
          this.testResult007 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult007 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test008() {
    const id = 'E2E_008';
    try {
      let drawable = this.createAnimatedDrawable();
      releaseDrawable(drawable as ESObject);
      try {
        drawable.getPixelMap();
        this.testResult008 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult008 = 'PASS: error 111002';
        } else {
          this.testResult008 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult008 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test009() {
    const id = 'E2E_009';
    try {
      let drawable = this.createAnimatedDrawable();
      releaseDrawable(drawable as ESObject);
      try {
        let controller = drawable.getAnimationController();
        if (controller === undefined) {
          this.testResult009 = 'PASS: undefined';
        } else {
          this.testResult009 = 'FAIL: animationController not undefined';
        }
      } catch (e) {
        this.testResult009 = 'FAIL: 不应该抛异常';
      }
    } catch (e) {
      this.testResult009 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test010() {
    const id = 'E2E_010';
    try {
      let drawable = this.createAnimatedDrawable();
      releaseDrawable(drawable as ESObject);
      try {
        drawable.loadSync();
        this.testResult010 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult010 = 'PASS: error 111002';
        } else {
          this.testResult010 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult010 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  async Test011() {
    const id = 'E2E_011';
    try {
      let drawable = this.createAnimatedDrawable();
      releaseDrawable(drawable as ESObject);
      try {
        await drawable.load();
        this.testResult011 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult011 = 'PASS: error 111002';
        } else {
          this.testResult011 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult011 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test012() {
    const id = 'E2E_012';
    try {
      let drawable = this.createAnimatedDrawable();
      releaseDrawable(drawable as ESObject);
      releaseDrawable(drawable as ESObject);
      if (isDrawableReleased(drawable as ESObject)) {
        this.testResult012 = 'PASS';
      } else {
        this.testResult012 = 'FAIL: 第二次 release 后 isReleased 为 false';
      }
    } catch (e) {
      this.testResult012 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }
}