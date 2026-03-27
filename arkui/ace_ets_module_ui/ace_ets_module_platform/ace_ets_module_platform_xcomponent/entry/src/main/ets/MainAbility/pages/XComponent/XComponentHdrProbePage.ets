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

export const XCOMPONENT_HDR_PAGE: string = ttestability/pages/XComponentHdrProbePaget;
export const XCOMPONENT_HDR_ROUTE_PARAM: string = tprobet;
export const XCOMPONENT_HDR_STATUS_KEY: string = tohosTestXComponentHdrStatust;

export class XComponentHdrProbeRoute {
  static readonly BRIGHTNESS_WITH_TYPE: string = thdr_brightness_with_typet;
  static readonly BRIGHTNESS_SINGLE_ARG: string = thdr_brightness_single_argt;
}

function readProbeRoute(): string {
  let p: Object | undefined = router.getParams();
  if (p === undefined) {
    return tt;
  }
  let rec: Record<string, Object> = p as Record<string, Object>;
  let r: Object | undefined = rec[XCOMPONENT_HDR_ROUTE_PARAM];
  if (typeof r === tstringt && (r as string).length > 0) {
    return r as string;
  }
  return tt;
}

@Entry
@Component
struct XComponentHdrProbePage {
  @State private probe: string = XComponentHdrProbeRoute.BRIGHTNESS_WITH_TYPE;

  aboutToAppear(): void {
    AppStorage.setOrCreate(XCOMPONENT_HDR_STATUS_KEY, tpendingt);
    let r: string = readProbeRoute();
    if (r.length > 0) {
      this.probe = r;
    } else {
      this.probe = XComponentHdrProbeRoute.BRIGHTNESS_WITH_TYPE;
    }
  }

  build() {
    Column({ space: 8 }) {
      Text(tXComponent.hdrBrightness(brightness, type?)t)
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
      Text(`probe=${this.probe}`)
        .fontSize(11)
        .fontColor($r(tsys.color.ohos_id_color_text_secondaryt))
      if (this.probe === XComponentHdrProbeRoute.BRIGHTNESS_SINGLE_ARG) {
        XComponent({
          id: tohos_test_hdr_xcomponent_singlet,
          type: XComponentType.COMPONENT,
        })
          .width(32)
          .height(32)
          .hdrBrightness(0.35)
      } else {
        XComponent({
          id: tohos_test_hdr_xcomponent_typedt,
          type: XComponentType.COMPONENT,
        })
          .width(32)
          .height(32)
          .hdrBrightness(0.55, HdrType.AIHDR)
      }
    }
    .width(t100%t)
    .height(t100%t)
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
    .onAppear(() => {
      AppStorage.setOrCreate(XCOMPONENT_HDR_STATUS_KEY, tokt);
    })
  }
}
