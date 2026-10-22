'use static';

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Entry,
  Component,
  Column,
  Canvas,
  Scroll,
  Button,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  DrawingRenderingContext,
  LengthMetricsUnit,
  ColumnOptions
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct CanvasIndex {
  private ctx2dBound: CanvasRenderingContext2D =
    new CanvasRenderingContext2D(new RenderingContextSettings(true));
  private drcBound: DrawingRenderingContext = new DrawingRenderingContext();

  @State mCtxBound: string = 'ctx_bound_init'
  @State mDrcBound: string = 'drc_bound_init'
  @State mAntiAliasDefault: string = 'antialias_default_init'
  @State mAntiAliasCtor: string = 'antialias_ctor_init'
  @State mAntiAliasSetTrue: string = 'antialias_set_true_init'
  @State mAntiAliasSetFalse: string = 'antialias_set_false_init'
  @State mCtx2dCanvasNull: string = 'ctx2d_canvas_null_init'
  @State mCtx2dUnit: string = 'ctx2d_unit_init'
  @State mDrcSize: string = 'drc_size_init'
  @State mDrcCanvas: string = 'drc_canvas_init'
  @State mDrcUnit: string = 'drc_unit_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('CanvasIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 2 } as ColumnOptions) {
        Canvas(this.ctx2dBound)
          .width('80%')
          .height('5%')
          .key('canvas2d')
          .onReady(() => {
            this.mCtxBound = 'ctx_bound:' +
              (this.ctx2dBound.canvas !== null && this.ctx2dBound.canvas !== undefined ? 'notNull' : 'null');
          })

        Canvas(this.drcBound)
          .width('80%')
          .height('5%')
          .key('canvasDrawing')
          .onReady(() => {
            this.mDrcBound = 'drc_bound:' +
              (this.drcBound.canvas !== null && this.drcBound.canvas !== undefined ? 'notNull' : 'null');
          })

        Button(this.mCtxBound).id('btnCtxBound').width('80%').height('5%')
        Button(this.mDrcBound).id('btnDrcBound').width('80%').height('5%')

        Button(this.mAntiAliasDefault)
          .id('btnAntiAliasDefault')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let rcs = new RenderingContextSettings();
            this.mAntiAliasDefault = 'antialias_default:' + rcs.antialias;
          })

        Button(this.mAntiAliasCtor)
          .id('btnAntiAliasCtor')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let rcs = new RenderingContextSettings(true);
            this.mAntiAliasCtor = 'antialias_ctor:' + rcs.antialias;
          })

        Button(this.mAntiAliasSetTrue)
          .id('btnAntiAliasSetTrue')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let rcs = new RenderingContextSettings();
            rcs.antialias = true;
            this.mAntiAliasSetTrue = 'antialias_set_true:' + rcs.antialias;
          })

        Button(this.mAntiAliasSetFalse)
          .id('btnAntiAliasSetFalse')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let rcs = new RenderingContextSettings(true);
            rcs.antialias = false;
            this.mAntiAliasSetFalse = 'antialias_set_false:' + rcs.antialias;
          })

        Button(this.mCtx2dCanvasNull)
          .id('btnCtx2dCanvasNull')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let ctx2d = new CanvasRenderingContext2D(new RenderingContextSettings(true));
            this.mCtx2dCanvasNull = 'ctx2d_canvas:' +
              (ctx2d.canvas === null || ctx2d.canvas === undefined ? 'null' : 'notNull');
          })

        Button(this.mCtx2dUnit)
          .id('btnCtx2dUnit')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let ctx2d = new CanvasRenderingContext2D(new RenderingContextSettings(true), LengthMetricsUnit.DEFAULT);
            this.mCtx2dUnit = 'ctx2d_unit:' + (ctx2d !== null && ctx2d !== undefined ? 'ok' : 'null');
          })

        Button(this.mDrcSize)
          .id('btnDrcSize')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let drc = new DrawingRenderingContext();
            this.mDrcSize = 'drc_size:' + (drc.size !== null && drc.size !== undefined ? 'notNull' : 'null');
          })

        Button(this.mDrcCanvas)
          .id('btnDrcCanvas')
          .height(15)
          .height('5%')
          .onClick(() => {
            let drc = new DrawingRenderingContext();
            this.mDrcCanvas = 'drc_canvas:' +
              (drc.canvas === undefined || drc.canvas === null ? 'null' : 'notNull');
          })

        Button(this.mDrcUnit)
          .id('btnDrcUnit')
          .width('80%')
          .height('5%')
          .onClick(() => {
            let drc = new DrawingRenderingContext(LengthMetricsUnit.DEFAULT);
            this.mDrcUnit = 'drc_unit:' + (drc !== null && drc !== undefined ? 'ok' : 'null');
          })
      }
      .width('100%')
      .height('100%')
    }
  }
}
