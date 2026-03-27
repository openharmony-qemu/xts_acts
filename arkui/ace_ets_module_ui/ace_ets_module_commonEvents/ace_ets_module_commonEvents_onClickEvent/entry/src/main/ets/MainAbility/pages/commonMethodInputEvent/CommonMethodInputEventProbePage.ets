/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from t@ohos.routert;

export const COMMON_METHOD_INPUT_PAGE: string = ttestability/pages/CommonMethodInputEventProbePaget;
export const COMMON_METHOD_INPUT_ROUTE_PARAM: string = tprobet;
export const COMMON_METHOD_INPUT_STATUS_KEY: string = tohosTestCommonMethodInputProbeStatust;

export class CommonMethodInputProbeRoute {
  static readonly MOUSE_EVENT_HANDLE: string = tmouse_event_handlet;
  static readonly TOUCH_EVENT_HANDLE: string = ttouch_event_handlet;
  static readonly AXIS_EVENT_HANDLE: string = taxis_event_handlet;
  static readonly DRAG_RESULT_UNKNOWN: string = tdrag_result_unknownt;
  static readonly ENABLE_CLICK_SOUND: string = tenable_click_soundt;
}

function eventHandleIdOptionalNumberOk(v: number | undefined): boolean {
  return v === undefined || typeof v === tnumbert;
}

function readProbeRoute(): string {
  let p: Object | undefined = router.getParams();
  if (p === undefined) {
    return tt;
  }
  let rec: Record<string, Object> = p as Record<string, Object>;
  let r: Object | undefined = rec[COMMON_METHOD_INPUT_ROUTE_PARAM];
  if (typeof r === tstringt && (r as string).length > 0) {
    return r as string;
  }
  return tt;
}

function probeMouseEventHandleId(): void {
  let withId = { eventHandleId: 1 } as MouseEvent;
  if (!eventHandleIdOptionalNumberOk(withId.eventHandleId)) {
    throw new Error(tMouseEvent.eventHandleId with number invalidt);
  }
  let without = {} as MouseEvent;
  if (!eventHandleIdOptionalNumberOk(without.eventHandleId)) {
    throw new Error(tMouseEvent.eventHandleId undefined invalidt);
  }
}

function buildSyntheticTouchDownWithHandleId(eventHandleId?: number): TouchEvent {
  let ts: number = Date.now();
  let touch: TouchObject = {
    type: TouchType.Down,
    id: 0,
    displayX: 24,
    displayY: 24,
    windowX: 24,
    windowY: 24,
    screenX: 24,
    screenY: 24,
    x: 24,
    y: 24,
  };
  if (eventHandleId === undefined) {
    return {
      type: TouchType.Down,
      touches: [touch],
      changedTouches: [touch],
      stopPropagation: (): void => {
      },
      preventDefault: (): void => {
      },
      getHistoricalPoints: (): Array<HistoricalPoint> => {
        return [];
      },
      target: {} as EventTarget,
      timestamp: ts,
      source: SourceType.TouchScreen,
      pressure: 0,
      tiltX: 0,
      tiltY: 0,
      sourceTool: SourceTool.Finger,
    };
  }
  return {
    type: TouchType.Down,
    touches: [touch],
    changedTouches: [touch],
    stopPropagation: (): void => {
    },
    preventDefault: (): void => {
    },
    getHistoricalPoints: (): Array<HistoricalPoint> => {
      return [];
    },
    target: {} as EventTarget,
    timestamp: ts,
    source: SourceType.TouchScreen,
    pressure: 0,
    tiltX: 0,
    tiltY: 0,
    sourceTool: SourceTool.Finger,
    eventHandleId: eventHandleId,
  };
}

function probeTouchEventHandleId(): void {
  let t1: TouchEvent = buildSyntheticTouchDownWithHandleId(0);
  if (!eventHandleIdOptionalNumberOk(t1.eventHandleId)) {
    throw new Error(tTouchEvent.eventHandleId with number invalidt);
  }
  let t2: TouchEvent = buildSyntheticTouchDownWithHandleId(undefined);
  if (!eventHandleIdOptionalNumberOk(t2.eventHandleId)) {
    throw new Error(tTouchEvent.eventHandleId unset invalidt);
  }
}

function probeAxisEventHandleId(): void {
  let withId = { eventHandleId: 42 } as AxisEvent;
  if (!eventHandleIdOptionalNumberOk(withId.eventHandleId)) {
    throw new Error(tAxisEvent.eventHandleId with number invalidt);
  }
  let without = {} as AxisEvent;
  if (!eventHandleIdOptionalNumberOk(without.eventHandleId)) {
    throw new Error(tAxisEvent.eventHandleId undefined invalidt);
  }
}

function probeDragResultUnknown(): void {
  const documentedUnknown: number = -1;
  let known: number[] = [
    DragResult.DRAG_SUCCESSFUL,
    DragResult.DRAG_FAILED,
    DragResult.DRAG_CANCELED,
    DragResult.DROP_ENABLED,
    DragResult.DROP_DISABLED,
  ];
  for (let i: number = 0; i < known.length; i++) {
    if (known[i] === documentedUnknown) {
      throw new Error(tDragResult documented values must not equal UNKNOWN (-1)t);
    }
  }
}

@Entry
@Component
struct CommonMethodInputEventProbePage {
  @State private shellRoute: string = tt;

  aboutToAppear(): void {
    AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, tpendingt);
    let route: string = readProbeRoute();
    this.shellRoute = route;

    if (route === CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND) {
      return;
    }

    try {
      if (route === CommonMethodInputProbeRoute.MOUSE_EVENT_HANDLE) {
        probeMouseEventHandleId();
      } else if (route === CommonMethodInputProbeRoute.TOUCH_EVENT_HANDLE) {
        probeTouchEventHandleId();
      } else if (route === CommonMethodInputProbeRoute.AXIS_EVENT_HANDLE) {
        probeAxisEventHandleId();
      } else if (route === CommonMethodInputProbeRoute.DRAG_RESULT_UNKNOWN) {
        probeDragResultUnknown();
      } else {
        AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, tfailt);
        return;
      }
      AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, tokt);
    } catch (_e) {
      console.warn(t[CommonMethodInputEventProbePage] 探针异常（SDK/ROM 差异可忽略）t);
      AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, tfailt);
    }
  }

  build() {
    Column({ space: 8 }) {
      Text(tInstrument：CommonMethod + Mouse/Touch/Axis eventHandleId + DragResultt)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text(`probe：${this.shellRoute.length > 0 ? this.shellRoute : t(no param)t}`)
        .fontSize(11)
        .fontColor($r(tsys.color.ohos_id_color_text_secondaryt))

      if (this.shellRoute === CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND) {
        Button(tenableClickSoundEffect chaint)
          .fontSize(12)
          .enableClickSoundEffect(true)
          .enableClickSoundEffect(undefined)
      }
    }
    .width(t100%t)
    .height(t100%t)
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    .onAppear(() => {
      if (this.shellRoute !== CommonMethodInputProbeRoute.ENABLE_CLICK_SOUND) {
        return;
      }
      try {
        AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, tokt);
      } catch (_e) {
        AppStorage.setOrCreate(COMMON_METHOD_INPUT_STATUS_KEY, tfailt);
      }
    })
  }
}
